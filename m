Content-Type: multipart/mixed; boundary="===============3082566400841020407=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-4.19.y 9753/9999] WARNING: vmlinux.o(.text+0x2f872e): Section mismatch in reference from the function ima_calc_boot_aggregate_tfm() to the function .init.text:ima_pcrread()
Date: Mon, 18 Jan 2021 10:11:40 +0100
Message-ID: <YAVQzME7h5CAyUgW@kroah.com>
In-Reply-To: <a4867445057a4b8997c4470899dc310b@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3082566400841020407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 09:01:58AM +0000, Roberto Sassu wrote:
> > From: kernel test robot [mailto:lkp(a)intel.com]
> > Sent: Sunday, January 17, 2021 2:53 AM
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-
> > rc.git linux-4.19.y
> > head:   e864f43593ccf9180c61738abdf1c1dde091367d
> > commit: fcb067cb457e2326c6d759e346f5f5dfef351d50 [9753/9999] ima: Call
> > ima_calc_boot_aggregate() in ima_eventdigest_init()
> > config: x86_64-randconfig-a015-20210117 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project
> > bfd75bdf3fd62d4f5e7028d4122f9ffa517f2a09)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-
> > tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable-
> > rc.git/commit/?id=3Dfcb067cb457e2326c6d759e346f5f5dfef351d50
> >         git remote add linux-stable-rc
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.=
git
> >         git fetch --no-tags linux-stable-rc linux-4.19.y
> >         git checkout fcb067cb457e2326c6d759e346f5f5dfef351d50
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross
> > ARCH=3Dx86_64
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> =

> Please include commit 8b8c704d913b.

Now applied, thanks.

greg k-h
--===============3082566400841020407==--

