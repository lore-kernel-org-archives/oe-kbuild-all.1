Content-Type: multipart/mixed; boundary="===============8467162161048784077=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 3/5] blktrace: fix debugfs use after free
Date: Sat, 09 May 2020 15:46:54 +0800
Message-ID: <202005091523.XKblXg5n%lkp@intel.com>
In-Reply-To: <20200509031058.8239-4-mcgrof@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8467162161048784077==
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
config: um-allnoconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/char/random.o: in function `blk_queue_debugfs_symlink':
>> random.c:(.text+0x10f0): multiple definition of `blk_queue_debugfs_symli=
nk'; init/do_mounts.o:do_mounts.c:(.text+0x10): first defined here
   ld: drivers/base/core.o: in function `blk_queue_debugfs_symlink':
   core.c:(.text+0x800): multiple definition of `blk_queue_debugfs_symlink'=
; init/do_mounts.o:do_mounts.c:(.text+0x10): first defined here
   ld: drivers/base/class.o: in function `blk_queue_debugfs_symlink':
   class.c:(.text+0xd0): multiple definition of `blk_queue_debugfs_symlink'=
; init/do_mounts.o:do_mounts.c:(.text+0x10): first defined here

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8467162161048784077==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8467162161048784077==--

