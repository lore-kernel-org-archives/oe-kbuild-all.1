Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1662A200D2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710070989; cv=none; b=OHD1kIPy48425JnebpxF8zKY+2ZbR8d4as+SNYwr83f06/eJxgRAbSWGXbpdsv310p+HhRSRxlgvLNwaznU48qm0heFXAsUONBEipHyBefPa9o69rD5aj39+aJUtJPRMH40qV/r/PJc/nsdghj9KGpRjpG6DyNHxTH7AHgcYL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710070989; c=relaxed/simple;
	bh=gv4LUpBbxoi3vY6Cmj6FYMYE4Ez9cJ1GVxZBdSSeOdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iuT/ukRVLNyb6SqRFhdvMQPLGih2vXrbXZDyKOb1ssdHKy0eI2vtMwGEj26j61WVAarvOGy6fFFVogG/Zb1tMu4InhW+l7iQnOTq9/jITTYZdL31OFP07xHudfE9yoW7YBEU4/8DBosOPEecH1n0F1M9gednFJZZYGarx7e4A3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UvhBgBQb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UvhBgBQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710070989; x=1741606989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gv4LUpBbxoi3vY6Cmj6FYMYE4Ez9cJ1GVxZBdSSeOdg=;
  b=UvhBgBQbq4gI3NbomxVJGHZsnNk7yLsRp3V3xZ1N1myz6xV1uTH2I6Cz
   I2KRnBl4R9o0nLXJdmczaHCsw2lwutT/LUhf6We2qaXrV3iF49CYaEmvi
   utXJ3s4+O76ifqaeFSgFLycVnyzZU7FXVC96daP3wx15qfQbX2GWp6Kwt
   O6u8hMipiubOEAOFn+c+jESmfR9J8QM7jS/AcFKwNVBSkiNT/E55Wlrpq
   9RvgElqxoL8403biggsFPV4nNtKkwP4cviDr77RKqiA4g50ilN8Yi/S8C
   1gwG76LFs1hwfOM8nI+xb/0h7SRVnHKCAQtAoQ3Kv9k0rCDs+lnv7vSKH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4603799"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="4603799"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 04:43:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="11303846"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2024 04:43:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjHa4-0008DF-1P;
	Sun, 10 Mar 2024 11:43:04 +0000
Date: Sun, 10 Mar 2024 19:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.8-dango_2 12205/12225]
 block/blk-nvmem.c:167:13: warning: unused variable 'ret'
Message-ID: <202403101923.pfdH4yG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.8-dango_2
head:   f60356397a938945300aed3f86c82a9db16bd3b9
commit: 773bd9e74b43d77e46fd8e49a126754b217ce0f5 [12205/12225] block: implement NVMEM provider
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240310/202403101923.pfdH4yG4-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101923.pfdH4yG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101923.pfdH4yG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/blk-nvmem.c: In function 'blk_nvmem_init':
>> block/blk-nvmem.c:167:13: warning: unused variable 'ret' [-Wunused-variable]
     167 |         int ret;
         |             ^~~


vim +/ret +167 block/blk-nvmem.c

   164	
   165	static int __init blk_nvmem_init(void)
   166	{
 > 167		int ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
