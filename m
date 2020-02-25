Content-Type: multipart/mixed; boundary="===============1609210544192477821=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-4.19 3/3] drivers/gpu/drm/drm_trace.c:239:11-34: WARNING opportunity for simple_open, see also structure on line 287
Date: Tue, 25 Feb 2020 15:10:55 +0800
Message-ID: <202002251551.qjzzThFM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1609210544192477821==
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
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1609210544192477821==--

