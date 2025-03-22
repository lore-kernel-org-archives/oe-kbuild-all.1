Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9EBA53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742633157; cv=none; b=J2ZrsvCHVydp3fePDH1O0rP0wGMwSGnPFSMDNw5AYL3gvL0gjIQVLvQBqz2/U3fLd1TMxbxR6/yYA4xzBjM4rTy2iGgFuc2c+P7k94xNr4fz5PNukwwBbS37TAHNuOL0ZU9a4ZqTVkne1h2UJHN8tP0AeRDBRtoQTBVDGU9oPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742633157; c=relaxed/simple;
	bh=h2kzPRRQeWz/yNiG/Ij/q8jKEg9mH23qUsj2g2LoL5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WZ4eWL5kvT6XxQlBrXhZOxPYu9Z1xGN+xbUxRE4xYC8uoJT5dxvTH1v018KQ6KHp9XbrQpKdhhsSTYsQQ5jUnGZA1rw6e5CR6WHf4VgEFp6Mq4oOjurNaZSdaR2FD+6FpxzUpiTAMjpUml8eob6t0lr8k84LUARhZcY6tWnqO5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cakPsWqS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cakPsWqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742633155; x=1774169155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2kzPRRQeWz/yNiG/Ij/q8jKEg9mH23qUsj2g2LoL5U=;
  b=cakPsWqSBYg8uP7za1MPtgak0rgKcNhBzMneLq/E44iO9NQETWv++eqy
   /tW59LMolLjoU3YVvoSPAF6EY/rKzeB62U6l44mGrO7r/iw10ctoXaHqQ
   MVDk4BJIe4ACl+hVwfwiPWTxl0Q6CyGX2d/QEngEKzCSYjVwMc2KA2fh4
   4xMeu8vlD2xgviu02dTFOfGvo/yXWZbAs55C6a7QJopmkC/vaabxVVVCj
   zzkUJOmHEFRHOkOIfYGmI/ypOoXL89z7GoaRRG2iPvLGM2VjWqg39NMnm
   tbfLB00ZIIdkp2WugTETfst6N6WjpNiCovj0T/HwyiTl6GUEpKeEnyxn2
   w==;
X-CSE-ConnectionGUID: tb6BXP/cQBSLZNSiE8otTg==
X-CSE-MsgGUID: WkUR+IStRImidUGVLGuL6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="31491271"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="31491271"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 01:45:54 -0700
X-CSE-ConnectionGUID: 3HYa7dwjQ2Kz9l2twdB6oQ==
X-CSE-MsgGUID: O6uPyL8dT4WT6h8MfbGhKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="123619652"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2025 01:45:54 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvuUA-00022B-1D;
	Sat, 22 Mar 2025 08:45:50 +0000
Date: Sat, 22 Mar 2025 16:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510]
 include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202503221640.dSQdYk6c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8a7a3996f4b2078603a8346880dbf5935308a57f
commit: de1b854e74d99da0917ef841500d597f75838dd2 [1510/1510] bdi: get device name under rcu protect
config: arm64-randconfig-r132-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221640.dSQdYk6c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503221640.dSQdYk6c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221640.dSQdYk6c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-core.c: note: in included file:
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] __rcu *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
--
   block/bfq-iosched.c: note: in included file:
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] __rcu *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *

vim +510 include/linux/backing-dev.h

   502	
   503	static inline void bdi_get_dev_name(struct backing_dev_info *bdi, char *dname,
   504						int len)
   505	{
   506		struct rcu_device *rcu_dev;
   507	
   508		rcu_read_lock();
   509	
 > 510		rcu_dev = rcu_dereference(bdi->rcu_dev);
   511		strlcpy(dname, rcu_dev ? dev_name(&rcu_dev->dev) : "(unknown)", len);
   512	
   513		rcu_read_unlock();
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
