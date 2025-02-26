Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE9224259
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740563878; cv=none; b=A5Xxe5Fi6EbAQMN4imhSmnTFUQSrSGt2dyR6a8VSPxqHFsm9sntT8bjf/0LbqFtBNa/Xz5CllsnfFpmZszhxuH650ctLbauUQhaRsZ8SxWqw58KHPOxRVZV9rhdSclnYvp0Aj5VCYDLH5GJMx8oPUB2Rz9GCJXriWll58O3P6as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740563878; c=relaxed/simple;
	bh=GxdOvfl59k5girVIFLMaC3EUubsgCoRT4YvB7DrzBSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POm5qt2zQ1PfJEenMNGAtb2AofDRLpLjmZMQ2xCnQp1QYmBrhk57ihbqzpc5J95KQcK5oI9atmRsHMPJUulUKEPp8gPTqgUrl1xD1KBEdFPiyhLJ4Z33x4lXHgEDrBOzuZ32HDGo1BS8lfTH66PGa/gCEu637ya9xvk2eQayL0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UntLsrB+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UntLsrB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740563877; x=1772099877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GxdOvfl59k5girVIFLMaC3EUubsgCoRT4YvB7DrzBSQ=;
  b=UntLsrB+zdAlSV8PA9QW42Pj/GaroN/5LMZgnzdLRyQhk3j9QJb39Vke
   LBL8n7ALVAHyJgdPyNGcgofAOZOpVZBYEUSQqtiUQ5BIHE1fzb44Zoq1z
   XPT7KoOL2xGv0RXkMlMwMwl2xSzoum8jpJNJONIff/fUaZjh329nWD4ez
   jYTkfeer8SWTaqnqrbQukWNecy4Ypd8gO89F3FdMDrpOxD/DHAY+3LfuJ
   bXdSYXPfAn7EhLIOoubFhzrLZHzSWmS9WzL32zPR90/sa5mJPKI7Jf+cp
   nauJEiCXwa+8dzccVrU8HYQky2l9MP54LWI5eAYFyv1HGXbx+JXLz/+sP
   Q==;
X-CSE-ConnectionGUID: B9LHRGjoQOmdYSitxhxnVQ==
X-CSE-MsgGUID: A6hhTdGCTICarrvCuEDIjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="28994818"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="28994818"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 01:57:55 -0800
X-CSE-ConnectionGUID: BZMOK/KCTFOJwCVGyHp3sw==
X-CSE-MsgGUID: bJy3QIbWTmyg156qB5IdYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121757605"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2025 01:57:54 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnEAq-000BVJ-0k;
	Wed, 26 Feb 2025 09:57:52 +0000
Date: Wed, 26 Feb 2025 17:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 122/123]
 fs/bcachefs/extents_format.h:219:33: error: width of 'flags' exceeds its
 type
Message-ID: <202502261700.DcbApKEF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   8de504fc059b751ae0cc0fd600f2d5e28ccb8dc5
commit: 82af8187566114f55114f1b878562de031e0b9b4 [122/123] bcachefs: bcachefs_metadata_version_extent_flags
config: arm64-randconfig-002-20250226 (https://download.01.org/0day-ci/archive/20250226/202502261700.DcbApKEF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261700.DcbApKEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261700.DcbApKEF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/bcachefs_format.h:502,
                    from fs/bcachefs/bcachefs.h:208,
                    from fs/bcachefs/bkey_sort.c:2:
>> fs/bcachefs/extents_format.h:219:33: error: width of 'flags' exceeds its type
     219 |         __u64                   flags:76
         |                                 ^~~~~
>> fs/bcachefs/extents_format.h:220:33: error: expected ',', ';' or '}' before 'type'
     220 |                                 type:7;
         |                                 ^~~~
--
   In file included from fs/bcachefs/bcachefs_format.h:502,
                    from fs/bcachefs/bcachefs.h:208,
                    from fs/bcachefs/extents.c:9:
>> fs/bcachefs/extents_format.h:219:33: error: width of 'flags' exceeds its type
     219 |         __u64                   flags:76
         |                                 ^~~~~
>> fs/bcachefs/extents_format.h:220:33: error: expected ',', ';' or '}' before 'type'
     220 |                                 type:7;
         |                                 ^~~~
   fs/bcachefs/extents.c: In function 'bch2_bkey_extent_flags_set':
>> fs/bcachefs/extents.c:1476:26: error: 'struct bch_extent_flags' has no member named 'type'
    1476 |                         .type   = BIT(BCH_EXTENT_ENTRY_flags),
         |                          ^~~~
   fs/bcachefs/extents.c:1477:35: warning: initialized field overwritten [-Woverride-init]
    1477 |                         .flags  = flags,
         |                                   ^~~~~
   fs/bcachefs/extents.c:1477:35: note: (near initialization for 'f.flags')


vim +/flags +219 fs/bcachefs/extents_format.h

   213	
   214	struct bch_extent_flags {
   215	#if defined(__LITTLE_ENDIAN_BITFIELD)
   216		__u64			type:7,
   217					flags:57;
   218	#elif defined (__BIG_ENDIAN_BITFIELD)
 > 219		__u64			flags:76
 > 220					type:7;
   221	#endif
   222	};
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
