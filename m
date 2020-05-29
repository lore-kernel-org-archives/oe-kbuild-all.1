Content-Type: multipart/mixed; boundary="===============2181634840102838138=="
MIME-Version: 1.0
From: Ben Skeggs <bskeggs@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:2019:1: warning: no previous prototype for 'gf100_gr_dtor'
Date: Sat, 30 May 2020 09:34:57 +1000
Message-ID: <CABDvA=m7_sQHkCqs6samzEq=33uHrOHwWfAgtW81=unmJmvZvg@mail.gmail.com>
In-Reply-To: <202005300444.jEGzmGwi%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2181634840102838138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2020 at 6:04 AM kbuild test robot <lkp@intel.com> wrote:
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
> commit: ef16dc278ec22ddbf8da54bd06a6e662719c1420 drm/nouveau/gr/gf100-: s=
elect implementation based on available FW
> date:   5 months ago
> config: arm64-sof-customedconfig-sst-defconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout ef16dc278ec22ddbf8da54bd06a6e662719c1420
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:745:1: warning: no previou=
s prototype for 'gf100_gr_fecs_start_ctxsw' [-Wmissing-prototypes]
> 745 | gf100_gr_fecs_start_ctxsw(struct nvkm_gr *base)
> | ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:760:1: warning: no previou=
s prototype for 'gf100_gr_fecs_stop_ctxsw' [-Wmissing-prototypes]
> 760 | gf100_gr_fecs_stop_ctxsw(struct nvkm_gr *base)
> | ^~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:2019:1: warning: no pre=
vious prototype for 'gf100_gr_dtor' [-Wmissing-prototypes]
> 2019 | gf100_gr_dtor(struct nvkm_gr *base)
> | ^~~~~~~~~~~~~
>
> vim +/gf100_gr_dtor +2019 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
>
> 89cd6e2071b3d3b Alexandre Courbot 2016-12-13  2017
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2018  void *
> c85ee6ca79590cd Ben Skeggs        2015-08-20 @2019  gf100_gr_dtor(struct =
nvkm_gr *base)
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2020  {
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2021      struct gf100_gr *=
gr =3D gf100_gr(base);
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2022
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2023      kfree(gr->data);
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2024
> 8e44b987e8f1566 Ben Skeggs        2019-02-12  2025      nvkm_falcon_del(&=
gr->gpccs.falcon);
> 8e44b987e8f1566 Ben Skeggs        2019-02-12  2026      nvkm_falcon_del(&=
gr->fecs.falcon);
> 89cd6e2071b3d3b Alexandre Courbot 2016-12-13  2027
> 00e1b5dcf76648e Ben Skeggs        2020-01-15  2028      nvkm_blob_dtor(&g=
r->fecs.inst);
> 00e1b5dcf76648e Ben Skeggs        2020-01-15  2029      nvkm_blob_dtor(&g=
r->fecs.data);
> 00e1b5dcf76648e Ben Skeggs        2020-01-15  2030      nvkm_blob_dtor(&g=
r->gpccs.inst);
> 00e1b5dcf76648e Ben Skeggs        2020-01-15  2031      nvkm_blob_dtor(&g=
r->gpccs.data);
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2032
> 0033f15b44bc29e Ben Skeggs        2020-01-15  2033      vfree(gr->bundle);
> 0033f15b44bc29e Ben Skeggs        2020-01-15  2034      vfree(gr->method);
> 0033f15b44bc29e Ben Skeggs        2020-01-15  2035      vfree(gr->sw_ctx);
> 0033f15b44bc29e Ben Skeggs        2020-01-15  2036      vfree(gr->sw_nonc=
tx);
> 336c46524fcd822 Alexandre Courbot 2016-02-24  2037
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2038      return gr;
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2039  }
> c85ee6ca79590cd Ben Skeggs        2015-08-20  2040
>
> :::::: The code at line 2019 was first introduced by commit
> :::::: c85ee6ca79590cd51356bf24fb8936bc352138cf drm/nouveau/gr: convert t=
o new-style nvkm_engine
>
> :::::: TO: Ben Skeggs <bskeggs@redhat.com>
> :::::: CC: Ben Skeggs <bskeggs@redhat.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2181634840102838138==--

