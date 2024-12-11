Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359F91DE4DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 21:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733954174; cv=none; b=Ejehc285ZTcsaHJVbvPIYmBH+gsMqsZCOOoa8OXYcXhleX4HK2hA9+A0RZ3SlHFdMwN+fipgjY2T0J/e3N/gM4OhD7H+Xoe8jtEB1pNiW/rVeP5NQkygKntOJmJ5emAe90/XwZJgIKEtV0Zh2T7K+wAhHFV+DYQftHPE8npBGVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733954174; c=relaxed/simple;
	bh=Iiz19co1FAj9gKrJjOloXYVxV8Kv4MmNKKyUbSlX0Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9r+LCr60HAXHRkLmPW4ou2RaNrS4dRknzCprjpSEYdu5fCF7rKtGZqSNkRRhYowiDvw1yCtwWBvZL27kLVjT0GKWuolB6yibPeydeP4xK3uoy4HYvnoAcvO0HOCcYU094KRHrcAnwcfZw8uDfqEepzCCCIGAXGSuUFMV9EmhQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F8SH7Q2j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F8SH7Q2j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733954174; x=1765490174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iiz19co1FAj9gKrJjOloXYVxV8Kv4MmNKKyUbSlX0Fg=;
  b=F8SH7Q2jsPLwE70h4Eda/vGsIDF67oxKP+RQUSRWpHccAU/wDQv77hiZ
   ICFC5Z60JRbBKxRM1U9V3oojEBZsbt+a+YqU8rbe9yCS5DfqHB7nHZS7U
   jtdD1OwkRrWY26jJL2T+thDBjK6Vz9w53qvLJREI3BUrlKJfVq09WdfgA
   5zTunoa5+cxrDmOzxe4ov5JZn4EvNJWojYnAo3P1UGB1XHhNs3326IWbE
   UZlCE6bqGYxOTAxO4gemGZVt7TaYnssAyxDMHzFpcQo0Uil4O4ossfz+w
   FQ/narn4J1LySu4U6l1hdeQnfDv4vyBOby96h9aLq3a19cOesWC60oQti
   Q==;
X-CSE-ConnectionGUID: j8faU6rcQYuE4XT9SOo7kQ==
X-CSE-MsgGUID: TG3W52YRS8ymi5dBOGRY4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34272974"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34272974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:56:11 -0800
X-CSE-ConnectionGUID: PiNU1C7/QmahYYQZ2+exQg==
X-CSE-MsgGUID: KtjbiitvTTa7wF3Jggyebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96473427"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2024 13:56:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLUgh-00078G-1S;
	Wed, 11 Dec 2024 21:56:07 +0000
Date: Thu, 12 Dec 2024 05:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 51/57] ERROR: modpost: "rcutorture_format_gp_seqs"
 [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202412120535.T5YZArL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   58b186eb8049230c475262f8e9eab34299677b8a
commit: 9133bc2bf728593225932a2574688beeb602b1ef [51/57] rcutorture: Include grace-period sequence numbers in failure/close-call
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120535.T5YZArL9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
>> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
