Content-Type: multipart/mixed; boundary="===============0405019372200789980=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: kbuild-all@lists.01.org
Subject: Re: lib/crypto/chacha.c:65:1: warning: the frame size of 1604 bytes is larger than 1024 bytes
Date: Tue, 20 Oct 2020 03:13:57 -0700
Message-ID: <291e3bbc22c84b18c54e072e995d18a7955a209b.camel@perches.com>
In-Reply-To: <c5af8f26bcb3468eb777bb8a8c8258d6@AcuMS.aculab.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0405019372200789980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-10-20 at 08:00 +0000, David Laight wrote:
> From: Joe Perches
> > Sent: 19 October 2020 16:47
> > On Mon, 2020-10-19 at 03:13 +0800, kernel test robot wrote:
> > > Hi Ard,
> > > =

> > > First bad commit (maybe !=3D root cause):
> > > =

> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   9d9af1007bc08971953ae915d88dc9bb21344b53
> > > commit: 5fb8ef25803ef33e2eb60b626435828b937bed75 crypto: chacha - mov=
e existing library code into
> > lib/crypto
> > > date:   11 months ago
> > > config: i386-randconfig-r023-20201019 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > reproduce (this is a W=3D1 build):
> > >         #
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D5fb8ef25803ef33e2eb60b62
> > 6435828b937bed75
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 5fb8ef25803ef33e2eb60b626435828b937bed75
> > >         # save the attached .config to linux build tree
> > >         make W=3D1 ARCH=3Di386
> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > =

> > > All warnings (new ones prefixed by >>):
> > > =

> > >    lib/crypto/chacha.c: In function 'chacha_permute':
> > > > > lib/crypto/chacha.c:65:1: warning: the frame size of 1604 bytes i=
s larger than 1024 bytes [-
> > Wframe-larger-than=3D]
> > >       65 | }
> > >          | ^
> > > =

> > > vim +65 lib/crypto/chacha.c
> > =

> > This seems to come from function tracing overhead.
> =

> Are you sure?

No.  I'm trying to isolate it now.

> I've not got the x86 object, but the x86-64 version caches the 16 x[]
> values (from the parameter) in registers.
> The 32 bit cpu doesn't have enough registers, but gcc tends to
> compile assuming an infinite number.
> So it may have spilled lots of virtual registers to different
> stack locations - instead of writing the values to their 'target'
> address.



--===============0405019372200789980==--

