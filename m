Content-Type: multipart/mixed; boundary="===============8211802165848319485=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/1] i2c: Add i2c-pseudo driver for userspace I2C adapters.
Date: Sat, 09 May 2020 09:43:30 +0800
Message-ID: <202005090940.DjgfwRg4%lkp@intel.com>
In-Reply-To: <20200507230513.246804-2-matthewb@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8211802165848319485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Matthew-Blecker/i2c-Add-i2=
c-pseudo-driver-for-userspace-I2C-adapters/20200509-011221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/i2c/i2c-pseudo.c:2897:8-15: WARNING opportunity for memdup_user
--
>> drivers/i2c/i2c-pseudo.c:2206:1-17: ERROR: i2cp_fileops: .read() can dea=
dlock .write(); change nonseekable_open -> stream_open to fix.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8211802165848319485==--

