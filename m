Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52B352C35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 05:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781068882; cv=none; b=sZbKsQ9F9k/4Cf5BvEhJHUNCumPfDHwtAbe8FzA7AwAoZF0YLF+c2txzr+4OEDTKT969uDeHYd4yIFr6EQrqu7wRNejAFQzAi6yMElqLvRa5BAlsEZMvjlC/lpVnF4au22HmxNAFm+Z42sFdL6t4AFiRWpEoFJgez/kedSZtQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781068882; c=relaxed/simple;
	bh=M7tELnQhajuWNUAKZGdQYpEoQBjyCBIW+hVqN8eFhd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVrmE9AJDpHmzGnotmeE0BiKJR9tSs6FII/xmNYo0KMKQfP3XRPZ+aLgjFK7RE4QhBv/+h7UtOzUboB4+X6ctYXQAZpG8/ogFuuyZliyXc25gndyZsWnScoFJaODuv2H/sF5bs34ZBtUDcdBoCtUEjb1V5gsWzmCB/S9rXFUOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a67GqHJP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a67GqHJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781068881; x=1812604881;
  h=date:from:to:cc:subject:message-id;
  bh=M7tELnQhajuWNUAKZGdQYpEoQBjyCBIW+hVqN8eFhd0=;
  b=a67GqHJP1aBCdgrvXVcNqEOkP72cT3v6yagUEkc8zrP4cCnsQ6KHDHZ0
   lbE3SxEx+zzOtGe95mAwrrib8V5A5i5MDt8RXJCPOsstzVoES41SKs4mB
   RN8oykAa61jY8vXzufz2+K3F1klzNMzBVJgbjqsjBZA5hem41aMCCZw59
   9EXXGavRs08bQV8yMxFIoapuMkMX2CTXTwamZ/Qtzgq9vJZo2291GFoJW
   l3mAnX+0d5BuJYG3dQjV0SKqRtbJSFkgwiR1bOCsUb3wJCZLb6t3pz+PB
   p6qPZYllt5zRqFo53UhTygDLl+w6VKhHa+Ymo+/t8/PKDgiZObZo1vb9H
   A==;
X-CSE-ConnectionGUID: MJ81jhgFSGGGkWipWRWvtA==
X-CSE-MsgGUID: Gu0AZQ2ET5yJHTw9UpicAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84421368"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="84421368"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 22:21:20 -0700
X-CSE-ConnectionGUID: O51jEB51TJGU44OpLwf/Bg==
X-CSE-MsgGUID: YZRXdS5sQVmDTy5sfWM4Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243096125"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2026 22:21:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXBNM-00000000Kvy-3GiZ;
	Wed, 10 Jun 2026 05:21:16 +0000
Date: Wed, 10 Jun 2026 13:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>
Subject: [linux-next:master 10407/12670]
 drivers/nvme/host/sysfs.c:357:30: sparse: sparse: symbol
 'nvme_ns_diag_attr_group' was not declared. Should it be static?
Message-ID: <202606101329.T3zXNqdy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
commit: 37afebc79a11bd889fe8e0a98c9ae034c3cff323 [10407/12670] nvme: add diag attribute group under sysfs
config: microblaze-randconfig-r131-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101329.T3zXNqdy-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101329.T3zXNqdy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101329.T3zXNqdy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/sysfs.c:357:30: sparse: sparse: symbol 'nvme_ns_diag_attr_group' was not declared. Should it be static?

vim +/nvme_ns_diag_attr_group +357 drivers/nvme/host/sysfs.c

   356	
 > 357	const struct attribute_group nvme_ns_diag_attr_group = {
   358		.name		= "diag",
   359		.attrs		= nvme_ns_diag_attrs,
   360		.is_visible	= nvme_ns_diag_attrs_are_visible,
   361	};
   362	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
