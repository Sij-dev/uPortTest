import { Connect, SimpleSigner } from 'uport-connect'

export const uport = new Connect('uPortTest', {
  clientId: '2orpuFq3R8KJxxk58oJLJAUkq52DgmbTG94',
  network: 'rinkeby',
  signer: SimpleSigner('576ad4313ac02c1d40791667fef94795635706358f517e3dbb70c6fac14bec85')
})

export const web3 = uport.getWeb3()
