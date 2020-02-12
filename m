Content-Type: multipart/mixed; boundary="===============1157879478114339405=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [alibaba-cloud:ck-4.19.91 10413/10873] arch/m68k/include/asm/motorola_pgtable.h:199:11: error: dereferencing pointer to incomplete type 'const struct mm_struct'
Date: Wed, 12 Feb 2020 04:36:00 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E66249523A8CF0@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <831EE4E5E37DCC428EB295A351E66249523A8416@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1157879478114339405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: RE: [alibaba-cloud:ck-4.19.91 10413/10873]
> arch/m68k/include/asm/motorola_pgtable.h:199:11: error: dereferencing poi=
nter to
> incomplete type 'const struct mm_struct'
> =

> > Subject: Re: [alibaba-cloud:ck-4.19.91 10413/10873]
> > arch/m68k/include/asm/motorola_pgtable.h:199:11: error: dereferencing p=
ointer
> to
> > incomplete type 'const struct mm_struct'
> >
> > Hi,
> > Can we only send to alikernel-developer(a)linux.alibaba.com?
> > We don't want to bother the author.
> Sure, no problem, we will update the configuration soon.
forget to mention, the deployment of new logic need some time to occur, it
should be ready this afternoon.

> =

> >
> > Thanks,
> > Joseph
> >
> > On 20/2/12 07:01, Dan Williams wrote:
> > > On Tue, Feb 11, 2020 at 12:08 PM kbuild test robot <lkp@intel.com> =
wrote:
> > >>
> > >> Hi Dan,
> > >>
> > >> FYI, the error/warning still remains.
> > >>
> > >> tree:   https://github.com/alibaba/cloud-kernel.git ck-4.19.91
> > >> head:   536f70b41d6fc5fc46f50c4caa012c4439160180
> > >> commit: 7a6bd9433d146a30036717ae982b9ee85d05ec56 [10413/10873]
> > device-dax: Move resource pinning+mapping into the common driver
> > >> config: m68k-allmodconfig (attached as .config)
> > >> compiler: m68k-linux-gcc (GCC) 7.5.0
> > >> reproduce:
> > >>         wget https://raw.githubusercontent.com/intel/lkp-
> > tests/master/sbin/make.cross -O ~/bin/make.cross
> > >>         chmod +x ~/bin/make.cross
> > >>         git checkout 7a6bd9433d146a30036717ae982b9ee85d05ec56
> > >>         # save the attached .config to linux build tree
> > >>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dm68k
> > >>
> > >> If you fix the issue, kindly add following tag
> > >> Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > > Why am I receiving this message? I don't care about ck-4.19.91. The
> > > commit in question is:
> > >
> > >     89ec9f2cfa36 device-dax: Move resource pinning+mapping into the
> > > common driver
> > >
> > > ...from the v5.1 kernel. If it was backported to a v4.19 baseline
> > > that's the backporter's problem.
> > >


--===============1157879478114339405==--

