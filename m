Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD281D47D0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725451274; cv=none; b=b/kglZGNx7QIEqX8lW1F6fx50DaMrKFCiQB2+MC1oMhGihb7F4PpyLEKdW//Akfyk2/byAmFrNcILEKZ4dlCBF2l/C403nvP8fuO/p0IO8RWARJIFa9dQhHPkOTWkORdQB4zk/jbKt3E3RwIPpNHhz9ENRr3nen3yWLgqP+zdoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725451274; c=relaxed/simple;
	bh=UVeaKGlOXCwZ1NKpPz/lKsvnxIP7hZ4KnNa2YhLrSQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVKULkEAAy95rrM3Olo30Kxsp53OBcVikZTqxfWW2p+kFoqUMGfKcUeBARadLeMLbOnVxVQDR8ICHu1IhygV8ViDsKBZq03KWYb1ETgsKr8Lzfdha3Ix6WeFLBdr/Qeg0XgNS4JBCohyHJG4lRoLAmgK1nchbTTZW6E4r/qwuoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxJc+3ZN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxJc+3ZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725451272; x=1756987272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UVeaKGlOXCwZ1NKpPz/lKsvnxIP7hZ4KnNa2YhLrSQA=;
  b=JxJc+3ZNIW9D2Ebuk/7nlHD8P1z3QUnVcgglbtNMxMUe7NdicH70TxDs
   HIwoFwTJgU2THfwD+8IlIxjOBiYGF/HMvUmHOh+plRXnejTDaSvdyz0FV
   c6G7aaO+NWMtZtxoyV9MHt9Dw1e21Hag/AvyPdFpfBz6zFHD+XOEpLuGY
   nKMH6UMEW6v+iVp1p78YcEKjvL3VYUSLmSng3t2zjGvg88/MTTzyPvwVI
   djaQX6RD3mttB6j56Cvc74l4Kn/yaZRygCV50py/cDBa0Wc7jcDQ4AZr5
   8oero0v2XceER8M3AWyvO8CapYA8v4A5nBfSL86wIRmFNblOCBpUzIq6M
   Q==;
X-CSE-ConnectionGUID: mqdWDs90QXK0O40DrrxcLg==
X-CSE-MsgGUID: oGz+Cdl7TB6Co9KM9u5ATw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35467440"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35467440"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:01:12 -0700
X-CSE-ConnectionGUID: L6GhFLViThq6/ay370yMLQ==
X-CSE-MsgGUID: ZdZPmY6DQgW1PL7V2BitlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="70061028"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2024 05:01:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slohB-0007wP-06;
	Wed, 04 Sep 2024 12:01:09 +0000
Date: Wed, 4 Sep 2024 20:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixiong Yu <yukaixiong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 -next 09/15] fs: fs-writeback: move sysctl to its own
 file
Message-ID: <202409041926.5vqwwXxo-lkp@intel.com>
References: <20240903033011.2870608-10-yukaixiong@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903033011.2870608-10-yukaixiong@huawei.com>

Hi Kaixiong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240902]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaixiong-Yu/mm-vmstat-move-sysctls-to-its-own-files/20240903-113226
base:   next-20240902
patch link:    https://lore.kernel.org/r/20240903033011.2870608-10-yukaixiong%40huawei.com
patch subject: [PATCH v2 -next 09/15] fs: fs-writeback: move sysctl to its own file
config: x86_64-randconfig-121-20240903 (https://download.01.org/0day-ci/archive/20240904/202409041926.5vqwwXxo-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041926.5vqwwXxo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041926.5vqwwXxo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fs-writeback.c:68:14: sparse: sparse: symbol 'dirtytime_expire_interval' was not declared. Should it be static?
   fs/fs-writeback.c:1943:17: sparse: sparse: context imbalance in 'writeback_sb_inodes' - unexpected unlock
   fs/fs-writeback.c:2608:20: sparse: sparse: context imbalance in '__mark_inode_dirty' - unexpected unlock

vim +/dirtytime_expire_interval +68 fs/fs-writeback.c

03ba3782e8dcc5 Jens Axboe    2009-09-09  57  
a2f4870697a5bc Theodore Ts'o 2015-03-17  58  /*
a2f4870697a5bc Theodore Ts'o 2015-03-17  59   * If an inode is constantly having its pages dirtied, but then the
a2f4870697a5bc Theodore Ts'o 2015-03-17  60   * updates stop dirtytime_expire_interval seconds in the past, it's
a2f4870697a5bc Theodore Ts'o 2015-03-17  61   * possible for the worst case time between when an inode has its
a2f4870697a5bc Theodore Ts'o 2015-03-17  62   * timestamps updated and when they finally get written out to be two
a2f4870697a5bc Theodore Ts'o 2015-03-17  63   * dirtytime_expire_intervals.  We set the default to 12 hours (in
a2f4870697a5bc Theodore Ts'o 2015-03-17  64   * seconds), which means most of the time inodes will have their
a2f4870697a5bc Theodore Ts'o 2015-03-17  65   * timestamps written to disk after 12 hours, but in the worst case a
a2f4870697a5bc Theodore Ts'o 2015-03-17  66   * few inodes might not their timestamps updated for 24 hours.
a2f4870697a5bc Theodore Ts'o 2015-03-17  67   */
a2f4870697a5bc Theodore Ts'o 2015-03-17 @68  unsigned int dirtytime_expire_interval = 12 * 60 * 60;
a2f4870697a5bc Theodore Ts'o 2015-03-17  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
