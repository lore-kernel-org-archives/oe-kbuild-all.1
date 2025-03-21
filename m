Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E578BEE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 09:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742548022; cv=none; b=Y9m3sX20GvOH4Pi0UbtOOXrJhJhFSHo056xehrR7aZd6tPfZNkuWRgyq0KWFYbGzLEJi089V3dS3PdML46eDUmw5WoHgoF1v4DDL4sFzO1TIt4CLna8sA+IoUzINKEBvNwP5ZcwAiAeW2craZXQLWBiK1LKh/7ja45luLh/LF4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742548022; c=relaxed/simple;
	bh=ul7CfSeUaWuBtceyuR/J8GsjwNrCXI8nP0Rj5T3ooAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FilW9drQg4a958IhlM+UsR522KkzI6//4ZeSJEqsa8g6XYP04ZiO+hYaG1kHGgtRVceEzEchepKcOZ9fwrWKJV766djMy7IhY7yVqz/ab2P1bsgBzlyYuqmBsRcwLOM18Brx4nGZ8h7E303LSRN7ngkxbXF5eL7RpBVwedHNXE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPS+mzts; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPS+mzts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742548021; x=1774084021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ul7CfSeUaWuBtceyuR/J8GsjwNrCXI8nP0Rj5T3ooAg=;
  b=UPS+mztsHaWDAhoVbFWzTTtaE/DrJHmOqd/f2Z9YubtkYvNhxVNYAR9S
   T0CAJmTWjBBDWQNwtxZ1FKFvHQw6jYKWhAqZP6YGM4oNx8ARdbqnRXa17
   heyXp8giiQLucjaTgIAUZVWIQFdfC+Z+lbELx0YBNJQB6LwGFKdqGMpYC
   2sL8Qtn5RGCt60O7bLUnHIvDDWOfXSAeXuVPzZeuul3pXz4A2scP/2ELt
   fcCGbet5COk7vyhuIFlklC61oHSmtMHEvuqv9S5yIVJGUmH4rM74YbzF6
   ujge+idRRC+0HEM+7qFhYUeB3cyNEmbkuvnnuBe8gyV8YLFv0pxAIac6c
   w==;
X-CSE-ConnectionGUID: d4DMqVMjSteGLJN19Cztqg==
X-CSE-MsgGUID: U9Q05jqFSkW144zioL6KFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47583921"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="47583921"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:07:00 -0700
X-CSE-ConnectionGUID: NLm5nu8kRa2bHPPy2QjZGw==
X-CSE-MsgGUID: wPJkXU+wTAy/Byg6qJHEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123866876"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2025 02:06:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvYKx-0001CN-1v;
	Fri, 21 Mar 2025 09:06:45 +0000
Date: Fri, 21 Mar 2025 17:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/drivers 20/24] undefined reference to `__ffsdi2'
Message-ID: <202503211748.QH9oyt9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/drivers
head:   ba8755ab541fc629948233125db870d4dbf00a75
commit: ee7f8ed72990f28657b5bf598e695fcf4633f4ed [20/24] platform: cznic: turris-omnia-mcu: Refactor requesting MCU interrupt
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250321/202503211748.QH9oyt9m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211748.QH9oyt9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503211748.QH9oyt9m-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/platform/cznic/turris-omnia-mcu-gpio.o: in function `omnia_mcu_request_irq':
>> (.text+0x2660): undefined reference to `__ffsdi2'
>> alpha-linux-ld: (.text+0x2668): undefined reference to `__ffsdi2'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
