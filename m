Content-Type: multipart/mixed; boundary="===============1360282475574389328=="
MIME-Version: 1.0
From: Alexandre Courbot <acourbot@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [chrome-os:chromeos-5.4 9/28] mtk_vcodec_fw.c:undefined reference to `scp_ipi_send'
Date: Fri, 02 Oct 2020 21:47:05 +0900
Message-ID: <CAPBb6MWvsuRcG9tSU-Ggiw4JAJNKantD5uG3uKYFc=YUVvEMVA@mail.gmail.com>
In-Reply-To: <CAHRZCZXGiOExCxeuAfXHxfB5vaeyy6Dww9G0cCOFgoFsGT1MDQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1360282475574389328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, and the problem has also been raised upstream. :/ Looking for the
right fix.

On Fri, Oct 2, 2020 at 8:23 PM Nicolas Boichat <drinkcat@google.com> wrot=
e:
>
> +Alexandre Courbot +Fritz Koenig I guess that's related to your recently =
merged patches.
>
> On Fri, Oct 2, 2020, 18:45 kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel =
chromeos-5.4
>> head:   1d3392f3ab6c29e5812a47f0a9c946cf0f6e03b8
>> commit: 6c834e841e853771807acc664507158b9226102d [9/28] FROMGIT: media: =
mtk-vcodec: add SCP firmware ops
>> config: i386-randconfig-a013-20201002 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce (this is a W=3D1 build):
>>         git remote add chrome-os https://chromium.googlesource.com/chrom=
iumos/third_party/kernel
>>         git fetch --no-tags chrome-os chromeos-5.4
>>         git checkout 6c834e841e853771807acc664507158b9226102d
>>         # save the attached .config to linux build tree
>>         make W=3D1 ARCH=3Di386
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_scp_ipi_send':
>> >> mtk_vcodec_fw.c:(.text+0x92): undefined reference to `scp_ipi_send'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_scp_set_ipi_register':
>> >> mtk_vcodec_fw.c:(.text+0xaf): undefined reference to `scp_ipi_registe=
r'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_vpu_scp_dm_addr':
>> >> mtk_vcodec_fw.c:(.text+0xcc): undefined reference to `scp_mapping_dm_=
addr'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_scp_get_venc_capa':
>> >> mtk_vcodec_fw.c:(.text+0xec): undefined reference to `scp_get_venc_hw=
_capa'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_scp_get_vdec_capa':
>> >> mtk_vcodec_fw.c:(.text+0x10c): undefined reference to `scp_get_vdec_h=
w_capa'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_scp_load_firmware':
>> >> mtk_vcodec_fw.c:(.text+0x12c): undefined reference to `scp_get_rproc'
>> >> ld: mtk_vcodec_fw.c:(.text+0x131): undefined reference to `rproc_boot'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_fw_select':
>> >> mtk_vcodec_fw.c:(.text+0x294): undefined reference to `scp_get'
>>    ld: drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.o: in function `m=
tk_vcodec_fw_release':
>> >> mtk_vcodec_fw.c:(.text+0x2d7): undefined reference to `scp_put'
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "cros-kernel-buildreports" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to cros-kernel-buildreports+unsubscribe(a)googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msg=
id/cros-kernel-buildreports/202010021814.NapfEnyz-lkp%40intel.com.
--===============1360282475574389328==--

