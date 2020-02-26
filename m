Content-Type: multipart/mixed; boundary="===============6432638759261211101=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [andersson-kernel:linux-next/lt9611 3/4] drivers/gpu/drm/bridge/lt9611.c:1027:5: sparse: sparse: symbol 'lt9611_hdmi_hw_params' was not declared. Should it be static?
Date: Thu, 27 Feb 2020 06:17:08 +0800
Message-ID: <202002270624.muKmv8Au%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6432638759261211101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/andersson/kernel linux-next/lt9611
head:   43a4eead3110e00cd8fa224553a559f2501346f3
commit: 9e1731f0c9f26e60c1ad7204ca77e9741f9b88e4 [3/4] drm/bridge: lt9611: =
Add hdmi audio codec support
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 9e1731f0c9f26e60c1ad7204ca77e9741f9b88e4
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/bridge/lt9611.c:1027:5: sparse: sparse: symbol 'lt9611_h=
dmi_hw_params' was not declared. Should it be static?
>> drivers/gpu/drm/bridge/lt9611.c:1100:5: sparse: sparse: symbol 'lt9611_a=
udio_init' was not declared. Should it be static?
>> drivers/gpu/drm/bridge/lt9611.c:1111:6: sparse: sparse: symbol 'lt9611_a=
udio_exit' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6432638759261211101==--

