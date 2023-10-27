Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44953BA50
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeKY8hSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698406833; x=1729942833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HznG8EOnVcrbQ97tKgo4d/COHlGwio4LBvAh92WE1h0=;
  b=DeKY8hSxGYq/7IAtRyrXMwcRzIAFtrw2xE6da+8ptEHJUcTUmhfFojZT
   JWqa5Kc0GVZONwbD58fW3yJjnpL6mJaof4Ase3LP48JQd5u9dq6eopcHR
   /R6vCmkiO9LILeyjJfG/yAjvEdpdXU8p5iSSt3EW7Aj++RfjpSE92kZrg
   HJOa9LKLcWCTazV+6llG434Sdjut9iKahndWdnGPfTz2U4VVaF6gQH44k
   zV22ZSQgb/wbmOuUhsft7ivF/GLXWaujB/SghidG4V9KuKRm8u01iPWAd
   Ky5PBllvpRB7Ng7QZ9Ga5+ZG1i3h4b5HyKeoHj/HasSg0Yx8ZT189xN9Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9298400"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="9298400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788809865"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="788809865"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Oct 2023 04:40:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwLCW-000Aml-2O;
	Fri, 27 Oct 2023 11:40:28 +0000
Date: Fri, 27 Oct 2023 19:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 39/39] dm vdo: enable configuration and building of
 dm-vdo
Message-ID: <202310271945.092XwBE0-lkp@intel.com>
References: <20231026214136.1067410-40-msakai@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026214136.1067410-40-msakai@redhat.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1e4ab7b4c881cf26c1c72b3f56519e03475486fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Sakai/dm-add-documentation-for-dm-vdo-target/20231027-054713
base:   1e4ab7b4c881cf26c1c72b3f56519e03475486fb
patch link:    https://lore.kernel.org/r/20231026214136.1067410-40-msakai%40redhat.com
patch subject: [PATCH v4 39/39] dm vdo: enable configuration and building of dm-vdo
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310271945.092XwBE0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271945.092XwBE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271945.092XwBE0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/dm-vdo-target.c:16:
>> drivers/md/dm-vdo/block-map.h:35:37: warning: 'UNMAPPED_BLOCK_MAP_ENTRY' defined but not used [-Wunused-const-variable=]
      35 | static const struct block_map_entry UNMAPPED_BLOCK_MAP_ENTRY = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-vdo/block-map.h:34:38: warning: 'NO_PAGE' defined but not used [-Wunused-const-variable=]
      34 | static const physical_block_number_t NO_PAGE = 0xFFFFFFFFFFFFFFFF;
         |                                      ^~~~~~~
--
>> drivers/md/dm-vdo-target.c:1162: warning: Function parameter or member 'vdo' not described in 'get_thread_id_for_phase'


vim +/UNMAPPED_BLOCK_MAP_ENTRY +35 drivers/md/dm-vdo/block-map.h

13d47b7579638e Matthew Sakai 2023-10-26  33  
397119f4a6191f Matthew Sakai 2023-10-26 @34  static const physical_block_number_t NO_PAGE = 0xFFFFFFFFFFFFFFFF;
397119f4a6191f Matthew Sakai 2023-10-26 @35  static const struct block_map_entry UNMAPPED_BLOCK_MAP_ENTRY = {
397119f4a6191f Matthew Sakai 2023-10-26  36  	.mapping_state = VDO_MAPPING_STATE_UNMAPPED & 0x0F,
397119f4a6191f Matthew Sakai 2023-10-26  37  	.pbn_high_nibble = 0,
397119f4a6191f Matthew Sakai 2023-10-26  38  	.pbn_low_word = __cpu_to_le32(VDO_ZERO_BLOCK & UINT_MAX),
397119f4a6191f Matthew Sakai 2023-10-26  39  };
397119f4a6191f Matthew Sakai 2023-10-26  40  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
