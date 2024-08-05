Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC32414F136
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852282; cv=none; b=vBZIw5MviyZ7EnxbVkNSgcWysHfKTLLut9rTxXTWWVOhB4SSNhH4ejTCY+5Kk9dbtn96VAbftf52wMUF57EWnBFkMCXqjbpVVLL70L0LWl2LYZ1UFNv3B5Irr3+Np0VCo7ZRUwPWfMwghVRRpecYzfhn3R4kY7IYUCdSDCg9Yxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852282; c=relaxed/simple;
	bh=DHCK5EzPFWfoSWC30hJdr2F05P1VmNla4Ud7dS/pMSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OU70Lvanl6rkSwIB6S3XBiEhicnOgl8DG/Efk7mOrBcxzfpRFfIxJ3BOQrs8Vk/7iZ4HBCglNfnGPISwRJdMtcIAhwn6ztMuN2sM+VYfsOHhHOrBBDl07fn1xgMSDmlChltGo4NBAh4v2A2QtaKfi6ByIwZuqBWQ6RIA3dFf1V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=disY5g1s; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="disY5g1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722852281; x=1754388281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHCK5EzPFWfoSWC30hJdr2F05P1VmNla4Ud7dS/pMSM=;
  b=disY5g1sj+0jcKM4SIS3iIORAp+oIybkCYzhgybYzF9vyHOgrg5CUGhl
   ijUhg6uLS7W1nafMgGQaSiJbF1bxQfFnPlgZxxR38wmpmFcJhtuxaKRgj
   rkO3k33Ch95SbBlp/LeiXWCUsJhYAPrbllQql84kR6bIvx67I081+lpG0
   6jE2/MYtCzKV/wMl75WutrV0MjxXbVDm70JLlIGvr3vbJY7rnj63cAUIs
   SqdRCxRTsecXs/Q3DvfH0anK15bf4bfjmgiZxIt9xm7834ub4SNI4bBlh
   JaZjIzsiMgKmLAiydihXCJS0nqngAqCXhuQYQenGPGSwbvuz0DA//xx5v
   w==;
X-CSE-ConnectionGUID: Bw1mcO6ZTVWHZm89jjQbUw==
X-CSE-MsgGUID: jqO4/BsaSrGnZOZn3k29Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31462837"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="31462837"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 03:04:40 -0700
X-CSE-ConnectionGUID: S03/D9r5TiO7RRwUw4KP5w==
X-CSE-MsgGUID: hg2Zc3pPTIavltbCboXIbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56036259"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2024 03:04:39 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sauZw-00023k-12;
	Mon, 05 Aug 2024 10:04:36 +0000
Date: Mon, 5 Aug 2024 18:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: fs/xfs/scrub/common.o: warning: objtool: .text.unlikely: unexpected
 end of section
Message-ID: <202408051834.jcuyCxWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
commit: b27ce0da60a523fc32e3795f96b2de5490642235 xfs: use dontcache for grabbing inodes during scrub
date:   3 months ago
config: x86_64-buildonly-randconfig-r005-20221226 (https://download.01.org/0day-ci/archive/20240805/202408051834.jcuyCxWe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051834.jcuyCxWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408051834.jcuyCxWe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/scrub/common.o: warning: objtool: .text.unlikely: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
