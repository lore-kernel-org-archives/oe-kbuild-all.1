Content-Type: multipart/mixed; boundary="===============6381357231525565731=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `security/keys/trusted-keys/tpm2key.asn1.o' being placed in section `.eh_frame'
Date: Sun, 31 Jan 2021 12:28:19 +0800
Message-ID: <20210131042819.GA28302@intel.com>
In-Reply-To: <20210129173934.GA2433246@localhost>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6381357231525565731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 10:39:34AM -0700, Nathan Chancellor wrote:
> On Fri, Jan 29, 2021 at 09:20:52AM -0800, James Bottomley wrote:
> > On Fri, 2021-01-29 at 22:27 +0800, kernel test robot wrote:
> > > tree:   =

> > > https://github.com/0day-ci/linux/commits/UPDATE-20210129-183238/James=
-Bottomley/TPM-2-0-trusted-key-rework/20210129-175906
> > > head:   d98ce41d6c32fa78e380385c6e146f752e4d3809
> > > commit: af175fe469c6f0bdd1e14a14a3d107e7adb122bb security: keys:
> > > trusted: use ASN.1 TPM2 key format for the blobs
> > > date:   4 hours ago
> > > config: arm64-randconfig-r023-20210129 (attached as .config)
> > > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project
> > > 275c6af7d7f1ed63a03d05b4484413e447133269)
> > > reproduce (this is a W=3D1 build):
> > >         wget =

> > > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cr=
oss
> > > -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm64 cross compiling tool for clang build
> > >         # apt-get install binutils-aarch64-linux-gnu
> > >         # =

> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Daf175fe469c6f0bdd1e14a14a3d107e7adb122bb
> > >         git remote add linux-review =

> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > >         git fetch --no-tags linux-review UPDATE-20210129-
> > > 183238/James-Bottomley/TPM-2-0-trusted-key-rework/20210129-175906
> > >         git checkout af175fe469c6f0bdd1e14a14a3d107e7adb122bb
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> > > ARCH=3Darm64 =

> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > =

> > > All warnings (new ones prefixed by >>):
> > > =

> > >    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from
> > > `fs/dlm/rcom.o' being placed in section `.eh_frame'
> > =

> > What's the problem here?  the file you're complaining about is pure
> > machine generated so I can't alter its .c anyway and this looks like
> > some type of linker problem anyway.
> > =

> > Let's start with what does the error actually mean?
> =

> Unfortunately, this is a clang bug:
> https://github.com/ClangBuiltLinux/linux/issues/1069
> =

> $ curl -LSs https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.or=
g/message/OWC2ZF3C6UTA6ND74UJVSJ4BRRKFGJKC/attachment/2/config.gz | gzip -d=
 | rg "GCOV"
> # GCOV-based kernel profiling
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_PROFILE_ALL=3Dy
> # end of GCOV-based kernel profiling
> =

> I will try to send out that workaround today so that we stop pinging
> developers about it (and it would be nice if the 0day folks could just
> send warnings of this nature to our mailing list only).
Got it Nathan, we will send this warning to clang mailing list only.

> =

> Cheers,
> Nathan
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============6381357231525565731==--

