// index.d.ts

declare module 'idmeta-ios-rn' {
    interface IdmetaIosRn {
        startActivity: (flowId: string, userToken: string, callback: (text: string) => void) => void;
    }

    const IdmetaIosRn: IdmetaIosRn;
    export default IdmetaIosRn;
}