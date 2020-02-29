Content-Type: multipart/mixed; boundary="===============0715473528851416637=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-5.4 60/62] drivers/extcon/extcon-tcss-cros-ec.c:273:4: sparse: sparse: symbol 'cros_ec_tcss_get_next_state_req' was not declared. Should it be static?
Date: Sun, 01 Mar 2020 05:18:17 +0800
Message-ID: <202003010523.MkhFG3C4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0715473528851416637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   d15a9eadc537a0796ee46b6c2831acb4f69be98c
commit: 562267b91e8a1ed80e5b312a214afd401b14dcc0 [60/62] CHROMIUM: extcon: =
Perform initial Type-C port and cable detection
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-173-ge0787745-dirty
        git checkout 562267b91e8a1ed80e5b312a214afd401b14dcc0
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/extcon/extcon-tcss-cros-ec.c:273:4: sparse: sparse: symbol 'cros=
_ec_tcss_get_next_state_req' was not declared. Should it be static?
>> drivers/extcon/extcon-tcss-cros-ec.c:426:5: sparse: sparse: symbol 'cros=
_ec_tcss_detect_cable' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0715473528851416637==--

