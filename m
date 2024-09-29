Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B09A2F36
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 01:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727572691; cv=none; b=NEqmYQRY+M1Z/1ZIJq6dB5ko98BC7cF9QqqLBfSob013IMlhFk0RRLzFsQhcpSbjBk1pvSPOs477LoM3wMzKTakRDcEGKRv/JYRFlxgMipnb//QZ3P6JgNDP/F3cog1GiCbiqvYDzEd4vJfTBK7ICrT3YzLmRLuxUNAgBrrwbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727572691; c=relaxed/simple;
	bh=ssZXEr5ls1Tr2RFUpybDuYsWeUvvCchzAc7ge6XDDCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W5HEgEousIZpd00z9vZQMZJa5wgogfuv8wi8FmKyRCUgwG3vR18zf3sTrV0Hn58wciORQqAEncVxY4YFNTuIo8o9v6EtHhFSpulmm8fSyuxZXbaG5eZDJv9SuvMwuG+5SnDODjeWZnIG4Bs3K2SDhPNO1UhkCyyzrdA4vlbT2Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T67MOxDN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T67MOxDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727572689; x=1759108689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ssZXEr5ls1Tr2RFUpybDuYsWeUvvCchzAc7ge6XDDCc=;
  b=T67MOxDN0TlNUgvS46EKUClRauvNsqvB2hPlSAJOz7getJ4/EDhMK3Cz
   mgwYg6PzkbROFK+5I93UgSn/rz5p9y/Un99Dl5D3BoNYPFF+ZNNfRMg0t
   pw+NqXPXiAnGCtPuH+NnrDdM6BjeQkWHF4oLJz5JT00tMkhxzR58UDQHx
   ZhPiYj/et+oQfZplT0qmxF3rEqVjmvZ81/4R6a3nCEVtE2JSs2R/UCHo/
   Y2OWMgqaXIqgDSYUQHTuQ6XWINIikCL8lzWF6NnWEnwKxzSloCHTu66ZB
   ETOXD0adveXevglfJDejgjSpE11p4kIb8jA/QP0SL3CjMICZfNsGUH0cl
   A==;
X-CSE-ConnectionGUID: eJXpj9D7S0ic/9IBelbjPw==
X-CSE-MsgGUID: jT9ba+1XR8GSRxi1xnb/MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30479207"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="30479207"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:18:09 -0700
X-CSE-ConnectionGUID: eJDLojeqQSaKOjzCsifxbg==
X-CSE-MsgGUID: DrJCjpe5RvGFVmXRY9f8Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72588800"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Sep 2024 18:18:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suiZZ-000Nnn-1m;
	Sun, 29 Sep 2024 01:18:05 +0000
Date: Sun, 29 Sep 2024 09:17:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Litao Jiao <jiaolitao@sangfor.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 21579/30000] net/smc/smc_core.c:770:6: sparse:
 sparse: symbol '__smcr_link_clear' was not declared. Should it be static?
Message-ID: <202409290926.Ll8zQyOY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 7dad816cb1f8841fda526c0978c10a94793f1178 [21579/30000] anolis: net/smc: Resolve the race between SMC-R link access and clear
config: arm64-randconfig-r131-20240925 (https://download.01.org/0day-ci/archive/20240929/202409290926.Ll8zQyOY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290926.Ll8zQyOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290926.Ll8zQyOY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/smc/smc_core.c:770:6: sparse: sparse: symbol '__smcr_link_clear' was not declared. Should it be static?

vim +/__smcr_link_clear +770 net/smc/smc_core.c

   769	
 > 770	void __smcr_link_clear(struct smc_link *lnk)
   771	{
   772		smc_wr_free_link_mem(lnk);
   773		smc_lgr_put(lnk->lgr);  /* lgr_hold in smcr_link_init() */
   774		memset(lnk, 0, sizeof(struct smc_link));
   775		lnk->state = SMC_LNK_UNUSED;
   776	}
   777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
