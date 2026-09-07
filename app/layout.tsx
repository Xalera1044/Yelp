import type {Metadata} from 'next';
import './globals.css';
export const metadata:Metadata={title:'HARA? — Find the best of Baku',description:'Discover restaurants, doctors, beauty and nightlife in Baku.',icons:{icon:'/favicon.svg'}};
export default function RootLayout({children}:{children:React.ReactNode}){return <html lang="en"><body>{children}</body></html>}
