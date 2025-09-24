Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D0927FD6E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710564; cv=none; b=X/zOPHBlexzI3SgUoUv9ArTr5AKZnmHpYR8Mfu4Fmcu97u/8NFqwxG9aKM6LEklvtRIYCDjfEteNb4edyWYaLM1Nlev9fjYXbaHr0q88jlHcgl2Xgi2nLsCusaJqIb21xRhImVIEdYPI3C07VlIjol4JCtj0ZeJmd49bZqWLsjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710564; c=relaxed/simple;
	bh=lhFl0Eb6Hz4pXsmpIG0HybFDNLaVx+QM986AzX18mTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOS+q2NBAWSH8Ez2UduSMDO4UfoAubwkxxk+u9WPf4KgfEyIeqNcP2c/f899aOv+zoMxDvLf1Y1pcbSe3blCWZwQ4KHWxcEd9a1oKhix3P6kX++okotDIXd3RdLEMkXp6L9esB1M0yx2eN6Avj3OvQa8VxVc0dChk5cUhffP72w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Swjy9D3P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Swjy9D3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758710559; x=1790246559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lhFl0Eb6Hz4pXsmpIG0HybFDNLaVx+QM986AzX18mTo=;
  b=Swjy9D3PygVBVberTSAka/NRSgFSIPx1K2FGiqq9apYWIa0uZW4zzQM0
   2hWSn0IDdpL9I+L+7Jt5sSSt/q+/4yXBcX9knmq/6sBUc9MgKIQ3JrJ8J
   hbLkWpw8LXdWwUmC5CkZyTKXlyoXa9/Pa3ozy9FGL543tw4yCC829Cl+P
   SKIJHV518ShAfi8Xpz4AKtGO9WGplj5yc1NHa6eOK5/6Yv/wNoaY281q6
   /89Eh4kpGWMvWem3xaG46Yz3BGy5biJhPN5j2/jNchrqZhT4MFAcdkiiy
   eP5sn8G7+RbjsgrrCa0ybS9Z3nxTBo1aVy6ONuQQhTVM4zvCZ40GII9XB
   g==;
X-CSE-ConnectionGUID: y1e3ftQ1SIuAHNsnB9DB4g==
X-CSE-MsgGUID: bjtat6twTvCXzdZviTr8yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="48569711"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="48569711"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 03:42:38 -0700
X-CSE-ConnectionGUID: zm5hqWMvQXu6OvNLo3xkJQ==
X-CSE-MsgGUID: +mxOworJSZyLfV+ovciZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="181016241"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2025 03:42:37 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1MxD-00043t-2F;
	Wed, 24 Sep 2025 10:42:32 +0000
Date: Wed, 24 Sep 2025 18:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: acampanella-thegoodpenguin <acampanella@thegoodpenguin.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH PREVIEW RFC 2/6] raid6: Add bootcache
Message-ID: <202509241816.I8xthB9j-lkp@intel.com>
References: <20250923-bootcache-v1-2-4f86fdc38b4e@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-bootcache-v1-2-4f86fdc38b4e@thegoodpenguin.co.uk>

Hi acampanella-thegoodpenguin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9]

url:    https://github.com/intel-lab-lkp/linux/commits/acampanella-thegoodpenguin/base-bootcache-initial-commit/20250923-223719
base:   c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
patch link:    https://lore.kernel.org/r/20250923-bootcache-v1-2-4f86fdc38b4e%40thegoodpenguin.co.uk
patch subject: [PATCH PREVIEW RFC 2/6] raid6: Add bootcache
config: i386-buildonly-randconfig-004-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241816.I8xthB9j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241816.I8xthB9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241816.I8xthB9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/raid6/algos.c:22:
>> include/linux/bootcache.h:2: error: unterminated #ifndef
       2 | #ifndef _LINUX_BOOTCACHE_H
   lib/raid6/algos.c: In function 'raid6_choose_gen':
>> lib/raid6/algos.c:172:54: error: incompatible types when assigning to type 'struct raid6_calls' from type 'const struct raid6_calls *'
     172 |                                         raid6_call = *algo;
         |                                                      ^
--
   In file included from algos.c:22:
>> include/linux/bootcache.h:2: error: unterminated #ifndef
       2 | #ifndef _LINUX_BOOTCACHE_H
   algos.c: In function 'raid6_choose_gen':
   algos.c:172:54: error: incompatible types when assigning to type 'struct raid6_calls' from type 'const struct raid6_calls *'
     172 |                                         raid6_call = *algo;
         |                                                      ^


vim +2 include/linux/bootcache.h

7a47ab44737a5b acampanella-thegoodpenguin 2025-09-23 @2  #ifndef _LINUX_BOOTCACHE_H
7a47ab44737a5b acampanella-thegoodpenguin 2025-09-23  3  #define _LINUX_BOOTCACHE_H
7a47ab44737a5b acampanella-thegoodpenguin 2025-09-23  4  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
