Content-Type: multipart/mixed; boundary="===============0786421199389852101=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/tty/serial/ucc_uart.c:264:21: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Wed, 27 May 2020 22:04:32 +0800
Message-ID: <202005272220.0hZcbdqj%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0786421199389852101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rasmus,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   444fc5cde64330661bf59944c43844e7d4c2ccd8
commit: 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5 soc: fsl: qe: remove PPC32=
 dependency from CONFIG_QUICC_ENGINE
date:   6 months ago
config: arm64-randconfig-s031-20200527 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-240-gf0fe1cd9-dirty
        git checkout 5a35435ef4e6e4bd2aabd6706b146b298a9cffe5
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 ARCH=3Darm64 CF=3D'-fdiagnostic-prefix -D__CHECK_E=
NDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/tty/serial/ucc_uart.c:264:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:264:21: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:264:21: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:268:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:268:21: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:268:21: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:286:6: sparse: sparse: symbol 'qe_uart_set=
_mctrl' was not declared. Should it be static?
>> drivers/tty/serial/ucc_uart.c:349:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:349:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:349:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:350:17: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:350:17: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:350:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:350:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:350:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:350:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:352:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:352:21: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:352:21: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:371:18: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:371:18: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:371:18: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:384:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:384:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:384:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:385:17: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:385:17: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:385:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:385:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:385:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:385:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:388:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:388:21: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:388:21: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:476:26: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:476:26: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:476:26: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:483:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:483:21: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:483:21: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:514:17: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:514:17: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:514:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:514:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:514:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:514:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:517:21: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@     expected void const volatile [=
noderef] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:517:21: sparse:     expected void const vo=
latile [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:517:21: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:608:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:608:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:608:17: sparse:     got restricted __be16 *
>> drivers/tty/serial/ucc_uart.c:609:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:609:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:609:17: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:610:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:610:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:610:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:616:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:616:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:616:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:617:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:617:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:617:9: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:618:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:618:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:618:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:629:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:629:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:629:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:630:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:630:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:630:17: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:631:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:631:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:631:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:641:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:641:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:641:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:642:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:642:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:642:9: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:643:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:643:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:643:9: sparse:     got restricted __be16 *
>> drivers/tty/serial/ucc_uart.c:657:46: sparse: sparse: incorrect type in =
initializer (different address spaces) @@     expected struct ucc_uart_pram=
 *uccup @@     got struct ucc_uart_pram [noderef] <asn:2> *uccup @@
   drivers/tty/serial/ucc_uart.c:657:46: sparse:     expected struct ucc_ua=
rt_pram *uccup
   drivers/tty/serial/ucc_uart.c:657:46: sparse:     got struct ucc_uart_pr=
am [noderef] <asn:2> *uccup
>> drivers/tty/serial/ucc_uart.c:665:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:665:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:665:9: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:666:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:666:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:666:9: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:667:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:667:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:667:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:668:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:668:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:668:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:669:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:669:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:669:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:670:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:670:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:670:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:671:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:671:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:671:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:672:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:672:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:672:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:673:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:673:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:673:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:674:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:674:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:674:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:675:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:675:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:675:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:676:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:676:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:676:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:678:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:678:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:678:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:679:9: sparse: sparse: incorrect type in a=
rgument 2 (different address spaces) @@     expected void volatile [noderef=
] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:679:9: sparse:     expected void volatile =
[noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:679:9: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:717:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:717:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:717:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:718:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:718:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:718:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:719:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:719:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:719:17: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:720:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:720:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:720:17: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:721:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:721:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:721:17: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:722:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:722:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:722:17: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:723:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:723:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:723:17: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:724:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:724:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:724:17: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:725:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be32 * @@
   drivers/tty/serial/ucc_uart.c:725:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:725:17: sparse:     got restricted __be32 *
   drivers/tty/serial/ucc_uart.c:726:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:726:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:726:17: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:728:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:728:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:728:17: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:730:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:730:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:730:17: sparse:     got restricted __be16 *
   drivers/tty/serial/ucc_uart.c:731:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got unsigned char * @@
   drivers/tty/serial/ucc_uart.c:731:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:731:17: sparse:     got unsigned char *
   drivers/tty/serial/ucc_uart.c:732:17: sparse: sparse: incorrect type in =
argument 2 (different address spaces) @@     expected void volatile [nodere=
f] <asn:2> *addr @@     got restricted __be16 * @@
   drivers/tty/serial/ucc_uart.c:732:17: sparse:     expected void volatile=
 [noderef] <asn:2> *addr
   drivers/tty/serial/ucc_uart.c:732:17: sparse:     got restricted __be16 *
>> drivers/tty/serial/ucc_uart.c:1004:24: sparse: sparse: incorrect type in=
 assignment (different address spaces) @@     expected struct ucc_uart_pram=
 [noderef] <asn:2> *uccup @@     got struct ucc_uart_pram * @@
   drivers/tty/serial/ucc_uart.c:1004:24: sparse:     expected struct ucc_u=
art_pram [noderef] <asn:2> *uccup
   drivers/tty/serial/ucc_uart.c:1004:24: sparse:     got struct ucc_uart_p=
ram *

vim +264 drivers/tty/serial/ucc_uart.c

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  248  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  249  /*
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  250   * Return 1 if the QE is done transmitting all buffers for this port
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  251   *
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  252   * This function scans each BD in sequence.  If we find a BD that is=
 not
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  253   * ready (READY=3D1), then we return 0 indicating that the QE is sti=
ll sending
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  254   * data.  If we reach the last BD (WRAP=3D1), then we know we've sca=
nned
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  255   * the entire list, and all BDs are done.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  256   */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  257  static unsigned int qe_uart_tx_empty(struct uart_port *port)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  258  {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  259  	struct uart_qe_port *qe_port =3D
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  260  		container_of(port, struct uart_qe_port, port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  261  	struct qe_bd *bdp =3D qe_port->tx_bd_base;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  262  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  263  	while (1) {
8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
 @264  		if (qe_ioread16be(&bdp->status) & BD_SC_READY)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  265  			/* This BD is not done, so return "not done" */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  266  			return 0;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  267  =

8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  268  		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  269  			/*
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  270  			 * This BD is done and it's the last one, so return
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  271  			 * "done"
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  272  			 */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  273  			return 1;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  274  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  275  		bdp++;
fc811472c2167cc drivers/tty/serial/ucc_uart.c Joe Perches        2013-10-08=
  276  	}
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  277  }
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  278  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  279  /*
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  280   * Set the modem control lines
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  281   *
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  282   * Although the QE can control the modem control lines (e.g. CTS), we
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  283   * don't need that support. This function must exist, however, other=
wise
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  284   * the kernel will panic.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  285   */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  286  void qe_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  287  {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  288  }
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  289  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  290  /*
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  291   * Get the current modem control line status
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  292   *
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  293   * Although the QE can control the modem control lines (e.g. CTS), t=
his
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  294   * driver currently doesn't support that, so we always return Carrier
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  295   * Detect, Data Set Ready, and Clear To Send.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  296   */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  297  static unsigned int qe_uart_get_mctrl(struct uart_port *port)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  298  {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  299  	return TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  300  }
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  301  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  302  /*
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  303   * Disable the transmit interrupt.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  304   *
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  305   * Although this function is called "stop_tx", it does not actually =
stop
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  306   * transmission of data.  Instead, it tells the QE to not generate an
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  307   * interrupt when the UCC is finished sending characters.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  308   */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  309  static void qe_uart_stop_tx(struct uart_port *port)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  310  {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  311  	struct uart_qe_port *qe_port =3D
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  312  		container_of(port, struct uart_qe_port, port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  313  =

8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  314  	qe_clrbits_be16(&qe_port->uccp->uccm, UCC_UART_UCCE_TX);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  315  }
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  316  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  317  /*
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  318   * Transmit as many characters to the HW as possible.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  319   *
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  320   * This function will attempt to stuff of all the characters from the
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  321   * kernel's transmit buffer into TX BDs.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  322   *
af901ca181d92aa drivers/serial/ucc_uart.c     Andr=C3=A9 Goddard Rosa 2009-=
11-14  323   * A return value of non-zero indicates that it successfully st=
uffed all
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  324   * characters from the kernel buffer.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  325   *
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  326   * A return value of zero indicates that there are still characters =
in the
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  327   * kernel's buffer that have not been transmitted, but there are no =
more BDs
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  328   * available.  This function should be called again after a BD has b=
een made
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  329   * available.
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  330   */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  331  static int qe_uart_tx_pump(struct uart_qe_port *qe_port)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  332  {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  333  	struct qe_bd *bdp;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  334  	unsigned char *p;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  335  	unsigned int count;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  336  	struct uart_port *port =3D &qe_port->port;
ebd2c8f6d2ec401 drivers/serial/ucc_uart.c     Alan Cox           2009-09-19=
  337  	struct circ_buf *xmit =3D &port->state->xmit;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  338  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  339  	bdp =3D qe_port->rx_cur;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  340  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  341  	/* Handle xon/xoff */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  342  	if (port->x_char) {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  343  		/* Pick next descriptor and fill from buffer */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  344  		bdp =3D qe_port->tx_cur;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  345  =

09a39ec9decd99e drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  346  		p =3D qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  347  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  348  		*p++ =3D port->x_char;
8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
 @349  		qe_iowrite16be(1, &bdp->length);
8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  350  		qe_setbits_be16(&bdp->status, BD_SC_READY);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  351  		/* Get next BD. */
8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  352  		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  353  			bdp =3D qe_port->tx_bd_base;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  354  		else
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  355  			bdp++;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  356  		qe_port->tx_cur =3D bdp;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  357  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  358  		port->icount.tx++;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  359  		port->x_char =3D 0;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  360  		return 1;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  361  	}
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  362  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  363  	if (uart_circ_empty(xmit) || uart_tx_stopped(port)) {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  364  		qe_uart_stop_tx(port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  365  		return 0;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  366  	}
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  367  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  368  	/* Pick next descriptor and fill from buffer */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  369  	bdp =3D qe_port->tx_cur;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  370  =

8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  371  	while (!(qe_ioread16be(&bdp->status) & BD_SC_READY) &&
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  372  	       (xmit->tail !=3D xmit->head)) {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  373  		count =3D 0;
09a39ec9decd99e drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  374  		p =3D qe2cpu_addr(be32_to_cpu(bdp->buf), qe_port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  375  		while (count < qe_port->tx_fifosize) {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  376  			*p++ =3D xmit->buf[xmit->tail];
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  377  			xmit->tail =3D (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  378  			port->icount.tx++;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  379  			count++;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  380  			if (xmit->head =3D=3D xmit->tail)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  381  				break;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  382  		}
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  383  =

8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  384  		qe_iowrite16be(count, &bdp->length);
8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  385  		qe_setbits_be16(&bdp->status, BD_SC_READY);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  386  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  387  		/* Get next BD. */
8b1cdc4033bd165 drivers/tty/serial/ucc_uart.c Rasmus Villemoes   2019-11-28=
  388  		if (qe_ioread16be(&bdp->status) & BD_SC_WRAP)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  389  			bdp =3D qe_port->tx_bd_base;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  390  		else
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  391  			bdp++;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  392  	}
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  393  	qe_port->tx_cur =3D bdp;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  394  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  395  	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  396  		uart_write_wakeup(port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  397  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  398  	if (uart_circ_empty(xmit)) {
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  399  		/* The kernel buffer is empty, so turn off TX interrupts.  We
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  400  		   don't need to be told when the QE is finished transmitting
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  401  		   the data. */
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  402  		qe_uart_stop_tx(port);
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  403  		return 0;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  404  	}
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  405  =

d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  406  	return 1;
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  407  }
d7584ed2b994a57 drivers/serial/ucc_uart.c     Timur Tabi         2008-01-15=
  408  =


:::::: The code@line 264 was first introduced by commit
:::::: 8b1cdc4033bd1659c5499c918d4e59bf8253abec serial: ucc_uart: replace p=
pc-specific IO accessors

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Li Yang <leoyang.li@nxp.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0786421199389852101==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICMFFzl4AAy5jb25maWcAnDzbkts2su/5CpX9sltb9uo2mvFuzQNIghIikqABUJd5YSlj2ZnK
XHw0M0n896cb4AUgQXnOSSWx2d24NRp9Q0Pvf3k/Iq8vTw+Hl7vbw/39j9G34+PxdHg5fhl9vbs/
/ncU8VHG1YhGTH0E4uTu8fXvfx9OD4v56OLjxcfxh9PtZLQ+nh6P96Pw6fHr3bdXaH739PjL+1/g
3/cAfPgOPZ3+MzocTre/L+Yf7rGPD99ub0f/WIbhP0efPs4+joE25FnMlmUYlkyWgLn+UYPgo9xQ
IRnPrj+NZ+NxQ5uQbNmgxlYXKyJLItNyyRVvO7IQLEtYRnuoLRFZmZJ9QMsiYxlTjCTshkYtIROf
yy0X6xYSFCyJFEtpSXeKBAktJReqxauVoCSCEWMO/ysVkdhYc2ep2X0/ej6+vH5veYADlzTblEQs
y4SlTF3PpsjMaq48zRkMo6hUo7vn0ePTC/ZQt054SJKaKe/e+cAlKWy+6BWUkiTKoo9oTIpElSsu
VUZSev3uH49Pj8d/vmsnIrck90xA7uWG5dYGVgD8M1RJC8+5ZLsy/VzQgvqhbZN29YJLWaY05WJf
EqVIuPLMoZA0YYHdjhQgxB7KFdlQYHS4MhQ4IEmSeodgu0fPr789/3h+OT60O7SkGRUs1NKQCx5Y
07dRcsW3w5gyoRua+PE0jmmoGE4tjkEi5dpPl7KlIAp3+ke7IBEBSsL2lIJKmkX+puGK5a5cRzwl
LHNhkqU+onLFqECu7fudp5Ih5SDCO47G8TQt7IVkEYh5NaDTI7aIuQhpVB0vli0tecuJkLRq0QiA
vfaIBsUylrY4vB8dH7+Mnr52ttzLdDgXrJqeaIfVQhTCOVtLXsDcyogo0ueCVhWbVs46aN0BCEam
ZKdrVFCKhesyEJxEIZHqbGuHTAuzuns4np598qy75RkFsbQ6zXi5ukF1k2r5ajgJwBxG4xELXQ46
7Rhwx3PeDDIu7LXDHwqUZ6kECdfOVnYxZtftyej+fOeaLVco/5rfQuom1Q73+ND2lgtK01xBrxn1
rq0m2PCkyBQRe8/QFY2l0qpGIYc2PbA5vcZc5sW/1eH5j9ELTHF0gOk+vxxenkeH29un18eXu8dv
7Z5tmIAe86Ikoe7X4ZsHiTLiniAtib7WWifKcAXHi2yW7tELZIQqL6SghaGtGsaUm5llBUGFSUVs
oUYQnMSE7DsdacTOA2PcO91cMuejsV0Rk2iQI3vz38DiRviAf0zyhNhbJMJiJPsnqN5iQNvSCZ/g
FsBp8ZkeaYjrFUIPXRAyrXRA2CHwMUnac2lhMgpbJukyDBJmqweN42GAS7KZ4S6mkY21+YslLetm
mTy018fWK9C+cL68jgi6FjHYOhar6+nYhiNrU7Kz8JNpy0qWqTX4IzHt9DGZdfWdEVKt9eoNkre/
H7+8gs85+no8vLyejs/maFWOATiNaa4569X+ntaOEpZFnoN7J8usSEkZEHBBQ1djGU8SljCZXnU0
eNO4wbZqzOnOw81wKXiRS7sNOEGhjzRI1hW5NS39bfjVQmPCROliWkcrBhMCNm7LIrXy6kJQMVbb
wTmXOYuceVdgEaVkuFEMx+FGm9e2XQ5unfKJWtUmohsW0t6ioZ2rTCp4kMc9mPYMLFcCBKtBOeYc
fWJwNEDbtbAC5cJZKrq9mW/GsBJhaGupZ5HznVHlfAOLw3XOQXLQqikurHVWqhqc+nrXWx99L2Ef
Iwr6KSTKu0sCVbClxhPUyhsdhQg78sFvkkJvxr2xYgURlcsb25sEQACAqQNJblLiAHY3HTzvfM+d
Y8XBVKYQjaEPgA4I/JHCcXG8gS6ZhL/4QxQnEtEGr2DRZOFELUAD2juk2kZrH8RiuiM9RsdbkuD2
pT1G3HJna5ZUoWdfVr6gf57I766vGBvfsxszNZ6Oo0i732WWWubSkXaaxGBWbMkKCDjSrrMWF+CR
dT5Beq1ecm7TS7bMSBJbkqTnaQO0w2oD5Ap0m6U8mSUZ4AQUwlG5JNowSWs2WQyATgIiBLO99DWS
7FPZh5QOjxuoZgGeEQzHnO23NqbZVAT/CuE7SbZkL8GnHjj72kGxl9y4+O2kof8s7GwIBDZOVKP1
lYZ6BoKeaBTZCl8LOp6dsgkxWtc2nIzndi/ablbZnfx4+vp0ejg83h5H9M/jI3hMBCxmiD4TONO2
ibW695rYN/bYuLKp6cx4z46Ay6QIGo3t5EeIgvBn7bVaMiGB76hBX87pTHgw2B42SSxp7WcOk6ER
Q0+sFHBgeeod1ibD2B08G8cOy1URxxAH5wRGBGnjoMe5GFiBdqwg/MXElX3wecwS58xoZabNiRMa
uRmpVjbThaWLF/OAWbrOCdo1qZlr168zKPhQFWruyH6aEvAJMrAcDMxoyrLrydU5ArK7ng70UEtA
09HkDXTQ32TR8FJBvKl5VDttlgJKErokSam5B6d0Q5KCXo///nI8fBlb/7T+brgGA9zvyPQP0VWc
kKXs42sn19HRFrDRSvVUZJ9staUQCPsyBbJIPVCSsECAo2ACs5bgBgLiMrINeA2ZTTtKjGY6C1ql
6FZc5YnjUqWWo7CmIqNJmfKIgsdjhzMxGDRKRLKH79KxBvnSpFl1+kxez5zBGxe70Hm5bg4F45dy
jSq1xLxCHTPk94cXVEYg9/fH2yqBbbcjIboAjro08CVL6M6rAKrpZDvmOaumcZKbJLTbJgjT6dXs
YrhTIADHElYy1HFARcKyfsdMYSrtTMciTKXyaUezsbt9xvs8WM+GGoAEgVCGJO8vMllO/OrZ2EEm
B7mW0oiBgK57XYI/7jW3BrkBM9Fvshvk4WdQDh3hEZQkZmAXmlFJ+myB/VljjnVoANk7OJISpZI+
r6TCHO9uMh7sap99hhDHdS81RtGlIGfEMxe+iMA0XRVZ5OvSwKfDvRYZyzE/PNTzBrxliGG6Z3OH
Sqg33M2Z03UD605zr5PhOdG2OxO3qQENBts0Op5Oh5fD6K+n0x+HE3ghX55Hf94dRi+/H0eHe3BJ
Hg8vd38en0dfT4eHI1LZOgJNG94LEQjA0LIklGSgTSEwc1eEdFTAfhZpeTVdzCafBpbnEl52CAfI
5uPFp64tbrCTT/PL6ZnZzKbjyyGt4xDOLy7fMpv5bD75NDzeZDydX06u3jDgZD65Gs/Hb6GcLC4u
ptOfzm0yvVpcjS/PTA74PVtcvmlyi9l0evHzIS/mU8OP2k0lGwbwGj+dzi4vhrGzyXx+Dnsxd1zg
Dv5yfrHwpU1cstl4MrnwdKN207arAYFFdVnGJFlD0N3u8NhvGjqHRdAcNF+pkoDZow90eWb8z1EM
R2DcUI/HC79ASx6COceLhUZ1YgaXdSOWOmoCc5QwdESaeSwmi/H4auwTNd+8KYRWE3txcQFRoiza
qcLKxhOvKvv/6SaX2/O19sllX+Iniwp1RtYXcw+NQ7EhxoueeQ58jZtf/az59exTN46om/YjDNNi
3sQIGPkEGPRm4B84zg9iEoamtUL6giedQkud5LaBydSXu8+ETkdeTy+amKHydKsce01X2D5zBn6u
rBPiVjoAY2acpc4CI1HJukG7pApTqVSYax3wRexcIcyzRumgH9xnAfFkCLba8ldWPKGYfNa+u73S
1Q2eLL/s35TTC5/nAYjZeNzvxU97bdVtGL6uBN46dl2g2n03eQ0UOh3ydsn0DS9EBVWwMYiuIvSe
o5XQUNURCgYf3VygCRbiDIM7eyvkXrZzXBVLCkor7joyWwIhLiLLPAX5gaC+O0HM82jnoMQyFJ2l
9AdRMgfB1d3kqrrkqGdCQwxfrbCICILXfn2I56Kv2bM13dEQpMV7VxsKIldlVNjD7GiGV/JjB2KF
bXg/q692UMa4QA+yDb+LDEPvKugDlU+Tsc14TH5AEEIyHamBnx8qLnoENJmCC4ko2dUKUgbWZgmO
KXudvmyuBA1fo17DbalUIMbAs6yvwRRZLjHBHkWiJIEvMjGZBIexOsO/okneuR2z+95cDaTma6f0
z6uPkxFWTt29gBf7iqkZ61bLmeRqW5I4CtLu0syKHFACGoconrLQYxA2Kzpkhs7NxprxdHjGnbEK
ws+YnRwO6KDJANHEgivPboWZPyT4yeSsBczeyPJcCbx1WdkZtJ/00J2s3PgOnsGBYiow8Zcozzbl
khYRx2S+/25OJxzxGgTz1z6JDSu7gpmuXHClTxQqOEHtbI2LRiNTVbB187mxw8jgCYZ7+o6Bl8W2
MI103d27d21zh9LSs7pkrDlXJk3z9NfxNHo4PB6+HR+Oj/YArdEuZA5W3leWYeeQ0n7eGGAk2uCN
UmSQXsZGQLYlKlxF3Hf3CtgwWTsD1bk1U8hk6azt5zLnW+AojWMWMsxx9+xVv33JY3vWiFxWRmww
P2B4gtdEkgVVhqEOlId4WhekVBRpQ9HUdgKOfbk/2tzXJROdwh+79MI0aJrHp+P/vB4fb3+Mnm8P
9055C/YUC2pVntSQcsk3WPkn0CcaQHeLIxok1qB0fUONqA0EtrYuF70y4G+EWynJ5v/QBE2EvkN+
exOeRRQmFr29BeBgmI1OFPv0gK+N9tAKxZIB9rq3r16KmhsD+GbpA/h6nYP72y5qgMReQyNwX7sC
N/pygsDp9OwInuGHun7ow0AbExXRTUch438kIuXscrerqYcsW017tfZRWnR1prMma+eDWB1m1hNb
bZ3ImQv22T8N6yh6Dp+N7h17zcT47vTw1+F0HEUN35y1SYxd8C4iHhJriEzSLbjE6H6nJPfTbMsw
rq6/hyJsGVr6vIaU9j1VA4z4Nks4icw9Q0/HVh4/0KZh6IQaKZjZkMF0rJsSzpdglOtV9BB4txBw
Dk63Dkwe2kVVBFi1A9LLLVovDyryTe6zZTRmze1ILd/q+O10GH2tN8gItsbUdY9+ghrd29p2LhhF
FFgKr0vhzrhsodjnivc82fpa0XKKjh++HL/DyK4ZdwIP9+Z73b3Q+RXikjIhAXUu4FHBg7FcU4zU
aBIPVMnrPW/tbpHB6pYZOvlh6KSm14Kq7si6cW8+BjpEHheZvkPCjA84Uiz7lYbdwm0gc4oz2lBU
XxWuOF93kFFK9I0qWxa88Fz/SWAR2uOqTLpPoJFYsGESDJ44FRS9YvG+rvrpE6wpzbvFQg0Seq3i
7AFkxISOxUnuXbd5PCGVKIBou2KKupWNhlSmeLSr1w1dzoM/K0swJcaXrTa4JHmX0VVphXfT8CXG
YEPH4WsrLHBcH1wHhmYubmjdLtsR7TNYT12KWUpYGP2jSwt6nDdyZioswzTfhatu8W99GirGYx6m
u2jTzrwrGcBFvOgnZ3R2pLp5RxffFOvXD1Y8y60yHZikUHYlzxDcaolMTijpbo8b1Fj+g6nd7MQ8
GbdfCvXa2prHiaSU4N5KTsOiwZJ3jf5p/bam+nkRd608MkyJ0Sot5dlNIxiYstr0TyIcrTqvRkMG
KrPFmxBV6hwmVo+hPHoOukbVEalvaKe2o9OBi2uLQjytrYKOoU5skk5diJbM2g1WPEe3wTRMyJ4X
dqyRYPFDAFsHPkBkjcXxIRVbVgGXVf9eDVvhSUf1V9jZFKald9THI9wZI2S21LXQoejPiDQoe1Vn
3sR2Zwv0IKrbvEpI+Jr7UFYmFeRiNkXpwOolV0ebK2OpHSNBcTV4huwlYuLTrgGTff8i5JsPvx2e
j19Gf5hsxPfT09e7KqJsXSogqxZ6jlmazNRM0bKu76sLpM6M1MTsSbHEJ1JcKnAn333717/eOSzB
B42GxrbYDrBaVTj6fv/67c7NcLSUZbg3KZKE7pja+93IlhpMBfIQ/hM8/yk1nlej/r0RhDO5bvnY
T/y8JkELcoPlo7azpMstZYpsH3e0TFftVMlm9Ox7qCLzgk2LBtmW0rfeg5cvVXMpwuYJpVuw26Nk
/vRRhcZNwxIIjxhWFHjtsS1TJiXq/qbavGSpvnxoV1ZkcHhAq+zTgCc9HknzriQB19H27gL3MgFr
vmUoGZzQzwW1/av2LQGc7W7ypC4VD6R/sRY+Yf5qyrbaHEtVhoS4psI7BV84VOPBXeRKuZWOfRxw
Y9tdRpWZNN6IGJzENvAFExaTGNenLNz3BqjxIfcGJGaaeOll3yfpjYHd5Tlp8hj54fRyhwdppH58
d7PquvLTOKxVJtOn51IwQC2pJTEy4tKHwGjTBrfJw85UHPFqk7fWYtLPZR6yHgz9HbvIG8E6X2te
4fL2XY4VJUI7xs1lYgRRgvui20Ku94HtH9bgILYyKvBR1jvUewqDSPt9iP/dqDPJxhYQ99kIkdnE
PrvmITp4VqBxUS0N34iaC5tSpFYyQmtP0xj2HNwVe51wXmk6hNQbNIBrLLJ+gx1pMv2s1UqtDGK6
jcXW37QHb50NU1VfbgXJc3te7ZMgLRX07+Pt68vht/uj/rWCka4mf7HkI2BZnOIlo/3Mp3b/+ij4
cDMOukwUQ7T29hD82OrBmyWrpi8ZCmY/+qzAoMFDt8sq6GsEZ2gdepHp8eHp9MNKw/WTJWdvs9ur
8JRkBfFhWpCuI9BvVcCjMMUK3VDADJLrh+XKNwwENeDFUR9qYzJ+vTv7HkV/UKNQdGVEHx8Tqcpl
L3mBeYmmrXVmzBLsh50uplex7MKr6Treg0tQSwvXZ9tXbGJu9ZXRklhGMu+MFaD5t+dWAYz8+qKH
DszzwwChzhOVnXqKfLWX5mZbNYX9reIDd3sgjbuWvrvZeul6n1OW6Z6v5+NPC2drGqVWLTcmLCmE
j6cVxjPUQFTbdODDV89y3tgbiJp+WdQyq0ulEyN1lWcTG1KwvB2YXQQEH55HKzXQm/BGLJb8yOvL
GnSTc5609usmKCI72XwziyHW9HR1o31r9xVvXVEPm5Z3Xp+2HVbtdILV02+dUNRZaTCiOpSzBwHR
oEK4OSX9qNA7nMlLIkmdITkXseX6wYKbuogFwR9a6KR4qkKrzlP0Jb4GBa9tlRLhRNc6+wjneA/u
Y65fFHr3x5mIzpIQJ2oc1uKt6lXXXSMFMFAgayxsl1XxXksNrFu6RdQIpB2YXAeokWlWJ0a1UcmO
L1gjiNdfPWsCmmRNlS1KBlJGjPj2AFwYK+THr+pmpmmvYQOtFUQs1lDwWT3i9QoFohX3KYNdLJwx
8VsnWr39aOz5WypNIosAc+Ms9EclmsYo2nOd4IWEVCz0R5a4a2vq+xmJXZTr98fULf+wwENcZUaa
2sOUG6uOPwbiI8/bwgdwcpVb9M8wwxrAMWTUHBt/D43boFVJ5xG06baiIQPPyRsyCLED7i1aAZI8
s3+1Rn+X0SrMOwMiGK/W/PeLFYEgwvc8Q5+u3H7PbCBLdAdpWuy6iFIVWWZ7XQ29kx/eo/nma+at
ozVNNoq5vRSRv/eYFz1AOxOX/YgmAzzXSkMOcMnMCbXRgJD1pqaBKJUdkArzGux2j+vrSrFLIcj2
JxSIhY3BhLv/oOLo8Nfluai4oQmLwM5wN/ngCn/97vb1t7vbd27vaXTRyfg0krZZuKK5WVSHDL3o
eEA8gci8Y0fFUUbEX++Bq1+c29rF2b1deDbXnUPK8sUwliW+328wPfcEAxs40q0hkjmmpoaVC++7
JI3OIoiodCig9jnt9Ocddim6ZM7pqSH+xmf1Gs62CDDD5lfupge93UPLkXS5KJNtM3and8SCV+J7
ptYSmJ8isE2Kvh30axl8eIF3Z5WrY6mQXOX4m3pSsnjvYHQTCBT01QTYgDR3MmxA0b2Da0DNkXPC
CsGiJW2Jevn88Ol0RC8F4uGX46n304K9QXy+UIWqnChbynpI/ftDQ9a5Q6rTF2+kTf6Xsy9rbtxo
EvwrepqwY+db4yBAcCP8UMRBooVLKJCE+gUhd8u2YrqlDkme+by/fiurcNSRBcr70Aczsw7UmZmV
R42fWiZlTTNstiAcQ1VxDlj5gIwHxmGFGbN0pdygs7QKclwH1+oAvas8ujIOHFEzam0BCwSA0cHS
YvvkY4R8DV7rNN8DWq87/rhUD0kcNziGxp0Fw64qJran1i8lYK+GO1sqdJmFKVGIjr7nX6fKW0sE
NpmILZN9XtPB8rShrofKch2oU9585BMoscRQU6nyD1TVaWOmzM6ywxdwRTr99wAOBWBroswuIEpC
2a5uSZIqqPHAV/edAILlCt6fEZ8r8twCF1tWXUIduP0w8dkyDN0Q420xng+eiOos469Z37VCIlqG
vVI2uDy2qJXCenoBTi8p4WA45cEfR14FiQlS6hRXoKXSev+JcUt6kbtT3dl2HDQLNlYrIwBSthXN
xHmcsQIkSHZWpJDOrGjtrFfHgB01Pc7E8prvqzWCITk1yK2gVPEBkuySrN4tfNkJjRFf599RnASe
r7t+3lP8mu+51vvt5svL99+enh+/3nx/gecT5UlLLjzodxVOBUtbp1Tae394/ePx3d5MR9oD44cm
Xuh6i1MBpOHVAsd/RA06MR476cMlrjMgC62ND5BJ9V2LVFNBUCvLkY6RZ/+kj1X2EfZroQfNjGb/
uU4/XhH/YNCmq+PDRViPPkyLsGfrdcdNSU3zmGndf394//Ln6vbqICxJkrQgWl1vVdAz6eOjpOIR
9cPUxYlarzCEvC5Lxmt+nLyq9vedRXKzFDDkqqsF7FcsXuBj873QcwbpwwWa00dJgUP+MG16/kcT
m9CP153GFsYIIbXoOhBSuNz/0dQIR84PU394jaxoYFDqllSHD+/MwrPx6QhtWh0silmM+p+Mnaa+
WCf9+OoXmpm6/XA/quwDcv5MbWXTEFKwn/go8cqDAkZ92/2Ts3iFITaJP3w7juQpKSxML0Yc/4Oz
GITuD9OucNcIdWd7nLEQc43rxwu0tvdShNq8nVepGaf3UdqTr4Vjmvy41vRosqpRF2hl1NlkKPLm
/3xAPZeB8rwlXFO50eRoMYscYxNmhCxkkJiyNtSuSdQg5azU3fEnrdXGRd2WByJVBjK/7krzXHun
Va2j14oLwdY2MmzKGE3emPoLgRm5POsj3Exiu3plmq7DrzpBY6p3NYKJz0XkWoVOEzyUwld4cIV2
RTpR6FYFgen7q4Pu6KwQtOSygmWs/clq7ypI2AoRc4ju7bU9OG7S/w7Xtim+HfH3HmU7YqGklO0Y
Wrajre55O1pqVjdbiG82a8eX3WIlGTcc1nzehPbtFH5gP0k06SkP8U2tkMGZeZ2qbixqdYXKwokq
NPDlwqrxOm35gc+0cGQKDW1XK1o9OMIrJ4fZ4spODde3amjbqyqFcT6F/+SAkomrBve3WN/N6J0b
Tnq2JI2fH98/cGUzQh53PhsOLdmfCog0zL9r7MS1irArVDz22XbeLMKu0U3vhdmQ7rETcSJr1u8b
q0gL/I+NA20TvDEmeqCxQzvFDon9HOICDwLKUAWpFBdxgJVNbYnYyZD71gsj/AjRhb0RTOXnLDGQ
+u8hP5RsBKq6brToUCP+zPo5bkncEE+4lIIpBiXaSzSAkBK8ysjxXCWa+QIdDmcLfyTRlGeUPROr
eNE/j6t6Nm2aBqyIlR+eOhOkwNShvScFaSxIo8QMb451ZeGjQ3aFNcTCT6VpCh8UoHwuHHKjQwLf
zHd/Pf71+PT8xy+jt4ESNWWkHuL9naao5eAjGtx3xmY01mcP4GzhrZRq2rxWdP0cyoXzO6y2FjW/
mbA026tGCQJ4ZwK79K7AvrHbW+X2cWhs5leAZbKV+TEd4R9pdOHQqnYNEzyhdmU6J2D/piVasrXq
EcSw3kFPVkno7f4qTXysb63CJae4y7CoJHN57mRgjBO4yeCYmNym5vhl+CI9orYQ03LLkYoW+w+j
NrDIX/1SJIi/YI6/Pby9Pf3+9MW0OmFHumZ3ywDguZjH+gcBoovzKrFECZ9o+OFk2/9AkF3UUQUY
E/ulGDUCwGMMyNboAmpa+/BW6bnRB22Co7z41BnwoDO6M+YcMuBgnmQAoYq0xYaLM4h4PhQgSTle
M3ue9TfxLeTKNFFxqXVshPMnABSjDK4EL9OOoAgeUB5DxKTKExQDDkPGyBDFRAFsN8EEBbSGWkcB
Dq7kC/RAhLXK3qygzMH43qyAEnAfNuFG1wComlVMXYP0sEjFuT7kHHq7x8l5PgIDyvpGTSiwACbU
WGa82vFJBcF0kJIV7WFZIwOVZ8goCZsFMODGGlBhrAJeudGbEWFepCNiPD/0vdLFk3n/ynGZ5Zl0
cSWxtDKSikIqqRqywsqORh2Tl8BsT25vgU7/xWwDZCo5DoQETxSH0AVexSi4HPNXYh2xu8voRGjV
PLgUigF5RGOE6yatzvSSd2i22TNipn++YqMvPF7lojgCyb9ZjUaDlpr5nlH2P0CGA5VWF4fAnQPf
qULZxhe2qMpSrOhR7sKRrvApfJgs1iNglOCDRAz6a2EKNaLu2k65DuD3QEuMWeQo1kt9R1Qxmjai
baTxaDOenVK28+1l/OjnC9WpTJ+EEIYhiTrILWQzpPeDmv1qfyf/EMmhVADt2pSUo+O5ZtMPei+R
AFr13Ll5f3x714Jb8B7fdpohmYRM2roZ2FLKp7g1o1Bv1KkhZDchaQWQsiWJymdOIyWfzuwHqFdU
wD4u5bkD0OGC1zR8cnf+btJkMMBN8vjfT1/QAHRAfo7R+N4c1YueKfS0iC1iGWBtZlICt+fOnmd2
MeMqWqS30kmGC4okYyupbfAnKIa8jdE0UvgiArVqq4bOuORtWii20hNkEAlxJmjKLalk03kOGjOA
qqBcMWmMswOIs67JUk+I58fHr2837y83vz2ysQLjlK/g9nxTkpgTSD7+IwR4O/5qz2NL84DZztLi
JWdQXH2T3eZWVnKnufjsmiUQgbKvGKK37qtdg7hzkhyXQuO0gddzVAzPYtmULmbn+yHvSKECqzg3
AOCHryrFBfhEbI/jjOAY58YEVY8PrzfZ0+M3yMP2/ftfz6P0c/MTK/HzzVe+lt/kJ76Y3ZbZdrd1
iN4Bxv/hHznAm73rOOpnZEljAIbc04akqQLfR0DDie4xsKhA6RcgvPWhKdtzATVa+k+7cRbU7+VQ
aHG1GDpXfQMoa3+on13aKlitexccM1lV+8GpnCppRjlAdWGTWV7JR0WDqKkwE8g7oLo/s5uTLfxC
Z0t4ctWSqp4kcKByc+7lECN5UZ9TyYBYBG9cblOh5NavhenMhIir5V5iR0UoPjkKif7DjNUsASdX
ZxWJ5IJk4BTWOmML0KkFPKENblMByKFBNW/QXEm1HjOASG3PO6ni7k55e6vlesxXYlzz7+lOeMQe
QOY1fi0Cjt0GdhxhbBOKnWInNMipBLAvL8/vry/fIDHzV/Pih7oJaZOzzXwICLKO/W1Lc8GHu40J
ztZCcQjnNU29vYoe8iziVxFUwnNc2UtDfjFLvq65C2P+LSZ2WxeOSpjGZGWJTUGGjVFPHt+e/ni+
QEBYmABuSkL/+vHj5fVdG/p0SC48LjJv19qpJRucvd9a3je1FYjnuzJ2U1RlO8lt3lrS3/EdpOeP
0+cG5fHWhkmM08PXR8hxyrCP0jJ+u3mzDGZMkrSKU9uITrzl1WrnIE349pm3Vvr89cfL07PeEciV
w/NKos0rBeeq3v7n6f3Lnx/YrPQyioldGlvrt9e2HG5sx0q6miYu41zhRASEx4gb4hyNrcFq2J/m
2AhN/K8vD69fb357ffr6h2orfZ9WFuO6Jgm3Hp6YKo88Z4cny2tJk2sS1BIt+enLeJXd1HqIhpOI
hShMUpeTXgEP4GYvpehmt2pXNqqf3gRjQuFJn+ZZrgCfNoh2iX93K9qcY3rvT3lhJjKZI0t/e2Gr
9nX5kuzCZ0YRWSYQj/6RsBqVNNtdS5bY28vnLaWktCvyt6IEkKWr2Nvsp5ciWLQ+M2z2+HGzaCSi
iZ7lmE8TS8Jj++E4DSpNFpc2mahleeCexdHW8jwuCCAe9ljN0KZljSYF4ESEp58eSXlMa0nRPOWL
hRC1p64W6L8x9PlUsB9kzy7GLpclUcb+DXs5aHWbHpQILuK3KgSMMCoHYR5hF9cgK0tZgzPV194Z
MBrHkvwAUbV52ia+/DJ5eQIq48ezlg5++mQRcbdu6qI+3MtqFsuuFtlS/nozhasxG+twyOmeVStp
bsu672T/Qh7oPt3nSnZH0L9DDJ1y0PjPET9l4RzEb2Wz0GIoY73ckrFF6u18itZMEtBC7UCuXTPN
+KGy2MCWHabrSzqJ0a4z+f8QWabrlHCVNRiLQW4QOeo1A4qoRCjqtt5/UgDJfUXKXGmV+8QoShMG
U9YR+12lakcgRlp7hohqcow1gQCluwIDAUdJuAwVitxxy2lLWt3cfVoqIsalpFgcg15WkPuK/ZDU
b0lbK8q3iRR4D0pZb7u88b2+R5r53BKlKPweLm3epdZDlJOMsbywSE5GN0540qcJXdS1pCeQoTzc
GPd6/TXS8SItwVjWaDJp92tBRat9gpWit7gkM+N7LN/hhBUjaQLHL1gykcs4rvaSg6nxyQStb5yc
E22OJ/B4hNFlVFT0RRPWIWUarMYhZQzEXCWkfWNdgZ5kbV11qZyaRULCQgDcXHB8zhBrcHkdmaE8
7uzqQGqzY+KpuliFJutcppK4MhYB6KTUNOrhRRD1CpSZIxdJugqAZ2TfiixqCjTWAMK2T1JQLUBt
RcsYRR+owPWVLGM73chtUgjJIyJiSz69fTGvHZpWtG7pUOTUL86OJ2d1SAIv6AcmFkjfIgF1dZuM
Yjc2drqfyvJ+PEklMyrGOllEvS7PSj6DOLMd053v0Y2aSXViHis2bvTUQi7NlivtlRctxhgU2GvG
mM6Vdm2jWEeRJqG7yPFIgUbEooW3cxxJVykgnqT2nEa6Y5ggcOSRm1D7o7vdYhk1JwLei52jPA4f
yzj0A1zmSKgbRjgKLkc2KkMaN/7IFGANw8m1PFZOTASovzI1nZokQg6WLCxCWzLQJEultQ4hU4e2
o71S3bkhVY7pP2MPbsXphShNGd9RSsL1NPsczk43b7O0tAADeQBHcJEeiMVTa6QoSR9GWyz580iw
8+M+RKre+X2/wSxsRnyedEO0OzYp7Y3epqnrOBtZ16t9s/TasN+6jrFdxmxB/354u8mf395f/4KI
hG83b38yKebrzfvrw/Mb1HPz7en58eYrOySefsB/l7HsQD0od+D/ozLsuBnZemMXcByu/BYaM5BT
m2JaAvnz++O3G8bC3fzHzevjt4d31hFE2XJmPIONxV2rQmJl0+pyh90ZaXys5VnnK5oUMWRQtOj5
50WvUxh4eOqQDy6yJxUZSI5+iHLG86/n962AmLuEB4EH8xc5BibJE55vD2fbzft7bBprSFXBA6sB
Wi7IJaccrRY1S4kzAnP0BcutkJ2olrVKLJM0TW9cf7e5+YnJ8I8X9udnc0SyvE3hhVSezgk21EfL
bM4UNnvghaCm9/gSXOue9GAyPkBrxn06j1NXCW66zW9gmTS945m+VC3DdIdlytLjVkipRbtckhjs
tPB7utFR057sCzldLQjVZ+VDDqiRO2uLprrtciyyrGHqDdV0hP0cznzU2ppdZWiRc9opBjAjA2ub
3qooa9t78blVorWRNq7QaEJg7y+0L2r6VwDDpOEWAgxrcIASjg2vflJI2LSy49jly05ZXPcEeHZl
bbeehe3gBHa3BnYApJ7j4NsXCPScxBKKzXFteqgmT+wuevrtLzi4qdAjEykpiaKXnjT5HywyH/Ld
EVLJaMaaZ8bzsGPeZ1yjyg1xPbQfB1vcfWMhiHBF8pkxORYj4u6+Odb29SZ6RBLSdOomGUFwe7Zw
IF2p4JCqh0raub6L6QnkQgWJQUEQK7uHFnlco9lPlKJdqhq+kTjVWMAFJfiADg0bK1daks9yUHQF
pVx77Gfkui5Ms2XCWFnd71qdzKqMbScgq33oD3u7Eb79pXDGDmfvyseyo7zqckWJRO70FI5IuTbG
RwhWfK2dRoVtxxeuFWHbzYVrm91ry+zU1q36nRwyVPsocjABSiq8b2uSaPt1v8G36T6GUG2WU39f
9fhgxLZl2+WHusID/UFl+HZnslaXltbIF6ygzSJ4+eBYRLuTCmFeWlKZ8VVSLsNuXZs70VzonJ+U
cZ0epdmADJa4QTLJ+TrJ/mA5FCWa1kIj+jfYwhkW+d1Jf6EzkFofkUE4pgVVbcpG0NDhW2RG4ytj
RuNLdEFf7RmTKZR+6ccrUgSygVbKTjukZV7l83WIqx1wFkeqODH4N8aX4Z6TcqnRVGhpqPBwRTRl
q0FP6G3Wl5anIlX0DvvUu9r39HN8zJXXOgEZqgbcWSp2c5Yi89q1miDFDdgRKfsMnmOy0nKRALK5
Y6KRZZkCvj+wrWonOeSkyiycHRSHbuPH14y1bdSFQG8d+fbTp7yjJ4RrysrzJze6cgWIfMnKwkTf
NqUiYG4CnIjCZBzzPjgm3nCwhS2CUkOW2tGNs7FyDUdLFFYGB09ZfBQBab10GNK/8pkncklz9Ruv
bvQ88oK+R9kAyJygGLqlLnrFAtjR6SxMfn7Arc0Y3LK08t5WxMpXcYytuo2tZwxhK2NLcV66Dn4K
5Qd80XzCnx6WMS9Je05V88LybN3RJYizFh3KuWksTGtP3DCyrlx6a/HOp7f3eIV1DAx813uDZV3L
34eYoWFUBWOoa+WALouebTf8cGS4wK4XYlh6WUVnmFOC3J88btWtcEujaIMPB6AC/MIXKNYiHq3j
ln5mtdo0g1p/auMuqmIv+hTido8M2XsbhsXRbLS3G//KyctbpWmZo6dFed8qZw/8dh3LWspSUlRX
mqtINza2LCQBwhcZjfzIuyICsP+mba5eBNSz7K5zf7iyW9l/27qqSy1Y+BVmplK/iVuL/jP2IfJ3
DnJ/kt6qp0q9W6tKeizdWPRTcs/PjBNWmEKeaDXRzhKzYH2rfDOjr6/cS2M2orQ65JX2gsdke7b2
0U+5T8HkKsuvCL5NWlFIUy1Xy1bFtbvyrqgPucK+3hXE73tc6LgrrOIgqxPe0m3oO2vohKkjJ3hk
KBWJ6y4mW3bt6g+wBt7qESGsi2zsTlteXR1tooxNGzqbK9sRQg2yy0AuFbn+zqLXBFRX43u1jdxw
d60xtpCIspTo0XoNtuR8RehtwXGzRc9CSkomhyjPpBR4Er01pGSa3uFV1gVpM/ZHzTWU4bNFwbEG
1siVjcD4YqIehvHOc3zsWV0ppY5iTneWe4Wh3N2VRUBLNRwJLeOdazOt5ycVp4gt1rZpk8c2639o
audaKufIzbUbhNYxOymEC91SlB3ijIamVw4Q2vE7VCnalSC0XV8YJ1V6IU1zX6a6sfpUKVt8FreB
GFxaLer/Kj9d6cR9VTf0XrUuvsRDX+hSlFm2S4+nTrkFBORKKbVEPsQN4+UgRw21BGju8Bcnqc6z
eoWxn0N7zC1aWMCeIZ89HhdMqvaSf67UfGwCMlwC23qcCfxrukthQSFXPtpUkD43Dm2seIs/VADC
a3BZNUsSfJ0wxtNyyYCkspbZj02cLUO44LGBRd7tgtJif9/gNwPFFUgnuh89oo3XNUDFxKLuAOQt
k6UtVwOgm/RAqMXfC/BtV0RugM/6gsdPMMADQx5ZGAvAsz82Xg/QeXPET5SLdt7PTsGXBHumAfLl
YakUdzWGU19N2c8VtzOGDQxuFK20lN0QZZSkykewk74TQU06DQuqZReicszWYHGCr8U2pyUaykuu
dJHnMeQoDOPYlqj+kQpuZpwwpOwzKCNkC2oZ3lnoP98nhOIo/uKUVqqGeDxTWnIfmy+1Kff/vrk8
gQv3T2bMgZ/BT/zt8fHm/c+JCnEquqCHO2emuYmEbLW6HJULerRbxY/6EuQni5KNFaa5YhXNIzeM
Pqu4Eogm6E10llNxn8uhAaNZWSIcYeYWGs2efvz1brXsyavmJE0z/zkUaUJ1WJaBvbYaIkBgILIF
WJl/V8EiH/at4rohMCXp2rwfMbyPp7fH128Pz19vnp7fH19/f1AsT8dC9YmmSDMTHFyV5RScGpay
24JNa/+r63ibdZr7X7dhJE0LJ/pU3+OhSwQ6PSNdS8/C/V+aBps3sihwm97va/BckzVHI4ydp9il
LaGbIIgiecVpOEzeWUi6271k0jvD7zrXUW1QFRRqhCpReG4oWbbOiGQMVNOGUYDWXdzeWsy7Z5JD
Y9HDKBR8daZXqupiEm5czO5SJok2Lj68Yj2vlS7KyPd8/EsZyscOEan6fusHO2QYy5hi0KZ1PRdt
rEovHSrjzRQQ0QhUn1jFiJi64Lr6Qi4E43kXmlN1qzpNLM2ywwC7G5fxL72hq0/xUYmpNaP7TtSs
w0EDOaQxsrBj0jDJrkfKiCg05hGxVMJ/sgNHigQ3gwZSyHGDFvj+PsHAoCNi/zYNhmQCFGk6xZMA
QTJRVHGYW0ji+0b1T1pQ3OuGW2ErWtgZnxZwY8c4Syt1IgUOCdWESW3xiZMjHC24rI6BN5FD90m1
jx+mNUzTNreIsoKASbtFylu19ovNcrDbbszK43vSYEYPAgvDovszqBjdItlGxr9thfBM+74n9p7A
6YYMzbwocMNonUoJkDJfdZDsQuIWJ8hAKsLWK4bwEwyaSEFpZmhc71uCUB8yD2vz0OaKU4uCGNB8
nwvJKWenf1l3SL2cfxdBFc26aZ6kFwivh5m7zlRdqaowl7q5nnut6IW0bV63yPCU5MCfsxAUY6ni
tJZdPlXUHiKNIMUgnFuKtdVd8oT9QDCfj2l1PGHTRGjguC46I8AknSxpi2aiviGYunrGNxQodJt/
BM1Y0tV6+hafnIzmJLS8EfMNwGOJW4LVCwI4WQS3aOUIwTBfeS/gUJJs3Q0upo8Ebf65riCmFd+f
a5Qg7sI1ZjvnBNm+JK7KwI3Mqd87w/7UdZbgFuNX0HI452y/drVFaBk5+n67DQNnqCt2jdrHhJPt
/PHrjFs2dv1t5A/NpRUdMwhKxoRhH3NoPDznuECCS2Gaaq7/EjJJIT4xatm+EPFhMJsmXc4d5rsU
s7qc+Xq2P6uRzuzEbd99soSJGCWsS9qWtoxFguY+5fL/CkVcus5aK216EKH9x+lZJe1OyzRZv7tr
aBh4bmSfUdI3ntMPTXqrY06TZKqPRZxFNmPpkeJSjtNt7RiQiPn8G5nptu5Iew9v4HWCrZmE7JzQ
v7LWm9gUfEnSF/6mx44FjrDc2SqNEuNAoPKSsvZO+hDGJfEdOaCaAta5GIEE3QdjpWXVyMpQJ+3Z
C9n8IaeVSRcGE53eI4He2tAteAXRBltFbZlvDK8WDsSHkqNEqDUFUu41SOb4yyhPEM541hrcS0aH
NJ2eXZI6xNMhvmN0PPMxQUiggmBSJxwfXr/y8CL5L/UNqHQUV12ll/wn/M39ITUwhEC7LTX3OkA0
MYglSE8Eusj3IP9otUFET6Om0QZ/rTaGA1dqo3NtrEpZI7jB2hbSvkx90gbiQMpUHYMJMlQ0CCIE
XigCwgxOy5Pr3OJGOzNRVkaORjK6lGCTt7gYIuo6odL88+H14QtkVzGcs7tO8dU6Yy/vpyrvd+wo
7tT3OOHNysGW6SHFUNWVCPmj6qb4k3ZntTiP7+OCJJawM2XdE6FeL2zWakABKRM6CwEEooE7z8Jx
TujhYDFyqT/XFuOgHA0YXA3HpJCd74cDVa3YIfYLkx0q1F4NYm5oE1Uk3AP0BEEoCH7QspNYC30h
3DUfX58evkkqb3XCeGCTWPZoGRGRFzgokDXUtGnMmAxQAoEzCNW38kSZwbRhnygTxcLNztJWSXCE
EnFRRqQ9aW39sbDJMknJrrUSdUuQqaqWm7vQXzcYtj1VkHxxJkEbSnu4MlGDHJmM0CZlA32GutTj
bR5kWti+N8HMD5Wedl4U9fhAll0YbLdGm3W2uNyO/tLVy/O/oAhrha817q+NOEyPNcBNwupwXIst
hUaF2Yxoi5fH6AQDPnhWM75m0kbqXzLCxTQNG1s5y0wzEcV3VfNkBYOpeUcCqLDI5bQRGmJZX67e
J8h1mpufwsFSsQgnwLaTGqNZAko7U//ETxQNIj1+Py2NDnIbsENaIV3Ps/yMtSEQUyfszd2Zvadx
XPWN2VTshjnd9r34ZitaDaShFcXZRYNMYb6nJS34m08dOaDbecRznKUs4GCBwVVqrkmZaE9OCSTo
/dV1A89xVijt05xnfdiHePgQTjDaijR06rReg0pwfTLBc9AYFsbcsZUtPtk1mmgt5ugjGjxIikY3
TkRo8ior0h4dfA1vvbJiMODiYfvyQx6zq7pFlhLcMJ9dP1jrdHlO9ye7ReV0FF/wkKLala9vz7hr
i0kprKL4Q7b8QCDBeSnIJV2rE81AYLJQddg9fzxPAQAV4wcGxcOhc/pYeoUZ3eSnAV/kvabMmRRY
JYVsKcmhPOxpQjqiwyH8i4gnp8jVC87MxizTCOsjoQ3OSKx3RraNEAB2gCliMwAvkLYnqa2NcAVO
nekF90br2OBdmFhVJbLxygzi2aCZjKOEkluw8KqmRACaMWIC1loTvsRScO0ZMXtvGpiyu8XAaX9f
1RTvCGM1U4vbb9OAE5bJ+gqzkZsvdnFo5vxlXQIEdIVULhtFJbJAN2qkpbj1bIraZrKCQreptXuz
KE8uy+6ZZB3SC3h6pr96wRzJrYvZn0YRMqTJb7DrmhfJqcYAjFADoOvZJfAQtwF2SUwk8IglbK6+
m+X5QxiDVCmqH5TJqtO5FkodpRZeNToBgMUPGsCc2bAMPPmr+rEZwNliW+Z+/tbO9z83cgAoHaMG
GzWwikKJTaGqZGCXZXGvvWNOMB5eEbNQmvC1CAoyRXc2F9UijI+Loj1RxibUdSei1Jr2QIzTMc2A
POl0hknhT+E8E5YChpC3cqomDjsyUsX6hQHLUz/JEeVf396ffnx7/DfrNjQe//n0A5Mj+Hpq90KR
w1O9pRXqUTPWLy6772oFAs7+XilXdPHGd0Kjw6Cz3QUb14b4N4LIK7hBsV60KXodMGySqkW1gmXR
x02RyIG0VodQbXoMYQw6Bfz0wp6e54VBvv3x8vr0/uf3N2VtMMbyUO9zbeIB2MSZ+gUCSOTeaxXP
jc1qMIgcuyyI8ZC/Yb1k8D9f3t6vRA4XzeZuYOG+ZnyIO87P+H4FXybbAE8UPqIhKogVnxuqQBlJ
LWYWgGzyvLe8dsDZyR+acU6Z47kHFtsRJ/tiyGkQ7Owjx/Chj8v0I3oXWi5Khj5bwvuMOHZO4wfU
32/vj99vfoOQwmLCb376zlbCt79vHr//9vj16+PXm19Gqn+9PP/rC9sQP+trYoxNYdmFMRyv2BGS
pDQ/VDxu+aQSsX6CTIsaKANRWqZnT90lgiUK9KZ1mzZ5kZS9Tn2blk1heZ6Bs6QLA4tJOEefw02P
xvPlC4fxjkl+q/a6nizDlIoMeUVevTFBB1Em6YleYwOK34KcLe+djGJWPFgqvTs1eqVtnqOPa4C6
9Xv1SyGhFDvwilSvheZlh7rtcOR9dXdiXHyrlwJ3AtLltmzzjGIMS2KbjtGfQ/8kLTGJMJz+N+MP
npmgyCh+EWfow9eHH+/K2Skv4bwGk6ST9hoI0yACSzMZ+XDExGzehXpfd9np8+eh1gUj+CoC5ndn
+/7p8ureklJJnBDsLhMmsSMzUb//Ke7A8dOkE0L9rNHyb9CzFgIuo7l+P6F3kTb1WuobGQWLVRE/
J+AYnXPlAIHo+/bItTMJ3KtXSKxRKyWOTyrnoxovRcHV5HqmTACJNI0ajEug4mmiyW/KhzdYcPFy
bxsmz1BK6Ksk1RDARMIWf+s4ahPgugT/Ch9fFcd4kz3RPChBgrHeAOLTpsNbkfwAc7Ec5yOSJxDQ
yoA2ie3+BI9oDBSQzwuUTcYY67fQVJ29KsAmitjBJ4Gf+GrdtdhkGpA7tStlm8LxPJWKHcOeXp2A
je80SofhMRBiDFh63Bpfzc/wOxN8avSq0dNeoaB+DLeZHR+7EeNjHPQJGvBHyJRVZ3rLDH60eUhz
PNdm2yrlB0DZeVvZzphj5otC3US96i4OsJWLAdA99+vW1s5KtilAf2atl81wuNO+bN69zevL+8uX
l2/jNtY2LfsjxD2lUog9Dt4yRkxn9WuKNPR6VPU8DZg6JGIMQc1lTA3HiKBnoEns2tri3dqU2DY6
yqo99kMReYWNBZUzJL1NogkHf3uCeMbLwEAFIAgv89w0amq1hlocdBhmqs8UzKFYXOQQ5+GWK/uW
Pkso/o6sND1hxqNlbugPSDfy8P7yakpcXcO68fLlv9AMVF0zuEEUsWrr2EwKNjprje6a4MhTpd2l
bm+56y30m3akbEANK3ltPXz9+gS+XIxX4Q2//W857qbZn/nzRslZiQcLSVZGxMBT8spZ+vKqlH2D
JHoQuLMTKzY+eEtNsP/hTSgIcfUaXZq6wg3cdvJmmTFoDuMJW8aN51MnkiZ1xFA2iuqzzozp3QB9
oJwJujLrsb7UcVrUGIs3E1yQb6Nb9aF0hu9Q9+QJvU/bQklFOA0IZXc+Vp8oMOwPm3itj/x1BalW
8BOkiZzQio0b13WsWH8rX4Nze6rxx1ymuWMtYTZcCkW0MWvMm7uN4+5QBNRpLgaOUL0YpO5FIfrK
J1PsQnTIy6TchS4WwV4u3G+Rj+C1uqGtS7st5melUOys37PbXS8cYQv8LqYbZ21OOItB6Z5xOGUe
Y1XQeOtGa8NJkzLER5Nhos3aYLKOCyNtHT57XGmI8UnFAod1GyJTw7iZRk5CMsEZcGgjst1uYmQT
zNhdGKxheYwhofF9/Pr00D3+182Pp+cv76+ImVIK2R+U56J5ErtbEDzVkCEL0tu6GA+3EIRb3kuk
aLjdbVEGYSHZhp4lCNpMErlbXEsok0RXSQJXUyZOml7b0BlfCsp9Yi4ZttC3hYtMFEf4NkSEDlp6
d2Ks5L7NT5j2BngLhpUuSQHgaVEgK86YpD5wvYmizrQn6qlI3t6NAcqUe9UkBo4voxrMSL3Lodxx
0lneIR6/v7z+ffP94cePx683XNVmrEtebsskiSlH3DwkHLOSiFW8WljlTeFncCHNXj5bOBRM22wl
sg7+ceS7Sf5gOU2Cgm5Hvk8GHotLoo/QPgrptje6VKbVZ9fb2npVNnHUy1eigI73r1oVkytDzNZL
WNrHpDUaZ4ceCRKPLcJ6j6utBVle4yLOtEpii2cLx2NilUphRNo2kAPV1j6iphPLpkyGTNfxzxve
uipnbTiHPv77B2OszdW6OH6r0KrRQAfIxptoQLFHHAzq9RqUv4L5JhQcMsyP7po89iLdGlBSSWlf
JfZolphfqw2m8JCyT5ypFpexRRNtjW/QD9N5EMCpSQNzpxYnCjGw5+rzwME72fCfg0/x3t0Yw34R
zI/88GeOx5xV98o47TtbQJhx2vKBx6nWLyKNKBVUHv4GJXZxEvueHiVLStiLfQCoGVaXNTuE3XBj
HCfcCnOHpheQ1rOrT2Xs+1HkGGu0yWlNccc2sZ9bwqYJ884X1YqEm9J8IZ8lAlzQ/frnSppu6b0f
KaZ1IL49Sfv8ovhlXtwhRhLcuP/6n6dR0b3od+RCQr/LwxrU2EAvJAn1NjtHa1PCRRivJpO4l1Lu
/YRQb68FTg+K4h75EvkL6beH/5bNglg9ozrpmLZqu6MyCbTYJhi+xAlsiEj7fBkFgXcSPQkmRur6
tupDa/Ueti5lisgJrIV9TJJRKfS1JKGutbzxI/x7AqfHEdvIsSFcHBGlY7YzFOdu0eNIXRkSwwsG
egM5Yz4wAgdpWxULQwk85eTFmX6JzhqzRCeC/3a4catMqqsgJFTRxd4uQGUliWpsRhIKJOSUxc/W
hI1DkmkEH2arQWBn80ikrjYFUybIPSYrhkUxFTc3ABktSxlp7SI9NU1xb3ZOwE117USUEEEo3TJT
muckHvakY2fVvWLPBomzeRF09kFxfID1x1g5jVueacZaBxJ30W4TYO7OEwnsmlA5lWUMqsNQCKQN
p8A9rMoiPTAR5mxJVjIS0T22sabPZli5ZhHauNULGZXu7+BhxZLBYxpR7l+88sGCYPngySFZnV6A
RtGQndJiOJDTITVHiDEe7lYYkeIYz4JhnJP89VPPc9pAqdWvY+WjHcqeTBTA7XqSt88EVy/YpT4+
8stGm6vp/DBwsQK9u1HciSZMknY877cgCYMQLazx1ypm55sYNucbN+gtiB1SFyC8AOkhILZ+gI09
QwURGod2XrLl3t9ssbKjHIBrmqaJ52tIHNEbTDie6NoucHwfa6bt2CGAG21NJNwCgnGQDSYLTUSn
mLqOo+zs4wVPUse5JiK9A4wAyBPW5VQNUzTh0jJl7VTgYToe8mxpFIStffqroxPLedwnGOQRh3gc
Q9fmDdJAkmbkVLBbsz6zjqTNcMmpch1ghBnJ2RyyIcCtLrAi4Ewsoqx8uMjIVBRFHVvjZ0zl7L1C
COXvRNBgCTGM5hAIevkSeZji5jRR4asKHv5WKZL0nLXpHUZjLAoINJHL7qkTarSsGKF3dZvfmQsP
1EYz9LsCZWvNN1HjO45RESibF6AQTB++v/31/Ac8UL5+xzxsRxX70sYi/FmKYkzCUpy3evfXw7cv
L9+/25vlDxQdRBqQm7SWmznm0TNl+eYJYoRNmBFVfSH39Ql/xZ+phJsOtzQf0gq2KHbOzOQQWI6/
BLOKl50/oyetLh+Ny8P7lz+/vvxx07w+vj99f3z56/3m8MK+6/lFD+85Fmd86lg3LHFD5J0rtMVf
pHXWyWO1LGoR62PFwUdobpCiCgLc3Y5DXuVdTApsb4DK1Ql3aE2ju91KJz7nOY+SMZeWzvMpfMZK
8bJgtSedXIr73jZMhFwrx4n2lKDtSo+na3WMOnNkpfJswNSP2c3uIGg7JrnIHZqGoQq60I0QDKTr
9qVOKlaMZe/B0KCiSXdCy/CtipeZQvhi/RP5Bvg8/K0D289EzM8E7xLX3fXoaiFFXm5dx9W7sHxT
6DtOSveWPgr96aC0B96NxHNVIMSKEb2ddJL/+u3h7fHrst3ih9evyoaFqCIxthiWLZ10mundpEC7
WjnwOmjl04KBQNw1pflecfKUtfhAQsFgUwWxHoEPOl56wmq1JHm9UmZCq1DhFgYVck9tqehizWSQ
Wb50JFJf0PZxSZAeAVgjEn2Pcwv1jMfAtI418NJj+Vs4imYFobj/g1yU56qLS4wxVci0qIgCh9pd
caea3/96/gI2SFPEFePeLbNEc6UDyCSFK3IrwKm/tbiBTGjbC3PJOYMmCDzc2YKXJ50XbR3DXlgm
4WHhwMxUi+C/II9FnFhCVGaJCIzpWORqTpDsgq1bXrBoyLwRTaReYKobHR/Z0UobDAqVAdZfZBaY
EX1zweD2srwd/VV8BvoYUH0Nn8E7+8wI/MrUAiPh2wcV0IFnzcYjkVjDi04kuFQ4oUNMJTgjfX1k
GdSWl4Cjiwr/ZkCOnHLREDSnM5+42IWESMZ8CvDKhE4Uxoo65uGGXVTcikf2mu3An4HmMa6oAjSr
yuZOUzQMbXHSApzNgQs69IlUn9nBVeOJLoFCXLj6iouipsRzFC/YQB84Dg5RjZfYJ7O+Rts/oHBB
c9ksaFlTs0Dlh9AFujMWEodHG0xZNaKjnYN1LNp59hXN8RazngUf2fFd6K8VT6vMc/cl5imRfu6n
IH/qSQBAy1cqr3wSHFhJ/dObOAvYhsQGbHw9nuKdKMU489k2uMcJb8t8rZWxhsaJQ+OgCyxGTRx/
GzmRrUbBd+tV0jReu8ZovtmGekQXjigDx1VHj4M0RofDb+8jttw9o+mSWvKJ7/vAMW9XtXBXNtZO
G48dAO3ygZS+H/RMfI/Jys1bNP5uYx9k0OVGtlFmjRSluYZIURJciw56StcJLEmyuY2Di3r/c9RW
u98lowj12zkcVaXOaM/dapXli5WGPpKACELMllKqz1hsHB5Z3FRngh36wRLaU9fXBDUvoRmjRVcY
cexY93EmsbsUG8dfWYKMAPLkrW2dS+F6Wx/ZOkXpB+be7mI/iHYrQ3NX9hFuI8KPtD5a4TiKOj5W
5IAauHG+UBjzaMz1GAPZGNYJgYwq578sRip8UMrAdeysCqCts8/NcrZ6ixxqv1kYemNJ4zWifdcI
O4WRrLGEQBI4tlDvUyc3xnFeH0vGxm9dm4WQTMR4TvtX0g4YLewJYzwrM+2gmN6U4axsU0lnM2mp
5jtNDn1gk9IWNckYuliepCWese0hd6HI8h7C8dVFRw6SqLcQQMCck4gFRU+KG85CA4p1rldfqL6b
VIxFO7CjCEOBVBmFClOnIi0PvxJREviqBbyEq9g/eKhMiWjcYkVSY7NqErLph+dyS5O251dpbiax
A8N4roNXzHHrHcxIFfhBEGBVq7yCFPiaCw/4IhK4c4BazixkOS12voO2ylCht3UJhmNnc6heeBKO
8QXb9Y/lJB5aMbwAo6tNt4RUMfjAFeK2sKHCbYh/wiR4XFl9QBZYLhuFiosjqyMCnH+4QXvKUXJe
IhUlxBAcFaBjzFFb3/rpXEz60EftMHZfI4ocvBOjRKwLBSrFNrrSAqNhEhfeQOOyUfcslTNJ6sqO
BJLIwfYdl6OQJpvs9Dl1Hcsh0JyjyEE9nDSaCJ1rjtrhqEuJdVM4CZUJyFdYsUXUMVGTXGVgMClF
whYHSAeKMxISGavDCdfvBkYTeRt0wzOeNHBDH5124GU9P7TMgWDwPVxq0cm261eBaVmt4Vx7D0cp
wtY0kwmuN20fHMH8I7iz6vUpISbbOaTQzJSNmHgUheUHbo19Z4BS3iJF3sYK+ZjCQrHVyyHjfIxl
t5BJmGx/nSS8RvLpfLUhWlf3V2lIdb+aj0MYSDQTifJUB0dUCtkLrrXSl816G3lZV5Ym2rgsVwrz
qTjnsZqDvo2lPCG2Xh3zPjgmllhOok9rOIgfaMOzcdGCrCjYzpI2BMw0IdqsJSxWa5VNANW1KSk/
W7KhQp8PddsUp8NKx/LDiVg8PRi261jR3DIJUzgCbfaEl1ZuXRnCZ8MSNInfCyvYlbRkgLW0yjrb
7+t+SM6Y/QR/MOYGqTUPLby8XH0HT8GbLy+vSFZPUSomJX8VGQv/rWJFLq+hO9sIINptx0QeO0VL
wDXEgqRJa0PBgWdD1TyQgxL/Vcewodor0riOb9O7E1jcEvT54JwnKc86vRynAnTeFB7r1x7i4hI5
LMmCRouI4IlzdwSGJGer3CkohMxZ5hVP3lsdUqq32J0q9fzhzfH3UsjROsQF/rIiyC4VGEarHd6f
MjBDQqDnkhuqLRg2yAYvCbCyRNXbgBL5zGVa0rOBIA1kSv7VDWVUcl8ReBfj30/VYiJAIk15VAa2
lSkdlLRzQHMq0jk20eJ0jLzf8sUBSa6XFSdsgh5/+/Lw3QweC6Ri+PnwLgOiIZTMr3/LRAcqAiBK
oDIIVcaZd6g7O+FK0u5DEaHc7dzGsE+rO7UhAY8hYjWKaHLiYoiki6mm+F+QaVeX2DpbKCDQa5Oj
TX5KwXrpE17zp8JznGAfY0ffQnXLao87vIbbuspjjPFdSErSUqxnZcuENtchGK66RA76OfU5cHcW
hL+xIga0TENiT5Y2FczWdzwrykVnkaYbx8XHiVY71pZFlaeTraxJQcUGvceCoWkkn9BOsr8C2fdR
R9m+gCNxXbNOhUvbOtXVwQAqiz+GSuVqSlKT6G4nK4U0RGzBCO91rM3u1nGxeBYKiev6eJtw8Kju
kBLyVDG2DH80WqiYnItzhRJJrUX3RChOTSenfpNQ5yjw0eV/jh3hmow0yRhvgkUqWCj6vBWRwfMO
q/xz7Pfatm8usd4YA1nv9gmv3g4acwDHMGaHAYU/tz6EMlM7wSbzku7Zxxl3iOdZnl9ES4ymM+1h
yfPDt5c/bhgGuG/jChRFm3PLsMqtpSCEze5K2xMdu65XqI4Jo7MySayCc05zNTy4QPEFHsJTWGkT
jQThod46ztYyCL98ffrj6f3h25XBICcn8iKzEwLOOa6VHoxULfZMM66I3vOVdNQKeGhjnTecMKSg
xFYK+GSjx10ZavokPhqJbRgU5g8P1TliBjnK7QQj2c5xAxyuet/MmOqeptjj5kxwCkP1YWDGfA61
mdYI4jT0fMfsTRq7YWSCgQNzsYaKMvUCS6ajiabsC9d1KebVOJG0XeFFfX8yW2b/0tt7rOnPietb
gkkDCZeKh/0pOVhS2C5ECRrIlpZU9KA9q93ae7E3GhY2at5oDKsHDgUaQl3O0kj893/CgvvpQdmK
P69txLSEEdNXvICiItqIGveJthlGpHZCYSQ8g43wEHn5/Z2Hiv36+PvT8+PXm9eHr08veJ/5osxb
2tyr5/mRxLdtph/mJc29ANmbUPUxKfMbJjhPwXy1RppTQdMIJGu1oZbkFT2SpL6MOE1qBgvfUTDC
z69NMQeZGW1sLUf+BnLglB743l6j4+6wCJG0VPQ2FVelNP5Yn0AFsUYoplMoT9g8lmX8C9hly0O8
1MW2BSBhX+B6HK4MmaTdlWayp9fHC3ih/5Sn7Jxz/d3m5xtizCqMQpa3adJp+3AEDlOCXGU+xWUo
ZfDjjYOLELyec+H45uUHvKUbOwtujY1rbK3uLEIYy2snvheP+KwrJcTPtW2e/SnzNE32Akc2K4ez
FVQ3FC2B6Sjkg2flSNLjGMN05qSqh1IZ4AXOr1xJs/Dw/OXp27eH17+XiPTvfz2zf/+Tffbz2wv8
58n7wn79ePrPm99fX57fH5+/vilR6Sdt3p4tIp6igaZFigY1HHV0XUfio371g2bUm48jMP5In7+8
fOVd+fo4/W/sFI/G+cKjZv/5+O0H+wdi5c/BTMlfcHYtpX68vrADbC74/enfyqKclgQ5JWrI4hGR
kO3GX+OEGMUu2mBajRnv7nZbcxWmJNy4sqAkwT1HB5e08Tfqu+G4yKnvo6aKE5rJ6oFeG0AL3zP4
rK44+55D8tjz9zruxD7E3xi30aWMtlujAYD6O7O358bb0rLBns1GHhjeVPZdNjCiaUG0CZ0nVJ85
SkgogkVx0vPT18cXKzFJzhDyUO+sAPsYeBMZEwfgUI3UoSDgNLd+HtBEG0QEGRF6YY1q30Xuzlo5
w8pu6TMwNIC31HG9rdmLkrGH7CNCjOOcx3vrusYQCnCPbCAwr9iiVtLT1msCd4Mc0gwcIOudIZjw
s7ojL16Ehsac0DvGqBvtAdQYJ4CaH3tuet/jW1Rac3C4PChnj3xOSqOEvhnPF1YQbbSKH5+tK3+L
TiJHRJhFqbTct8jQCsR6QX/j4wV91NJjwu/8aGecKOQ2ipDr+Ugjz5kHIX74/vj6MB7+VmGWcQcV
JOYojIVZ5qRpMMwxD8zdAt6R7gaDBhEG3aK0O2PJMKgva1kXaGCcnfXZCzdGDQANkBMV4GgEFAmN
NBGgTTBogDXB4PYjoT6HiivFUmiLQ9Hu7BDo1pNjdMxQxfxrhqIftEX7sN1itJE4PY2P34UbXC5e
CCwORROB60cBrpodDxQahp79xCq7Xek4xkhwsG9cyAB2XYy6cXwM3DmqgnpBuGho2hl/dly84Nnx
1wu6WEHaOr7TxKg5oqCo6rpyXE6DtBuUdbGmvWs/BZsKM+gamw9uQ2JwRBxq3BYMuknjg7EMGTzY
k8wA80PIkOO7KL1FNHA0iLd+6RsCV8GOQPM5cDphg8hkGsnt1jd3W3LZbc0zjkEjZzuc4zlddvbt
4e1P64mbgO0ccheATX64th3AMHQTGl8nLrun74xf/+/H74/P7zNbr3KhTcK2o+8aEyUQnItb5IBf
RK1MWvzxyoQAMLieajUvTXYweUdEzk3aGy4X6R0CYbwk7L7gQywEq6e3L49Mpnp+fIFMb6p4orMp
R7r1HfzNYVrR3hb1NBlvD9VtdPyObijzJk90DkkKU/r/IVvNES7XP+lA3TDEGzYKS4Io4Ex1Qdwn
XhQ5IkNNK9JzyDGl1WKqmDnZGYgu/vX2/vL96f8+gmZOSLimCMtLQDKsxpLTSiYDmY4nkreJuTNZ
pPACBlLxOjIa2CqHpIbfRRF2JStUKQm2oWtpgiO3OLKkuXLhKLjOc3pLvwEXWj6Y43wrzpOlFA3n
+pa+3HWu41ra6/nrsA0XOKowrWI3NgNVpWN9wWoJUE9gg2zbWb4u3mxo5NjGBY6XMFhbJK7lE7PY
cVzLsHGct4KzdGds0VIyVRMRq5Uy/tm2LqKopfCCYxmh7kR21sVIc88NLIs473aub1moLbstbTPS
F77jtpllxZVu4rIhUmV4g2LPvmeDHoTYaSQfU2+PN6C8zyZ126TX4iZyb+/sgH54/Xrz09vDO7to
nt4ff140c6qqlXZ7J9pJMscIDF3H0YFnZ+f8GwG6JmXIpH+TNFQ4Tm4pxZa9fExwWBQl1Hed+ZLW
PuoLT7rzv27Yic6u63fIDm/9vKTtb9Xap0Mz9pJE62Cu7iLelyqKNltlFhewyXwx3L/oR4adyfAb
Vx83DvR8rQed72rvi58LNjl+iAF3ek9pcHQ3ltAa0wR6ES52TEvBdszN5XeYtklaCUan+FLCLsZx
hiLBoqmPd2ziHCfCMqFMpTzz1fKcUrdHlQ680HgEJK6jL3eBEvPkG0uINdXr9MTcM6J4iAG32Nzr
G4mtSDVKBG+JsivLNnhs5xifAukOiBviA6p6WM2ruLv56SP7izaMwTDnF6CYAmv8Um+LDBQDGvuM
r16LYn3c3pgJHaCKcKOEdF2+eKPNXNV3oTlmnR8g284PjHWZ5HsY8tJmITDhY6TgFhD2coDWHncY
dGeuVfFd2ks+N0HQlm4aa25F03b0Q9xJTUwO47E9B7NWmdEbV3b7BDB/5NeNDgTQQ4EgKiEnsv5V
8Jg+ZIZ9rrAPABvaGg9mMnc1QqxA2IqPx5tFXevGYRJZt56YBQ9dc/qpLo7N7SyGdpQ1X728vv95
Q74/vj59eXj+5fbl9fHh+aZbtuEvMb/6ku680km2nD0H9T4FbN0GrqffwgB09VnZx0xGN8/u4pB0
vm+tf0Rr1+gIDYkOZvOrn3mw5R2NISGnKPCM00FAh6TDQjJJBOdNgR4srnn05TT5+Nm30+eabc7I
MfcXP389B0k9D62p/MJ/XO+CeojHEB0J06PNfMrGn9/IJmsnqe6bl+dvf48s5i9NUajfqGjEl2uR
fSi7OdAbk6N2s2KepvGUTHJSEt38/vIqOCWDV/N3/f0nY8VV+6MlFs6MtjEgDNnos8Rh2mIHH+WN
vmo5UC8tgMYtADK8jcsoDjQ6FMaWYEDzcifdnvG/lsTz43kShsG/rfi89wInsO0ILkZ5xgXCrdKM
bzrW7Yn6mJG5OIjjuvNStaJjWqRVOutUhP1Fzpbu6+8PXx5vfkqrwPE892cpwaiprJxOamdnsrON
Z+yi7uXl2xsk2GTr6/Hby4+b58f/sW+Y5FSW9+z+WBO7DOmKV3J4ffjx59MXJFvp+UAG0krxFEcA
dwQ5NCfFCUTOWsV+cEXckOylnMYLVM7VCtCkYWdaz6NYawa2HMtzh5UoQzGjaVpkYIikNndbUpi7
RvY/muDZfkEh7bE+lbQDs+e6qA/3Q5tmqHUTK5BxHyMkDPKCrM9pK6xd2K2pNicIipTw9KqUpy2x
NFTUJBmYtJ3MpjrGOIJZmAI7QD5dCOVoGQYbDsrRI9h/YdizNts0PqZzVnfQs44PtzcvhqGKVIpn
dj8ydjBUp43nW88LN1QMDSYMJN4GHeAuwh0bDDr9gUpSB9u6KdiXtjRfAKD2Y1LEid41DmRDVl8G
noysPWHRLfkmIAXbBDltCnKv13Jbl2lC0P7K3VELtSRJLTbTgCZlwnaraTEdNzc/CYuh+KWZLIV+
hjTvvz/98dfrA9iVyTl8P1ZAbbuqT+eUnCwjcT6k2kI6szWpLgZwtW3i/KAkNgHEmDVzOpTbLlZP
xZmE7RY0O+9CEWx8n7sBV1gT2xmFVV7mPeo7LJGc8ySfzM+mBwj+2rB/ffr6h766xkLilMRaTHAv
XImCm5eudkkEVBxtGX/7l3lZLaQHL8FGZcibxtJBNt6YFZBE0dadHuBHwtKYFBZ/b7lf1NbIKSn0
fUUsacz5fjyQg2dTBjF8nLPNTIc7dsJbaXi4+uQa/mLMjElUnBPbRcPxkEIh5c7Q2uDd9ZZI/gy3
r+OjrVYIhgQJBZuTdlfT0gAAFc8Qod08gGrTQ87zerH78pBXB71/c/FTgjkSTSQwQuyv2FhcgGSb
wlK0IVU6h/1Pnt5+fHv4+6Z5eH78pq1qTshjnYMBMTtdilRfLIJkZSIEgXgwU8dIYLI0v4e0Ddk9
Eye8TZJ7IfGdBCPNixwiiOfFzle4d5Mg30WRG6MkVVUXjIFqnO3us+ysupB8SvKh6FhvytTRn38W
qls2bePFNNwmzm6bWHLWSIMgkhoPRbJzUEtQaUAZ1d7xgzsH/VBAHzbB1seQEPqiKiJnEx0LRc5f
KOozj8Vedf7O0dSCM1Fd5GXaD3BTs/9Wpz6v8BReUpE2p5D+5jjUHYRw3aGSw0JOE/jjOm7nBdF2
CPyOYt1lfxPwqoyH87l3nczxN5VtWlpCmz3jKO4Z89zVJ7aV4zZNbezFVOY+yU9sV5bh1t25topn
osjDNdcLbR3f8mH4dHSCbQXSsK27dbWvh3bPVltiE/mM9UPDxA2T9S4stKl/JB7eukQU+p+cHs2o
ZCEvHWyqJJKIEJwkzW/rYeNfzpl7QAl4nJPijq2L1qW9Y5mQkYw6/va8TS42zyCTfuN3bpE6mIWP
fGB1LTjyshN8u7V2QSaKdqjIvRCDxTKJ+yAMyG2JV9g1YAjueFHHls96B0fSjV92KbH0j9M0BzzA
o0TWnop7OAyCYLcdLnf9QTgMjbysdkPI5fdtnhy0+03UOWOUS2bRAyzsnMp78NgcbERJ1W+1II0y
m5FUguvTPpuJ9nsueicEN4/moiG7rIa0sgWy4fdneiCQlZvxV13S9BBd7JAO+yhwzv6QXfRmQXxq
usrfoFELxKCA4DE0NAo9YzMy+Y39ySM8DrWgyHeObM04AT3Z8x6A3TGvIM9nHPrsO112o2r4mh7z
PRntrcN17FbDsiM1azauY4BpFQZsOiJEOAWb38A1FqiEGrhPheXLZzrf15kcuQrDHF5bu+bC0/jk
riLn3LaBSRs3h5P+CcecMu4rx4NkzwS3eZtX6rBMuVBwKOfqNFRPNR6yp9le78+hdL2Tj66hLq/u
eY/6yA+2EnM1IYBl8rwAR/gb10SUOTum/DslOMWEa9OGNOjmmijYgRnIq0WCb/2g1a6FwtX5mD7V
xE9IyZKxw7hLK0PdwBiZFUaEldJ1YQVs/3t9vXVJZteitK4lwsQoNVlx59yOo+RMDqhDsMxypVXH
lWnD3Slvb7WVUuTgClklPCWGMNd8ffj+ePPbX7///vg6poWS2P5sP8Rlwvg96VRnsKru8uxeBsmj
M6nYuMIN6S5UmoH/XlG0EM/kbw0R1809K04MBJu4Q7pnXL2CofcUrwsQaF2AkOtaes56VbdpfqjY
jcD2H8YoTi3Wcha+DPx8M8Zopskgh1RlcBA4i/xwlBYVg0I+1lE/qFYDUhV0qxNyoDlHfz68fhVu
t7PmQe6/ELnRNcSwTYm9DDEEk+piTTUHld0z5tmzmXtAMXZZsWHCNQR8xmiHufUx1Omcqp7IDAbJ
0cBN0tp/6iY8uqcNX4HCCN9BDNvmZysu31rM9WGyjAzgSq12HSKMUHdvOwsE1vqpuI0vYIxzQMHm
1tGr0pqt+hznhRj+9r7FZTqG823HHcOd6zqpa5zjBnTHeBnr13SMNUztK4i0eFA+vpitlcZsPeeV
fYyObAPu2U4b9BRAEk0ZyOaDHELjU9Zra/aU4MojWFN7dg333SZABUQYGRFNe2mF31v8WUO6vaSF
mIKEUZep1gd4UPbsu8K0T5ZwFOwktlqFtNy6uEU2el/wM2j/8OW/vj398ef7zX/csGGdYpQbj2Og
QhCRw0SEyOULAVNsMoexqV4nG7dyREkZh3HI5EdZDu/OfuDcnVWo4GB6E+jLNlUA7JLa25Qq7Hw4
eBvfI8orCiAmL3pkLAHNxF0/3GUH+Vlm7DtbTLeZ/k2CAdMbqbvSZ9wXntp6vEzUEZQTfc0UY5rN
1VrmVAgGBkL/ImCR069IJcX2giRJE0Wy/YaG2qIoHvJbjj6moXYopokCOf/xgpHiCBs4LEKuNGAN
KndIjZ4Dz9kWDVb1PgldOYSZ9Olt3MdVhaHGYP+yeH1lF011cM8JnIngAsP8i8nPSiI4+D1wBR47
AivseyUKJju7oVrXiImLU+cxafLvpefGc/hUjNYn+RzjPwcIZqhnXlUxkMyUrfIc22xUqbBKeEbV
VgU1cWkAhrSQVu4EzNN4F0QqPClJWh1AejbqOV6StFFBLbmU8FSlANlWEeEh6iyDB2gV+0k8RGiQ
MV6WEkuRikGBZ3IVyB/QAGV+pw04QKjZvKLmIIgRlGcDPrXlYHwGrLEred9ID7dwQn/1PRk+BlkZ
6iJRg4vyfrR1PGRU78UZkkXRlKNRWwKVKK86bWSnoBdKrcJaYSxmq7Qk8DCjF6UQWLWKrQND4t12
AI2SYuPJG7VGexHzkOtNkcSNoh16s3N0Afa9K+g82AQ4Z8bxXZ73+KPogubCCp5IixOdosgSAmpC
W+zNJ7RF1c3RF9zYl+M+d75v4a0Bv+80o2MFGxPHtcRH5Ogy1/KvKui6vz+kONPPS9ONF/0/xq6l
uXEcSd/nV/g4E7EdI5IiRc3GHCCSktDiqwhKouvCcLs0NY522b22K3a8v36RAEgBYILqQ9nl/BIg
nokEkMh0NzuHXQ5PBdx2W/enU9LkZKZF+fSeg3NyP5tcZo9fXo3Zu2GZvRvniw6+B5MCzY1lyb4K
8Fi5AFO+X9/hu5crTG8xpL/ezMHdbUMWbg4uwr3FwT0uFD6TQcm8YOXuPInPfIB568A9YwCO3PC2
iB33KmKtSJlbkgDoFiFch/UmGw4bnxlUXOJnedy522VgcBfhUDU7z58pQ17l7sGZd9EyWjrOLeRy
mDG+d8M3rGotJw7fYwCXhR+6hVWddHvc6kMoJ7RuubroxovM8aRCoWv3lwUaulOzzBFtToBwi3ui
m5l2mzsdEAs0JbFr56vhN5YwsQ+vmFs6nDrfEa8Y0Ptii8Xq3qe/CJsvw32amAtEDkh0gz2m+ouV
hOuSwhCSb+e/Zv+MloZWZWtSR7axNQnpMjKdkYHAcSTezBwXviMJJV8cCgzgEThmM5VP4eqPbkli
0TdJatoeD8xw4hzZupPw71dhJ8oauk+xZG1VZk7ffgPTiTSUuIcSVOtMHfEIlRadUGzXLsd6YlaT
E6SeuDlaqjMgavNubUMmbMMWY6KgQuYFKKKYj3qp2hXiFnqioULSgh6aSujbLbZDlNozo7tSHPNT
39praJgstfIXmSg3a2Dvv327XN4fH54vd0l9HJ+rKgPxK6vy0Yck+Yc9rZjYO+Q9Yah/WZ2FEYpV
G6Dii0s5H/M/8g12N+1MkTGjDqBO6RaHsrnS0GRL85kC0aITBTp2+iHCbFPrWfCug4BuvreY9uKB
NodzVSFDV0fg5oCkhCslfbrBqkELzD30ONKul5/TUdj6qxlZJFmilSNu8ZUl9laYJYvOYL4uNRER
ryuM+5YFxPdXGWxt13Bu51YHtMQpWfneGk8zSXHge5bkxNLpQIFzN6yIrLVOI6dioP7CtbaoZ5u5
WSHO9aTTTOTjXHmLbqK20L9iZDsH8SZCJo2C08IFNdVR3JG5UjJnSgLmkM5vogOBQagq7KXx2A9p
EesOE0e6tICyAGUWNTlZGu2lEGmhIDlNp+NgSFmkBxVYa660OvfwsWme17ygqHP5ldV5WvcqbSqK
jGXSlCkxbUftgrWFj8SitZYRdc4oZFxzebm8P7wD+o4tDGy/5ALVvakGHjASRlWyP/FJ5IvVFt7A
5NnJVPRkJdri6fHt9fJ8efx4e32BU1MGp/53PKXyB3i9N7mW48+nstu8g+AjnWv0KFRoh3ADXpC2
dZiRW0nE4JlnbLf1DoIYY+vq165vsSkujHmUXjs8U4DjtOnbsCHFuej3xw1DRpt+FmdjKTn2XIzk
WDqOeSv9CtBEOidiOh2wMUeU4gmbrDqCgh9LB+Lpbl1spN8jc3QELbdQI35YeqhXTJ3BDDSuIcsQ
czGrMYTh0pHUFVdDZ1lixgxXhjCIUWnOkXC+YHkSRvoL7QHYpH6MA23PkmpKT5qK9SKsITr+EhaE
eeBjhZTQnN4iOZauXJHFSAIRBiz9fImMKgGE6HhWkDN0t8k3c0Iw8sytr4JjhbQ8AGaoaB1ZYRfv
BoOzbqtbM1UxofMUsK5DJqMCzJjuGhh4ppNCHVrO68KCxX1TIFnAgfNsm3T+YmWGlRkgocnODcgU
nkZNKiVepTjGf8ZWHjaCOd1fIvI1Y3HgIeMX6D7S2pKON7bC0O7bQXAQdGTAg5G+OQSLwH0mJjRG
0PcX8ZyUkSzrxfTzCkFm8LiNQLVUAMNZaS1YdENeA1j7LiRY4RskkZ372HXUnfn+45ykQyjFmQJy
PdOLYrTpAVrF6xuzUnCtke25AlwL3QAzNFaizmUErbeAudwBvpl7sIjQ+a+g25UXXOigBpC3LXEj
M6WXuCvOqcYYev5/bq4JA998c/Bphs7qJudrMCIdmjaMMOkAdBd/hCwpbNfm4eRYUiB0V5CU1W4E
lzUj2mQ7I37xlQEstHrCf9ItNYNdXnmarVLRpS48sx/DT5sYK3zDFYsORJhWqQA1oKZFUvD8qORc
yzBaoRm0JPDnLggkC+oz88pA+b4R0eBbwvwwRGolgMgBrFboBORQiDsb0zlWHrp0Cgg1xdc4uDqL
LIUilITuA3wEtmQdrzDgGo1hFsSHqs6AipGRwYzTNYX9DquODt8ogWC5UQasBOqcDkOk+oV2EWCh
+4oReEQsi2Cehy9z6yDAvOFfd6qx5UZJR/w5DUswIK0K9BiRVxBPw0MkH9AxySribzj4A0Q3ADqm
pwE9dJQnREaliAbi4F8hEh3oMTJ/OT1eoDtKidwQVIoJHXJwDrbAi75e4F2yxpdygcztXIFh5chy
hffaOkakujy6m9K/ipOedWQ4PdJVulWIiBVxCo70tTwdn9JLcLa1RFugnJoMYRxY8SSACZaaRHzv
pN62Du57jDMjI4lccMFCbTwAMst5ZXDdoImleNeQei/YzDJZL5AUMl74qUOtPU2nBtKcqFlz0rTf
iOO4exFLvty1ewNtyFkLu7zXD1whrbpIHC/h/rg8gpMv+DDygARSkCU8VkYqLcCkORrycyT2WyzC
n4BreOz/aaVhjlcqAjzCXbcju02WH/Q3dEBL9vDI26ZR/te92ZRJ1TBCG7s0SXXc2Ye/GlyQhOQ5
/lQD8LqpUnrI7t01SsRFl6NGKoyYWXzesbuqhCf0V/qVxlvbrFgGjplsWp4lVWHRvvJy2kOk2NDG
GnO7bVOYbDydeEJv8h3uM5NwJnmrRyAD2olmZ2HsYX34vpF+nwwqTUia2UOMtpiJJiC/kk1DzCK0
Z1ruSWkVNCsZ5bPH/lye1NVZ99IkiFlqE8rqVNmlgsfJ9mSxBs6OJkV1RA1MJUMOTzrMjxXkXgS3
N6lNJrvf4qVwxlhtW7tsBcieJnMP2uKYt1T0qKNsZUvNb1UN3NQapJqULZ97eaXLP404GZN11pL8
vuzsGVjzyZqj8c8FmvMs4XF9wux61g0tHFYbAPPZzgs9A4sLJzdeZxm8fzw4CsbazAxGrIhZzrjY
zbA7D8Ehg0ubI7HRH/qK+QG+Kgij2pZ9JMmGNT9bkKb9tbq3w1brM4OeKmuuVDXL7NEOz8Z3hU1r
jqyd2kPrdGsNMEp3hJWqrxmm3wq5QWlRtZnZAh0ti8okfc2aSrXdmP9Ac69BX+9TvkrZc59xmVA1
cHGE0hNesapQf00Wvby2xP1wS4cssdfwpcaCP2YoDaRwP7VydhiYkd3mlVPrt9eP10fwqTld1CHz
wwbPXIRbteXTWJUbn7DZxsvHwZcdqt7A3Z5UUwyHcgbvaAyn56oVudontIdXslxFky91NR0IwoHL
VwYmURkwfJq1P+Y1BZUMGTgyUVmKl0FmXqRJ9v2esH6fpAZislkG/TKsc1kdyyTry+ys3m9NHcGa
EWGgfa/BSo3c0mxLuBzv4QkQZdhTW8HleKghmrLd2UXkpP6853Izpw7nXwPXJhdvmVgLc2iWc8tc
AelF/M8jF7QlWI6BZz//L8boLAdtWYyz1/cP8Js3OAtN7Qth0WnRqlssVN8YRelg4OzRdUbEv1aw
2USC2lSVqGXftnamAm9b6FHhznEuc2RECPqWYfquXiZ43K8LsBEb3flhiYYXi1and0ffW+xrUVcj
IWW150WdAoxybnk/gqWY1XymLCFdsPS9WZ4K6QNzSs530tEL/GnBWR573gyZ16yyW16CiWvuNzG4
1uU7NqQxIMdNUuA2YAMDQ8PED6gI/wyGycPmDMa3fFJ7lzw/vCNhu8R8SazOFC+ezDNjIJ9T14xr
i3E/WPIl9x93oi3aqoFn5d8uf4CL2zsww0wYvfvt58fdJj+AqOpZevfj4XMw1nx4fn+9++1y93K5
fLt8+2/+lYuR0/7y/IewlPnx+na5e3r51+uQEipKfzx8f3r5rvkJNQdSmsSOh00cprUwOHM2PngE
whQNkXN7DMwGBEq/B78fU7IVL1nQRQemTYKRZS6iNvXzwwev/o+73fPPy13+8Hl5G8OyiK7mo+fH
67fLtXtFFnyt6asyvzdzT89JMKXMfE8KxiHetjmERFIlNpA8Sc3smSKAaut+Sj4yKUtFk+xPPuMb
Rd89fPt++fh7+vPh+Rcu2C+iXe7eLv/z8+ntIhdAyTJaYH2IoXd5AQf43yarIuTver41MoiudVfF
79sGXmQWlLEMDpm2k1YBp1A0zbB9/SBLV9HCrLsiTleZEeDtwleb3BALos6oOIB9BsnNrCQNdBcm
85li13OhKabcM9rCUoKENgnZOMKd6XzNIeAriaNpFJM6y0ELvwdHQxgiVJN9RloUhTtmLiOTLM+m
KuCQd83Xsc5aKBSkQroXMQpnRZ3tbEmrsG2bUt52mMW8xnWi1mZCw2iNvqzQORpHt2TpbvLCwc3V
61t7vQqx5+txH0woDDpHwXfC38aNotdnR9npEXNzrDHA0VpNyr5OiaMAiuNGNjmbKF8DBO5AeobG
oNfYiqTtj64WEt45cKRiq5XueMLC4qUD645iDGNYSU4FKVGozv1gEaAdXLU0ikN8bH9JyNHVwV+O
JIf9061Zz+qkjjvs+ktnAoNwVPCAOXhN0jRLHYIpaxoCj3By47xUZ7kvNlXu6OUWMzcwJv8ma8yH
+Rracclnr22DSDpPdqCqvet2orQPUFHSMptsJrSESXVjQHdwNMH1FEennSnbb6rStVwPLcaOVgwg
vd9b7KZKYzjW6SreLlbBwlGRySo7rmnmJhdd3LKCRv5kv1RQ37WukPTYHieS/cSmQjvPdlULJ7+O
nPLp5nFYG5L7VRLh5qmSDU4/3VOFpq4TYbHLglWEb4Ot8SQuUa6u7/XqUb573px2xCTnk+JzdaZM
shPdNOBB3KWzVGfS8I1mY35eRYiw9q0sa+UuZku79jijj1MG/k62ZyfDPU+NufcU3/kq2qWzlEjY
i/Pffuh1G7Pqe0YT+E8QLoLJvk1hywg1lBMtR8sDvGMX4U6ZJX2TPamYcYUieqe15QKcG8vrEqsA
SQfXZa6tbUZ2eSZzM88t+A9ORudR/e/P96fHh2e5xcAnUr3X9hNlVctMk4ye7FECZ139CT8Qa8n+
VAHXtbIjSeqtm/vhSMrOF9TbAHWzKyqe15ZGIs7l4OJIaXHGaaOjylZNCNd28POr9r5GDaggGaje
PTvTVr/qKsSWeUxfnxuWfeGSCPX2qdCpGs3Z+01eJdhtAoPb5KMRqwHY1QiUu8Yi+TtL/w6ct8/B
ILG1eQUSV9T4L2qXSrwjgVdMaIUER7pPtPuJkcQlhlC3GZNHi2a2qTrzmsuU6yvttsCy5htO0hCm
qzkmKKaZC2zXngPK4H/6FDNQvvcr2H62HXq4oyyTDM+j7sgJO324cmzht2npfQULmm8ycsRHrsbG
8CVGjBq6LeC0xpmDw5BT5s73hdUePxYTmRfCBFGPoaNKRacU4SwzLUiCDA0qnsE3JWgJhcNFM7Am
m5XDwQygJ0pmB256NkuVntWAs6mb/JhtKXiIsrqFY/KwxPmFfk+D1TpOTv5iMcn3ECAZuk4nRNPs
4RfF7rJEhY8QQNL8zJHtE3OwH6GBIy7MLE6wrAC/wkf9rkK08pf9VC4MLqDdU7hoD/is77IS1V+1
uSZtYZG0pIhCbHkGjuqsnXYUWcG4omwWQdEcqmdx+fH69sk+nh5/n66VY9pjKTYjXN87FqYMZ3VT
TaW4hk/ByXfd0ntaCzGXC9y0ZGT6VdgBlH3gCO00MjbhGtPorzg2POCqimuf2mEh/CV9EGK03jJf
EMimAR2wBAV6fwY9qtyJbZ6oNOeYdoZIRkjr+WtDVEp6GSz8cI0fwEsOFkRL1I2iLE9SRNK+3Ewm
6Oj7MFnBZrGAUJFLfVAIJMu90F8EC9Tbp+AQ7hanVRFkrFeuqO44UhEj/cHWSFwbTi8H6sKzqXVC
1qH59Eynu5whCh7zOlR+pA7Wy6X9ZU4MJ4Wsw7Drrq/JrabgqI+/c7ri2No6otH0g7HhyXUgGp4q
r3UPO7xNwm62TYAnCuxWTkni+Uu2iMNppmfUiyhATbaDiHj6HkyOzNSPF5PqtUG4DizOIvGCVWwP
mjYhUWj6epX0PAnXnsOLjsyPdKtVZIeDm3KgIS/HURz+xyrQoU19PmKtwlMWeNs88NZ2aypAWnBb
YkNcNP32/PTy+1+9v4k9QrPbCJwX6OcLhKpDDDPu/no1d/mbJXg2sA8sJo3F9ZnE4e5ZNkTe8f5z
NQPf99u9ysD+4F6PCyU7hfI2OzrnCUz11UxjR74wIR5bqX17+v7dWmLkd7hY3lkuCUcOqdjTDYRS
wi3JKP9Zcg2hxG5rMz7+NVuMMVHTJnKhQNJwTVBZRVwb5EqztzQachogGWOkIFN39oTdl1yn6fqs
hCsMsQiJYCzWbo8n7qXbHZOm/DUP6cwS8q2DXkdYRhvCF+5d6rglJgUoVvkiRuOanHvSUak5676Z
wWGMK0MAv7hA4XEKzp5IhGpWp74zw8pJSn/CFiaug0HRNJO/PAgWijTm0MElU+8qkPIgcAP+el9+
KWqbayhie+j3DL76qZOSLxMSbKx7UlsFFF5PNqRwZC/gPTRZX+zMU9YrhPcd9Ju1R1JUvYkHRtdm
ADYervZRGKRFvZdu+9rooYb3BSNiL3YtkwyuJ0tl8YlbUDn6xgmVPD9dXj4MGTJOKUdTFEScYCBT
q28ITbXpujluNSunoRqQ+5bql5jsLKjG+ZJKjraTgMYwt7jNnvV5rXrHTh26YqdF1LQogW2xwxsG
YHXanODelTboJR/nSCFqrOSwMyZ2SBsN42tKUjniBYgP8x0V4g3c4CmzFj1/heTNkRnmlkAstpHD
IeNp63AxB9JzxgGujKZ47WcVXbHIyqPeGIqMb0gHkLfjdeQr4ga85+l3MYouPC5PP1uYnauRh5Ao
M9Z7j2+v76//+rjbf/5xefvldPf95+X9A3PpcotV8HaXl0HLQWxH4aWJqhvSIoCKIMsnvsJpdwoy
VXKA5ymfRmZbXBWABHCWs7+vs0ZcYju+xv9twBR3ePxi5t7vypaXx5F215BSeL/uZcznH1ZaCXMR
ImBM7J1p1eYbFRHISFyf4BHHtWDOWg6MqnkcRa35QOYD4TqcgAi2jH2XG1E+x5dAfb1LadOzPRc1
uvUr0r1D2l2T3W90O3FF6DOmP45qiQobqggJxEI2znIkxWnyMsLSmlQITPo16w+bf/qLZTzDxvV+
nXMx+WRBWTIz6xUXZWRgsqvBp3puvGLUyPpLMJ0coZkEC4wcez6WSaw/JdfJMUIuAlkUu/LwoJvX
nlb+YgF1dDeA5KwTP4iAcVLQEY8Cgdtl4NIpXiyQLhcApsMNnUmShY8NFcK8qMC34leWRTxfLZHL
pLCcGptXzhp7jJ6fXBmi5cKfNE/a8q2xh5KRoSPI06EjyCFOXmFNxAHH6/WBoygCn2BGJYphm4ce
1voElnxaeX6Pu2PW2Chtqh41tBrmlriB8ReHZNI+SdSBvVQ1AYo6iZDJRdIvnr9BOq7kGFewfc9x
RmCyYacoOoe19lqQF+Gy+8qWk02dzA9MPmdJilSE01PizcwXzlAgDcbJoA7aDSYeWX0JkNqw0Mdd
yIwZUkxsIuVNKLktYIU6PwrY6Uhexw7f19dW5VlEocMh5/Ur6XF2RkiOLUHfKhg8wmnGpEFPxSFe
dN2k/WM/XGLEECX2ZugxhRzk75xiVttTOT3JmbdRiwyNko7OKo0zEL6WrH088DkHrVJcoXjlmank
cxuudL9/KJPq8SBdQOTx8fJ8eXv9cfkwjtcJ39l4ka+/alck9Wxb6SdWepnny8Pz63ewwv329P3p
4+H57vH1hX/0wzpiIukqRmUTB3jt9S+v/Nj87Nwn9EIM8G9Pv3x7ers8wh7OLM74jXZl+I9SBPPF
/0AcnOGYxbn1MVn5hz8eHjnby+PF2URaO+iuEvjfq2Wkf/h2ZiqoLpSG/5Iw+3z5+Pfl/cn41DoO
jCbnfy/1TznzkG8FLh//+/r2u2iJz/+7vP3XHf3xx+WbKFji6P1wHVj7UvWpP5mZGsAffEDzlJe3
7593YhjCMKeJ+a1sFdsOPMYR7MpA5NBc3l+fQf2+2Vc+83zPGKW30o5P3JD5qZ3c/T9nT9fcOI7j
X0nt027V7Y0lWbL8sA+yJNsaS5Yiym73vKgyiXc6NZ2PStJ70/frjyApGaBA98xVV3XFAMRvAiCJ
D5VyLWSinb6e737/9gpFvoNd/Pvr+Xz/hQQF5Smss4EOtDzctry/3Pf3d0/ntztZk/zsbcIynh/e
Xh4f6EXPtnKE0E/2KtJrfxTsmazAPsuQmVQeI7u86rd50mCOCCgplRWcn0bTqssnQ+9WNR+noezy
fpNVUjmnaftMKHdjo8h8uJHnxGaTrOqaGjLtC9l40ThiBejL+j4td/IQuIcsWbtPv7S8tgKpD9ec
EKy0X8TlHhbsqlLrzEyxe4eZk0KqrFputMok5kZnRcXrBQrrCvSlkAfW+2knFjOcM3o40apwGniS
BgTMQVvzK2+gGVLOcjNpSAaXUwusErFdLbusuRPzBVs3cFEw7ZAOKzABQ7yOCXAwypxidOb0TBnw
TZDqIXYCtaK4je35dH0MBZ92e0RjGTkAlb3aFIoNBJtirl6vjZ/P++/nD87na9jJm0Ts8q5ft0mV
f6rt5J9DqjlaDHk0gGcTWBBrrjPKvAeaSBKsbSswJ4CmCxOc5cLa2vRkcOBOIxdiWToiI0MpTVuv
C9du3Emt0ZVLF9TzT8o8dJU4bpA/8fpgLpVpOV78IeG2ZBNGyxb2x3yfge87YcHbxnM0cFOX2boQ
XKyIap0NgW6R7ruVezYf3U/xrc6E1ATJJdHABmDbVGIzpSUJTwagylcxBadbKRzy47RstfdXSTv9
5Lhi2qcuz9ZkeYzNUSECXD7QI9Vnwaavq/KyTPb1iXHWlRIEbkMll9kdGrRiIXEkiJkGkqvjV6aL
CBqEvcmpkX59uf9dp28Fxeui1SChBafDpCuo0SogRMPHa9IfnUyaQ5GShsPT3I5rmTEWiOnFEEIu
53HI4kQR6vTznMgFZMgZGFMaz76oQ7g59zRKSXCcMoRJszRfzCJH0YBd+pxbDCYSwB76FAXPAfBt
3Ra37DCq91UWQ7K34glO+XFdFycpY6yLDQlPUnBfERQIj78itC4bB/jCwT9GguVsquXqtYkMOarz
w+Ndd/4dguuzK3XMG8Iur85fTG7VKLJfZY1wxGuaEhfV5s8T/9xssjz98/TVepOu+Qg0DHFlFeyk
POpGXB8FKQT+XEujxWL5o2ohFYtjPgCl2+5sjyKZDrST9NI/N4nunYNkEfn+FVSfd9vrH0NKqx9Q
SKX2Wp8dmWksmjhwVKESzCi9+XolkipN7IVzhfjPzYImbQ7KzMF+eXCQOS8PGfrEkVjdVfqeN8qa
kv/ZDaeJ/8K4Haf73k17dW3Gocq77KhLIs3KYrXj69x0vMxQeZv6pJECxySRvjTGIIPF6WRUCfur
eBYZU7gJMm08bzZBKouZTYZ1BAWSCl6assNg5zxS5EkYNCV3YtcZjEBGVxkUiu65mtt+k6Z9PIvn
FFpVF/DlGsKQz2cex/KKsbToZH9WGvjVz3Boz0pUGhrRWKEjfMlenl7Q2IYVoOUUmmnaZYSftgBa
TqGyBD0mk4J1dYu53UpDvmBtysbvllyfl8uIrdoGG+LYgjaHCfw2FWbqcITQVMEWHomQK/sveSKU
QNI2mcGKcPeh1O7QwumUFAzw20iIrm6sGk0p06J1m22wuoLhEGB6xMHLJhFiRFzO0KZa1yOcNlpb
8/tn10gV/pSmVPk01mBUAWzjZLGYpzMGuoxCDrq0aZfJLNrMAt8CgzmaVGqlvGo2tnqpkODwKX/V
6Q4suhwnksGETRYil4porUoGQ7jiGLF8Z8jZNeK08w+wt2hOD1joFK5JJFcWWpm3bYQH5syfxtAR
/JM82+5ZDxL9kXj59nZ/nnpLqEzt2giVQOSpeJWTIRBtaun6oJkPCeAvzFxHOZskhqcYsCyCwLQJ
Z85ukdZ12cOlTtLCneSlLmXV2rZJd5Dks1kcxmgVbQtRlOALP5J4kTdT/0hr5dwMBLKApY+wYLdk
zJAFeFelFfay7HZ23236rjog5NAbUsoIJbRmsOm5mohpazYRc02KclWzokSuwIP8/4isRDQswbci
GnSxvtYXcPAG8nh/o5A3zd1v5w+IoDMNEzRU0jebDmyl7XIvGOBG5MKAJRgNMK90aPxAzuZxIa6W
qUnYUi/XhD/oLK1/uN6Z1DrG2JNMt9vKpbvhbsHqtSa3B4rY2xYNgI6VMvAhG0pAE9nHFYPseZdS
uXiHaimf1512mkgOH5kHsKeXj/Pr28s9Fz+yzSEwp2QjKTvKzMe60Nen99+mbMq60FM/1RUdMlVW
sNEe9FITKXHcecBL4DXnX2Oi2W/PD58e387IAUAjZA/+Lr6/f5yfbmrJg788vv4D3svuH/8tV8nE
gxqYYiOFcC234l5MdGSKHipPnr6+/CZLg5yBeCyHJywGrb+Dd7sH52dTrEKv3l7uHu5fnqzvxpFJ
+1WbVqJb4WFkP9IvvKfmp0u22NuXt+J20iLEsrMmYc3mD4XUQmz/CdB8RFl/IhAqAjaHjmw/KN8H
SQpRrPhX5B80WLX48b+rk2tgJzjjqnk5MHGdV04GVcaZcasNuV+3iTxiUhnTQATOT23SULBIm+H0
PtgEc7Wr6m+/3X2VE+eY7jGHK2ROzJD7pj565fuix8HENVSsignrKOXJwHXCqrKuL+sko/EGFapO
rQdijLytCrODxOTDturWone9Lg+nRI7pKtzkwKegn9I9qGJdW1qIpGnxaLNjinfQRAVWCs2oqlJG
DhilHSf8VQeiWHFX1Qifzviil+EPSl7ydmWY4HrVWonnPlzwBwtEEXPPBAi/dPVqyeZM+SxPb9Pj
xgVMzhsIjA8cLcTTS5PWJqSgOnUq/jrM3wTcYGE/wpBAQEWreGvamP/x6+PzHy7OYryejumB5Xfc
x6MhyJ+SbkOjoKH5cd3mt0PDzM+bzYskfH7BnMWg+k19HBJj1PssB0Zz6SYmkttcpZHVITI4Angc
F8nRgQY3SdEkzq+lJlaob0nLJxIcdCczMebRV3X4aToI8hST77tpZxR4KGNfp80PSBprUXSpugNT
zcz/+LiXRz8T4ZVx+dfkfZKlPQQhY/bDQNEWv9R7YsJoMGuRLOfsHjQE1GTAAKvk5M3DxYIpEAL6
BiHPci4kE9dfm6bp9qHHpvEyBJqTSxmpHAYmLWy7eLkIkglcVGGIXaINeAhkZE8FINLpC7QUPXX7
2VbJm9Jb+H3V8JFFQHRX+LiFx7UAf6PDeo31xQusT1ccqQqLIJWdQ4XtRgC/A3OGXruNILBx3c2z
oS6C1X+uBfsNbdZQq4CNO5L4mEQMwcppcRI8kD85rE2RhZ62N2WFj8GhxENJdiqDhT8B2MnoBrDL
FmlVJR67IyTCx0EZV1Uql6iOHcpDqYkCwRDzmCzx8WVjlgTYCUGeCNuMPhVrEHfdrDDYXgrlJ9A1
B8gHaXcS2dL6aY+XBvKZsHan9OedN/OQSXCVBn6AL4OrZDEPwwmAjs0AtOoGcBRxkyEx8RwHi5CA
ZRh66tloArUBNMLOKZ3PZjzLkrjID1lVI00CmvSx28WBR5MzS9AqsW9X//9m0uMK1hkiIfx9l9C1
vfAcbpZgMB05ND2JWjr0T0Bx3g0KEePNtpgviKn0IqJrVkP6Yi3FtJTIbVKW7I0soZvsXSk5HObh
iyjuPZuYVy8lAsf6Ur8D69M45sIlSMTSJwbwi+V8SX/jOBTJqfFnJxDRpHgJjWOA8hwob6VW59t4
g01TT647z5Q5iKv9MS/rBnxMuzwlloHDVTNtwraI5wG/5renhcevhmKf+KeTo11ll/pzmh9bgWK+
FoWjISnQXebJm/nc+APG8/C205CYAgKcpxUMhCKPNKxKm0DOC1+5xM19hxGrxC0dgzOYmIA1gdSN
wBXcNcFVvu9/8a6sgH1yWFheeBemkimNr6ozHfSFGaUOPK/SWeyhFTLAsEX/AJuLme/ZYM/3gngC
nMXCm02K8PxYzMIpOPJE5BMuoBCyCI9fFRotz6z8wVGj44C1uzLIKLZbLXRMHasZXZnOwzmnXBzX
kTej++tYSE1HWY3bG8mcwKZz/VfdUtZvL88fN/nzA+L0oDK1uRQ1pQ4dSMtEX5i7xNev8vBmyYo4
iIh/CKLS2taX85OKjSmUaT/+tisTqeJtLxmNRk0mj+KZ/dvWdhTMYuBpKmKPG/MiuTWSe6RtKrAO
Y/ObQm62VrkGbBqsbIhG4J/HX+LlCfd90lc1AtvHBwNQbhf6ye0yDEiD0sqvibDDoy/q7SUrEVs+
nuNKmCIGa2x9/yya4buxTRdeDNq0aFympMMhf1IE0cY7q1oeR3RVC2cmzbgU6QUu1/qdXqG89hLO
ImIXICEBq+QBIibOTuHc9+jvuaVkSAinF0tEuPTbfpWI3PoA4K4vgpbUFuJne/k78uctHR4p1jxi
DQByLqJuVKE2ZcVtkBBHdnNALiM6PxK2wCq1+h3T35Fn/baHfLHkD1aLYGbpQnHs8OLMmroDh3Du
HCLmJD91FfkBHgUplEOPXCAAJPa5NkmpO1/4+AghAUufihvwS499O3SaRoThgu+ARi8Ch0g36Mjh
6qrlRGZHIh2d467shtEH8+Hb09N3czk32d766iw7VNVntopJAaqENeRBOT/ffx8d8v4XQpdlmfip
KcvhcUs/J6snz7uPl7efssf3j7fHX7+BgyI9hS+tCHrWi7SjCJ1i5svd+/mfpSQ7P9yULy+vN3+X
TfjHzb/HJr6jJmIesZba6YwuQwmyp9E05K9WM3z3g5EiTO23728v7/cvr+eb91FOWlcVs9hx3a2w
XsCzOI0jRyd1txERxndqxTwkInfjRZPftghWMEsEr0+J8KUK7bj+QOJs87mt+8DhC9Ycglk4c9wL
GCGhCwAHm4n8UChI7XcFDZHuBvRlY3QbqbrzR2r3XGk5f777+vEF6TkD9O3jpr37ON9UL8+PH/bU
rvP5nNVCNGZOeFowsw8nACFJptn6EBI3UTfw29Pjw+PHd3bhVX7gUKWzbedga1vQ4x2nH5Lmsioy
K47fQNUJHwti/ZuuPgMj0nHbHfBnopAKXkh/+8RddtJ3zTglx/mA0IxP57v3b2/np7PUg7/JsWQ2
5dzhYGCw0VWsY0OvqsJstmtoXp6vT7WIF3iRDBDbEW+E8wXtqhOW8cX+CJsyUpuS3C1jBNHyEIJT
8UpRRZk4ueCsyjjgBp4zCCr3hOECYNT7srBuuwfo5YZcR6l8/O3LB9oT48z9LFcwuUBNsgPcJ2B+
WkplZEavzppMLAM2loxCEQvX1dZbhNbvmAaoqQLfix326xIXOKJnVLJhrI0/ROUNrRqiKORr2DR+
0sgeJ7MZFxV8VPpF6S9n+PKEYmi0YwXzWK8kfMlcWmmKDbxpa2L//LNIPJ8NnNI27SwkbMI0ahLZ
uGt1pN7LpdJRctt5yhvgS2Ys+TU7wwa1xGXt60SKbJ631k0nlwqnqzayVyqoM2mXKDzPDmyAUHO+
FtHtgoD1owNv6WMhsE48gui+vIAtNaBLRTD32HsUwOCHlGH8O7kAQnyzpgCxBVjgTyVgHgZoLg8i
9GIfPUEc0305JxfpGhKQxX7MqzKasRqURmE3u2MZEePtX+R0yUnxMEei3ENb8dz99nz+0PfxrKzd
OezWFQIfx3az5RIzIPPyUyWbPQu0OT9GOVMvJBvJ5Hj5hLYdlJF3dZVDum2XLlelQejPucE1bF21
hNfUhvZfQ2NFzlpT2yoN43ngRNhDY6N52ThQtVVA9DEKt3YKxVkSjF0cetl8+/rx+Pr1/Ac5wahb
nQO5fCKERo+5//r4PFlx01ks9mlZ7MdZZBmsfm7t27pLTA4xJH6ZelQLhjDPN/+EaCPPD/Kc+nym
vdi2xlB5vNhCSJWQoz00HY/uwGMaQh7waOXgzN2Y8c0i57HXlw+pRDwyUYpCH3OgDCLE0deAcG7f
RMxjzwYs6HUDkZIA8DBXA0BoA7yZR1SCrinhLHD15GL1iu2xHBGq6JZVs/QmkQIcJeuv9en87fwO
2hijRK2aWTSrNpQpNT77nJY1Ut3iX5yVozfCNGQmmtIj3kTqt73hDZTf5xIZ0DJEGGHOq39PytRQ
R5kSGSwmjMzqCoaymrDG2EI35I+S28afRaiMX5pEaojRBEBrGoAWq5pM60VdfoZwQtPZFsHSiFss
HQmxWTAvfzw+wXFM7smbh8d3HWVqUqDSFG3VrMiSVv7f5VaI8MusrDyfTWvRriHIFX51Eu16Ru4z
xUnWx2pKkhLt3GMZBuXsZAfr+kHH/nLUpyW5u4EoULO/EgVKs+bz0ytcrLEbFG6VlzFla0XVq0SC
dVofmjJnN2SXVyhcQFWelrMIR7bUEPJGWDUz+pCvINzjbCf5Oc6coX5jXQ+uQ7w4JM9RXDeREt7x
ITKOVd7zOecglMF39EMLGQrSD+zYfgugxsyLrQ/wYHK+7jiLZcCCgRf43+GRUnDzLOz4TOUBwdEr
AGhMTUk5gxta13BeGqqjxhzVvMZA2PD7L4+vKAb0sD3bWzBRpb5bG5zc2QBgwvp9+y/Phh/9akp8
DDhYX3TCBYeglQhXNhAluxIE1q9xwyDNQbPqi7TDSZ3AvDyBbl2GcRgu6CuiPOarAzSgsWFFerBB
dYbt9TSsKSaliRxRlQIsB3U89gtIpOsN7VeTSK0K1DSwoEubqTtO43hOnszqOKkNJB+3whHpF+tO
hXNlueOQarlOu6TEowepOuUPE8AIGUcrzHQDabg2mK/ZRB2IQnbOLnGa/FDDu4LJoKKF0fbzjfj2
67uyYL4sbhO4nmawRMC+KuRpJNPoyw6TCBUehb/QS6t+V+8T7U4KFbM8QpZh8vzJ8rlNSghwgC6M
0UmLCRuRWGA+RXWKq1tHnDTdtVNeujuoZ03yiY5zw0EUNCAXFKxWehLAbaScwEnbMf7QVQWPjU+X
j0nDNIGOA6ApHO1rTknvx/tKpWVFuwmjYI4oSnlsTtsMaT6o/94APgl3E1LJsRtmhJKm2dbAvrIq
imiwasDXaV7W8GzeZjkrtiSNcTe5jWfRXM0SrUK76Sn0yYWG7B6+XbdxqGmcq1YTwMBda9kB2wZj
aO/N9xVFDe4u1kxcHLahofbQX7BXmkKIAlq8MXXLGu0ib4+DQav9MQljOKUzTUQII2H1EnuafhKq
UMRtRlRLwqZQg8CjIU04PlGlKzw08qcrn6LElA1JbdIm0/wSl+icg1TVATiRmDUROVfFXopSuchI
mRTLhiSzChgyMv3t10dIpfVfX/7H/PGf5wf9199cxUPl1910x7Ce48litT9mRUWCf6zKncoL0fA+
ZvsMKMgHHedqXK+t5CC6pn6X41gsWYICTEOtAHiyAP3OKgh+fic/bV0VeFG+Pky88G7XTVujj1sI
7yaaPs8V3CiA2083H2939+oUZ6uAgqaMlj91NDywjynYRBkjBTi7oyCOgFAWChQk6kMrhVmqnTHt
ugx2m0s1aJUnfPxDRLju2iTlZbPOU9Vt2aXCDAF6X2s2nBxcCyS+5A+VzRLmcF9nhGUBrkoEXMnZ
mf44Gle0P0Si8xPzbZJKZF3RholVDo4eFFjjkBxdPhpnyT+nLqB1oynwz15sq35/qFTGEqmobuQ+
9tB5DZUzrlOIWi/Vt9PFrQNddrIesQcwI94slj6bp0tjhTfHZ3eAUnckgKjAFPwt66SdTSW7iFR/
UdRon8KvfhomVZRFZanVADLus13L2bBfCPabzHIqVVem8u99niIHMgzVkYzcKIhnY2LrOEluU0Fs
E6YUEzfYtD4AEVniHegFSZbZx+LhcpH6pmnzo0eIKq3EHXYJTJN0m0M0j8xkCbx08JjA5VAnt7mA
gxFJeShBhcr7iz2z/B5zSQPoT0nXtVNwU4tCLqe0pPFXNFLk6aHlbRwkSdBjlccAnAUGPy5wbhc4
v1bg3FUgJXIl6fl5lSEtBX7Z2RDBi3qlJoYevAoBYt4VJPbnCcogTgpxqRJ+3x7qjgSvOOEOs+UD
RcsJY0DUe5VKS6TtYWUXa3AQ4rTgY+4C1aek5SO/AdI1lpu18Enf6nSEXF6FDayv/ZTn9SOF6JKO
G0JNoFoBQmFX1iSuEUazU7Dq2mESkGajYT8Y9pFMLod0pxjGxrnwRuL2AAfKvaTrmXR5hHoythY+
EXLZ8arApbp8DdFxijW3wfZFaSYFszDfvZKhUQkXMsfalONug9A4lPVoiE7hLYULwkEWwh7AViIP
8IIGv43PhMLVvnyftp8buClyUcBwsPxmLfZ1J0eKhMjQIO6lV2OsjLPrZCzDghguDvdXVSEEDfs6
2fUKAHGkIUmuFkZrS6MbZHQrsYYetipJVKbBFhfTwK7NiZp5u666/6vsyZrbRnp831/hytNuVWbG
cmzH2So/tEhK4oiXeUiyX1iKo4lVEx/l4/sm369fAM0m0d2gnH1IOQLAvhtHN4BuV7J7jMZJFiaV
ZR0u4hNts+rUkjgaZoFQS3f2XQAg+fBap9QRN3AO05moa5ez9FDYAWFcohAPR3icRKuStQK1fZYn
Sb4+WGuLRhizZhgmw+W4cd/mZQQbWEM0Nu+1K41gkPPCWoZaO9ze3tl53mcVySfZ/1hTa/LwNzB9
/ghXISkgg/7B3JfyL+fnx/KwN+HM8A1TuFygvpHNqz9mqv4jq53K+j1SW4sjreALC7JySfC3SRwV
gKGBevfl6afPEj7OMf9RFdWXH/YvjxcXZ19+m3yQCJt6dsFMzNoTDQQak3mELNd8UEY6rs9jX3Zv
3x6P/pIGBJNBWd0lwLJ78HY4E0HoKkWwyBlyyolubU8C4mC1aQ5SiL+BTqhgESdhGbHEosuozHhT
HJu7TgtbgBDgHdmpaUgBlR1ymjmwvulINnedED+yXoGkTCcLBcZIPFdZHetODnj9xzCh4bTJn4S+
HnxYEUWOfk6FdTkvVTaPHIamQm+1dCBYE6I39NAYIx1JdMkbbuFUB7+LpLFhU7dNBDDcf1AOxvTR
yNFHg1KlvDj9W8tu64GHCmyeamEtkg6iZbanMttozXQls9CQgT2VpwVYnNk8kQvqKMiylk9HJMru
NunwB94ydQlu0AVXalRyI8eWMwLpTHWo+UYs9qaqZce0nuKUDvOmlFH/RhaqPW2UTiMwWKVjlGGa
SjVPMQ2Ltkqx0MtPPW/eeCs/jTPY/bLATr11vyjGVuRVtjn1Cgfg+dgH5VC8BaG3ZsN2eq1Xr4vO
MxdeVLXLbAmCsgLfn6V7F3RZkS8JNC1Mr0jnUp32VOyUvEcuAo5267g4PfmFOnDJDKU4veQIvwtD
44ycPNgV1lpDLxRrtef9cr0SP/z4z+nd7QePTJ+euv3rUiK6jfBPSW08sDt2rHVdrayF1XgLU0Pa
NdgX8p5rDmgPUZl7BRrYux/1Zzn+p6IgdonMoQmz1Azqhjs+9NAAZA+ewJImkcRpXNOZp9GEohrT
0HLpKelLCRtN+DFMrq+lIdqoee0pdzezMJ8/fbaLHDCfz0YwFzwwwcGcjGKsDG4OTk7SYBOJ8bsO
yWS8jnPZJcwhklznHJLTA3VIkQsOieXo5OCksGKL5Mun8c+/iMmsnM9PRhv/xQ5qHmmi6J2OJGD7
4AJsL0bWzOTk7HgcNXF7paoglu4jeVUTuzwDPpHBn2Twqb1eDfhMBp/L4M8y+Itc5WSkKZORtkyc
fbjM44u2tGkJ1th0qQpQWKvMBwcRqHKBXYSGZ3XUlLnwRZmrOlaZ8M11GScJd5YwmLmKkjhwp5Yw
ZST6qxl8DA20Uvn1iKyJa78N1E2xdXVTLuNqYSM6q3U4s0rkRJ9NFuMqlc6y8nZ9xc0i605C51bY
3b49o8Pn4xOGKzNb1b7axV8krlXtAMvoqomqujcGjKyNyioGEQHKJZDhKwCWGjLtPpfcJ0uUQaFu
wHBJoA8ADZwVBb/bcNHmUCN5/MuqmxGFbZhGFXlV1WUsWyee0DQQyxIy5XVC0dLoHVy7mZXS7XtP
B6O6YDYgXmPT42sZdBcPIvGQqFUJqLLKMu09ogOodgYF0JOLXEX3qOiis1Ajx6x5SWee+jp65LZa
oZWO5aWwKnXu2sMzUqVO1kafpM7T/Fo+T+tpVFEoqFM06QwNpuAtbI89FwcrDbop6o896bVKlVhG
pWborheP2HFDVWBp5+sM40TFM+juzsG+/JzrKuJ5poBh2Lnje7SqrtM0wrU9tr9iK7N6qto0UlWD
6nRQtnG4uZwccyy6Sif6TGaoDuDZvEfJDglAU8UyESMxZ3R9NR/299sPEsUCbNa2WqiJ3XqOvvzw
credfLAbQXo76MvA5cUDfyApIxV2FHbhsKZKFVeRDKU3VjGFW2qp6CtpTk0zBz6kmDCCdQC2z+Pt
398e//3w8ef2fvvxx+P229P+4ePL9q8dlLP/9nH/8Lr7jsz64+vj/ePPx49fn/76oNn4cvf8sPtx
dLd9/rajeIWBnXeZue8fn38e7R/2GH68/8+2S2/RL5+4xp0bLNssz6ypxpdRiqSZo8MkcOagTiK1
pO0tzrpMPr0uI/l5zgP0yPDe/wbajJ+M+MRAtzDvK3LOfgZGrpAM8Qyk/ihtn2pcHE6DHp+NPh+R
K3bNTGzyUh9ZWOd1IPhQ29HH+M8/n14fj24fn3dHj89Hd7sfT5QyxSKGLs+V/dYnA5/4cNgAItAn
rZZBXCyichThf0JbUwL6pGU2l2AiITuHcBo+2hI11vhlUfjUS+4kY0pAJcgnBc1OzYVyO7j/gX2/
aFNjAAW91kFXyR7VfDY5uUibxENkTSID/eoL+uuB6U/oLj28zFqAAuaRY/s84v4FA30d8vb1x/72
t793P49uaeV+f94+3f30FmxZKa/40F81UeC3IgqIcLhwNOAyrJS4101vm3IVnZyd2Q+WaV/Rt9c7
jBO83b7uvh1FD9R22KlH/96/3h2pl5fH2z2hwu3r1utMEKT+rAmwYAFKszo5BtFzjUH2whacx9Xk
5MKfkQ6BAQP+zq2iq3gljNNCAZdbGd+0KeUtun/8tnvxezD1xzmYTb12BLW/ioPaY15Q91SYosS+
QnHR+Uzy8O9X8DTwqtkI2wXUIHo+wqXNFv2we6MbgplWN6nfDUyg3juWbl/uxoYvVf74LTTQ7eUG
OjLezZX+yETA7l5e/crK4NOJVDIhxovebIgxu32cJmoZnfhTreH++EIt9eQ4jGfeF3OR8bPF7jY4
DcWHhA3S3x9pDGuaYj38tVCmobRzEMxzmAzgk7NzrwIAfzrxqW01dABKRQD4bHIiFfHJB6af/O/R
pWOazz3iel5OvvisfV3o6rS2sH+6s1xde/7hTyTA9IMLDjhrpnbuKYMoA/kerF8w+Xrk7XOzdBS+
4R0rofBAVbWcDoQRSCmQjeyIpCbP6O+hYpcLdaOkSzMzGyqplLAiDCsXeHEkMeiysB5O6Of/VGh1
HR0UY/U6d4f5v7oXzJ8wBtpS9fvhmSXWRbvhyDe5B7s49RdZcnPqDQHdEnlQvBIyDKzcPnx7vD/K
3u6/7p5Nxjwn0V6/6qq4DYoyk+5HTCfKKSURbrzmEWaE32qcqhaHxpSIAvF+mFF49f4Z13VURhgv
yA9jmM5Hj825Y2QQbceQ3db0eKNjH2p6T1yOuNO5dKjnH1jw6KIpau/4YJNrlvzYf33egmn0/Pj2
un8QJCMmsJKYDyW20hLGhClKCsNANd5iJNLbkZU0RiKMNiFF1dCn02zGhxshB3otXqp/OURyqJGj
KsrQA6Y+SkQjUmmxlrZGtAIbBHqeJG0QHVaekRajMQMlPmHJqLo4sjLzRRiiqzPfykK4qlP36QgP
GwWHsNj141NpipEmCORIwECt4iYF3nNQTlAkTAz7fNMGWXZ2tpHzCPL6dLk3sRTrxuiu+GMhFhwf
9BoZRPbqnzDCahZtAvndVz4ejusow+Fjonh09V4fDd1IVjeHcFGIDm58HtMkxzj5+SaR53nAu+6w
9kFoW18XkYgsmmnS0VTNdJSsLlKLZvDuPzv+ApsFD8bjAD1I3NCNYhlUFxRFhFgso6MYwpO6snv4
4NEA334GEVdVeAep8b6cx6SCf5Gp+kIPl7/svz/oTBK3d7vbv/cP31nEG93b80uW0nIt9vHV5Qd2
otrho01dKt7tsQPvPAtVee3WJx2u64KBuwfLJK7q0aYNFCSE8H+6hcZj9ReGwxQ5jTNsHTlbzy77
jIpjMqxUcXjeFjy/Qgdpp1EWgMJRcl8jZZze+9pAlcdHbdkSo8se8nKUsCZgH2yALMA7nBJDja3l
xUmSKBvBZhG6wcbcNSPIy5CbTTAIaYQRb1P92GDfQ7xUU4lfZhHEblASdQRdwIO02ASLOd10lNHM
oUCHzpnCtGg6Yi62w63irPPXdsIJ+/0fALMCTYuLjWByzjkEbFjPJg3auG5a+yvrKW382cfc2pyQ
MMAnoun1xQhvYyRjZhGRqHItX4doPCwDq0nkyjH8tH8xtxiQ9f1BwEDA7N/O3B9mognjWs+Hvtj1
FZFSZWGe8kHpUdw/zYZqR0wbjq6UqC7aNseN1qAcKPeus6FSybKXnedex6jF9sl+dASW6Dc3CHZ/
t5uLcw9GAe6FTxsrPrMdUJWpBKsXsCs9RAXywC93GvzpweypGzrUzi03MIaYAuJExCQ3/P6QIcir
VaLPR+Cs+4alCHfcoJSEbZUnufXaBIeib8CF/AFWOIaCrybn459xXA3iropwq0iwdsmTSTH4NBXB
s4rBKQZopRIduDNMnCpLda35I9dHqjyIgSGTzAACLkcoQpTH0msQBqq0FpNGuPW8dkZdp0fTWhAh
c+6MQDhEQBFkC7rO+YhTYVi2dXt+ajGvkG5ng0SRC+eC7GJBEFRR3RREbMWN9fgaRo0uy8dJquss
IPSsTwD5HpVONuSSIBaWZyG0t1rHeZ1M7e5leWYo8Um1wsaWkQfqBJuACWhG9Dnv7q/t249XTIX2
uv/+9vj2cnSvbxy3z7vtEabn/19mWNNF+03UptPrGoPUzz0MusNDEzFyYnLMBJLBV3iESl/LgovT
DWVJIswq0Xa0sHFivCGSqCSeZ+iUfnnBfJ/o1j0edZit5onmHUz4FU1b2qN8xZWYJLduJPC3mG/D
7IPEDqsOkpu2Vmw5xOUVWus8H1cR6wgC00jmuTEI7VnIFhnm/yjxaqcurb0N+92wyFVYMYZqoPOo
xvSk+SzkTGGWw7qsmqILVuPQi384gyMQhqzBCFjx+BVmaMl5p6IUG5gzfz26hA+jIuffASewBh/d
rbI5VyRYlkVH37ZdGowBQ9Cn5/3D6986PeH97uW777dGuvyyxdHg89uBA3xuTzzV0z7moLDOE9DC
k/5y+fMoxVUTR/Xl6TAy2krzSugp0F3ENCSMEj5T4XWm8KFzL6oHLNApOqa0UVkCibTpdBw0/Fvh
21xVxMd2dLz6E+L9j91vr/v7zjh6IdJbDX/2R1fX1R38eTCMtGwCOu8etu6ArUDTlw9VGFG4VuVM
VqAZ1bQe8ScJpxgUHxcjIdhRRhfraYMeixjgLYznrIRxpqDby5PjU8aFcA0XIIQxQU0ql4+eRFSD
qmRvzUWEWfowvhS2TSIdyeQFrF3kkzHG8VsGpB4AsKopZV4aV6mquU7iYqgTmA+ArTSSdWsF+133
s8hJBeExmBzuTyV5x7Vr9NPBZ2+9OCtjhv/q2qKVSHcB+1uz68Pd17fv39F1Jn54eX1+w4cS2CpM
FR76VNcVTzDIgL3/jp7uy+N/JhKVTvvnDq8Vjtdb50tYWXws8LcU/mc0iWZaqS4lAM6l4oKBcLww
n1iKzSUiDC3uJSQPz0QfXCIRZ+OXxtceBwwQjRJ//jGA0juD6jyi+nIZP0aeCMovvlXHpYYuDLGO
4HYQZst6zj5UMOiF9holKKzdKs/kc6ah+FYfTDjdK/NQYRy9l3bLosqnf8Jeky4hqqSZGiIuJBHs
3KXQ6uoGG+Qq+rG5w/AeHOUxSWgdvDc5Pz4+dtva046oNg5V7/s2E0anp0JlAR//zUYL1P6ETaXj
dQcmCmw37JBRFo5yYV3IKvXbsErJK8KNh3dpyqn4aTGfJWouJm/rrQBNG5d1o4QN0CFG69bPopND
oaU3IZCSRsTANkGcU0J7XEb8qKlbnpqxotElRg0PbElVPHTCQdA742rOD/0C6qHGCvdshBBq7IrD
WeNZsLxt7yyBhU4B21k1QHSUPz69fDzCN8renrRAWGwfvnP9DbhggI6YuWXrWWBMldREQz5ejSQF
uKkve/dlPHxE09K8BTxsxnxWjyJ7p15ORjX8Ck3fNDajWEO7wIyJtaqktb6+AokM8jrs0tz0aaUO
jZiO3wDJ+u0NxanAevVWc+5FNNDW4AhmmNPgpCqU7S5UHPNlFBUHeW0ZRSk5G+rjdfQ6GwTQf788
7R/QEw06ef/2uvtnB//Zvd7+/vvv/8MSfWNeGSpuTmaEa9MUZb7iaWb4Z9gxl3/imUhTRxt+E92t
WeiLHTPc7WqZfL3WGGDw+dqO4+hqWldWlgENpYY5gk/H3xc+w+kQowOs6hxthyqJxr7GMSP/gc78
kpgKNQl2Alqozonh0El+OG7Mt//HfPanYRihiyYz8WLHlCQkqxx1WBiqtsnQlwYWrz6WFoSTlspj
DFOwkxhj+ltrRt+2r9sjVIlu8cbIs3zotslVVTqg05pK9r7QSCMHxORVpDq0pIYEOT0rojUnhzGM
tNhuXAAmGaiKsaKrH+2FEzSiokZbqOQJwJ3VMFg5QYMiajauJSEF/1qK6Q8aknFkB/XM+2TC8c5S
QFB0xXNfmIcErC65gw3sVRstpWCu2EY0bQLQVvEUUWo0NngBvD/RCg4lDKDs4GwbAzQLruucnX5k
9PQL9MUK3oLhnjWZNtkOY+elKhYyjTk5mDljJSDbdVwv8HzJ1UE7dEqpD4EArwYdEkw4Q/OElGQb
uoUE3Ye6FLaIqNWUQ99poq41cDI3IK/qn7gzZvsKT1iR3mLvOPY4WRV0LPDHhxVFvHYNhPxMqhNM
eHIndsurz5y2uRV1hMJRm9Pj0el+Z6b1SHXthY01d/KlsJ7QUIlxX+UVKCszr+y+VAeuFYUeOpxg
rGGFd3Dp9ES3tVsvlbcOqgx02kXuLxCD6JVfe7KmwPVhjoFLUXIZN07JwFWW4ctPmBSEPhg50u7J
YUlLhFweCWNg0irTQ+dysoklVDGNuunwD/pc+GFqdx29v6/7BdX1tHQXpbfbhyjPbgZrVeLNzAj7
NmvevlpCt4zuISs7exQVqbexNnrEaRm24eBQIcsXtrV/nfKdLrFdRMezresHYHqhEroOw3EV61w2
WSxeIkjWn3UqUqTvm4j5jCZtvEQ5RUJU6+zN73zgrh+/qcNC0WnYDEo8eHKO8fnRfr17eUWNEU2a
4PFfu+ftd/bmWm+NL4Ocx7JoAxasUQAbvmibsICQ1A1Y7OjggnNK69byG06WYW1plHSeRl5GVT6S
jZNIRrF6/1c8K6hINzUaLynXBzSqKd4QjypT/PbaXbbWHfN4DTpp1jhemxn4JoOYlp6PyiLahM3I
Swt62PR1kA4PF7MAdFRVUFjvZBB8CYg6l24QCd25c91bwO5Cyi0KwLAdEjlgWx+qNiPh3ITVF/Xj
eEz3OHOyTdoUJbrl1HjGeWA8x9zVCRuHUvZwvYKXqTMOq1SbnTaUnMEpg4AzaoU3juh+t8jpRHbF
h3MW42sC8Qjn5kXM4jIFq45rgjTbJqehM/7Ei8eXCOUbsJNF6EWS5qE33WmUBqC9SLa0KQ6tZX5y
Z77roH15ABrZjJXCR3ws+adBXAyK6gan0heFLFMVR2rvDxfXGcBCxR03Gq9zaafQ76BXaQz6eYx3
DS6qxOxbA9KtUP8Sk7l1FKsZvg1KLuchujayiDN2EkvvQcSV1t+jPpJk+3x/fipZsapMgUMVNbKf
1k2saSHJ4hvJiFzEeERm7Is4lBRdXZg+i8BbG7JEQMHGhKTuIdHGPx6gW5zutkFmt7r8CO9ARrkt
9rDC10VF4euNkiOVRQn8f5FkV3TBpwIA
--===============0786421199389852101==--

