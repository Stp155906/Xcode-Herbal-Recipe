export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json }
  | Json[]

export interface Database {
  public: {
    Tables: {
      smoothies: {
        Row: {
          created_at: string | null
          id: number
          method: string | null
          rating: number | null
          title: string | null
        }
        Insert: {
          created_at?: string | null
          id?: number
          method?: string | null
          rating?: number | null
          title?: string | null
        }
        Update: {
          created_at?: string | null
          id?: number
          method?: string | null
          rating?: number | null
          title?: string | null
        }
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}
