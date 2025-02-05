Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC922A81B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 08:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745295; cv=none; b=uT9NxNd7JdO2NFkW/PmElokJTLzxyP/vuKsiRikedhgwRiuWdwvBcgbQJNTb1Loebh5b93OricG8vs6FZWCxRC66WroF4qhHvxChS44+ZbSKqybOuqEdZHbAvlH9ySEJum3wX2ZZiTyjZv/NetethdHInE+mKB7dzQDyT8N2u9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745295; c=relaxed/simple;
	bh=Y6k9CdtjgZkNewEJOnFHF6vwoWpjN3BBUPoDzghWSRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qbGMcLxLHSmhLOWuxo0sPyCcKdbY57J8f2i+NZvRwZddgywx1WuyuYzXCscl953ncgUAC81aHvsY7RB4LD5dc5UpGI7dVYilQ2eJxh2PMcjCCeyXwQ1ywAM7HKS4KIe321kdjVuvlcJkjLZO5fWBi6uHDsEwJhcLihiLgpzDFGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixL15ula; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixL15ula"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745294; x=1770281294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6k9CdtjgZkNewEJOnFHF6vwoWpjN3BBUPoDzghWSRE=;
  b=ixL15ulaoy397f8oBuURI5ZNXlTEIe5MMThWWbtE6KdjBaxrk/HAymQt
   IEWpg3Bf3NRNIJZNVk0I9+gfMn5iw2D1sVzhRoNeHQIvCHgwqSxJolutf
   zKEyN/nRjOAEp7podrPIypm7OjEXENaCpSYiAgvdhxfvgMdch7Ne40qqT
   tPTN0gHwS+h7sPqRFS7HCUuS8INDhBhv31dbP/cWc0Pk8BpOwV1c6XM3n
   mtKbVyTSTtYfrHtCJqsJoDexigHbvxh4X14wyQ0a1f9VSfAb9S6Zl6rPw
   UW+5qPFfqm/8wA5OcWAu3Erhi/pCllfD9i7T4lLIB73sCPwzD8VHZEorK
   Q==;
X-CSE-ConnectionGUID: x+ASMsWoTWeat5wfLMlo8Q==
X-CSE-MsgGUID: WbKmR5WuQUKKbsuNYcRZqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42960912"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="42960912"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:48:11 -0800
X-CSE-ConnectionGUID: Dvqx+aFKRPu443sK5m0WUg==
X-CSE-MsgGUID: THd8eCXGRLWG5CETgrJMkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110692064"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2025 00:48:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfb4p-000tfb-1R;
	Wed, 05 Feb 2025 08:48:07 +0000
Date: Wed, 5 Feb 2025 16:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/firmware/arm_scmi/tinysys.c:318: undefined reference to
 `scmi_protocol_register'
Message-ID: <202502051657.E8JYASut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: f1e104ed61ffbb353b91e2a25e09f96ac805bd4c [192/192] CHROMIUM: firmware: arm_scmi: Porting tinysys_scmi driver
config: i386-buildonly-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051657.E8JYASut-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051657.E8JYASut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051657.E8JYASut-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   ld: drivers/firmware/arm_scmi/tinysys.o: in function `scmi_tinysys_register':
>> drivers/firmware/arm_scmi/tinysys.c:318: undefined reference to `scmi_protocol_register'
--
>> drivers/firmware/arm_scmi/tinysys-scmi-drv.c:71:5: warning: no previous prototype for 'scmi_tinysys_notifier_fn' [-Wmissing-prototypes]
      71 | int scmi_tinysys_notifier_fn(struct notifier_block *nb,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +318 drivers/firmware/arm_scmi/tinysys.c

   315	
   316	int scmi_tinysys_register(void)
   317	{
 > 318		return scmi_protocol_register(&scmi_tinysys_protocol);
   319	}
   320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
