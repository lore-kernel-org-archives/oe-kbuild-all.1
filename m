Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15622E9756
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760777159; cv=none; b=cOVxPcx9EdYWc7qyntbu5zswWtlGAPplDpoFY0UZ8FOQbtGtyNlHXJWnQOfEA6RrJs6GspwR9w01UaZf4xkLXQO9FOGsNwsB/gQubLm7Nt1xR7L2xrZxsA87emVq1fZKuj+gJZkOeIxRMMgC3qaXZ2ws81m7TFQKOINFeegMmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760777159; c=relaxed/simple;
	bh=ZSRtSOTvmFSaRCr+PYDOxpChHp6yh+niXyz9P4y2Q+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5vl0xcCTxNLydr71tZ90faXCPJoiiQ+a38VelBL7BMjSJ4gQBGyCPmtwyrp7QJbfUxDCxv7xYFWLRtcNGZrJlFTG58xOXymbqJWS3pw554yErFZaQ79BtpAQWTGlRY1RNaUlIE0Me8SGk3ohPDnyPnjAyX7B6qaN00f7pfPW1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfBLCww+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfBLCww+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760777158; x=1792313158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSRtSOTvmFSaRCr+PYDOxpChHp6yh+niXyz9P4y2Q+I=;
  b=VfBLCww+d2KjbAs/PSME4ZYicQtLXvxmVCccd4Q6lLMePVr53ulZnF6Y
   s+29DNAVYzFaBkE4DYwx+jFQnr3jhM060i70hF7yWIn3qpAnNPR7NFUXL
   MO+PE4Ov5l6jxHaseXq4gC5KEqIEUn8axHREfsiGSHEpUYPs+Apxz7jR8
   DCt4L1saF2KjBNhaPdLvhczfhOe4e5hARKS1BW9cmrdx0BS97IVo18PH0
   zPfyWn35rWGxMV02SEIPhXIusU6pCQaQmUrDeo7SuzsFUbrrpGO9LjtHq
   toGUl+0yAxHP12X2WkMxgOdPzGJWZBXAuIM5CKh+5DHeZewTvdJcFc4y4
   Q==;
X-CSE-ConnectionGUID: tQPSN8g5TlOxkCkrnAqsfw==
X-CSE-MsgGUID: /3nZQMOQR5WZD2HKmoXqWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62684761"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="62684761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 01:45:58 -0700
X-CSE-ConnectionGUID: /w5cnCXoTmuGdfFNNdiCsQ==
X-CSE-MsgGUID: gmgodB2KQeGE/nORI3ZbhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="183684457"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2025 01:45:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA2ZW-0008Ap-0r;
	Sat, 18 Oct 2025 08:45:54 +0000
Date: Sat, 18 Oct 2025 16:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.17/fixes 4/6] drivers/pci/msi/irqdomain.c:156:3: error:
 implicit declaration of function 'irq_chip_shutdown_parent'; did you mean
 'cond_shutdown_parent'?
Message-ID: <202510181637.1fbpVcUm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.17/fixes
head:   2204ae45596c83fbcec13b2e8776b66d2e41a261
commit: 9c72540edfd20c69769955971be0675cf3e73bbb [4/6] PCI/MSI: Add startup/shutdown for per device domains
config: csky-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181637.1fbpVcUm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181637.1fbpVcUm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181637.1fbpVcUm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/msi/irqdomain.c: In function 'cond_shutdown_parent':
>> drivers/pci/msi/irqdomain.c:156:3: error: implicit declaration of function 'irq_chip_shutdown_parent'; did you mean 'cond_shutdown_parent'? [-Werror=implicit-function-declaration]
     156 |   irq_chip_shutdown_parent(data);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
         |   cond_shutdown_parent
   drivers/pci/msi/irqdomain.c: In function 'cond_startup_parent':
>> drivers/pci/msi/irqdomain.c:164:10: error: implicit declaration of function 'irq_chip_startup_parent'; did you mean 'irq_chip_set_type_parent'? [-Werror=implicit-function-declaration]
     164 |   return irq_chip_startup_parent(data);
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          irq_chip_set_type_parent
   cc1: some warnings being treated as errors


vim +156 drivers/pci/msi/irqdomain.c

   150	
   151	static void cond_shutdown_parent(struct irq_data *data)
   152	{
   153		struct msi_domain_info *info = data->domain->host_data;
   154	
   155		if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
 > 156			irq_chip_shutdown_parent(data);
   157	}
   158	
   159	static unsigned int cond_startup_parent(struct irq_data *data)
   160	{
   161		struct msi_domain_info *info = data->domain->host_data;
   162	
   163		if (unlikely(info->flags & MSI_FLAG_PCI_MSI_STARTUP_PARENT))
 > 164			return irq_chip_startup_parent(data);
   165		return 0;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
