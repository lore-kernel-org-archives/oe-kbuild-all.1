Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80390244669
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754437146; cv=none; b=nGitM4nSJq+iEgTgenLwro36A8xkHp7be4TP34sF0Sk7xiO/G2qhjaQpO6yZk8DZoBTf61DtmH6Tn+rKZbfFg4Ow/OATAscyDPdRIHSSF63tgduzX3D/Z604rpbgw7jb4YEKpU1nwe67xAa0NA4lOIOar1ns/fwdO2p+qMgqia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754437146; c=relaxed/simple;
	bh=w3h8/qBLm1K4Qc4izU/DPJn+Kzc6b1RMeQ8MIMXOea0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dj1qe39JgbeAEvR6/u6aSw8BkJl3lKcIkEPNzRFf1zm4LAkoY9+ScH8KWjcd1WjrsQgnL6FhgYd5FqDEkr7LWT7DCytPOFQApljWKSsZWvn6JtQegYO0qkkJUC22OZe1S9arIgya5e04c7aOPccnMJZFQK6pLCfNaIuRh7eMj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAPwr3nQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAPwr3nQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754437144; x=1785973144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3h8/qBLm1K4Qc4izU/DPJn+Kzc6b1RMeQ8MIMXOea0=;
  b=FAPwr3nQhbSCCk3p4jr2pyyWFS2Vh8wtLiNM7ssZcwpgnIaSOnD34cQj
   a11riKlUYvWnJMaOUjl/mXpnFyyg3+T2VMT8U9I/glEPvDCq32w/0QLZi
   ngRe11yuRCKtYkDFPj+H6GarbZkqhxzElmowcmfnro4dksILkRLIt75+U
   iWTtAWXMDuVJIuUSc2e9A/hoqicYi/oRkCy1qY9DoxSEjGeKdOGudXFJB
   mCs1CQzg1DcdVCfH8S50KFTr3RwxKV3vaNdTZcKmGU6PqP1N4LM73SQJO
   p7+1IkNHc+N832jujjWQoVKxf4OOe3a5jSJ/C+GoT1CWix+3FdkqwwjwK
   Q==;
X-CSE-ConnectionGUID: /tG2jzw/RqaQCoRpuNHdZg==
X-CSE-MsgGUID: XxXdsSBUT8W6N51/qMfypw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="59363316"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="59363316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 16:39:04 -0700
X-CSE-ConnectionGUID: AQTTAwnsQSaVuGQzgHjRMQ==
X-CSE-MsgGUID: g6bNQh3YTHGlnGqhahXOmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="165043014"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Aug 2025 16:39:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujRFB-0000q5-2k;
	Tue, 05 Aug 2025 23:38:58 +0000
Date: Wed, 6 Aug 2025 07:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 13/13] fs/f2fs/f2fs.h:3051:24: error: 'struct
 f2fs_sb_info' has no member named 'bggc_block_io'
Message-ID: <202508060732.lODuFyrt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   55c1de831d3eda713fb732eb92043b862f8033d6
commit: 55c1de831d3eda713fb732eb92043b862f8033d6 [13/13] f2fs: Add bggc_block_io to adjust the priority of BG_GC when issuing IO
config: s390-randconfig-002-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060732.lODuFyrt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060732.lODuFyrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060732.lODuFyrt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/extent_cache.c:18:
   fs/f2fs/f2fs.h: In function 'is_idle':
>> fs/f2fs/f2fs.h:3051:24: error: 'struct f2fs_sb_info' has no member named 'bggc_block_io'
    3051 |                 if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
         |                        ^~
   fs/f2fs/f2fs.h:3053:24: error: 'struct f2fs_sb_info' has no member named 'bggc_block_io'
    3053 |                 if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
         |                        ^~


vim +3051 fs/f2fs/f2fs.h

  3041	
  3042	static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
  3043	{
  3044		bool zoned_gc = (type == GC_TIME &&
  3045				F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_BLKZONED));
  3046	
  3047		if (sbi->gc_mode == GC_URGENT_HIGH)
  3048			return true;
  3049	
  3050		if (zoned_gc) {
> 3051			if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
  3052				return false;
  3053			if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
  3054				return false;
  3055		} else {
  3056			if (is_inflight_io(sbi, type))
  3057				return false;
  3058		}
  3059	
  3060		if (sbi->gc_mode == GC_URGENT_MID)
  3061			return true;
  3062	
  3063		if (sbi->gc_mode == GC_URGENT_LOW &&
  3064				(type == DISCARD_TIME || type == GC_TIME))
  3065			return true;
  3066	
  3067		if (zoned_gc)
  3068			return true;
  3069	
  3070		return f2fs_time_over(sbi, type);
  3071	}
  3072	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
