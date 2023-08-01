Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8AD22EFB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690898955; x=1722434955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oRynheA8juoUI+0GBEhCccN5NpjSNx1eanJEFgIeSIs=;
  b=Iz+GwN97PB6kVRpx9srbs14/sDvjYKG4CH/0EML620bMit/POcbp3LWW
   ybQequs+BlJezejA1vjr6PMXsAiuTf/W9EbaST4E/H/oRBPWkXB0Tefne
   JCZYy8OlR6D54IOXh7uticr2OSAg6FWa2HNI34Y2AXyjuZimjcG+LineF
   WxY3ifwRI6aYyyTvoFdY5eSyTaTBvnHCoWDleqQ7E1AC5DUXvrGe4pcux
   elFjccppl3GP4QIi81iho/A9TStA4UyEvIpZ/k2JuYf9rX5JorFzXHZrc
   fU0wzW2230TfLumWNS2i8kQVSgGlMkyHoXnv4mfNEnD25eGjck0YsC99a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354232786"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="354232786"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902562851"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="902562851"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 07:05:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQq0c-0000Ku-2f;
	Tue, 01 Aug 2023 14:05:58 +0000
Date: Tue, 1 Aug 2023 22:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH iwl-next v2 2/6] ice: refactor ice_ddp
 to make functions static
Message-ID: <202308012117.GWpl2IGh-lkp@intel.com>
References: <20230801115309.697331-3-jan.sokolowski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801115309.697331-3-jan.sokolowski@intel.com>

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Sokolowski/ice-remove-unused-methods/20230801-195105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230801115309.697331-3-jan.sokolowski%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next v2 2/6] ice: refactor ice_ddp to make functions static
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308012117.GWpl2IGh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012117.GWpl2IGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012117.GWpl2IGh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_ddp.c:1474:29: warning: no previous prototype for 'ice_find_seg_in_pkg' [-Wmissing-prototypes]
    1474 | struct ice_generic_seg_hdr *ice_find_seg_in_pkg(struct ice_hw *hw, u32 seg_type,
         |                             ^~~~~~~~~~~~~~~~~~~


vim +/ice_find_seg_in_pkg +1474 drivers/net/ethernet/intel/ice/ice_ddp.c

2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1463  
b1e9d9a5d80ff6 Jan Sokolowski     2023-08-01  1464  /*
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1465   * ice_find_seg_in_pkg
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1466   * @hw: pointer to the hardware structure
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1467   * @seg_type: the segment type to search for (i.e., SEGMENT_TYPE_CPK)
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1468   * @pkg_hdr: pointer to the package header to be searched
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1469   *
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1470   * This function searches a package file for a particular segment type. On
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1471   * success it returns a pointer to the segment header, otherwise it will
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1472   * return NULL.
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1473   */
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20 @1474  struct ice_generic_seg_hdr *ice_find_seg_in_pkg(struct ice_hw *hw, u32 seg_type,
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1475  						struct ice_pkg_hdr *pkg_hdr)
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1476  {
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1477  	u32 i;
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1478  
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1479  	ice_debug(hw, ICE_DBG_PKG, "Package format version: %d.%d.%d.%d\n",
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1480  		  pkg_hdr->pkg_format_ver.major, pkg_hdr->pkg_format_ver.minor,
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1481  		  pkg_hdr->pkg_format_ver.update,
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1482  		  pkg_hdr->pkg_format_ver.draft);
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1483  
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1484  	/* Search all package segments for the requested segment type */
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1485  	for (i = 0; i < le32_to_cpu(pkg_hdr->seg_count); i++) {
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1486  		struct ice_generic_seg_hdr *seg;
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1487  
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1488  		seg = (struct ice_generic_seg_hdr
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1489  			       *)((u8 *)pkg_hdr +
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1490  				  le32_to_cpu(pkg_hdr->seg_offset[i]));
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1491  
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1492  		if (le32_to_cpu(seg->seg_type) == seg_type)
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1493  			return seg;
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1494  	}
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1495  
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1496  	return NULL;
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1497  }
2ffd87d38d6b9d Sergey Temerkhanov 2022-12-20  1498  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
