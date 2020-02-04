Content-Type: multipart/mixed; boundary="===============0584158968488438554=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-4.19 3/3] drivers/gpu/drm/drm_trace.c:239:11-34: WARNING opportunity for simple_open, see also structure on line 287
Date: Wed, 05 Feb 2020 03:57:02 +0800
Message-ID: <202002050358.o4FjzItX%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0584158968488438554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.19
head:   2ef86936fa7b9f135fa6f7a08db0427701107c47
commit: 2ef86936fa7b9f135fa6f7a08db0427701107c47 [3/3] CHROMIUM: drm: Make =
the drm_trace size configurable

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_trace.c:239:11-34: WARNING opportunity for simple_op=
en, see also structure on line 287

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============0584158968488438554==--

