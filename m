Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9623668EA6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyVs7HyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701801014; x=1733337014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=580JKYXGxyyY/nV+egTJ+yhmFcdmfjmLclX5dabPicY=;
  b=nyVs7HyOe/TtZycQxo3KKQJE1jjgqA6aEGOD+IFKVy2DPuU4cWAydsvB
   cesjIV2pPZLrOQivj48wGjbybcV0Q5dKQWSg2nauvMvE7xRXxHi4hy6A2
   qteFYw4Rt9Vgm9FVHkqyPlMdA8lsDs+vkZ6hxeo1svt73f6N9OGbgkrwM
   clZcVHz2l+g/iCP9sDDrQsScQM18+MtOGG6um99KeSlBhLhuKwjtpw+dF
   fH38cj85s6FeoVZLbUmPQWQQDl8UgdET+wXmVa3qXIuNy7U78UO4f8S2R
   6nwCYmk+oGNh8Hyz8OoXRwsDhahNfkhv/lyc6ep0+idXZKgSDavNhWgUv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396730831"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="396730831"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894462825"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="894462825"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 10:30:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAaBO-0009Xk-2k;
	Tue, 05 Dec 2023 18:30:10 +0000
Date: Wed, 6 Dec 2023 02:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: sthanneeru.opensrc@micron.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] base/node: Add sysfs for adistance_offset
Message-ID: <202312060217.sThi7OQi-lkp@intel.com>
References: <20231130220422.2033-2-sthanneeru.opensrc@micron.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130220422.2033-2-sthanneeru.opensrc@micron.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus akpm-mm/mm-everything linus/master v6.7-rc4 next-20231205]
[cannot apply to cxl/next cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sthanneeru-opensrc-micron-com/base-node-Add-sysfs-for-adistance_offset/20231201-060901
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231130220422.2033-2-sthanneeru.opensrc%40micron.com
patch subject: [RFC PATCH 1/2] base/node: Add sysfs for adistance_offset
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312060217.sThi7OQi-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060217.sThi7OQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060217.sThi7OQi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:45:
>> include/linux/memory-tiers.h:141:12: warning: 'get_target_memtier_adistance' defined but not used [-Wunused-function]
     141 | static int get_target_memtier_adistance(int node, int adistance_offset)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/get_target_memtier_adistance +141 include/linux/memory-tiers.h

   140	
 > 141	static int get_target_memtier_adistance(int node, int adistance_offset)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
