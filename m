Content-Type: multipart/mixed; boundary="===============3573592043376025910=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 179/239] include/linux/thread_info.h:215:27: error: 'INT_MAX' undeclared
Date: Mon, 17 May 2021 12:04:42 +0300
Message-ID: <YKIxqo8I1V5w0SDh@smile.fi.intel.com>
In-Reply-To: <20210513120805.14ca5439fe8a1ec2a1168d8e@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3573592043376025910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 12:08:05PM -0700, Andrew Morton wrote:
> On Thu, 13 May 2021 17:36:14 +0800 kernel test robot <lkp@intel.com> wr=
ote:
> =

> > tree:   https://github.com/hnaz/linux-mm master
> > head:   12891f829e4851b3562ddcde27a4a9ade308ada3
> > commit: 161b082aa6ac5047f1b0f243f0e834d2bfb39842 [179/239] kernel.h: sp=
lit out panic and oops helpers
> > config: nds32-defconfig (attached as .config)
> > compiler: nds32le-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/hnaz/linux-mm/commit/161b082aa6ac5047f1b0f=
243f0e834d2bfb39842
> >         git remote add hnaz-linux-mm https://github.com/hnaz/linux-mm
> >         git fetch --no-tags hnaz-linux-mm master
> >         git checkout 161b082aa6ac5047f1b0f243f0e834d2bfb39842
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss W=3D1 ARCH=3Dnds32 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > Note: the hnaz-linux-mm/master HEAD 12891f829e4851b3562ddcde27a4a9ade30=
8ada3 builds fine.
> >       It only hurts bisectibility.
> =

> I'm surprised.  I guess some later patch accidentally fixed it.

For the record I have tested on x86/64, so we may see a few more breakage
things, but I hope that the number will be quite small in comparison to the
initial attempt.

> I expect we'll see a bunch more gramlins like this.  And I assume this
> fixes:
> =

> --- a/include/linux/thread_info.h~kernelh-split-out-panic-and-oops-helper=
s-fix
> +++ a/include/linux/thread_info.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_THREAD_INFO_H
>  =

>  #include <linux/types.h>
> +#include <linux/limits.h>
>  #include <linux/bug.h>
>  #include <linux/restart_block.h>
>  #include <linux/errno.h>
> _

LGTM, thanks!


-- =

With Best Regards,
Andy Shevchenko


--===============3573592043376025910==--

