Content-Type: multipart/mixed; boundary="===============5913064531783405831=="
MIME-Version: 1.0
From: Guenter Roeck <groeck@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [chrome-os:chromeos-5.4 9/28] mtk_vcodec_fw.c:undefined reference to `scp_ipi_send'
Date: Fri, 02 Oct 2020 08:37:44 -0700
Message-ID: <CABXOdTcO3ip+B=U7pGy21+wDsy3LiOrO75HB46jsnQNKwPiYJg@mail.gmail.com>
In-Reply-To: <CAPBb6MWvsuRcG9tSU-Ggiw4JAJNKantD5uG3uKYFc=YUVvEMVA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5913064531783405831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2020 at 5:47 AM Alexandre Courbot <acourbot@google.com> wr=
ote:
>
> Yes, and the problem has also been raised upstream. :/ Looking for the
> right fix.

One can not set MTK_SCP without taking its dependencies into account.

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a097652cec52..0a51ca707b1e 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -245,6 +245,7 @@ config VIDEO_MEDIATEK_VCODEC
        depends on MTK_IOMMU || COMPILE_TEST
        depends on VIDEO_DEV && VIDEO_V4L2
        depends on ARCH_MEDIATEK || COMPILE_TEST
+       depends on REMOTEPROC
        select VIDEOBUF2_DMA_CONTIG
        select V4L2_MEM2MEM_DEV
        select VIDEO_MEDIATEK_VPU

is the obvious fix.

Guenter

>
> On Fri, Oct 2, 2020 at 8:23 PM Nicolas Boichat <drinkcat@google.com> wr=
ote:
> >
> > +Alexandre Courbot +Fritz Koenig I guess that's related to your recentl=
y merged patches.
> >
> > On Fri, Oct 2, 2020, 18:45 kernel test robot <lkp@intel.com> wrote:
> >>
> >> tree:   https://chromium.googlesource.com/chromiumos/third_party/kerne=
l chromeos-5.4
> >> head:   1d3392f3ab6c29e5812a47f0a9c946cf0f6e03b8
> >> commit: 6c834e841e853771807acc664507158b9226102d [9/28] FROMGIT: media=
: mtk-vcodec: add SCP firmware ops
> >> config: i386-randconfig-a013-20201002 (attached as .config)
> >> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> >> reproduce (this is a W=3D1 build):
> >>         git remote add chrome-os https://chromium.googlesource.com/chr=
omiumos/third_party/kernel
> >>         git fetch --no-tags chrome-os chromeos-5.4
> >>         git checkout 6c834e841e853771807acc664507158b9226102d
> >>         # save the attached .config to linux build tree
> >>         make W=3D1 ARCH=3Di386
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_scp_ipi_send':
> >> >> mtk_vcodec_fw.c:(.text+0x92): undefined reference to `scp_ipi_send'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_scp_set_ipi_register':
> >> >> mtk_vcodec_fw.c:(.text+0xaf): undefined reference to `scp_ipi_regis=
ter'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_vpu_scp_dm_addr':
> >> >> mtk_vcodec_fw.c:(.text+0xcc): undefined reference to `scp_mapping_d=
m_addr'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_scp_get_venc_capa':
> >> >> mtk_vcodec_fw.c:(.text+0xec): undefined reference to `scp_get_venc_=
hw_capa'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_scp_get_vdec_capa':
> >> >> mtk_vcodec_fw.c:(.text+0x10c): undefined reference to `scp_get_vdec=
_hw_capa'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_scp_load_firmware':
> >> >> mtk_vcodec_fw.c:(.text+0x12c): undefined reference to `scp_get_rpro=
c'
> >> >> ld: mtk_vcodec_fw.c:(.text+0x131): undefined reference to `rproc_bo=
ot'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_fw_select':
> >> >> mtk_vcodec_fw.c:(.text+0x294): undefined reference to `scp_get'
> >>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function =
`mtk_vcodec_fw_release':
> >> >> mtk_vcodec_fw.c:(.text+0x2d7): undefined reference to `scp_put'
> >>
> >> ---
> >> 0-DAY CI Kernel Test Service, Intel Corporation
> >> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> >>
> >> --
> >> You received this message because you are subscribed to the Google Gro=
ups "cros-kernel-buildreports" group.
> >> To unsubscribe from this group and stop receiving emails from it, send=
 an email to cros-kernel-buildreports+unsubscribe(a)googlegroups.com.
> >> To view this discussion on the web visit https://groups.google.com/d/m=
sgid/cros-kernel-buildreports/202010021814.NapfEnyz-lkp%40intel.com.
--===============5913064531783405831==--

