Content-Type: multipart/mixed; boundary="===============8353999246366234280=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [cel:nfsd-5.8 4/31] fs/nfsd/./trace.h:470:1: sparse: sparse: incorrect type in assignment (different base types)
Date: Sat, 02 May 2020 22:19:24 +0800
Message-ID: <202005022221.C6jJHNA0%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8353999246366234280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.linux-nfs.org/projects/cel/cel-2.6.git nfsd-5.8
head:   b3bd93d54a48dbb6feb5eb1d46027d8602cef06c
commit: 1c3c49f4833b0ededa26242246cedec54db84457 [4/31] NFSD: Add tracepoin=
ts to NFSD's duplicate reply cache
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 1c3c49f4833b0ededa26242246cedec54db84457
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/nfsd/./trace.h:470:1: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@    expected unsigned int [usertype] cached @@    go=
t restricted unsigned int [usertype] cached @@
>> fs/nfsd/./trace.h:470:1: sparse:    expected unsigned int [usertype] cac=
hed
>> fs/nfsd/./trace.h:470:1: sparse:    got restricted __wsum const [usertyp=
e] k_csum
>> fs/nfsd/./trace.h:470:1: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@    expected unsigned int [usertype] ingress @@    g=
ot restricted unsigned int [usertype] ingress @@
>> fs/nfsd/./trace.h:470:1: sparse:    expected unsigned int [usertype] ing=
ress
>> fs/nfsd/./trace.h:470:1: sparse:    got restricted __wsum const [usertyp=
e] k_csum
>> fs/nfsd/./trace.h:470:1: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@    expected unsigned int [usertype] cached @@    go=
t restricted unsigned int [usertype] cached @@
>> fs/nfsd/./trace.h:470:1: sparse:    expected unsigned int [usertype] cac=
hed
>> fs/nfsd/./trace.h:470:1: sparse:    got restricted __wsum const [usertyp=
e] k_csum
>> fs/nfsd/./trace.h:470:1: sparse: sparse: incorrect type in assignment (d=
ifferent base types) @@    expected unsigned int [usertype] ingress @@    g=
ot restricted unsigned int [usertype] ingress @@
>> fs/nfsd/./trace.h:470:1: sparse:    expected unsigned int [usertype] ing=
ress
>> fs/nfsd/./trace.h:470:1: sparse:    got restricted __wsum const [usertyp=
e] k_csum

vim +470 fs/nfsd/./trace.h

   469	=

 > 470	TRACE_EVENT(nfsd_drc_mismatch,
   471		TP_PROTO(
   472			const struct nfsd_net *nn,
   473			const struct svc_cacherep *key,
   474			const struct svc_cacherep *rp
   475		),
   476		TP_ARGS(nn, key, rp),
   477		TP_STRUCT__entry(
   478			__field(unsigned long long, boot_time)
   479			__field(u32, xid)
   480			__field(u32, cached)
   481			__field(u32, ingress)
   482		),
   483		TP_fast_assign(
   484			__entry->boot_time =3D nn->boot_time;
   485			__entry->xid =3D be32_to_cpu(key->c_key.k_xid);
   486			__entry->cached =3D key->c_key.k_csum;
   487			__entry->ingress =3D rp->c_key.k_csum;
   488		),
   489		TP_printk("boot_time=3D%16llx xid=3D0x%08x cached-csum=3D0x%08x ing=
ress-csum=3D0x%08x",
   490			__entry->boot_time, __entry->xid, __entry->cached,
   491			__entry->ingress)
   492	);
   493	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8353999246366234280==--

