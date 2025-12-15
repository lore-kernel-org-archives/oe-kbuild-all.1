Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A93C30C37D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788179; cv=none; b=lZM9YDCH32yEGNAHmEPHga9uxGrEXLYFH5SAGI8w0RuTo9Roq3hqXx3jm/xb8N0Qi3HjAdh4T4/mFtFuoiCBbAw6Fgeo7AGzeBtJLntwS4pDXFiNKe61jOCjyo8UGvnjlmN0y+jwTIJv3IVq0kccZO5ShQp+YXaqb9sJdracJRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788179; c=relaxed/simple;
	bh=cC9fHdv9dp3oFdBtbN9Aro9WrHkCTqMTLsVVkmBWMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZLkyNVVaTQa1ytLL6tjDt3nUaGZPIKqKubSoJyEzNi6+t2/VHjHfRQUcxUcqlrDm4MuhURqyJvjy7/5tMRzkIcociHW2QdKEURqeXrWosMogenhbmU4U9HNZW7Y9YFP9rM4HLK5rEL+TBaqEnQOKIQOkMutEhKcOQmvHPtCOmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CA54bXke; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CA54bXke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765788177; x=1797324177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cC9fHdv9dp3oFdBtbN9Aro9WrHkCTqMTLsVVkmBWMjs=;
  b=CA54bXkeWv3OlcQspymsRNhbwqJVpal9iLTDyvDHhmlejaMkX4GqhVbJ
   l/fdUaZseq+8UDj5Ru0Ns+IWKiZJy1Vjm1/IR1k9XyUSPWIBB1ftktjl+
   j7Dz38KeuPr+uWc9iAPYLj2Kim/pywfo2+pl2N/j6S5xEBxL2QRrEzFFA
   z6pPRhT6wPnEqegRfNoJLD2Dz3+jBezmGBgNwP7JOryJvXI5Hx0qCT2RO
   6FtZyT1XYTaV6YyxNFg9aN0+HFshdHX3M1KzNDjsOPZ47n9Voixj0koAw
   eJQj9PoRVabSW9NfHi0Rzqc5j+afh9omZbUjLG39g4GWk0gFMwkABP55W
   A==;
X-CSE-ConnectionGUID: 8RSVmE5zSnKmnNjeskV8pA==
X-CSE-MsgGUID: fB5hMM0sSSqpfVtbd5orgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67561436"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67561436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 00:42:56 -0800
X-CSE-ConnectionGUID: Nz1L8hGsTS+qr3D75mmcQg==
X-CSE-MsgGUID: 74SXlIzoRh6tBhzU55kLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197561765"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Dec 2025 00:42:55 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4AO-0000000005V-3QdW;
	Mon, 15 Dec 2025 08:42:52 +0000
Date: Mon, 15 Dec 2025 16:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 mm/shrinker.c:688:6: warning: no previous prototype for
 'register_shrinker_prepared'
Message-ID: <202512151620.YxQ4tMmo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: f1dadc895ed84d664e6d2d008be8225d3b051db7 [11/11] mm: shrinker: remove old APIs
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151620.YxQ4tMmo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151620.YxQ4tMmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151620.YxQ4tMmo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

314369bb029a4d7 Qi Zheng 2023-09-11  687  
314369bb029a4d7 Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
314369bb029a4d7 Qi Zheng 2023-09-11  689  {
314369bb029a4d7 Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
314369bb029a4d7 Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
314369bb029a4d7 Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
314369bb029a4d7 Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
314369bb029a4d7 Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
314369bb029a4d7 Qi Zheng 2023-09-11  695  }
314369bb029a4d7 Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: 314369bb029a4d7f5018a64217e28d549e42fb65 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
