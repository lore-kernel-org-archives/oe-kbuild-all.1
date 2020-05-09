Content-Type: multipart/mixed; boundary="===============5294228376959371475=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/5] blktrace: fix debugfs use after free
Date: Sat, 09 May 2020 16:01:44 +0800
Message-ID: <202005091525.sYzumFwT%lkp@intel.com>
In-Reply-To: <20200509031058.8239-4-mcgrof@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5294228376959371475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Luis,

I love your patch! Yet something to improve:

[auto build test ERROR on block/for-next]
[also build test ERROR on next-20200508]
[cannot apply to mkp-scsi/for-next scsi/for-next linus/master v5.7-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Luis-Chamberlain/block-fix=
-blktrace-debugfs-use-after-free/20200509-140139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
config: parisc-allnoconfig (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dparisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/char/random.o: in function `blk_queue_debugfs_sym=
link':
>> (.text+0x1130): multiple definition of `blk_queue_debugfs_symlink'; init=
/do_mounts.o:(.text+0x1c): first defined here
   hppa-linux-ld: drivers/base/core.o: in function `blk_queue_debugfs_symli=
nk':
   (.text+0xc18): multiple definition of `blk_queue_debugfs_symlink'; init/=
do_mounts.o:(.text+0x1c): first defined here
   hppa-linux-ld: drivers/base/class.o: in function `blk_queue_debugfs_syml=
ink':
   (.text+0xf8): multiple definition of `blk_queue_debugfs_symlink'; init/d=
o_mounts.o:(.text+0x1c): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5294228376959371475==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5294228376959371475==--

