Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559DD84039
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782263183; cv=none; b=npThL5Zs0wZpr6PqtG6zCcknyGxRerGaLTnmocDFzYSgeZeuWyTPMN3oaM81HL6OBAITOrNtzUPL//DxpZLlfdn4dzzEWJZwk0nz/lRoCte71EbmaJn2LrjaADrtxd6tCYHDnPOMa+zoyIvNWb8ats7eFPZ0qcr8caqcEuqbn4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782263183; c=relaxed/simple;
	bh=U5m7KwZd52Y8L587g1zdndDEnnEMeRoDkgxaaIG4t3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B+2c69oQIht/o/Jbdc/BenqKtApIUoP8LSXdz83RzdCPdsUdc+GsjuzxkZxyeZ6d2AmRyZZJD+hkPtoMUxHo0LbW5DJUSjj0SjfN+TIAxJluPnFve5R8whFoK/W2jccgSRvUVU+ZRMVbr4rfEbMJYowDbT3I6MrWW2MuG4KD6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeGzmmOn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeGzmmOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782263182; x=1813799182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5m7KwZd52Y8L587g1zdndDEnnEMeRoDkgxaaIG4t3E=;
  b=AeGzmmOnx3972T0Swf0LlkTkZsjsqz7AvNEnveEpoSpgiK96PJE7M0xl
   umoad+0yaAiUctiaN0rhKkRAEcKlVs5U7gWrg4ip9qDXd8ku3/LzCft22
   4lETdpt/x46Bupkuzfz+k1RL5Uqx7SDkUAcr9jkxWJ4n/cxf+z/iflS6O
   +uqOnScor/9Im+maT/QJjmWV2fZ0o9J8kWjyjnzo3bnLSdaLSSU+FVYZ0
   3LHCXk5wDbT/wVj3wjVoh0sg5C/iGqZLD/uLOuGRmzp83dXHQoWQXlaBM
   BvadD+i413LeeY0Kc/V3YXrF/EhVc5w3UFMbnF5ntxjcs/NKsB3xKUXDH
   A==;
X-CSE-ConnectionGUID: YLBVdSZXTSmIxG9eGit+mw==
X-CSE-MsgGUID: KTZexh/zQxWUPx/W+dgkSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83056314"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="83056314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 18:06:20 -0700
X-CSE-ConnectionGUID: 6ZW+j8oWTG6/QwK0xl720w==
X-CSE-MsgGUID: c53p7LGwTuaJmcDloAq+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="245306653"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 18:06:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcC4D-00000000325-2tMg;
	Wed, 24 Jun 2026 01:06:14 +0000
Date: Wed, 24 Jun 2026 09:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 123/124]
 drivers/reset/reset-zte-zx297520v3.c:204:53: warning: cast from pointer to
 integer of different size
Message-ID: <202606240948.HgwPKSrM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: 64dd9c56a2aaf035cb2702b7d20cf6bf7901466b [123/124] mfd 2
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260624/202606240948.HgwPKSrM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240948.HgwPKSrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240948.HgwPKSrM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/reset/reset-zte-zx297520v3.c:7:
   drivers/reset/reset-zte-zx297520v3.c: In function 'reset_zx297520v3_top_probe':
>> drivers/reset/reset-zte-zx297520v3.c:204:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     204 |         dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
         |                                                     ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:204:9: note: in expansion of macro 'dev_err'
     204 |         dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
         |         ^~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:205:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     205 |         dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
         |                                                         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:205:9: note: in expansion of macro 'dev_err'
     205 |         dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
         |         ^~~~~~~
   drivers/reset/reset-zte-zx297520v3.c: In function 'reset_zx297520v3_matrix_probe':
   drivers/reset/reset-zte-zx297520v3.c:219:53: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     219 |         dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
         |                                                     ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:219:9: note: in expansion of macro 'dev_err'
     219 |         dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
         |         ^~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:220:57: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     220 |         dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
         |                                                         ^
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/reset/reset-zte-zx297520v3.c:220:9: note: in expansion of macro 'dev_err'
     220 |         dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
         |         ^~~~~~~


vim +204 drivers/reset/reset-zte-zx297520v3.c

   201	
   202	static int reset_zx297520v3_top_probe(struct platform_device *pdev)
   203	{
 > 204		dev_err(&pdev->dev, "my of node: 0x%08x\n", (unsigned int)pdev->dev.of_node);
   205		dev_err(&pdev->dev, "parent of node: 0x%08x\n", (unsigned int)pdev->dev.parent->of_node);
   206		return reset_zx297520v3_common_probe(&pdev->dev, pdev->dev.parent->of_node,
   207						     &zx297520v3_top_info);
   208	}
   209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
