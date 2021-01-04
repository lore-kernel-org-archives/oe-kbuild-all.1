Content-Type: multipart/mixed; boundary="===============3257214287084173682=="
MIME-Version: 1.0
From: Darrick J. Wong <darrick.wong@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [djwong-xfs:realtime-rmap 245/249] fs/xfs/scrub/repair.c:2202:6: warning: variable 'is_free' is uninitialized when used here
Date: Mon, 04 Jan 2021 14:29:13 -0800
Message-ID: <20210104222913.GK38809@magnolia>
In-Reply-To: <20201221221921.GA3388751@ubuntu-m3-large-x86>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3257214287084173682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 03:19:21PM -0700, Nathan Chancellor wrote:
> On Tue, Dec 22, 2020 at 03:22:03AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linu=
x.git realtime-rmap
> > head:   62eb0024d510607ecb04789e8b4f8c0975efb08b
> > commit: f4188e5ab1984e1b140433a80f223ab4644801af [245/249] xfs: online =
repair of realtime file bmaps
> > config: x86_64-randconfig-a011-20201217 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ce=
e1e7d14f4628d6174b33640d502bff3b54ae45)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-li=
nux.git/commit/?id=3Df4188e5ab1984e1b140433a80f223ab4644801af
> >         git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/=
kernel/git/djwong/xfs-linux.git
> >         git fetch --no-tags djwong-xfs realtime-rmap
> >         git checkout f4188e5ab1984e1b140433a80f223ab4644801af
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>):
> > =

> > >> fs/xfs/scrub/repair.c:2202:6: warning: variable 'is_free' is uniniti=
alized when used here [-Wuninitialized]
> >            if (is_free)
> >                ^~~~~~~
> >    fs/xfs/scrub/repair.c:2189:16: note: initialize the variable 'is_fre=
e' to silence this warning
> >            bool                    is_free;
> >                                           ^
> >                                            =3D 0
> >    1 warning generated.
> > =

> > =

> > vim +/is_free +2202 fs/xfs/scrub/repair.c
> > =

> >   2173	=

> >   2174	/*
> >   2175	 * Check if any part of this range of rt blocks is free, so that=
 we don't
> >   2176	 * rebuild things with bad records.  Returns -EFSCORRUPTED if ba=
d.
> >   2177	 */
> >   2178	int
> >   2179	xrep_rtext_is_free(
> >   2180		struct xfs_scrub	*sc,
> >   2181		xfs_rtblock_t		rtbno,
> >   2182		xfs_filblks_t		len)
> >   2183	{
> >   2184		struct xfs_mount	*mp =3D sc->mp;
> >   2185		xfs_rtblock_t		startext;
> >   2186		xfs_rtblock_t		endext;
> >   2187		xfs_rtblock_t		extcount;
> >   2188		uint32_t		mod;
> >   2189		bool			is_free;
> >   2190		int			error;
> >   2191	=

> >   2192		/* Convert rt blocks to rt extents. */
> >   2193		startext =3D div_u64_rem(rtbno, mp->m_sb.sb_rextsize, &mod);
> >   2194		endext =3D div_u64_rem(rtbno + len - 1, mp->m_sb.sb_rextsize, &=
mod);
> >   2195	=

> >   2196		/* Make sure this isn't free space. */
> >   2197		extcount =3D endext - startext + 1;
> >   2198		error =3D xfs_rtalloc_extent_is_free(mp, sc->tp, startext, extc=
ount,
> >   2199				&is_free);
> >   2200		if (error)
> >   2201			return error;
> > > 2202		if (is_free)
> >   2203			return -EFSCORRUPTED;
> >   2204	=

> >   2205		return 0;
> >   2206	}
> >   2207	=

> > =

> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> > =

> =

> This appears to be a false positive. From the config:
> =

> # CONFIG_XFS_RT is not set
> =

> which means xfs_rtalloc_extent_is_free evaluates to ENOSYS and we never
> actually make it to that if statement evaluation; however, clang cannot
> see this because it is doing simple static analysis at this stage of the
> pipeline, not seeing that it will never have to use is_free in this
> configuration. A simple reproducer:
> =

> $ cat test.c
> #define func(a) 22
> =

> int main() {
>     int error;
>     _Bool is_free;
> =

>     error =3D func(&is_free);
>     if (error)
>         return error;
>     if (is_free)
>         return -117;
> =

>     return 0;
> }
> =

> $ clang -Wuninitialized -fsyntax-only test.c
> test.c:10:9: warning: variable 'is_free' is uninitialized when used here =
[-Wuninitialized]
>     if (is_free)
>         ^~~~~~~
> test.c:5:18: note: initialize the variable 'is_free' to silence this warn=
ing
>     _Bool is_free;
>                  ^
>                   =3D 0
> 1 warning generated.
> =

> Obviously initializing is_free to false will avoid this warning, which
> is probably the simplest fix.

I don't mind making that change (and in fact already did), but uh...
shouldn't clang be analyzing the C source code /after/ the preprocessing
step?  I bet there's a fair amount of #define soup in the kernel that
clang would /love/ to sink its teeth into. ;)

Insofar as one doesn't need teeth for soup.

--D

> Cheers,
> Nathan
--===============3257214287084173682==--

