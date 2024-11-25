Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7B383
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 03:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732504414; cv=none; b=VDPOzFWls3BXA4HKRZCqa2Jh0pLvBH/H3xbKNzsm5nD4PjkS5MCZSgDovBP7vZNDOEES+I/t3qbfghMMK/1koTD6eFrLSzkxK6V8h5rn05R5qWPJGXV5AVGI527TKF3xRDtUhTRmIF0zurjSTB+CY0+A3Oak/engbdlrIp51NWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732504414; c=relaxed/simple;
	bh=8zizghsVJ5TCismM+KuC5JiSezCBDz22QL5bh2elCYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JafmPr16y4cDHNvztDzV74haKYh47wluiBEwp0gjFk4n/zEompUDOu/Q7Wg+azIthsWKsdzbQuxllYQ1JvHj+jiepzBs6HgMcHSZD8tKGOOD9u9Qzpktsw8j0ZCEf7maCqgnEnd3wkRHZWGXhpVerrysyqycRL6rXE26mzwAIuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LElMu2mW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LElMu2mW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732504413; x=1764040413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zizghsVJ5TCismM+KuC5JiSezCBDz22QL5bh2elCYk=;
  b=LElMu2mWXV7KjZrPTURybpyZ//DwAJwWOzWlkUSyDc+CErCNHkIqkD/8
   q8tz9einXBcScoCMf/SXmPWZpvhB1GLcyk2nk8vWAiNQp7QomjGlFL/1G
   OO220/XL4QqwEm83vm7lXJfCZw5IV3ooS8iD1YL4HDpWJ3uokeexca+A4
   CE55bZ8X0lUe1kGK7BzH6EWIRPBeRt1sNxjcmsCRz/jpSvM8iCqLyYbeL
   dLvdE83onRM8zmFgDO/Gz9yBRSjXZIgkjXbETBiZPV+7lDMCvXMdC19F7
   Nvr00XV+X5WwCuyfaE5+tMH0RmHSC9BSPoow3LcDFr1y9a7V0bOaz4dnE
   A==;
X-CSE-ConnectionGUID: KkHgIRFxSsS5HGomSdWwRg==
X-CSE-MsgGUID: dRYISip2R2m/yfIiJ8RkvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43654734"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43654734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 19:13:33 -0800
X-CSE-ConnectionGUID: tpZkrW8hQQWuXWtXsXiLaw==
X-CSE-MsgGUID: OUvxxIraTd+4K54xbTNZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="90929147"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2024 19:13:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFPXV-0005fB-19;
	Mon, 25 Nov 2024 03:13:29 +0000
Date: Mon, 25 Nov 2024 11:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.cred 2/27] include/linux/cred.h:190:51: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202411251159.evI6yVgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.cred
head:   a617a3cb721d5c4fdc88889c7d80936831efe7df
commit: df0177575e5e6cc90351b898384103bc4d14aa80 [2/27] cred: return old creds from revert_creds_light()
config: x86_64-randconfig-123-20241125 (https://download.01.org/0day-ci/archive/20241125/202411251159.evI6yVgt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251159.evI6yVgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251159.evI6yVgt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/overlayfs/util.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/cred.h:182:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:182:41: sparse:     expected struct cred const *old
   include/linux/cred.h:182:41: sparse:     got struct cred const [noderef] __rcu *cred
>> include/linux/cred.h:190:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *override_cred @@     got struct cred const [noderef] __rcu *cred @@
   include/linux/cred.h:190:51: sparse:     expected struct cred const *override_cred
   include/linux/cred.h:190:51: sparse:     got struct cred const [noderef] __rcu *cred

vim +190 include/linux/cred.h

   187	
   188	static inline const struct cred *revert_creds_light(const struct cred *revert_cred)
   189	{
 > 190		const struct cred *override_cred = current->cred;
   191	
   192		rcu_assign_pointer(current->cred, revert_cred);
   193		return override_cred;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
