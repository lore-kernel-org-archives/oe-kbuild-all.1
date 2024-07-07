Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F312F51B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jul 2024 20:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720385664; cv=none; b=F0SdiVhGL7pYqA5b4Ip8bDnZSQY5v9GOsKelib7qY0xBh4OhcPKqdGiG/THPZLdECLhT9zIDL9x/ImFE/RPSVTldprgv5b9VokMLjLv/iU1F7xozwUFmHCFawh6LsuMei8zzvjJsAMd9bcNW37Bf//e5QwCAuVyAFnOGSY62fx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720385664; c=relaxed/simple;
	bh=NjBfxO0E1MOBZu2kbQemHAUcdI3BFBSLBrP53JdlHuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PT4DzuDQanl0PaXNj+Q81Bu9JPDTyNFzsp7dvZywLM/kolFVZMBrcxIH8y2pO7mZw11uvvhRztXg9NYtWn1tv1qdx75JQ+DAyF4cwWVGoKZPXEtb+xTMgo2PKomh+JcUeMCmeWdzm1EQmgrmqduglMBvUYESSyEVaxIJLqr2yXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj3gC+BM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj3gC+BM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720385662; x=1751921662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NjBfxO0E1MOBZu2kbQemHAUcdI3BFBSLBrP53JdlHuA=;
  b=Fj3gC+BMBslWFltRSo9wSDco+fA0zP4icJmnnrpXH72QmJ2TmlWh4oO9
   ekE/MxtUU2TtMubtC1+q6z1gFkqE6vg4X3Z6zmgH23iBMPnN5GBfhNtM8
   Pqp+9PfsqS7PH8sFg3+hQAci3OmoVM72alHeveQCcDEr+amssCxzChLlb
   9sxGs9k98CZ0IULkXvDvfeuCVvISdivPlzf5fZ7hk947WjaH0kAU0FQ6n
   4rIXb7yPUGAFlPbge0NF2r7jFBFmAmAIUnx+g7L5+RQjlCqDhLn62bP7V
   zDADOV+vwPh2TK54EhPb176usqwXABpSejmUP/lCGwLIFixXXOSywwa3q
   g==;
X-CSE-ConnectionGUID: 81y9tx2yTc2oP5tsKK/s7A==
X-CSE-MsgGUID: 9xYo4R3LRrG7QHRgcVYlEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="28972465"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="28972465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 13:54:21 -0700
X-CSE-ConnectionGUID: eSKCiuzgSR+kheWEeqjryg==
X-CSE-MsgGUID: maNtS4buSeaWdhULAu2BeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="52140914"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jul 2024 13:54:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQYtm-000VGw-1o;
	Sun, 07 Jul 2024 20:54:18 +0000
Date: Mon, 8 Jul 2024 04:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/9] fs: add percpu counters to count fine vs. coarse
 timestamps
Message-ID: <202407080405.chnDpH48-lkp@intel.com>
References: <20240705-mgtime-v3-3-85b2daa9b335@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-mgtime-v3-3-85b2daa9b335@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on cc8223373449ecbd4c18932820714235db6006c4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/fs-add-infrastructure-for-multigrain-timestamps/20240706-052441
base:   cc8223373449ecbd4c18932820714235db6006c4
patch link:    https://lore.kernel.org/r/20240705-mgtime-v3-3-85b2daa9b335%40kernel.org
patch subject: [PATCH v3 3/9] fs: add percpu counters to count fine vs. coarse timestamps
config: sh-sh7757lcr_defconfig (https://download.01.org/0day-ci/archive/20240708/202407080405.chnDpH48-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080405.chnDpH48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407080405.chnDpH48-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/inode.o: in function `percpu_counter_add':
>> include/linux/percpu_counter.h:195:(.text+0x14b4): undefined reference to `__cmpxchg_called_with_bad_pointer'


vim +195 include/linux/percpu_counter.h

80188b0d77d742 Dave Chinner   2015-05-29  186  
^1da177e4c3f41 Linus Torvalds 2005-04-16  187  static inline void
20e89767096392 Peter Zijlstra 2007-10-16  188  percpu_counter_add(struct percpu_counter *fbc, s64 amount)
^1da177e4c3f41 Linus Torvalds 2005-04-16  189  {
88ad32a799ddc9 Manfred Spraul 2022-12-16  190  	unsigned long flags;
88ad32a799ddc9 Manfred Spraul 2022-12-16  191  
88ad32a799ddc9 Manfred Spraul 2022-12-16  192  	local_irq_save(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  193  	fbc->count += amount;
88ad32a799ddc9 Manfred Spraul 2022-12-16  194  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16 @195  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
