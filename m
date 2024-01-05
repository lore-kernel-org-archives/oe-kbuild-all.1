Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD351DDD9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faRKGPGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704434249; x=1735970249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBVSaa8S7VS7VcF464mo6vuAJr25bs3JE40u1rINOSg=;
  b=faRKGPGBfbRiPBkdGWPyLRvocjTMN1TO1IP6pTHQe1izAGl1aRpEB2zn
   h4mi+oJvW0JZpDKT79FIQMt4FcliL5woG/VJxhe4/kRFN3eGJrnKemtdC
   svtNJ7ECF6uNjFSEjJmc6VC+8qBIeENAzHaZ1NiAyL7isv4o89RG2ihrq
   2aX9s1YAG0j8fNz0RUQkps/H+EKRHts3fwxt15DKDKyfofKc2n4O5IMRX
   /d9ecJff2NFeFdd3IFuP+IR7sBx9CAcdLz5eCoGoNwIo8Hq5MuvNFZc/v
   ZGO/zxXk4fz3V2QHf3ZMiHAfgilK5LxwuOfEO/7j7k9QT3K6Kuad+YeNO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4545272"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4545272"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 21:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="809458669"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="809458669"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 04 Jan 2024 21:57:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLdCv-0000q4-07;
	Fri, 05 Jan 2024 05:57:25 +0000
Date: Fri, 5 Jan 2024 13:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp1 42/46] net/smc/smc_wr.c:176:60: error:
 extraneous ')' before ';'
Message-ID: <202401051351.WPFIO341-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp1
head:   62bfd93b1d4bc92cd171973923c45a2b011f1c5c
commit: 5aabc44128937b7dd8079cada0381ea5af59aa20 [42/46] net: smc: fix opencoded find_and_set_bit() in smc_wr_tx_get_free_slot_index()
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20240105/202401051351.WPFIO341-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051351.WPFIO341-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051351.WPFIO341-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/smc/smc_wr.c:176:60: error: extraneous ')' before ';'
     176 |         *idx = find_and_set_bit(link->wr_tx_mask, link->wr_tx_cnt));
         |                                                                   ^
   1 error generated.


vim +176 net/smc/smc_wr.c

   170	
   171	static inline int smc_wr_tx_get_free_slot_index(struct smc_link *link, u32 *idx)
   172	{
   173		if (!smc_link_sendable(link))
   174			return -ENOLINK;
   175	
 > 176		*idx = find_and_set_bit(link->wr_tx_mask, link->wr_tx_cnt));
   177		return *idx < link->wr_tx_cnt ? 0 : -EBUSY;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
