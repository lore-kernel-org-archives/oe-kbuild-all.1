Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171634D395
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 13:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762694871; cv=none; b=ka+WClLMOB+gfPhMxRH0u+0VIsMn9A4Mw5fxX9lX1esK46zeepK+/ydJqKxI5QOXrVdfzskVGt0hdQZQKdKyKPcM9P9okXkbZUcapJ2AXrI1Mo5ieckMTfNSvOpNtNkldpgCduV6AwNFFqZEjPuhDkejAt4kZ5DFB1TBgCaHQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762694871; c=relaxed/simple;
	bh=8c6yOJMysKJaNtLqTY925bSjoQTK9l2V2BxxVPKVq6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NayhuiytcJR7lIt1teiN8/bqhyNyckl2aBEgsqddNM+eQSRYud7qOn7d7rs0E8B4/Xv3VWgfKx0MiRQMLOsXCqTmDoc7+1ZvZ6vUuF5I5CAY6jfPw6W++JbCIDA+tshcMqXpEtrrg4l/0ks1iYFouTRYd4unWitVn7fNq8ql1Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1KJRhvs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1KJRhvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762694869; x=1794230869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8c6yOJMysKJaNtLqTY925bSjoQTK9l2V2BxxVPKVq6E=;
  b=n1KJRhvsjMfVJApS5H/l/fiaJ5CQTJQwCESIYo/5VreOIGgfKB7858c/
   jwjYQRFOnydqTyCFFVhmcG5U/o3WjYsJZ0qfBXP2IiiVYeP50Zvi8tA5F
   SfiuzRSFKAy22HhMbxVI/w0aA5oJlXO00wKHCJ6E7hcGTKDs9kEVRhK/M
   dm6itmb9CnrK1wxgy0m5T1nIskbCOys8k41ide8bzFXznNfbCfEzQpqzi
   LoE6CDYu4+kKLIt5pKrRZGQWoswTvW2Y8ZFlTEJDnLJpAsAZjVlTD/325
   UOORRwMg1JkRJh4dacBCcWojyCdsLT335WHXWJvDo99glrch1FCf/UcSF
   w==;
X-CSE-ConnectionGUID: kKk2lNMsQz6pzGw6SozyHQ==
X-CSE-MsgGUID: 96hILX6HRzeh4q8x9mMrhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="82394820"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="82394820"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 05:27:48 -0800
X-CSE-ConnectionGUID: 8bdO7Y4iSMihxbyJJkJR4g==
X-CSE-MsgGUID: sYwHGrX3TTinn0uUXHyE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="187758129"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Nov 2025 05:27:47 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vI5SL-00021U-1H;
	Sun, 09 Nov 2025 13:27:45 +0000
Date: Sun, 9 Nov 2025 21:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3124] drivers/ub/ubfi/ummu.c:24:1: error:
 expected member name or ';' after declaration specifiers
Message-ID: <202511092145.WGq6xLTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: 010c6364261c263f01d3d7861a955f3b1c2c9156 [3124/3124] ub: ubfi: Parsing ummu node in the ubrt table
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251109/202511092145.WGq6xLTY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511092145.WGq6xLTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511092145.WGq6xLTY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/ub/ubfi/ummu.c:24:1: error: expected member name or ';' after declaration specifiers
      24 | };
         | ^
>> drivers/ub/ubfi/ummu.c:24:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      23 |         u8 node_data[]; __counted_by(count)
         |                         int
      24 | };
         | ^
>> drivers/ub/ubfi/ummu.c:23:18: error: 'counted_by' only applies to pointers or C99 flexible array members
      23 |         u8 node_data[]; __counted_by(count)
         |                         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:320:32: note: expanded from macro '__counted_by'
     320 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                         ^~~~~~~~~~~~~
>> drivers/ub/ubfi/ummu.c:23:37: warning: expected ';' at end of declaration list
      23 |         u8 node_data[]; __counted_by(count)
         |                                            ^
         |                                            ;
>> drivers/ub/ubfi/ummu.c:23:5: error: flexible array member 'node_data' with type 'u8[]' (aka 'unsigned char[]') is not at the end of struct
      23 |         u8 node_data[]; __counted_by(count)
         |            ^
   drivers/ub/ubfi/ummu.c:23:18: note: next field declaration is here
      23 |         u8 node_data[]; __counted_by(count)
         |                         ^
   include/linux/compiler_types.h:320:32: note: expanded from macro '__counted_by'
     320 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                         ^
   1 warning and 4 errors generated.
--
>> drivers/ub/ubfi/resv_mem.c:33:1: error: expected member name or ';' after declaration specifiers
      33 | };
         | ^
>> drivers/ub/ubfi/resv_mem.c:33:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      32 |         u8 ranges[]; __counted_by(count)
         |                      int
      33 | };
         | ^
>> drivers/ub/ubfi/resv_mem.c:32:15: error: 'counted_by' only applies to pointers or C99 flexible array members
      32 |         u8 ranges[]; __counted_by(count)
         |                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:320:32: note: expanded from macro '__counted_by'
     320 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                         ^~~~~~~~~~~~~
>> drivers/ub/ubfi/resv_mem.c:32:34: warning: expected ';' at end of declaration list
      32 |         u8 ranges[]; __counted_by(count)
         |                                         ^
         |                                         ;
>> drivers/ub/ubfi/resv_mem.c:32:5: error: flexible array member 'ranges' with type 'u8[]' (aka 'unsigned char[]') is not at the end of struct
      32 |         u8 ranges[]; __counted_by(count)
         |            ^
   drivers/ub/ubfi/resv_mem.c:32:15: note: next field declaration is here
      32 |         u8 ranges[]; __counted_by(count)
         |                      ^
   include/linux/compiler_types.h:320:32: note: expanded from macro '__counted_by'
     320 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                         ^
   1 warning and 4 errors generated.


vim +24 drivers/ub/ubfi/ummu.c

    18	
    19	struct ummu_sub_table {
    20		struct ub_table_header header;
    21		u16 count;
    22		u8 reserved[6];
  > 23		u8 node_data[]; __counted_by(count)
  > 24	};
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
