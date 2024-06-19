Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19B55884
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718832947; cv=none; b=RjZy8o67QOCFDZpuuN34fSCNGr42bmHeiMCgqMG5HSzl++vBnyWaFGHu5dk8TDP6WdvrxXLKDcGNHbHmxBl3E2oiPdeZ+5pGUTx+xmJQ6Y1TbquoeFEgSxGtHo64sNysxkqW9sLAaOAgF245IeHSaSZ8XRLzFrMT1BVtmjExrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718832947; c=relaxed/simple;
	bh=IVLWGrQdrwxSxrECnzIWel80hY9K41v1LW8UYZES0Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpI1zqXPV0ITxdRpRkXjv+w5SYYpYZDVbIl0AakJjNX5E+UfUofoeYq8qocAthXFHiJ9eDH9FfjMULN5Q8pzpXRBRPpFTltMAZUfLs3MW2BkHunRH5G6ptRJWaPdxsM4kBFkXe63dZGwvEStYGnGyKt+OaVk0lKZZ8Y55yx/JF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXIfplUb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXIfplUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718832945; x=1750368945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVLWGrQdrwxSxrECnzIWel80hY9K41v1LW8UYZES0Ag=;
  b=FXIfplUbu9mWmuYalkrbhcOgFwMbdFMpYAS+ViH8asIKp+StugLYwQQ8
   FVxFWllb1xy7+AcFGB38Jkp6enTz1ZEunSf/F904SjsSOU1FZMkwOo810
   vzRjTFnbimMJAAH11QCIcl71hP4afRQDObsbo9Xp7uSnQJdjjUqee5f6t
   DNkf+s94zRAbKF5/XiTQB+fBmClkvHCE255qLym8Pzn/NF93jH17csTV4
   V6kHLbG0+oZK23NFL2LYvCPDzGSuI1DJiN20q9wJ6gIKf60nsyOqq931/
   YeTPehfUl7YdOfy7BKQCUNHoFYpmIjTU0O1G8CrVsk8EK1pqVl7HSh4K4
   Q==;
X-CSE-ConnectionGUID: Jz8RzQfdRAOq3Lqov1lkXA==
X-CSE-MsgGUID: GZIefCBlSNi/ikWRT4tZRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15929788"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15929788"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 14:35:44 -0700
X-CSE-ConnectionGUID: t8AxtTr9RPKl7eP9/pZjIQ==
X-CSE-MsgGUID: /FZzdGeLRV2wsOOiZeqmfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="65278305"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2024 14:35:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK2xw-00071Q-1q;
	Wed, 19 Jun 2024 21:35:40 +0000
Date: Thu, 20 Jun 2024 05:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Daniel Wagner <dwagner@suse.de>
Subject: [linux-nvme:nvme-6.11 10/16] drivers/nvme/target/debugfs.c:16:15:
 sparse: sparse: symbol 'nvmet_debugfs' was not declared. Should it be
 static?
Message-ID: <202406200501.5DrFu8Fu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.11
head:   30576c4bdf564c6afef97a6306e5aae7f2fd744b
commit: 7586ba95433d12335aa71bfc0ff61654a79797aa [10/16] nvmet: add debugfs support
config: mips-randconfig-r111-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200501.5DrFu8Fu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce: (https://download.01.org/0day-ci/archive/20240620/202406200501.5DrFu8Fu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200501.5DrFu8Fu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/debugfs.c:16:15: sparse: sparse: symbol 'nvmet_debugfs' was not declared. Should it be static?

vim +/nvmet_debugfs +16 drivers/nvme/target/debugfs.c

    15	
  > 16	struct dentry *nvmet_debugfs;
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
