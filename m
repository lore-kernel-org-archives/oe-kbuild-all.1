Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21A178CC4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 May 2024 20:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716927878; cv=none; b=bPCHYwn843MoKcCfYZ7X16w8eRJU+c2utz5Vx2OEDFiKd17wtCK6kxuc8hjX+jw5+88YHE1T3TWwy9htd1s64T5Ya4oE+GYB3uzVz0zj9ixR5Obf0KFEs+zaQ55pfla/CtHQuALz0I4+ADLVfszlaagI62bWuHuN2GY6KfiN50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716927878; c=relaxed/simple;
	bh=dglC6audh/9isJ7/6h4M1rNAgEJxTVjjb/a/Y5DhAWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UW1y4PGsvKOEpPns4h6oHHieJ2H0OrB+T65tnTdjJV8hyDRNQ1fxdFBT7jE1AVzgNue4hs8E3wJzbVKpWK7mhOBDHRzIrYsX8UmyrjCW4NM4qjaNvf6Sy1Yc0bqKVX8IjP8Mq0Lq5kjb2iVHq9E4UsVcLDkTOilDUw47Wfg7MBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKGbU6Rm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKGbU6Rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716927877; x=1748463877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dglC6audh/9isJ7/6h4M1rNAgEJxTVjjb/a/Y5DhAWU=;
  b=HKGbU6Rmo+oo6zboOemMgfHwUFK1hoW/ypk4X/v27IUga2InrBhzZJbD
   rdtYoDw43NDrKs6w9o+I1HUsHQBaGEoApbUciuLQj0hGFZg3SstUJXRPl
   6+g5RQY30KAYcgUlihL6NFRiz8ZlD0I1BQKLpLxyDypin5ltUBm19FzvZ
   1gpFe0lcqwRKzjsEMrO+U4Lrz/p/iYk5pvgf4z6+duG9w4SxymbXI6F7N
   8wpnBu2C8VkEtrviT7K6VabeCBwuFXsLBnnXsViVbMA0q6ggxFGA4kbZ6
   R5wjCZ5xgYELTJaYqsrkKoAAHTpSnbyTCAMhtzbCgDq3JLHT/466Mgmcg
   A==;
X-CSE-ConnectionGUID: jKScA+mNT+6UJ/74N0jQyg==
X-CSE-MsgGUID: TI71S3QRSkmR6iIw6n/2hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16249199"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="16249199"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 13:24:36 -0700
X-CSE-ConnectionGUID: dUJA2OM2R5S/O1shuarDUg==
X-CSE-MsgGUID: SJFrpJXdS7abG4JUQPPALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="66047209"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 May 2024 13:24:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC3N3-000Cj2-0E;
	Tue, 28 May 2024 20:24:33 +0000
Date: Wed, 29 May 2024 04:23:51 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:mariusz-npem 2/3] drivers/pci/npem.c:206:23: sparse: sparse:
 symbol 'npem_ops' was not declared. Should it be static?
Message-ID: <202405290435.wdDAsAEq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux mariusz-npem
head:   2fb114bf74eff73c83383cbd1d481584053cb8cd
commit: b333459f7f6c0f7dc493350e5bbf2bd1c21f518f [2/3] PCI/NPEM: Add Native PCIe Enclosure Management support
config: x86_64-randconfig-123-20240528 (https://download.01.org/0day-ci/archive/20240529/202405290435.wdDAsAEq-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290435.wdDAsAEq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290435.wdDAsAEq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/npem.c:206:23: sparse: sparse: symbol 'npem_ops' was not declared. Should it be static?

vim +/npem_ops +206 drivers/pci/npem.c

   205	
 > 206	const struct npem_ops npem_ops = {
   207		.inds = npem_indications,
   208		.get_active_indications = npem_get_active_indications,
   209		.set_active_indications = npem_set_active_indications,
   210	};
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
