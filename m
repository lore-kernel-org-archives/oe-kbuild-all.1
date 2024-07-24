Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867E61FE1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721807114; cv=none; b=rtuDa/hXpfxipIP8KsqRyP8J8a7ldUEEs37zWkeztqGRIoezHhYPQgbt8ksy/FQlQMXze2VxgaiUyYVBs6MxtJhZl+26ATRAHsPrb1gpjqeAA1hRGsiJjOaFUFgkv5OFrYr016jEJhVnFOaO6nWSD9DnDqrboVfwdUvgbx+os4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721807114; c=relaxed/simple;
	bh=8q7AR7Na89iTo3GQVqeI9lRAMhhLYE7OJP74SF2Ffeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnwjycp2cJcCbYIeHQDmb936f5Tgeid6MtozXK+AENOmduGj9WkBmnXMsY5SfjuRccwSPWoJ+0sFlGMTBsAgqHI892huk51tFq4nwr9DE/DrpcwWsi4G7xfii3d8Nu3FqwpLc9juxx0VbXSYkC/E7Y5MoKO3g4A/0ofDnyXmmGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoVE0Th7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoVE0Th7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721807113; x=1753343113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8q7AR7Na89iTo3GQVqeI9lRAMhhLYE7OJP74SF2Ffeg=;
  b=KoVE0Th7p/wa8MFFThFY3i8QHO2AN5XrWKQLprvD1E8W5/xE25f0GFAt
   sWZy4DNRcDXZ0atPBC49Mfx0he96NaBnVN58K3ceD0Om9Jb6iPiiGApzE
   BK80NdSpLRKp1m+Ca++4izw44n+EBgEJQ1BjxwwaCrK491miHNN1dUdFK
   sd74Nf5bDOHI7MciR+tPVrpzEwwQtKG5kX2ipbJFZD6WtwHlyV8dTvWYY
   xlMHl7InlGbC5yIXTs4RU4aQSuE1dQg4avLZBBtBq67MUaJ6fthDvjoSD
   i5QRioOWo658CAZAn+DVMB9JcOeGNFzcmxPeuBoq7+eU6326GKNCogtSX
   g==;
X-CSE-ConnectionGUID: bd1I7Jc/TCyWm79mXcQ1WQ==
X-CSE-MsgGUID: tAdyNWViSMW7zv9TdBQE1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="23278309"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="23278309"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 00:45:12 -0700
X-CSE-ConnectionGUID: odDXAzKuRpSssIN9pYLcow==
X-CSE-MsgGUID: IJ8Z8RGhTa+G6PFaWgc3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="57305411"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2024 00:45:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWWgO-000mn6-2F;
	Wed, 24 Jul 2024 07:45:08 +0000
Date: Wed, 24 Jul 2024 15:44:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Sagi Grimberg <sagi@grimberg.me>
Subject: [hare-nvme:secure-concat.v8 5/18] drivers/nvme/host/sysfs.c:766:30:
 sparse: sparse: symbol 'nvme_tls_attrs_group' was not declared. Should it be
 static?
Message-ID: <202407241521.VJXNzGup-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v8
head:   7208e97adaac1f55470f41207881719fb19358e6
commit: 68f97b34688a7ce91e42d933d4a9064790aca286 [5/18] nvme: split off TLS sysfs attributes into a separate group
config: sparc64-randconfig-r131-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241521.VJXNzGup-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240724/202407241521.VJXNzGup-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241521.VJXNzGup-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/sysfs.c:766:30: sparse: sparse: symbol 'nvme_tls_attrs_group' was not declared. Should it be static?

vim +/nvme_tls_attrs_group +766 drivers/nvme/host/sysfs.c

   765	
 > 766	const struct attribute_group nvme_tls_attrs_group = {
   767		.attrs		= nvme_tls_attrs,
   768		.is_visible	= nvme_tls_attrs_are_visible,
   769	};
   770	#endif
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
