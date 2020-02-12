Content-Type: multipart/mixed; boundary="===============5669220005181654521=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [alibaba-cloud:ck-4.19.91 10413/10873] arch/m68k/include/asm/motorola_pgtable.h:199:11: error: dereferencing pointer to incomplete type 'const struct mm_struct'
Date: Wed, 12 Feb 2020 01:21:51 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E66249523A83F4@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <CAPcyv4hH3TspP+dDcxE7=ZvS+1to4E+CQDK0USXg9wXgfkBDbQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5669220005181654521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild-all] Re: [alibaba-cloud:ck-4.19.91 10413/10873]
> arch/m68k/include/asm/motorola_pgtable.h:199:11: error: dereferencing poi=
nter to
> incomplete type 'const struct mm_struct'
> =

> On Tue, Feb 11, 2020 at 12:08 PM kbuild test robot <lkp@intel.com> wrot=
e:
> >
> > Hi Dan,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://github.com/alibaba/cloud-kernel.git ck-4.19.91
> > head:   536f70b41d6fc5fc46f50c4caa012c4439160180
> > commit: 7a6bd9433d146a30036717ae982b9ee85d05ec56 [10413/10873] device-
> dax: Move resource pinning+mapping into the common driver
> > config: m68k-allmodconfig (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 7.5.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-
> tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 7a6bd9433d146a30036717ae982b9ee85d05ec56
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dm68k
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> =

> Why am I receiving this message? I don't care about ck-4.19.91. The
> commit in question is:
Sorry Dan, we will resolve this to avoid sending this kind of mail.

> =

>     89ec9f2cfa36 device-dax: Move resource pinning+mapping into the
> common driver
> =

> ...from the v5.1 kernel. If it was backported to a v4.19 baseline
> that's the backporter's problem.
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============5669220005181654521==--

