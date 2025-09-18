Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5442F9DB2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 09:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187472; cv=none; b=r5dr51uGqJ8Kz65+RN4AOnWUFPvJP/6fEGRPf/QvUncV9NYKT622QF9bxuZjTeJNyqZaWBSij+mH0Ymj5t8p8GbM+TixxNedt8DjfAyj9rVA7HHTnxmwv9eWSYRyLeQRdgddRs3gSe3yKKtyO9t0BE6DGmsSdCsWToSevDn3LIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187472; c=relaxed/simple;
	bh=fe3MESOP7aMUflwUPlHBb2xtJAfsatsOjGwihYykr7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6a/RR5PLcRex1YwFsmofLlreTafbadncQrbl+VZZbBXtB2JFH07fu+gKBtCdPTy6qaRJw0M+luRc6Zc1XKt7yCbaiy6dOuX1+CsTKVJ/bSvDW+PBi4m+J6L+xYkofu1PfG+sNkOB2GhmjmjcEqMulXqzz3DZn9ZKG7a6yS67r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4qHPlId; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4qHPlId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758187470; x=1789723470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fe3MESOP7aMUflwUPlHBb2xtJAfsatsOjGwihYykr7U=;
  b=d4qHPlIdyRtH9lqWlTtS6aWIfTVm7jg+cfnx+lo6hf2/TiPS9mv3eSmq
   FYd/+g6KQsmTa1H58jmLW71GUOGEP1MWYbevL6zWa3fjjYHAjwFrUr6q0
   YIOo9Bz5ZBI+rYKz7DmoX5fMA8N6p8TlTvLHViFRUOt8j+zV7b3oP5XhE
   q4Ktm9FbtE+2UnjE0Pxx/4AkmOCGgEyGUSPeOW+QczBBD9hc07wcecbS+
   LFmcw3IenC6rbjkaLP6aT4KBLLhIVB4MZ0PvB8FhxPkWqz7+Sspy+Esji
   W7+E/yHjDFJTDSLb9x/09L7q5q/F1xPi+f9TN43TbmAn7iGJ/JU6IdQtr
   g==;
X-CSE-ConnectionGUID: 4CnVniHDRA2a/l23acz2jw==
X-CSE-MsgGUID: RJWpKvBxQ9+5QfyQXQEixA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85950584"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="85950584"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:24:30 -0700
X-CSE-ConnectionGUID: zsMdoLmZTW6IrTGSXj802w==
X-CSE-MsgGUID: u0y8GORpRZG5HsZ3uWh83g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="175413327"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2025 02:24:29 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzAsN-000000003An-0Qqq;
	Thu, 18 Sep 2025 09:24:27 +0000
Date: Thu, 18 Sep 2025 11:24:15 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/1] htmldocs:
 ./block/blk-core.c:894: warning: duplicate section name 'Note'
Message-ID: <202509181101.qaRdFPsS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   3eff75f14ff67c968fa98c407cb55532722b6655
commit: d6f0f66569f2f74c9095a8c4e8c43bff2b571769 [0/1] ANDROID: block: Do not set the I/O priority for zoned writes
reproduce: (https://download.01.org/0day-ci/archive/20250918/202509181101.qaRdFPsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181101.qaRdFPsS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Error: Cannot open file ./include/linux/math64.h
   Error: Cannot open file ./include/linux/math64.h
   Error: Cannot open file ./include/linux/kfifo.h
   Error: Cannot open file ./include/linux/kfifo.h
   Error: Cannot open file ./include/linux/bio.h
>> ./block/blk-core.c:894: warning: duplicate section name 'Note'
>> ./block/blk-core.c:894: warning: duplicate section name 'Note'
   Error: Cannot open file ./include/linux/clk.h
   Error: Cannot open file ./include/linux/clk.h
   Error: Cannot open file ./include/linux/rcupdate.h
   Error: Cannot open file ./include/linux/srcu.h
   Error: Cannot open file ./include/linux/rculist_bl.h


vim +/Note +894 ./block/blk-core.c

   884	
   885	#ifdef CONFIG_BLK_DEV_ZONED
   886	/**
   887	 * blk_bio_is_seq_zoned_write() - Check if @bio requires write serialization.
   888	 * @bio: Bio to examine.
   889	 *
   890	 * Note: REQ_OP_ZONE_APPEND bios do not require serialization.
   891	 * Note: this function treats conventional zones on a zoned block device as
   892	 *   sequential zones. This is fine since zoned UFS devices have no conventional
   893	 *   zones.
 > 894	 */
   895	static bool blk_bio_is_seq_zoned_write(struct bio *bio)
   896	{
   897		if (!bdev_is_zoned(bio->bi_bdev))
   898			return false;
   899	
   900		return bio_op(bio) == REQ_OP_WRITE ||
   901			bio_op(bio) == REQ_OP_WRITE_ZEROES;
   902	}
   903	#else
   904	static bool blk_bio_is_seq_zoned_write(struct bio *bio)
   905	{
   906		return false;
   907	}
   908	#endif
   909	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
