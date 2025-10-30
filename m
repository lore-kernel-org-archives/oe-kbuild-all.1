Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0252F9C2D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761864695; cv=none; b=SRXfkiOCEaDsyOa8ZCMW4uQjqnrpVH9ioRj9BaqB93gJkGtXtnLeRxzci9eViTYgWFfOCUEARnpBME+kCgeRZdcmvMWUJQ/ABMkA/6jpVawPjz+ubvrOsYTL7SsBqVeaKvfMTFlowhVBg6Co92oZj45KM14fqctdcGWh4fQ3mPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761864695; c=relaxed/simple;
	bh=Lt/yE8G2bXJ7JoJQ/zbXewnW8GnyKHz2LvbIDjxigrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfU/8Ai63Kb/bSLfoiY3n4B/CY6J8PvxagfF/nSBiirYlefc1hnKTW5zJH3zAkzWm9EsY1WCkkYY1mulUgRVMXz+eDmFbhU/pcaMh7UNSaFbrJ3Qv2RX5Pg64aQgvPituZUSVKN5oYUpdqCPGZXDzu/alWTKHWgcQpCFh0G4fdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4jqaQsx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4jqaQsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761864694; x=1793400694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lt/yE8G2bXJ7JoJQ/zbXewnW8GnyKHz2LvbIDjxigrE=;
  b=d4jqaQsxtUtkqjOhimXmj2upZx9GU0kPVtzi67W7Jy0Mle+ggZ/RXObP
   mnYWk1JwJTjxTIssXbjXuXJbJ+INPIdzRVzUGfnDcZCpbAQZwWOnJeYpU
   BXgepIfYlSKzamnhhA9XQGLrh3Rdg+Myb0EUASrLtc3TeCbsJI9pbKRnm
   Twlsmr/FLIpiudZKkGDMeDt3PplfQs7Gpt9EJH1YIw42GnxMiKdoT3oak
   vtLKyBCkvXZWE0vFv1s33Wggb8Ye7CHrOIgevoR1opSLCQPcL8X9VeEi5
   qYtxSAwXLjmio5f4p7po0ITMzqTHlvEHaYJZ6+uRUuOq4zQJ4/hZ8Chog
   g==;
X-CSE-ConnectionGUID: ZndPM5TITNGGUgh0yIvRBA==
X-CSE-MsgGUID: ehsoYBIYS92duZuvXzEa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63949060"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63949060"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 15:51:31 -0700
X-CSE-ConnectionGUID: oMCYHyTfTnSfFCqI9V2tgg==
X-CSE-MsgGUID: 24BHMfhURaOkU9lwiUeokg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186415654"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2025 15:51:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEbUO-000Mam-1m;
	Thu, 30 Oct 2025 22:51:28 +0000
Date: Fri, 31 Oct 2025 06:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio-v6 9/14] Warning:
 drivers/dma-buf/dma-buf.c:1319 function parameter 'dir' not described in
 'dma_buf_map'
Message-ID: <202510310640.dCSYuakp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio-v6
head:   6cfcd9b0566328445e8d9ff25e0078532f49cf2a
commit: 2edb89b4dfa58d343569abfeee962986a9fd757b [9/14] dma-buf: provide phys_vec to scatter-gather mapping routine
config: sh-randconfig-r054-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310640.dCSYuakp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310640.dCSYuakp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310640.dCSYuakp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-buf.c:1319 function parameter 'dir' not described in 'dma_buf_map'
>> Warning: drivers/dma-buf/dma-buf.c:1448 function parameter 'size' not described in 'dma_buf_unmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
