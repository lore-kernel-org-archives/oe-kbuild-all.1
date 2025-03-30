Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1F6154426
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329718; cv=none; b=GpBXU3DIrRAvoYcZBRuwn/dcrSZiLih6sJT/dY0C6htoF31ryIq7bRUkZkhyYYCKdf9iNusEF+7HaBfy8nrVl/tELBMZ+ZtkGcIAf4WpBCLkz/JDRPwtB6uifdXJ6z7cK1J4zaHklWAZtm4QgIhxVUF7pfbBHa+HlESY1mEro1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329718; c=relaxed/simple;
	bh=XyAIgdxXpblk99sCSh3aNkQNygZI+PqyqEG30U/8tHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gX1vkDbwQFZMnGSUL9hCtjaeBUjKW6ZlUt9OzrFoOgjlPfwGyQI4Fr4bTc/B75SdD06qVh+r1sDezXqrKNgiKbALD312rwNJmJOpY8IA5bTLbF3fVQMPFw5Prg2cN0eCKq2K2W/+Z4fIl/4w7Ad+nG6nMEhYysREd6aRJopXHPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EX1PH79Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EX1PH79Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743329716; x=1774865716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XyAIgdxXpblk99sCSh3aNkQNygZI+PqyqEG30U/8tHU=;
  b=EX1PH79Ym9aBLQt9eF2njYylD/MHee8fofr8szkfzy62naP/8X4P6DV8
   UUaAbk6zd635iWrXK6tswsF7w2614QonjBos+XU8q23MZ9fRkJz1v3CHa
   /IrAx2Z/6cl60hmN0Bf8y+RMU+DAd1mu9ZKZnfY7dfIrg1xcknzNdj5XY
   eSTHxVrOu0v/bXP9cGd6ChZeadBNnX2itRX6SiBuULW21cgw1E65hMgPY
   8mFYJHcx4qgDL/TJI2zkm+ZtEZX73ubI0Zu6vURHxw5by35YHGenPmS1Q
   krGSwb7F//+SRtxPjF6h4OjwaZU/kGxIdo7t6oX2JM9z20dtS1+FvVHQx
   A==;
X-CSE-ConnectionGUID: pxrJX1wKTS2rodAt224b9A==
X-CSE-MsgGUID: KVE3SaBiTQC6PMjF2QDlyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44521577"
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; 
   d="scan'208";a="44521577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 03:15:15 -0700
X-CSE-ConnectionGUID: O13jfDaSSSSESKiME6V0ZA==
X-CSE-MsgGUID: sh9y4gDUQmaHGUUwz4R92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; 
   d="scan'208";a="125847998"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Mar 2025 03:15:14 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1typhA-0008du-1r;
	Sun, 30 Mar 2025 10:15:12 +0000
Date: Sun, 30 Mar 2025 18:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Nan <linan122@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1531/1531] drivers/md/dm.o: warning:
 objtool: dm_process_bio()+0x2ec: unreachable instruction
Message-ID: <202503301828.H3xVCQ5Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: 3830dbeebc54a74b56b8253c33857b38fae427fb [1531/1531] dm: revert partial fix for redundant bio-based IO accounting
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250330/202503301828.H3xVCQ5Q-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301828.H3xVCQ5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301828.H3xVCQ5Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm.o: warning: objtool: dm_process_bio()+0x2ec: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
