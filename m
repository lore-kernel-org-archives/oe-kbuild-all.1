Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB645005
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735324400; cv=none; b=pKjCHo/qol9fykLXi8W8vZZ7Az+OZsmJPW9aKwOB0QcAXKzdqyxz5KB/DVvkcqTDTdRRp/N/PUh2TNr/sKvvp96jhUp9CNV+JdVhtvQSo5scd+KGpULC5DYSCtM8hl3lD36pZipMJkT1sSYE/HVgdu3eqU17MmjQKgb8+UXMpBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735324400; c=relaxed/simple;
	bh=o13coohmFE4KFwiNYIkjei751dn/ze2BUktmVKOn4EY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ybd6tysPh+64ABqjqPAm27SkXfUYo04DKIFz76YJMJvDvkVcfn0a5S2wtgMO36chmLEeohb0VcvSXsRacpJ0nk3c8UtLfR08rccaUr46AeWt/nF041BFmtuiFOz6fx4E45KguM2FW9bz/8QWsM91rNyj+Buzebbgm947zDCk7lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKMCRI+i; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKMCRI+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735324399; x=1766860399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o13coohmFE4KFwiNYIkjei751dn/ze2BUktmVKOn4EY=;
  b=JKMCRI+iqzgdqeDQBSlJG2b9XA/IJGoT6hM8viK9rFHZxLJJIqF/9yGN
   U3skGcO4mSRO4PpHJy1vYpQjGbBnv0JFQ8KL1Z1Mnb6P+7eGqSEQloWSu
   BmqI8gT5iNpnMIpYFwoCyq9LbamtA5kOsD7+lVCxGPkcPUtoRADgt08Em
   bTFBFUAcGDmuAiCkjaTW9DIuC20VvvokaF3KLt2VrGqBxPoadS1+5FfV0
   C/7vlHzrAmk7hJkIdo2fa/3nzm9Z5Jvv+AQzD4QPNOiAvFvGjijK/Lc0a
   3q78LEdZsP+PxfadhFnBBIqEr8xcJNBg9P45GgdUDMQPXe3Aa26yJSzFC
   w==;
X-CSE-ConnectionGUID: c7krtVh3Q4+ajBItxut99Q==
X-CSE-MsgGUID: PecepQChSLOmAAuFBf4K1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39410226"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39410226"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:33:19 -0800
X-CSE-ConnectionGUID: 0UJcHaxDQaW8j1mtxQ9FWg==
X-CSE-MsgGUID: Gx+C7LuDSfqYxDs67V3W9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100691951"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 10:33:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRF99-0003Rs-1b;
	Fri, 27 Dec 2024 18:33:15 +0000
Date: Sat, 28 Dec 2024 02:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] fs/ntfs3/file.o: warning: objtool:
 ntfs3_setattr()+0xfb: unreachable instruction
Message-ID: <202412280232.iRY0y7uJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: c213d417e466b7a7d9e02939bb67fcf5d82a3f2f [2589/2589] fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241228/202412280232.iRY0y7uJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280232.iRY0y7uJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280232.iRY0y7uJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/file.o: warning: objtool: ntfs3_setattr()+0xfb: unreachable instruction
--
>> fs/ntfs3/bitmap.o: warning: objtool: wnd_add_free_ext()+0x3f1: unreachable instruction
--
>> fs/ntfs3/run.o: warning: objtool: run_collapse_range()+0x17b: unreachable instruction
--
>> fs/ntfs3/fsntfs.o: warning: objtool: ntfs_bio_pages()+0x34a: unreachable instruction
--
>> fs/ntfs3/index.o: warning: objtool: bmp_buf_get()+0xc8: unreachable instruction
--
>> fs/ntfs3/fslog.o: warning: objtool: do_action()+0x4a1: unreachable instruction
--
>> fs/ntfs3/frecord.o: warning: objtool: ni_write_frame()+0x219: unreachable instruction
--
>> fs/ntfs3/inode.o: warning: objtool: ntfs_get_block_vbo()+0x12e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
