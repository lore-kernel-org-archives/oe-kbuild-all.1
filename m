Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59F830170B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761293288; cv=none; b=AYtZfvpxMGJPPkVrhTlnLHZDj79J6XXiIjnoqx/fdLpiMMrnqwIcM1r7h5jmPXdpO+6JtouneHDeU87OTtTIP/q4edFwbNnAM96n32O4OgtweExHr+IZlQ6g+4K80GzvsoBbnat293Z1T+yKM8JgHYzDZJsAugOKpLubx9WIG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761293288; c=relaxed/simple;
	bh=nw6/Lzb9nJW94fiEjh/16uCkfuy345vT8/bfpTy/z74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVvIFNI7PIa3Z9xjV1JxYYMAT1y+U3oxITaYB+o2ELPMw9a7zmL/H7XdZG1Oa1MJa7rezIDaAnQ7ow13N06xwl0pa0tUknwuR7wuMiDfpXP9strtGEp5eoRP7XAirFNzWucCeM36fMXKlm1LC8q0Dju09BRSHd6lltV4iKvyuj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBJ22gKC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBJ22gKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761293286; x=1792829286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nw6/Lzb9nJW94fiEjh/16uCkfuy345vT8/bfpTy/z74=;
  b=NBJ22gKCxL5vfD/5Envk/4GEnnB7EyS/76zVvw2c7RXqvyeeYKH6PUi/
   gHbuWY6rQrNOUGEOIGuyFITu/MzYzQWeOVB4fsubMrIHfiH0c1hmyMJRH
   cAYUKnPW4sxfadm9JwsZpqYwOsnkiQW2rWmNLlStFlaO7Vx4QclOOutcM
   h/F8mISZtKUPeAnSdEsdZEppMHeW+4CvtQKPPNWoAUs0Nkc7wmVXANl4K
   pqExD8ATr09QPjrk6jQctNI6TiscdxCTSkT1XdiK/xzWTfgOET2Dw7spo
   RQUwsFFhEQdyPte5atH+HmUr3nvSQgnUq+Asy4bEdy79X5GuG3OdyL8v6
   A==;
X-CSE-ConnectionGUID: 467EEBIhRpSgmaoju4EGJA==
X-CSE-MsgGUID: lD4zdAwZTEOjMiUNCJzbBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63363256"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63363256"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 01:08:05 -0700
X-CSE-ConnectionGUID: B7Sr7kolTNCljG/LubeJUw==
X-CSE-MsgGUID: 78WyWlHgQiq3Gr92I28yIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="183598566"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 01:08:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCCq5-000EJx-1A;
	Fri, 24 Oct 2025 08:07:57 +0000
Date: Fri, 24 Oct 2025 16:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/ixp4xx-mi424wr-switch-tagging 3/3]
 drivers/net/dsa/ks8995.c:579:12: error: redefinition of 'ks8995_setup'
Message-ID: <202510241652.EStgYXa0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-mi424wr-switch-tagging
head:   0fa196b91fd54f6e8199b112d3f9d4a6888a330e
commit: 0fa196b91fd54f6e8199b112d3f9d4a6888a330e [3/3] WIP: dsa: ks8995: Enable tag handling
config: xtensa-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241652.EStgYXa0-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241652.EStgYXa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241652.EStgYXa0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/dsa/ks8995.c:579:12: error: redefinition of 'ks8995_setup'
     579 | static int ks8995_setup(struct dsa_switch *ds)
         |            ^~~~~~~~~~~~
   drivers/net/dsa/ks8995.c:539:12: note: previous definition of 'ks8995_setup' with type 'int(struct dsa_switch *)'
     539 | static int ks8995_setup(struct dsa_switch *ds)
         |            ^~~~~~~~~~~~
>> drivers/net/dsa/ks8995.c:539:12: warning: 'ks8995_setup' defined but not used [-Wunused-function]


vim +/ks8995_setup +579 drivers/net/dsa/ks8995.c

0fa196b91fd54f Linus Walleij 2025-06-26  538  
0fa196b91fd54f Linus Walleij 2025-06-26 @539  static int ks8995_setup(struct dsa_switch *ds)
0fa196b91fd54f Linus Walleij 2025-06-26  540  {
0fa196b91fd54f Linus Walleij 2025-06-26  541  	struct ks8995_switch *ks = ds->priv;
0fa196b91fd54f Linus Walleij 2025-06-26  542  	int ret;
0fa196b91fd54f Linus Walleij 2025-06-26  543  	u8 val;
0fa196b91fd54f Linus Walleij 2025-06-26  544  
0fa196b91fd54f Linus Walleij 2025-06-26  545  	ret = ks8995_read_reg(ks, KS8995_REG_GC9, &val);
0fa196b91fd54f Linus Walleij 2025-06-26  546  	if (ret) {
0fa196b91fd54f Linus Walleij 2025-06-26  547  		dev_err(ks->dev, "failed to read KS8995_REG_GC9\n");
0fa196b91fd54f Linus Walleij 2025-06-26  548  		return ret;
0fa196b91fd54f Linus Walleij 2025-06-26  549  	}
0fa196b91fd54f Linus Walleij 2025-06-26  550  
0fa196b91fd54f Linus Walleij 2025-06-26  551  	/* Enable the "special tag" (the DSA port tagging) */
0fa196b91fd54f Linus Walleij 2025-06-26  552  	val |= KS8995_GC9_SPECIAL;
0fa196b91fd54f Linus Walleij 2025-06-26  553  
0fa196b91fd54f Linus Walleij 2025-06-26  554  	ret = ks8995_write_reg(ks, KS8995_REG_GC9, val);
0fa196b91fd54f Linus Walleij 2025-06-26  555  	if (ret)
0fa196b91fd54f Linus Walleij 2025-06-26  556  		dev_err(ks->dev, "failed to set KS8995_REG_GC11\n");
0fa196b91fd54f Linus Walleij 2025-06-26  557  
0fa196b91fd54f Linus Walleij 2025-06-26  558  
0fa196b91fd54f Linus Walleij 2025-06-26  559  	ret = ks8995_read_reg(ks, KS8995_REG_PC(KS8995_CPU_PORT, KS8995_REG_PC0), &val);
0fa196b91fd54f Linus Walleij 2025-06-26  560  	if (ret) {
0fa196b91fd54f Linus Walleij 2025-06-26  561  		dev_err(ks->dev, "failed to read KS8995_REG_PC0 on CPU port\n");
0fa196b91fd54f Linus Walleij 2025-06-26  562  		return ret;
0fa196b91fd54f Linus Walleij 2025-06-26  563  	}
0fa196b91fd54f Linus Walleij 2025-06-26  564  
0fa196b91fd54f Linus Walleij 2025-06-26  565  	/* Enable tag insertion on the CPU port */
0fa196b91fd54f Linus Walleij 2025-06-26  566  	val |= KS8995_PC0_TAG_INS;
0fa196b91fd54f Linus Walleij 2025-06-26  567  
0fa196b91fd54f Linus Walleij 2025-06-26  568  	ret = ks8995_write_reg(ks, KS8995_REG_PC(KS8995_CPU_PORT, KS8995_REG_PC0), val);
0fa196b91fd54f Linus Walleij 2025-06-26  569  	if (ret) {
0fa196b91fd54f Linus Walleij 2025-06-26  570  		dev_err(ks->dev, "failed to write KS8995_REG_PC0 on CPU port\n");
0fa196b91fd54f Linus Walleij 2025-06-26  571  		return ret;
0fa196b91fd54f Linus Walleij 2025-06-26  572  	}
0fa196b91fd54f Linus Walleij 2025-06-26  573  
0fa196b91fd54f Linus Walleij 2025-06-26  574  	dev_info(ks->dev, "setup switch\n");
0fa196b91fd54f Linus Walleij 2025-06-26  575  
0fa196b91fd54f Linus Walleij 2025-06-26  576  	return 0;
a7fe8b266f6596 Linus Walleij 2025-08-13  577  }
a7fe8b266f6596 Linus Walleij 2025-08-13  578  
a7fe8b266f6596 Linus Walleij 2025-08-13 @579  static int ks8995_setup(struct dsa_switch *ds)
a7fe8b266f6596 Linus Walleij 2025-08-13  580  {
a7fe8b266f6596 Linus Walleij 2025-08-13  581  	return 0;
a7fe8b266f6596 Linus Walleij 2025-08-13  582  }
a7fe8b266f6596 Linus Walleij 2025-08-13  583  

:::::: The code at line 579 was first introduced by commit
:::::: a7fe8b266f659624309c69208be0410584bb9980 net: dsa: ks8995: Add basic switch set-up

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
