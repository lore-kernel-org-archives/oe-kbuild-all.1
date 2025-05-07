Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ECE15B971
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598028; cv=none; b=ZBut/9zuUaKcBXxmztWtcjkGQ2cNciCQpzfUzF2IsEAvaP0lRYzAxIJFkqvpJ2/BZ3o9le9HumV4Gltg/eAQx8igOW+mSagRvnlEUixLB8ZlWtmtquY5ORg7agLOxpsCm9jAv6E9qxdnBjFdF8UcB38vJXKfCjCJO6Z3Qk3e7K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598028; c=relaxed/simple;
	bh=e2TQpM8BJFHpFEG39yeKwoa1hDa+czKSI9zbCV1nFTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S3UuQ5blspFo0Vwtmtr6W66es77/GLAddXZFI250bxEVggzwvpGcjxuklewCYadqidUsePMD8PD+Z4msYo2cc5VxvqoPNz9h6r/MeYDVMNXQ+MeEeStWSDbz5BH0aaTF56PCIW7ktw88iHpvN7f3dsKpyH0q9EBzUunzFUyHgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6XbLoUU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6XbLoUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598027; x=1778134027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2TQpM8BJFHpFEG39yeKwoa1hDa+czKSI9zbCV1nFTU=;
  b=J6XbLoUUVaHMU7jH58M4gE1ZJzGuANDNvE/BGcpPq0xfpF7H8QN9wTqK
   tef0Gjk5uVY7eBdLx+DU50dLzqFHzuIpcSQjWRcTwp7ZDvOf4F5CfnDK9
   S9qLV+MBAJHtGME8+yvyTHq7zUaI6H2qjdP2SirETdsolWXbzOtfNXsm+
   NhSquzmFNM6wvzk7x3z9VFFQJt9JPLgeq+jNjWJtVYIqzY4glpzIPCeQa
   xBZC0y52G+bWYdRZ68At4X5SWvKTaIs1FH6ieEr2BU83QdDRiPImkvMb4
   4kIu9oA6uM9hPhQq8RvQCI66dv3YvwtTX6ttKR1iuato/umzSDu44DjIf
   Q==;
X-CSE-ConnectionGUID: KaWTl6pdTvatqgxwIIaOog==
X-CSE-MsgGUID: FuALbcNxQGyR1Qvwj77gYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48316389"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48316389"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:06 -0700
X-CSE-ConnectionGUID: 75aGIHN7Tuqef07CbO07nw==
X-CSE-MsgGUID: AB3j/z4+RVCXksoOmVUkQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136370561"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 May 2025 23:07:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079V-0K;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: [jlayton:reftrack-dbgfs 3/8] lib/ref_tracker.c:15:23: warning:
 'ref_tracker_debug_dir' defined but not used
Message-ID: <202505071314.URClTxm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git reftrack-dbgfs
head:   1c49f3ad833f720bc692137505882e0fbdabb7e4
commit: 5f3878e53677732a70771676f191673996f7fd5f [3/8] ref_tracker: add a top level debugfs directory for ref_tracker
config: openrisc-randconfig-r122-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071314.URClTxm7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071314.URClTxm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071314.URClTxm7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ref_tracker.c:15:23: warning: 'ref_tracker_debug_dir' defined but not used [-Wunused-variable]
      15 | static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
         |                       ^~~~~~~~~~~~~~~~~~~~~


vim +/ref_tracker_debug_dir +15 lib/ref_tracker.c

    14	
  > 15	static struct dentry *ref_tracker_debug_dir = (struct dentry *)-ENOENT;
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
