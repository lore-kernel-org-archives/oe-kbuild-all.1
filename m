Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF100F9D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751205513; cv=none; b=D+sfDFqMFliXlq2HJSc5KIBY56fauYC+h8n6yD0KdndF6hob3fjvYgEKyxYh/EaJs6IBPdDiUu9Z2S6sdn/PreiBnIXpNMcQM0rt7tWU2uYrQWmT8Om6hK8wYYv27vStEY7oSpC9ts3/Ft0zAe4hECk/JW6wpzj3gaEbNzD7AUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751205513; c=relaxed/simple;
	bh=k8wCRnnvKaRHhFGu8LurLm4GU8KP/Rqlweg58nBS3xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h0jIaozv2A70YyKJcsISnI6/u1DHYNoO/nqbN9AK5b5lc89IpDL4plG72ActUv0xz4E8HuamZ9PIxvaMiKc3FOVk76IIqq5zpc3nUClye6LSASsAbiNihoXZh2IxzfE+d8THrBRUKzEFHeEgTyLlfODE6TSILPp8JjPxUW9X8Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/AWWQ2f; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/AWWQ2f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751205511; x=1782741511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k8wCRnnvKaRHhFGu8LurLm4GU8KP/Rqlweg58nBS3xQ=;
  b=R/AWWQ2f/KzgxjE7RDpYwqO7IzVGsqoaburucJwFrSCUuVW60UPQWcvr
   V3CW1jPaXcLuiaU/uOHXAffZvncpLg3SgfqzfgawnEPBQVPmvrBTH2pVv
   G1YpssNv/uvpYeRubHp7MdKqlp/lNIf5oE1+c2CUFnv16B5Fz8dpYRYr1
   jFAOA7iTbSGgV2Dwz9YJ4PWzfS8paJDUYnvWO3Cy5W7GAmO2Iatc2um8w
   +oDPMzWkEKp0W5qrORyjnZ33MzLoyKHCFrmPe7ly+2Dt04ZbyM53UAJ6O
   /y+NU4fXaZNPbOSkn3FspyWvl4zUrfAVhUOU5wWLL6tJJFOXM5pCjoF6x
   w==;
X-CSE-ConnectionGUID: c4YuKakJTmGn/Y8SGnaFAQ==
X-CSE-MsgGUID: oMfRdukJT3yaWQePwItJEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53166085"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="53166085"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 06:58:30 -0700
X-CSE-ConnectionGUID: eav0vtzvQjmVwsED3VB7qg==
X-CSE-MsgGUID: ESpeadUXToi6bBW0+k6TJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="158957268"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2025 06:58:30 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVsY7-0000up-1J;
	Sun, 29 Jun 2025 13:58:27 +0000
Date: Sun, 29 Jun 2025 15:57:51 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411] drivers/crypto/ccp/hygon/vpsp.c:589:6:
 warning: no previous prototype for 'vpsp_set_default_vid_permission'
Message-ID: <202506291537.ZBDFCNhr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: e2861aaa47961017ada7f66de11104bbf3b85eb1 [2411/2411] crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250629/202506291537.ZBDFCNhr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291537.ZBDFCNhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291537.ZBDFCNhr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for 'vpsp_do_cmd' [-Wmissing-prototypes]
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


vim +/vpsp_set_default_vid_permission +589 drivers/crypto/ccp/hygon/vpsp.c

   582	
   583	/**
   584	 * When 'allow_default_vid' is set to 1,
   585	 * QEMU is allowed to use 'vid 0' by default
   586	 * in the absence of a valid 'vid' setting.
   587	 */
   588	uint32_t allow_default_vid = 1;
 > 589	void vpsp_set_default_vid_permission(uint32_t is_allow)
   590	{
   591		allow_default_vid = is_allow;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
