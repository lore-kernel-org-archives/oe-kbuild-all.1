Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFF9160
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeEa+u3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696810170; x=1728346170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKzOvOU1UbJc+0bjE6jftHdMgIGa4ZnA/jUk75US0Vg=;
  b=XeEa+u3kTPw0unuYjAb6MO7wIYXGdcLFF/IwIZIv0k/exOHejtl+yR4t
   vlGowDwBAP0IdGhXpb0SfZahcOrFpzLKEgy6P5qELEd9xu1QW34D+2oWd
   QwqeGsywprQa3C+/Gl7/BqgEiYKf43tuxfbs3EqKeTMEBaZW3T3EIrW1z
   X4MQ+rzVp3Ahkr2Hig/KftL9ID8kvywWBsAcTrsFASE2RWoNInenT0irl
   UmT1pMyC3KVYHghWbOBqrKzxIh6Bj8BFwb1MplclO0w/9dAo0wSlBHDDO
   Kk+HxOeMLPeJyglzeCwzrqlCIEYd1LZWgDlfCUcyHTvHEAafTb95suMe0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="2644836"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="2644836"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 17:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="926585693"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="926585693"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Oct 2023 17:09:26 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpdps-0005tF-1k;
	Mon, 09 Oct 2023 00:09:24 +0000
Date: Mon, 9 Oct 2023 08:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: fs/ntfs3/frecord.o: warning: objtool: ni_read_frame() falls through
 to next function ni_readpage_cmpr()
Message-ID: <202310090811.VuUeT0nD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94f6f0550c625fab1f373bb86a6669b45e9748b3
commit: 6fa57d78aa7f212fd7c0de70f5756e18513dcdcf slab: Remove special-casing of const 0 size allocations
date:   11 months ago
config: x86_64-randconfig-015-20231009 (https://download.01.org/0day-ci/archive/20231009/202310090811.VuUeT0nD-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090811.VuUeT0nD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090811.VuUeT0nD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/frecord.o: warning: objtool: ni_read_frame() falls through to next function ni_readpage_cmpr()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
