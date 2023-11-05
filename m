Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3E816
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Opbzz+Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699147609; x=1730683609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKDEO3lRmG4eGtgdCTjmcPWWEFolxB7BfhNcjRGA3NY=;
  b=Opbzz+Py1T0DyeEOA+zMyntdu5piO8/6mDNMLCoyyJI7xWeu6dag+cUG
   e/EP5DjoB1IgqMJ867I6Y4gCZh0dsV0M6XOnqWTvS3CF3Rq/YQlCBqcN4
   4H3ZUZ6DTj49Q5q6Tv+Z1RaKy86xhUcNAfiNjHXwYLrUlZKwFIHSfvALp
   cOVH43eejuQQMQNkQIyS6I0UlS3EgslZmhAzrAemGcGB/gBjFo8ZPqyd+
   wYaTUiyrcB/oNArgDnPOidrOXomSb8RBG9ZwIqspaRr0PhVntAejAJ5c/
   ropHynQLD2xkgEudnAKb3isJalE3TiKFGEYj1iMbxjsZ5pV4d5/fkgjja
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="420236680"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="420236680"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 18:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="738454496"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="738454496"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Nov 2023 18:26:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzRuX-0004sy-0A;
	Sun, 05 Nov 2023 01:26:45 +0000
Date: Sun, 5 Nov 2023 09:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp1 42/46] net/smc/smc_wr.c:176:67: error:
 expected ';' before ')' token
Message-ID: <202311050948.6MxDmdex-lkp@intel.com>
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
config: x86_64-randconfig-121-20231101 (https://download.01.org/0day-ci/archive/20231105/202311050948.6MxDmdex-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311050948.6MxDmdex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311050948.6MxDmdex-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/smc/smc_wr.c: In function 'smc_wr_tx_get_free_slot_index':
>> net/smc/smc_wr.c:176:67: error: expected ';' before ')' token
     176 |         *idx = find_and_set_bit(link->wr_tx_mask, link->wr_tx_cnt));
         |                                                                   ^
         |                                                                   ;
>> net/smc/smc_wr.c:176:67: error: expected statement before ')' token


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
