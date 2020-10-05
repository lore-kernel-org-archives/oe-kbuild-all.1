Content-Type: multipart/mixed; boundary="===============5199068761391120568=="
MIME-Version: 1.0
From: Alexandre Courbot <acourbot@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [chrome-os:chromeos-5.4 9/28] mtk_vcodec_fw.c:undefined reference to `scp_ipi_send'
Date: Mon, 05 Oct 2020 12:37:41 +0900
Message-ID: <CAPBb6MXpe3DuO645e8D5yAQu73Bf9gfJYL=wAX1mx_M4hHiL9Q@mail.gmail.com>
In-Reply-To: <CABXOdTcO3ip+B=U7pGy21+wDsy3LiOrO75HB46jsnQNKwPiYJg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5199068761391120568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2020 at 12:37 AM Guenter Roeck <groeck@google.com> wrote:
>
> On Fri, Oct 2, 2020 at 5:47 AM Alexandre Courbot <acourbot@google.com> =
wrote:
> >
> > Yes, and the problem has also been raised upstream. :/ Looking for the
> > right fix.
>
> One can not set MTK_SCP without taking its dependencies into account.
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kcon=
fig
> index a097652cec52..0a51ca707b1e 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -245,6 +245,7 @@ config VIDEO_MEDIATEK_VCODEC
>         depends on MTK_IOMMU || COMPILE_TEST
>         depends on VIDEO_DEV && VIDEO_V4L2
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> +       depends on REMOTEPROC
>         select VIDEOBUF2_DMA_CONTIG
>         select V4L2_MEM2MEM_DEV
>         select VIDEO_MEDIATEK_VPU
>
> is the obvious fix.

Sent a fix upstream:

https://www.spinics.net/lists/kernel/msg3687878.html

Users of pure MT8173 systems might not want to bring remoteproc in for
MT8183 support they won't use, so I've reworked the code to make it
optional.

I plan to wait until I can cherry-pick a FROMGIT into the CrOS tree,
but if someone is affected by this, please let me know and I will make
a FROMLIST.

>
> Guenter
>
> >
> > On Fri, Oct 2, 2020 at 8:23 PM Nicolas Boichat <drinkcat@google.com> =
wrote:
> > >
> > > +Alexandre Courbot +Fritz Koenig I guess that's related to your recen=
tly merged patches.
> > >
> > > On Fri, Oct 2, 2020, 18:45 kernel test robot <lkp@intel.com> wrote:
> > >>
> > >> tree:   https://chromium.googlesource.com/chromiumos/third_party/ker=
nel chromeos-5.4
> > >> head:   1d3392f3ab6c29e5812a47f0a9c946cf0f6e03b8
> > >> commit: 6c834e841e853771807acc664507158b9226102d [9/28] FROMGIT: med=
ia: mtk-vcodec: add SCP firmware ops
> > >> config: i386-randconfig-a013-20201002 (attached as .config)
> > >> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > >> reproduce (this is a W=3D1 build):
> > >>         git remote add chrome-os https://chromium.googlesource.com/c=
hromiumos/third_party/kernel
> > >>         git fetch --no-tags chrome-os chromeos-5.4
> > >>         git checkout 6c834e841e853771807acc664507158b9226102d
> > >>         # save the attached .config to linux build tree
> > >>         make W=3D1 ARCH=3Di386
> > >>
> > >> If you fix the issue, kindly add following tag as appropriate
> > >> Reported-by: kernel test robot <lkp@intel.com>
> > >>
> > >> All errors (new ones prefixed by >>):
> > >>
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_scp_ipi_send':
> > >> >> mtk_vcodec_fw.c:(.text+0x92): undefined reference to `scp_ipi_sen=
d'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_scp_set_ipi_register':
> > >> >> mtk_vcodec_fw.c:(.text+0xaf): undefined reference to `scp_ipi_reg=
ister'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_vpu_scp_dm_addr':
> > >> >> mtk_vcodec_fw.c:(.text+0xcc): undefined reference to `scp_mapping=
_dm_addr'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_scp_get_venc_capa':
> > >> >> mtk_vcodec_fw.c:(.text+0xec): undefined reference to `scp_get_ven=
c_hw_capa'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_scp_get_vdec_capa':
> > >> >> mtk_vcodec_fw.c:(.text+0x10c): undefined reference to `scp_get_vd=
ec_hw_capa'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_scp_load_firmware':
> > >> >> mtk_vcodec_fw.c:(.text+0x12c): undefined reference to `scp_get_rp=
roc'
> > >> >> ld: mtk_vcodec_fw.c:(.text+0x131): undefined reference to `rproc_=
boot'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_fw_select':
> > >> >> mtk_vcodec_fw.c:(.text+0x294): undefined reference to `scp_get'
> > >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in functio=
n `mtk_vcodec_fw_release':
> > >> >> mtk_vcodec_fw.c:(.text+0x2d7): undefined reference to `scp_put'
> > >>
> > >> ---
> > >> 0-DAY CI Kernel Test Service, Intel Corporation
> > >> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> > >>
> > >> --
> > >> You received this message because you are subscribed to the Google G=
roups "cros-kernel-buildreports" group.
> > >> To unsubscribe from this group and stop receiving emails from it, se=
nd an email to cros-kernel-buildreports+unsubscribe(a)googlegroups.com.
> > >> To view this discussion on the web visit https://groups.google.com/d=
/msgid/cros-kernel-buildreports/202010021814.NapfEnyz-lkp%40intel.com.
--===============5199068761391120568==--

