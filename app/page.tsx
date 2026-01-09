"use client"

import { useState, useEffect } from "react"
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Trash2, Edit } from "lucide-react"

interface Calculation {
  id: number
  principal: number
  rate: number
  duration: number
  durationType: string
  compoundFrequency: string
  finalAmount: number
  interest: number
  date: string
}

export default function CompoundInterestCalculator() {
  const [principal, setPrincipal] = useState("")
  const [rate, setRate] = useState("")
  const [duration, setDuration] = useState("")
  const [durationType, setDurationType] = useState("years")
  const [compoundFrequency, setCompoundFrequency] = useState("annually")
  const [calculations, setCalculations] = useState<Calculation[]>([])
  const [editingId, setEditingId] = useState<number | null>(null)

  useEffect(() => {
    const stored = localStorage.getItem("calculations")
    if (stored) {
      setCalculations(JSON.parse(stored))
    }
  }, [])

  const calculateCompoundInterest = () => {
    const P = Number.parseFloat(principal)
    const r = Number.parseFloat(rate) / 100
    const d = Number.parseFloat(duration)

    if (isNaN(P) || isNaN(r) || isNaN(d)) {
      alert("Please enter valid numbers")
      return
    }

    const t = durationType === "years" ? d : d / 12

    let n = 1
    if (compoundFrequency === "monthly") n = 12
    else if (compoundFrequency === "quarterly") n = 4
    else if (compoundFrequency === "semiannually") n = 2

    const A = P * Math.pow(1 + r / n, n * t)
    const interest = A - P

    const newCalc: Calculation = {
      id: editingId || Date.now(),
      principal: P,
      rate: Number.parseFloat(rate),
      duration: d,
      durationType,
      compoundFrequency,
      finalAmount: Number.parseFloat(A.toFixed(2)),
      interest: Number.parseFloat(interest.toFixed(2)),
      date: new Date().toLocaleString(),
    }

    let updatedCalcs
    if (editingId) {
      updatedCalcs = calculations.map((calc) => (calc.id === editingId ? newCalc : calc))
      setEditingId(null)
    } else {
      updatedCalcs = [...calculations, newCalc]
    }

    setCalculations(updatedCalcs)
    localStorage.setItem("calculations", JSON.stringify(updatedCalcs))

    setPrincipal("")
    setRate("")
    setDuration("")
    setDurationType("years")
    setCompoundFrequency("annually")
  }

  const deleteCalculation = (id: number) => {
    const updatedCalcs = calculations.filter((calc) => calc.id !== id)
    setCalculations(updatedCalcs)
    localStorage.setItem("calculations", JSON.stringify(updatedCalcs))
  }

  const editCalculation = (calc: Calculation) => {
    setPrincipal(calc.principal.toString())
    setRate(calc.rate.toString())
    setDuration(calc.duration.toString())
    setDurationType(calc.durationType)
    setCompoundFrequency(calc.compoundFrequency)
    setEditingId(calc.id)
  }

  return (
    <div className="min-h-screen bg-gray-100 py-8 px-4">
      <div className="max-w-4xl mx-auto">
        <h1 className="text-3xl font-bold text-center mb-8 text-gray-800">Compound Interest Calculator</h1>

        <Card className="mb-8">
          <CardHeader>
            <CardTitle>{editingId ? "Edit Calculation" : "Calculate Compound Interest"}</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid gap-4">
              <div className="grid gap-2">
                <Label htmlFor="principal">Principal Amount ($)</Label>
                <Input
                  id="principal"
                  type="number"
                  step="0.01"
                  value={principal}
                  onChange={(e) => setPrincipal(e.target.value)}
                  placeholder="Enter principal amount"
                />
              </div>

              <div className="grid gap-2">
                <Label htmlFor="rate">Interest Rate (%)</Label>
                <Input
                  id="rate"
                  type="number"
                  step="0.01"
                  value={rate}
                  onChange={(e) => setRate(e.target.value)}
                  placeholder="Enter interest rate"
                />
              </div>

              <div className="grid gap-2">
                <Label htmlFor="duration">Duration</Label>
                <div className="flex gap-2">
                  <Input
                    id="duration"
                    type="number"
                    step="0.01"
                    value={duration}
                    onChange={(e) => setDuration(e.target.value)}
                    placeholder="Enter duration"
                    className="flex-1"
                  />
                  <Select value={durationType} onValueChange={setDurationType}>
                    <SelectTrigger className="w-32">
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="years">Years</SelectItem>
                      <SelectItem value="months">Months</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>

              <div className="grid gap-2">
                <Label htmlFor="frequency">Compound Frequency</Label>
                <Select value={compoundFrequency} onValueChange={setCompoundFrequency}>
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="annually">Annually</SelectItem>
                    <SelectItem value="semiannually">Semi-Annually</SelectItem>
                    <SelectItem value="quarterly">Quarterly</SelectItem>
                    <SelectItem value="monthly">Monthly</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              <Button onClick={calculateCompoundInterest} className="w-full">
                {editingId ? "Update Calculation" : "Calculate"}
              </Button>
              {editingId && (
                <Button
                  onClick={() => {
                    setEditingId(null)
                    setPrincipal("")
                    setRate("")
                    setDuration("")
                    setDurationType("years")
                    setCompoundFrequency("annually")
                  }}
                  variant="outline"
                  className="w-full"
                >
                  Cancel Edit
                </Button>
              )}
            </div>
          </CardContent>
        </Card>

        {calculations.length > 0 && (
          <Card>
            <CardHeader>
              <CardTitle>Calculation History</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="border-b">
                      <th className="text-left p-2">Principal</th>
                      <th className="text-left p-2">Rate</th>
                      <th className="text-left p-2">Duration</th>
                      <th className="text-left p-2">Frequency</th>
                      <th className="text-left p-2">Final Amount</th>
                      <th className="text-left p-2">Interest</th>
                      <th className="text-left p-2">Date</th>
                      <th className="text-left p-2">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    {calculations.map((calc) => (
                      <tr key={calc.id} className="border-b">
                        <td className="p-2">${calc.principal.toFixed(2)}</td>
                        <td className="p-2">{calc.rate}%</td>
                        <td className="p-2">
                          {calc.duration} {calc.durationType}
                        </td>
                        <td className="p-2 capitalize">{calc.compoundFrequency}</td>
                        <td className="p-2 font-semibold text-green-600">${calc.finalAmount.toFixed(2)}</td>
                        <td className="p-2 text-blue-600">${calc.interest.toFixed(2)}</td>
                        <td className="p-2 text-xs text-gray-500">{calc.date}</td>
                        <td className="p-2">
                          <div className="flex gap-2">
                            <Button size="icon" variant="outline" onClick={() => editCalculation(calc)}>
                              <Edit className="h-4 w-4" />
                            </Button>
                            <Button size="icon" variant="destructive" onClick={() => deleteCalculation(calc.id)}>
                              <Trash2 className="h-4 w-4" />
                            </Button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  )
}
