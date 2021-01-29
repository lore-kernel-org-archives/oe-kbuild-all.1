Content-Type: multipart/mixed; boundary="===============0531043093302177909=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.14.y 1531/2170] /tmp/ccoMtgxh.s:815: Error: immediate out of range at operand 3 -- `bic w1, w0, 5'
Date: Fri, 29 Jan 2021 11:04:52 +0100
Message-ID: <YBPdxJfzszcvs0CK@kroah.com>
In-Reply-To: <74d3819f-3544-23d0-5495-98c43c52f7d5@suse.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0531043093302177909==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 09:05:21AM +0100, Jan Beulich wrote:
> On 29.01.2021 05:36, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-4.14.y
> > head:   8fd249c180486f0a441ce3b2ab2e1d9a3f697b21
> > commit: 0cad6b264e35cc31de99c58ed11e42ba6e06d80f [1531/2170] xen/netbac=
k: use lateeoi irq binding
> > config: arm64-randconfig-r001-20210129 (attached as .config)
> > compiler: aarch64-linux-gcc (GCC) 7.5.0
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-rc.git/commit/?id=3D0cad6b264e35cc31de99c58ed11e42ba6e06d80f
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/l=
inux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc linux-4.14.y
> >         git checkout 0cad6b264e35cc31de99c58ed11e42ba6e06d80f
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-7.5.0 make.cr=
oss ARCH=3Darm64 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>):
> > =

> >    drivers/net/xen-netback/rx.c:422:6: warning: no previous prototype f=
or 'xenvif_rx_skb' [-Wmissing-prototypes]
> >     void xenvif_rx_skb(struct xenvif_queue *queue)
> >          ^~~~~~~~~~~~~
> >    /tmp/ccoMtgxh.s: Assembler messages:
> >>> /tmp/ccoMtgxh.s:815: Error: immediate out of range at operand 3 -- `b=
ic w1,w0,5'
> =

> This looks to be due to wrong asm() constraints, requiring =

> 580fa1b87471 ("arm64: Use correct ll/sc atomic constraints")
> to be pulled in.

If someone wants to backport it to 4.19.y and 4.14.y, I will be glad to
take it, as it does not apply cleanly.

thanks,

greg k-h
--===============0531043093302177909==--

