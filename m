Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7328621B191
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 17:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823790; cv=none; b=hQNG0e+H/O+l6f1hpUGO+jhRRE8e87aQDBkH7t+WauSkAXFKOrrscpri8uH8BbQyz3Ie1nyVO4twwWc+6r/09feoP9O0sJhu53X2fTuEyfNQMjkHsLPD6p6XpGJlYgNBWZNPcxSCVl77wFl4DRK+nfM1oNAd6nbug3u+1zSSlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823790; c=relaxed/simple;
	bh=7YvBpEgQIMo/HTNGdHfQIkV70lr5so4TJbXaEExesk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmtJ24TODHGSV7k9spbKRZahiliBLpw3UoGXPCyHBOMX03WGsi3FasST5W4gaTbSkNoLQH/DhFaEiZ+OiEsj7sOXZ23JJ8LjSGEDur07bExZSv+fqAGEbsPTEWpYB/TXvuwr//l9SxP0j1QCL9yEhbuYwgT3GIJ8bqQ6l+A9BRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQk8u8z4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQk8u8z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744823789; x=1776359789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7YvBpEgQIMo/HTNGdHfQIkV70lr5so4TJbXaEExesk4=;
  b=TQk8u8z4BEIXr3k489siHU60EoIH5U77NQatQ1Uhec7ZZ3uDAAoDRF6x
   RZ503SDcGvBR/iy4U9NZx//xg+OU/WL3K1oUvZ2w7tAfofFzoPmdU1B6O
   +y29hieMpoWHF5CIeJOQPg7ol/sXSZHhwlRObNS65OfxXQKpULr25ksqd
   2zjKKt5oBTv4bgtvFJ01zeDGimhK9lGW5aFse4by+l6SlFIrX7OJ3W6Ya
   dLaiomxYAPXBfJrna21nIxhJ+MUs8s4oPEt+U1F4Afya3KgYnJDJAgWyU
   Ucc5KGlTFaKDnKjm8KjcxbuklsFnwuvkHZQa9De/IHvtP28SV6uLv7WBv
   A==;
X-CSE-ConnectionGUID: fQZycr9cQUqqOcr+OVajFQ==
X-CSE-MsgGUID: 2RVZLRKWTauUP6HTsnOBHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57025372"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57025372"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 10:16:28 -0700
X-CSE-ConnectionGUID: 2fuVRP0YQQOEj5J6+3KB3w==
X-CSE-MsgGUID: xOaMtuAERyejLmAJ32I9zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="130400445"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2025 10:16:27 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u56N6-000K7C-27;
	Wed, 16 Apr 2025 17:16:24 +0000
Date: Thu, 17 Apr 2025 01:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2862/2862] fs/cachefiles/ondemand.o: warning:
 objtool: cachefiles_ondemand_daemon_read()+0x2ea: unreachable instruction
Message-ID: <202504170158.DUuilMVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeffle,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2affea8965688b8231cf977864ba7539320d5db8
commit: 2937cd5f8c58bd8e7895f6b2698057721442248e [2862/2862] cachefiles: notify the user daemon when looking up cookie
config: x86_64-buildonly-randconfig-005-20250415 (https://download.01.org/0day-ci/archive/20250417/202504170158.DUuilMVg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504170158.DUuilMVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170158.DUuilMVg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cachefiles/ondemand.o: warning: objtool: cachefiles_ondemand_daemon_read()+0x2ea: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
