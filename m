Content-Type: multipart/mixed; boundary="===============0781217158658658289=="
MIME-Version: 1.0
From: Ben Skeggs <bskeggs@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'lsb_header_tail_dump'
Date: Sat, 30 May 2020 09:36:41 +1000
Message-ID: <CABDvA=k15=DN+ntNtC451ysaM0BTAqFTBX=DG5Nw9q5df+0bfQ@mail.gmail.com>
In-Reply-To: <202005300520.jjdrpDkK%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0781217158658658289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2020 at 7:00 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Ben,
>
> FYI, the error/warning still remains.
Thanks, I've got a patch in my tree.

Ben.

>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   75caf310d16cc5e2f851c048cd597f5437013368
> commit: 22dcda45a3d1dfe6eeb4ab0a3b9aaa2333cb649d drm/nouveau/acr: impleme=
nt new subdev to replace "secure boot"
> date:   5 months ago
> config: arm64-sof-customedconfig-sst-defconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 22dcda45a3d1dfe6eeb4ab0a3b9aaa2333cb649d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous pro=
totype for 'lsb_header_tail_dump' [-Wmissing-prototypes]
> 49 | lsb_header_tail_dump(struct nvkm_subdev *subdev,
> | ^~~~~~~~~~~~~~~~~~~~
>
> vim +/lsb_header_tail_dump +49 drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c
>
>     47
>     48  void
>   > 49  lsb_header_tail_dump(struct nvkm_subdev *subdev,
>     50                          struct lsb_header_tail *hdr)
>     51  {
>     52          nvkm_debug(subdev, "lsbHeader\n");
>     53          nvkm_debug(subdev, "\tucodeOff      : 0x%x\n", hdr->ucode=
_off);
>     54          nvkm_debug(subdev, "\tucodeSize     : 0x%x\n", hdr->ucode=
_size);
>     55          nvkm_debug(subdev, "\tdataSize      : 0x%x\n", hdr->data_=
size);
>     56          nvkm_debug(subdev, "\tblCodeSize    : 0x%x\n", hdr->bl_co=
de_size);
>     57          nvkm_debug(subdev, "\tblImemOff     : 0x%x\n", hdr->bl_im=
em_off);
>     58          nvkm_debug(subdev, "\tblDataOff     : 0x%x\n", hdr->bl_da=
ta_off);
>     59          nvkm_debug(subdev, "\tblDataSize    : 0x%x\n", hdr->bl_da=
ta_size);
>     60          nvkm_debug(subdev, "\tappCodeOff    : 0x%x\n", hdr->app_c=
ode_off);
>     61          nvkm_debug(subdev, "\tappCodeSize   : 0x%x\n", hdr->app_c=
ode_size);
>     62          nvkm_debug(subdev, "\tappDataOff    : 0x%x\n", hdr->app_d=
ata_off);
>     63          nvkm_debug(subdev, "\tappDataSize   : 0x%x\n", hdr->app_d=
ata_size);
>     64          nvkm_debug(subdev, "\tflags         : 0x%x\n", hdr->flags=
);
>     65  }
>     66
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0781217158658658289==--

