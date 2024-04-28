Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F2AD5D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 21:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714340515; cv=none; b=AUdzEUmClryLYebEdZ4TuxewN7uFDGO7uPOvN6JDTNkbmDpiiZULspU95wEmP01xY7C5EvKc6ub0rzDyuR0mYHtEWiO4vDpk1LafD9U78r/x5UAwYTuqBIwEmdh+kKiqQ8rqAAecHH5aW1s9secpeTeigJv1lUaBgnhyUtEMT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714340515; c=relaxed/simple;
	bh=1fOn/wQQOinF2nzqDMpP0fWE4xtQ5ydUo22GvfCp0VA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fi4aCiO9oelWAlqo8U4VmnzcBc2ejoMWtphYcl2Xjb160N5oktIbHXmT9/DS7SpzWijcYGtc0UrqZAEZm9xTuO3Lzfn+5O/tc74TicJAxoFHEDQBYvYdiJgEz2uG++V6vey6vkc4rwvRqwq45yU6JGcRTIdbydMs/jXH/SISKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSztrjXy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSztrjXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714340514; x=1745876514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1fOn/wQQOinF2nzqDMpP0fWE4xtQ5ydUo22GvfCp0VA=;
  b=OSztrjXyTuxh3H2CuD0E2Un/Ojb83TeEwneQ2R2LCvwlHQKUazlRC9wL
   W4iunr20zWOZUdSTvU9iyQqmrnfvVnHqzT4enGulUd6op1ef36qyn9x2f
   62YEG9t2Rtwsdc/zAPNVmNaCTB2tkcCOq4XqRDwrEOLM1ikNzKNGtg6T3
   c2el0IIALEIywS7+RtxAbTjziKkxRkTvXH5xEQGYnMWfHDNjBRS22v7Ia
   tAV1eZZ5kMGHF3JDxwvo8bkNxnSGMeT54OCU9KyenWop5edLy2osmzSb0
   vLoAkirekm7c8cD/32gYYaOGRSN5fCs0MA1j/4ffbOEGRQZbd8OdMe7FF
   w==;
X-CSE-ConnectionGUID: Mt3X9yOgRqe76zy+Pe8uYA==
X-CSE-MsgGUID: VsNjwcAXTiSolyMBl6aSTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21406403"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="21406403"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 14:41:53 -0700
X-CSE-ConnectionGUID: lG6h8NT5T7yZ50PEVP5m5A==
X-CSE-MsgGUID: NCrZH/UKSnO+w8PFd4mHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; 
   d="scan'208";a="26441180"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Apr 2024 14:41:51 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1CHM-0006l8-1L;
	Sun, 28 Apr 2024 21:41:48 +0000
Date: Mon, 29 Apr 2024 05:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8878/8890]
 include/asm-generic/io.h:1184:(.text+0x2c36): dangerous relocation: windowed
 longcall crosses 1GB boundary; return may fail: (.xiptext+0x14c8)
Message-ID: <202404290508.KXWwv1Xb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb7a2467e6beef44a80a17d45ebf2931e7631083
commit: f2542a582d5a5d11b801373c5beba08e64daee4c [8878/8890] Merge branch 'zstd-next' of https://github.com/terrelln/linux.git
config: xtensa-randconfig-r032-20211011 (https://download.01.org/0day-ci/archive/20240429/202404290508.KXWwv1Xb-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404290508.KXWwv1Xb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404290508.KXWwv1Xb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_util.o:drivers/mtd/chips/cfi_util.c:287:(.xiptext+0x16): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_off':
   drivers/mtd/chips/cfi_util.c:288:(.xiptext+0x2e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:289:(.xiptext+0x44): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:293:(.xiptext+0x82): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:221:(.xiptext+0xca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:221:(.xiptext+0xde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0xee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.c:226:(.xiptext+0xfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   include/asm-generic/io.h:133:(.xiptext+0x1ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x10)
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_present':
   drivers/mtd/chips/cfi_util.c:244:(.xiptext+0x246): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x25e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:249:(.xiptext+0x273): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.o: in function `cfi_qry_mode_on':
   drivers/mtd/chips/cfi_util.c:250:(.xiptext+0x2a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:251:(.xiptext+0x2b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:252:(.xiptext+0x2cf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:257:(.xiptext+0x308): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:258:(.xiptext+0x31e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:259:(.xiptext+0x34e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:263:(.xiptext+0x364): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:264:(.xiptext+0x37a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:267:(.xiptext+0x390): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:269:(.xiptext+0x3c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:270:(.xiptext+0x3d6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x3ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:271:(.xiptext+0x402): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_util.c:278:(.xiptext+0x45e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_util.c:282:(.xiptext+0x496): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_util.c:299:(.xiptext+0x4aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   drivers/mtd/chips/cfi_util.c:309:(.xiptext+0x4ea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_util.c:312:(.xiptext+0x526): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4fc)
   drivers/mtd/chips/cfi_util.o: in function `cfi_read_pri':
   include/linux/mtd/cfi.h:313:(.xiptext+0x5ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4fc)
   include/linux/mtd/cfi.h:319:(.xiptext+0x5c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0020.o: in function `cfi_staa_setup':
   drivers/mtd/chips/cfi_cmdset_0020.c:241:(.text+0x88f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `kmalloc_array_noprof':
   include/linux/slab.h:695:(.text+0x4fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `fwh_xxlock_oneblock':
   drivers/mtd/chips/fwh_lock.h:77:(.text+0x2a0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x14c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_read':
   drivers/mtd/chips/cfi_cmdset_0001.c:1556:(.text+0x2b37): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x14c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_read':
>> include/asm-generic/io.h:1184:(.text+0x2c36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x14c8)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_destroy':
   drivers/mtd/chips/cfi_cmdset_0001.c:2687:(.text+0x316a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1988)
   drivers/mtd/chips/cfi_cmdset_0001.o:drivers/mtd/chips/cfi_cmdset_0001.c:1134:(.xiptext+0x2a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1136:(.xiptext+0x4b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   include/asm-generic/io.h:168:(.xiptext+0xae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x60)
   include/asm-generic/io.h:133:(.xiptext+0x126): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   include/linux/mtd/map.h:397:(.xiptext+0x12c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0001.c:1143:(.xiptext+0x14a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   include/linux/mtd/map.h:395:(.xiptext+0x1c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   include/linux/mtd/map.h:398:(.xiptext+0x1de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:415:(.xiptext+0x242): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x60)
   include/linux/mtd/map.h:395:(.xiptext+0x2e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_getlockstatus_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0x37e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:2104:(.xiptext+0x39c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1170:(.xiptext+0x447): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1176:(.xiptext+0x4c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/linux/mtd/map.h:394:(.xiptext+0x67f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/asm-generic/io.h:133:(.xiptext+0x6e2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/asm-generic/io.h:133:(.xiptext+0x706): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1215:(.xiptext+0x78c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/linux/mtd/map.h:415:(.xiptext+0x85a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   include/linux/mtd/map.h:415:(.xiptext+0x866): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   include/linux/mtd/map.h:417:(.xiptext+0x87b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   include/linux/mtd/map.h:417:(.xiptext+0x881): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   include/linux/mtd/map.h:417:(.xiptext+0x88b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/asm-generic/io.h:133:(.xiptext+0x8e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/linux/mtd/map.h:397:(.xiptext+0x8eb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   include/linux/mtd/map.h:397:(.xiptext+0x8f1): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1224:(.xiptext+0x8fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0001.c:1237:(.xiptext+0x906): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1236:(.xiptext+0x92f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.c:1246:(.xiptext+0x956): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1246:(.xiptext+0x9d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   include/linux/mtd/map.h:418:(.xiptext+0xa4a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x60)
   include/linux/mtd/map.h:417:(.xiptext+0xade): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   include/linux/mtd/map.h:397:(.xiptext+0xb6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `xip_wait_for_operation':
   drivers/mtd/chips/cfi_cmdset_0001.c:1263:(.xiptext+0xb88): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:1264:(.xiptext+0xb97): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x21e4)
   drivers/mtd/chips/cfi_cmdset_0001.c:1266:(.xiptext+0xbae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:2123:(.xiptext+0xc3b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2131:(.xiptext+0xc56): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.c:2131:(.xiptext+0xc6e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   include/linux/mtd/map.h:393:(.xiptext+0xcde): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:413:(.xiptext+0xd5e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:415:(.xiptext+0xd83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   include/asm-generic/io.h:159:(.xiptext+0xd8c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: panic
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   include/linux/mtd/map.h:413:(.xiptext+0xde7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x60)
   include/linux/mtd/map.h:417:(.xiptext+0xe28): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2145:(.xiptext+0xe36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1334)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   include/linux/mtd/map.h:413:(.xiptext+0xe4e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   include/linux/mtd/map.h:415:(.xiptext+0xe8e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1954)
   include/linux/mtd/map.h:415:(.xiptext+0xe96): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_xxlock_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2165:(.xiptext+0xeee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0001.c:2167:(.xiptext+0xf0e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0001.c:2167:(.xiptext+0xf1c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x21e4)
   drivers/mtd/chips/cfi_cmdset_0001.c:2170:(.xiptext+0xf36): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0xfee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x1003): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1954:(.xiptext+0x1066): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1970:(.xiptext+0x10c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1129:(.xiptext+0x115c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.c:1975:(.xiptext+0x116a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1334)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   include/asm-generic/io.h:151:(.xiptext+0x1182): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   include/linux/mtd/map.h:415:(.xiptext+0x119c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   include/linux/mtd/map.h:416:(.xiptext+0x1257): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x3c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   include/asm-generic/io.h:160:(.xiptext+0x1263): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   include/linux/mtd/map.h:427:(.xiptext+0x1284): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_merge_status
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0001.c:1980:(.xiptext+0x1292): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':
   include/linux/mtd/map.h:414:(.xiptext+0x1314): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_erase_oneblock':


vim +1184 include/asm-generic/io.h

cd24834130ac65 Jan Glauber     2012-11-29  1169  
cd24834130ac65 Jan Glauber     2012-11-29  1170  #ifndef memcpy_fromio
9216efafc52ff9 Thierry Reding  2014-10-01  1171  #define memcpy_fromio memcpy_fromio
c2327da06b33d8 Andy Shevchenko 2017-06-30  1172  /**
c2327da06b33d8 Andy Shevchenko 2017-06-30  1173   * memcpy_fromio	Copy a block of data from I/O memory
c2327da06b33d8 Andy Shevchenko 2017-06-30  1174   * @dst:		The (RAM) destination for the copy
c2327da06b33d8 Andy Shevchenko 2017-06-30  1175   * @src:		The (I/O memory) source for the data
c2327da06b33d8 Andy Shevchenko 2017-06-30  1176   * @count:		The number of bytes to copy
c2327da06b33d8 Andy Shevchenko 2017-06-30  1177   *
c2327da06b33d8 Andy Shevchenko 2017-06-30  1178   * Copy a block of data from I/O memory.
c2327da06b33d8 Andy Shevchenko 2017-06-30  1179   */
9216efafc52ff9 Thierry Reding  2014-10-01  1180  static inline void memcpy_fromio(void *buffer,
9216efafc52ff9 Thierry Reding  2014-10-01  1181  				 const volatile void __iomem *addr,
9216efafc52ff9 Thierry Reding  2014-10-01  1182  				 size_t size)
9216efafc52ff9 Thierry Reding  2014-10-01  1183  {
9216efafc52ff9 Thierry Reding  2014-10-01 @1184  	memcpy(buffer, __io_virt(addr), size);
9216efafc52ff9 Thierry Reding  2014-10-01  1185  }
cd24834130ac65 Jan Glauber     2012-11-29  1186  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  1187  

:::::: The code at line 1184 was first introduced by commit
:::::: 9216efafc52ff99e9351ef60de5fcafc2bc8adb6 asm-generic/io.h: Reconcile I/O accessor overrides

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
