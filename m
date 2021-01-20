Content-Type: multipart/mixed; boundary="===============3008076417074762001=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 5835/9999] arch/x86/kernel/cpu/mcheck/mce_amd.c:552:6: warning: no previous prototype for 'disable_err_thresholding'
Date: Wed, 20 Jan 2021 12:01:00 +0100
Message-ID: <YAgNbE/RcZnwiLK1@kroah.com>
In-Reply-To: <20210119174052.GH27634@zn.tnic>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3008076417074762001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 06:41:02PM +0100, Borislav Petkov wrote:
> On Wed, Jan 20, 2021 at 01:36:14AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-4.19.y
> > head:   e864f43593ccf9180c61738abdf1c1dde091367d
> > commit: 938de2324afb53acd20893cd8eec8ee6f80de646 [5835/9999] x86/MCE/AM=
D: Carve out the MC4_MISC thresholding quirk
> > config: i386-randconfig-r005-20210118 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git/commit/?id=3D938de2324afb53acd20893cd8eec8ee6f80de646
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/l=
inux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-4.19.y
> >         git checkout 938de2324afb53acd20893cd8eec8ee6f80de646
> >         # save the attached .config to linux build tree
> >         make W=3D1 ARCH=3Di386 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All warnings (new ones prefixed by >>):
> > =

> > >> arch/x86/kernel/cpu/mcheck/mce_amd.c:552:6: warning: no previous pro=
totype for 'disable_err_thresholding' [-Wmissing-prototypes]
> >      552 | void disable_err_thresholding(struct cpuinfo_x86 *c)
> =

> Why are you running W=3D1 build tests on stable kernels?
> =

> Especially -Wmissing-prototypes is a complete waste of time for those.
> =

> And the fix
> =

>   47cd84e98f51 ("x86/mce/amd: Make disable_err_thresholding() static")
> =

> would be a complete waste of backporting bandwidth and it doesn't even
> fit the stable rules.

I agree, this noisy checks should be verified that they actually are
pointing out a real issue before sending them out.

thanks,

greg k-h
--===============3008076417074762001==--

