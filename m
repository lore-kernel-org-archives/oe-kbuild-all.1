Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F03FAE13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356857; cv=none; b=IhPos7XFQ59h7IBP0XRfEbUPurPE0wnKF5ZoB5JIoVECjnGxYhGwskOk3R3Q2Bc6gHo/2N0Pw+M+Xje/yoA2vT+6SpqextX4WznZ4+vCAf1w4C37DdBfy/arrJMzl4YmnES4cFOsaBNJ2c3dv3XKeugrCVtoiYKgtqID5R5E0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356857; c=relaxed/simple;
	bh=pPnE6gIn8rrE2iaVo/GLfKgxUpVTpLw3GTb5Cayb9h0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kpsXhxsRHaC6fpQ54ysSZbE/sCusFLiQ4Qc5McL5PIIOToltax1uZHLeb+sylqaDgxZKZxsCrFgQhwE6hAt3nbPCFu8XbmrsIgATgLluTOhBMAJztjvdfNJlX4BDKPylJfS8cFrAJgbs11dBYFuDCzqu0HKD8UxntXU+YlODUt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJqKkYVm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJqKkYVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774356856; x=1805892856;
  h=date:from:to:cc:subject:message-id;
  bh=pPnE6gIn8rrE2iaVo/GLfKgxUpVTpLw3GTb5Cayb9h0=;
  b=CJqKkYVmqFC1qrUlyC7XCD9ps40sAotn1s/cHpvyXvLu+U58opyxiMWX
   vshgdcknsIxqPEkjeRGCRcZDChB3lPyQZaPaRmFJOnYqpjGEsRVZO1hnC
   FGWUZMBalSCW/eclPSE6EanFNCv+tKThqRV0MukZl/DoJ7Apyr/Bc4glo
   AT1FHpdMR41HqmadzUHRCffJxCd9non6/bh6TFfG/imIpioBbbuPbCwo9
   Arvu68d4uc7wkJEB4suYf6CqyUYu/tZw5p+ROtY1wk9F1/7nqcqMS0jFj
   DWbAMEYswxySrJYiNZ5TPtHkJMZXABckfqrCu1ZkkdvNC1Yj4uPG1rWUO
   g==;
X-CSE-ConnectionGUID: f/1JKYHrRRGzyXvKQPepsQ==
X-CSE-MsgGUID: 9Git0v1ZQayuX4Otb6/Deg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="77973670"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="77973670"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:54:12 -0700
X-CSE-ConnectionGUID: Terk5FmLQJuw1rw6ShcA3Q==
X-CSE-MsgGUID: qEewLT06TdqJx43VP2Lv2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247423198"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 05:54:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w51Gq-000000004ZL-05qz;
	Tue, 24 Mar 2026 12:54:08 +0000
Date: Tue, 24 Mar 2026 20:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/block/zram/zram_drv.c:1122:7: error: call to undeclared function
 'zram_can_store_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202603242022.PGRPzjPA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3ec022196c4e9d5c1434599cdda63f622dd6f586
commit: 487e818b8c0f11de2d03896c8cb09695003a2f59 [0/1] ANDROID: zram: Fix build issue with zram_can_store_pages w/o CONFIG_ZRAM_ANDROID_IOCTL
config: x86_64-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242022.PGRPzjPA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242022.PGRPzjPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603242022.PGRPzjPA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/zram/zram_drv.c:1122:7: error: call to undeclared function 'zram_can_store_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1122 |         if (!zram_can_store_page(zram)) {
         |              ^
   1 error generated.


vim +/zram_can_store_page +1122 drivers/block/zram/zram_drv.c

ed6a4b978dbd71 Richard Chang 2026-02-19  1091  
160a4092db6739 Richard Chang 2026-03-13  1092  static int zram_populate_table(struct zram *zram, struct page *page, u32 index)
160a4092db6739 Richard Chang 2026-03-13  1093  {
160a4092db6739 Richard Chang 2026-03-13  1094  	unsigned long handle;
160a4092db6739 Richard Chang 2026-03-13  1095  	void *src, *dst;
160a4092db6739 Richard Chang 2026-03-13  1096  	u32 size;
ed6a4b978dbd71 Richard Chang 2026-02-19  1097  	int err;
ed6a4b978dbd71 Richard Chang 2026-02-19  1098  	unsigned long blk_idx;
160a4092db6739 Richard Chang 2026-03-13  1099  
160a4092db6739 Richard Chang 2026-03-13  1100  	zram_slot_lock(zram, index);
160a4092db6739 Richard Chang 2026-03-13  1101  	/*
160a4092db6739 Richard Chang 2026-03-13  1102  	 * We release slot lock during zram_prefetch_slots, so slot can be
160a4092db6739 Richard Chang 2026-03-13  1103  	 * changed via slot_free(). To avoid the race, we need to check ZRAM_WB
160a4092db6739 Richard Chang 2026-03-13  1104  	 * again.
160a4092db6739 Richard Chang 2026-03-13  1105  	 */
160a4092db6739 Richard Chang 2026-03-13  1106  	if (!zram_test_flag(zram, index, ZRAM_WB)) {
160a4092db6739 Richard Chang 2026-03-13  1107  		zram_slot_unlock(zram, index);
160a4092db6739 Richard Chang 2026-03-13  1108  		return -EIO;
160a4092db6739 Richard Chang 2026-03-13  1109  	}
160a4092db6739 Richard Chang 2026-03-13  1110  
160a4092db6739 Richard Chang 2026-03-13  1111  	size = zram_get_obj_size(zram, index);
ed6a4b978dbd71 Richard Chang 2026-02-19  1112  	blk_idx = zram_get_handle(zram, index);
160a4092db6739 Richard Chang 2026-03-13  1113  
160a4092db6739 Richard Chang 2026-03-13  1114  	handle = zs_malloc(zram->mem_pool, size,
160a4092db6739 Richard Chang 2026-03-13  1115  			   GFP_NOWAIT | __GFP_HIGHMEM |
160a4092db6739 Richard Chang 2026-03-13  1116  			   __GFP_MOVABLE | __GFP_CMA);
160a4092db6739 Richard Chang 2026-03-13  1117  	if (IS_ERR_VALUE(handle)) {
160a4092db6739 Richard Chang 2026-03-13  1118  		zram_slot_unlock(zram, index);
160a4092db6739 Richard Chang 2026-03-13  1119  		return PTR_ERR((void *)handle);
160a4092db6739 Richard Chang 2026-03-13  1120  	}
160a4092db6739 Richard Chang 2026-03-13  1121  
160a4092db6739 Richard Chang 2026-03-13 @1122  	if (!zram_can_store_page(zram)) {
160a4092db6739 Richard Chang 2026-03-13  1123  		zram_slot_unlock(zram, index);
160a4092db6739 Richard Chang 2026-03-13  1124  		zs_free(zram->mem_pool, handle);
160a4092db6739 Richard Chang 2026-03-13  1125  		return -ENOMEM;
160a4092db6739 Richard Chang 2026-03-13  1126  	}
160a4092db6739 Richard Chang 2026-03-13  1127  
160a4092db6739 Richard Chang 2026-03-13  1128  	src = kmap_local_page(page);
160a4092db6739 Richard Chang 2026-03-13  1129  	dst = zs_map_object(zram->mem_pool, handle, ZS_MM_WO);
160a4092db6739 Richard Chang 2026-03-13  1130  	memcpy(dst, src, size);
160a4092db6739 Richard Chang 2026-03-13  1131  	zs_unmap_object(zram->mem_pool, handle);
160a4092db6739 Richard Chang 2026-03-13  1132  	kunmap_local(src);
160a4092db6739 Richard Chang 2026-03-13  1133  
ed6a4b978dbd71 Richard Chang 2026-02-19  1134  	/*
ed6a4b978dbd71 Richard Chang 2026-02-19  1135  	 * Retain blk_idx here and defer its release until
ed6a4b978dbd71 Richard Chang 2026-02-19  1136  	 * swap_slot_free_notify is triggered.
ed6a4b978dbd71 Richard Chang 2026-02-19  1137  	 */
ed6a4b978dbd71 Richard Chang 2026-02-19  1138  	err = zram_prefetch_cache_store(zram, index, blk_idx);
ed6a4b978dbd71 Richard Chang 2026-02-19  1139  	if (err < 0) {
ed6a4b978dbd71 Richard Chang 2026-02-19  1140  		zram_slot_unlock(zram, index);
ed6a4b978dbd71 Richard Chang 2026-02-19  1141  		zs_free(zram->mem_pool, handle);
ed6a4b978dbd71 Richard Chang 2026-02-19  1142  		return err;
ed6a4b978dbd71 Richard Chang 2026-02-19  1143  	} else if (err == 0) {
ed6a4b978dbd71 Richard Chang 2026-02-19  1144  		zram_release_bdev_block(zram, blk_idx);
ed6a4b978dbd71 Richard Chang 2026-02-19  1145  	}
ed6a4b978dbd71 Richard Chang 2026-02-19  1146  
160a4092db6739 Richard Chang 2026-03-13  1147  	zram_clear_flag(zram, index, ZRAM_WB);
160a4092db6739 Richard Chang 2026-03-13  1148  	zram_set_handle(zram, index, handle);
160a4092db6739 Richard Chang 2026-03-13  1149  	atomic64_add(size, &zram->stats.compr_data_size);
160a4092db6739 Richard Chang 2026-03-13  1150  	if (zram_test_flag(zram, index, ZRAM_HUGE))
160a4092db6739 Richard Chang 2026-03-13  1151  		atomic64_inc(&zram->stats.huge_pages);
160a4092db6739 Richard Chang 2026-03-13  1152  	zram_slot_unlock(zram, index);
160a4092db6739 Richard Chang 2026-03-13  1153  
160a4092db6739 Richard Chang 2026-03-13  1154  	return 0;
160a4092db6739 Richard Chang 2026-03-13  1155  }
160a4092db6739 Richard Chang 2026-03-13  1156  

:::::: The code at line 1122 was first introduced by commit
:::::: 160a4092db67397d85b790f102f375ae0e045257 ANDROID: zram: Add ZRAM_ANDROID_IOC_PROCESS_PREFETCH ioctl

:::::: TO: Richard Chang <richardycc@google.com>
:::::: CC: Richard Chang <richardycc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
