Content-Type: multipart/mixed; boundary="===============6939784855388534919=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 14/16] vhost: poll support support multiple workers
Date: Fri, 23 Oct 2020 11:43:14 -0400
Message-ID: <20201023114247-mutt-send-email-mst@kernel.org>
In-Reply-To: <202010080822.dOGbzKC9-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6939784855388534919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 08:46:42AM +0800, kernel test robot wrote:
> Hi Mike,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on vhost/linux-next]
> [also build test ERROR on next-20201007]
> [cannot apply to v5.9-rc8]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Mike-Christie/vhost-fix-=
scsi-cmd-handling-and-IOPs/20201008-045802
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git lin=
ux-next
> config: m68k-allyesconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/c9bcafefcac3c32ade0ba53=
3609d7b1ddc343c54
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Mike-Christie/vhost-fix-scsi-cmd=
-handling-and-IOPs/20201008-045802
>         git checkout c9bcafefcac3c32ade0ba533609d7b1ddc343c54
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> m68k-linux-ld: drivers/vhost/scsi.o:(.bss+0x0): multiple definition of=
 `vq'; drivers/vhost/net.o:(.bss+0x0): first defined here
>    m68k-linux-ld: drivers/vhost/vsock.o:(.bss+0x0): multiple definition o=
f `vq'; drivers/vhost/net.o:(.bss+0x0): first defined here
>    m68k-linux-ld: drivers/vhost/vdpa.o:(.bss+0x0): multiple definition of=
 `vq'; drivers/vhost/net.o:(.bss+0x0): first defined here
>    m68k-linux-ld: drivers/vhost/vhost.o:(.bss+0x0): multiple definition o=
f `vq'; drivers/vhost/net.o:(.bss+0x0): first defined here

Mike, what's going on with these failures?
Can you figure it out pls?

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============6939784855388534919==--

