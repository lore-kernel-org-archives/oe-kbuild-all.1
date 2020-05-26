Content-Type: multipart/mixed; boundary="===============6743677656427752490=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [hch-block:blk-accounting-cleanup 1/16] include/linux/blkdev.h:1908:42: error: implicit declaration of function 'bio_sectors'
Date: Tue, 26 May 2020 17:40:20 +0800
Message-ID: <202005261718.2MXyRdmx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6743677656427752490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/hch/block.git blk-accounting-cleanup
head:   426c2d7f0c7434a57d66be949f1c20e87f8f94ac
commit: 6affa383c213074810553ceb6d97493a9404f09c [1/16] block: add disk/bio=
-based accounting helpers
config: x86_64-allnoconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3393cc=
4cebf9969db94dc424b7a2b6195589c33b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        git checkout 6affa383c213074810553ceb6d97493a9404f09c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

In file included from arch/x86/kernel/asm-offsets.c:13:
In file included from include/linux/suspend.h:5:
In file included from include/linux/swap.h:9:
In file included from include/linux/memcontrol.h:22:
In file included from include/linux/writeback.h:14:
In file included from include/linux/blk-cgroup.h:23:
>> include/linux/blkdev.h:1908:42: error: implicit declaration of function =
'bio_sectors' [-Werror,-Wimplicit-function-declaration]
return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bio));
^
1 error generated.
make[2]: *** [scripts/Makefile.build:100: arch/x86/kernel/asm-offsets.s] Er=
ror 1
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1141: prepare0] Error 2
make[1]: Target 'prepare' not remade because of errors.
make: *** [Makefile:180: sub-make] Error 2

vim +/bio_sectors +1908 include/linux/blkdev.h

  1894	=

  1895	unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int =
sectors,
  1896			unsigned int op);
  1897	void disk_end_io_acct(struct gendisk *disk, unsigned int op,
  1898			unsigned long start_time);
  1899	=

  1900	/**
  1901	 * bio_start_io_acct - start I/O accounting for bio based drivers
  1902	 * @bio:	bio to start account for
  1903	 *
  1904	 * Returns the start time that should be passed back to bio_end_io_a=
cct().
  1905	 */
  1906	static inline unsigned long bio_start_io_acct(struct bio *bio)
  1907	{
> 1908		return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bi=
o));
  1909	}
  1910	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6743677656427752490==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
T2oAAA==
--===============6743677656427752490==--

