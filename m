Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2461ADCC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690906176; x=1722442176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpbeiMW1haUpo8QTTHn/ZV9DdlpORD52MMmpGXK1SI4=;
  b=lmQRxTTmPbJjeDUF+TdIv8q1LzqTbOqYCbSwVgI9JSk1eE2qwJbruUBx
   B5M6khGsbfg2+QbWFdVni4DoWKLsPGvd8zgbXLqlwvH6FDpAuNRx1AU9J
   D5Au/Zs6cAP0Iilkx0Qik17C7KCtm18amvzlT7/JIuFIkqV7hyR9cIxZ5
   QtnnmB6WqD+tpWooEUwDplnZWD47NsyMPqmSbXakf3iVP9urIEle5QZZE
   OVNKB4OiqKqEr4Dt2MJ2iOy5u+3XmdkqGcdZ1Ih8KRFddGi8qtzzIrvmg
   27vRgnev1nNfvLsMpQKXqe4F1HSW1su0R80eophnsQzT3mKCNLBmMerIk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455713777"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="455713777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 09:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="722524362"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="722524362"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Aug 2023 09:09:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQrw4-0000Q7-37;
	Tue, 01 Aug 2023 16:09:24 +0000
Date: Wed, 2 Aug 2023 00:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 368/9999] futex.c:undefined reference to
 `atomic64_read_386'
Message-ID: <202308020014.cTK0KMYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: e6d506cd2243aa8f6e19fdb4dc61d85275c2c918 [368/9999] futex: Fix inode life-time issue
config: um-randconfig-r014-20230801 (https://download.01.org/0day-ci/archive/20230802/202308020014.cTK0KMYs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020014.cTK0KMYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020014.cTK0KMYs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: lib/lib-ksyms.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: lib/lib-ksyms.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: kernel/sched/fair.o: in function `update_curr.constprop.0':
   fair.c:(.text+0x4d7): undefined reference to `atomic64_add_386'
   /usr/bin/ld: kernel/futex.o: in function `get_inode_sequence_number':
>> futex.c:(.text+0xc6): undefined reference to `atomic64_read_386'
>> /usr/bin/ld: futex.c:(.text+0xf1): undefined reference to `atomic64_add_return_386'
>> /usr/bin/ld: futex.c:(.text+0x11a): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/inode.o: in function `inode_init_always':
   inode.c:(.text+0x21e): undefined reference to `atomic64_set_386'
   /usr/bin/ld: fs/inode.o: in function `generic_update_time':
   inode.c:(.text+0xa5c): undefined reference to `atomic64_read_386'
   /usr/bin/ld: inode.c:(.text+0xaaa): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/inode.o: in function `file_update_time':
   inode.c:(.text+0xdcf): undefined reference to `atomic64_read_386'
   /usr/bin/ld: fs/namespace.o: in function `alloc_mnt_ns':
   namespace.c:(.text+0x14f): undefined reference to `atomic64_add_return_386'
   /usr/bin/ld: fs/ext4/mballoc.o: in function `ext4_mb_mark_diskspace_used':
   mballoc.c:(.text+0x4de6): undefined reference to `atomic64_sub_386'
   /usr/bin/ld: fs/ext4/mballoc.o: in function `ext4_free_blocks':
   mballoc.c:(.text+0x62dc): undefined reference to `atomic64_add_386'
   /usr/bin/ld: fs/ext4/mballoc.o: in function `ext4_group_add_blocks':
   mballoc.c:(.text+0x6b1c): undefined reference to `atomic64_add_386'
   /usr/bin/ld: fs/ext4/super.o: in function `ext4_alloc_inode':
   super.c:(.text+0xff0): undefined reference to `atomic64_set_386'
   /usr/bin/ld: fs/ext4/super.o: in function `ext4_statfs':
   super.c:(.text+0x156e): undefined reference to `atomic64_read_386'
   /usr/bin/ld: fs/ext4/super.o: in function `ext4_fill_super':
   super.c:(.text+0x7273): undefined reference to `atomic64_set_386'
   /usr/bin/ld: super.c:(.text+0x7454): undefined reference to `atomic64_add_386'
   /usr/bin/ld: fs/ext4/sysfs.o: in function `ext4_attr_store':
   sysfs.c:(.text+0xf8): undefined reference to `atomic64_set_386'
   /usr/bin/ld: fs/ext4/sysfs.o: in function `ext4_attr_show':
   sysfs.c:(.text+0x2ba): undefined reference to `atomic64_read_386'
   /usr/bin/ld: fs/fat/inode.o: in function `fat_read_root':
   inode.c:(.text+0x1250): undefined reference to `atomic64_read_386'
   /usr/bin/ld: inode.c:(.text+0x1286): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/inode.o: in function `fat_fill_super':
   inode.c:(.text+0x1a78): undefined reference to `atomic64_set_386'
   /usr/bin/ld: fs/fat/inode.o: in function `fat_fill_inode':
   inode.c:(.text+0x211d): undefined reference to `atomic64_read_386'
   /usr/bin/ld: inode.c:(.text+0x2153): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/inode.o: in function `fat_build_inode':
   inode.c:(.text+0x2530): undefined reference to `atomic64_set_386'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_revalidate_shortname':
   namei_vfat.c:(.text+0x14): undefined reference to `atomic64_read_386'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_rename':
   namei_vfat.c:(.text+0xf10): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0xf58): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: namei_vfat.c:(.text+0x1000): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x10ea): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_rmdir':
   namei_vfat.c:(.text+0x1398): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x13d6): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_unlink':
   namei_vfat.c:(.text+0x14d2): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x1510): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_mkdir':
   namei_vfat.c:(.text+0x160f): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x163f): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: namei_vfat.c:(.text+0x1699): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x16c6): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_create':
   namei_vfat.c:(.text+0x17c2): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x17ef): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: namei_vfat.c:(.text+0x183e): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x186b): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/fat/namei_vfat.o: in function `vfat_lookup':
   namei_vfat.c:(.text+0x19d0): undefined reference to `atomic64_read_386'
   /usr/bin/ld: namei_vfat.c:(.text+0x19f5): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: fs/f2fs/extent_cache.o: in function `f2fs_lookup_extent_tree':
   extent_cache.c:(.text+0x1e4): undefined reference to `atomic64_inc_386'
   /usr/bin/ld: extent_cache.c:(.text+0x224): undefined reference to `atomic64_inc_386'
   /usr/bin/ld: extent_cache.c:(.text+0x299): undefined reference to `atomic64_inc_386'
   /usr/bin/ld: fs/f2fs/debug.o: in function `update_general_status':
   debug.c:(.text+0x13): undefined reference to `atomic64_read_386'
   /usr/bin/ld: debug.c:(.text+0x24): undefined reference to `atomic64_read_386'
   /usr/bin/ld: debug.c:(.text+0x35): undefined reference to `atomic64_read_386'
   /usr/bin/ld: debug.c:(.text+0x5c): undefined reference to `atomic64_read_386'
   /usr/bin/ld: fs/f2fs/debug.o: in function `f2fs_build_stats':
   debug.c:(.text+0x1206): undefined reference to `atomic64_set_386'
   /usr/bin/ld: debug.c:(.text+0x1211): undefined reference to `atomic64_set_386'
   /usr/bin/ld: debug.c:(.text+0x121c): undefined reference to `atomic64_set_386'
   /usr/bin/ld: debug.c:(.text+0x1227): undefined reference to `atomic64_set_386'
   /usr/bin/ld: lib/atomic64_test.o: in function `test_atomic64':
   atomic64_test.c:(.init.text+0x1dae): undefined reference to `atomic64_set_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1dea): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1e2d): undefined reference to `atomic64_set_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1e3e): undefined reference to `atomic64_add_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1e45): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1e5b): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1e8f): undefined reference to `atomic64_set_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1e9b): undefined reference to `atomic64_add_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1ea2): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1eb8): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1eec): undefined reference to `atomic64_set_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1efd): undefined reference to `atomic64_sub_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1f04): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1f1a): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1f4e): undefined reference to `atomic64_set_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1f5a): undefined reference to `atomic64_sub_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1f61): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1f77): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1fab): undefined reference to `atomic64_set_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x1fdf): undefined reference to `cmpxchg8b_emu'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x2000): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x2016): undefined reference to `atomic64_read_386'
   /usr/bin/ld: atomic64_test.c:(.init.text+0x204a): undefined reference to `atomic64_set_386'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
