Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55781EEA59
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870032; cv=none; b=CDllnTNIUalGfm7v4v40T/JgLDNtlXq1e35+eiykCdb89tTTA6axAF8d+WHP/lhPL69sNkER+iZ9Ct46PF94dS4ieOgDJKrlDv1m4SnI4JD9BPR5TnGRMtidBiXO2M0kllLc9TVUAt/VUCGct6s/CDX5WTDe1OkEHwbJI+zpn5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870032; c=relaxed/simple;
	bh=rL3XcQbkr3ZddTLYitvK4EcNsLYVRGSWxFEoPUFYo20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gWoZ7XGDrmdycVW/mIageGPDjBb82z5lT77cjSn3ncfUL8HQZHhws8WXpwq3nruVxG5SEDDqvg97xUPVIV9k0c15NMasf3x/um47GEXZV6G1YNi4rgOQQ9sPvtPuvq4YmhdTdKwNFNXySzJfqkc2BMX0xWhcapOVZv/P0jwTUa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRTAFiEC; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRTAFiEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744870030; x=1776406030;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rL3XcQbkr3ZddTLYitvK4EcNsLYVRGSWxFEoPUFYo20=;
  b=VRTAFiECh/y4ljcxhzE9Zf+xMDWNoNqmkunfkLxOVzs5z8d5OmtS1nta
   Dz2HYgOa/6SrhwyLkmVqdqKPcUU94g9cFOfAQR4iAqh9op5sg/tWRR23X
   sWm3r2zaOUPl/r3F+jTC7T3N5F4Ri4Q+nAx6ZkqktPVyeZVRSOb/CvF7X
   ru50Gyj83aTlrSJDKjt1v8kA679itmJPicyHj1DMC+EHcvEQQpGg7ATVI
   fMgLx+zxwZH/wTRa64NQmAo6fTUeT02nHtMiPvpR2gvD3SAPDb7Feo7yO
   PCssxk9RWGruc/nQVZBHxY0xemE0zNlq99XfP6F+IfPWCDgoyMilXHLf8
   Q==;
X-CSE-ConnectionGUID: lOHw22ooRqawx2uBiHAY2A==
X-CSE-MsgGUID: srSx6j7sTvuOrzvd9y/P8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45575887"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45575887"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 23:07:09 -0700
X-CSE-ConnectionGUID: btAZfIMfRaaEXSYL/t7gbA==
X-CSE-MsgGUID: iMz6dODDTH2nr4dSbLVkyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="161744322"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 23:07:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5IOw-000LVy-08;
	Thu, 17 Apr 2025 06:07:06 +0000
Date: Thu, 17 Apr 2025 14:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 123/123] mm/shrinker.c:688:6: warning:
 no previous prototype for 'register_shrinker_prepared'
Message-ID: <202504171330.MY8oNTJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   074661a2e2a9eb4c8a10f52d986487be78c957fc
commit: 4dbbc419d670b57c4e19ecfd80c33d649903f030 [123/123] mm: shrinker: remove old APIs
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250417/202504171330.MY8oNTJW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171330.MY8oNTJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171330.MY8oNTJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

460ba8f99f94dc Qi Zheng 2023-09-11  687  
460ba8f99f94dc Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
460ba8f99f94dc Qi Zheng 2023-09-11  689  {
460ba8f99f94dc Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
460ba8f99f94dc Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
460ba8f99f94dc Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
460ba8f99f94dc Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
460ba8f99f94dc Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
460ba8f99f94dc Qi Zheng 2023-09-11  695  }
460ba8f99f94dc Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: 460ba8f99f94dc0b8c8310c3fe2509dc34fa0d0b mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: 小龙 <wenqing.ly@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
