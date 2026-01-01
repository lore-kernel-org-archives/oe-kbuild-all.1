Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F43296BCF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 11:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767267584; cv=none; b=Ua9AR7B4mmSm/vyZIy0IYmvT50IjpJkwrNpcawSvMdK5W1iIaVsG+inlbm61RPI8T10T64bNlOOTfBlnGRUiBMgG8Il50vR0scLpyl1zoywscrAXe5lUUMsVTZT177Qq58zS4/CgI2ywCQIBOoGdxLgjQzXwP419zlFlkoGqc9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767267584; c=relaxed/simple;
	bh=87WQ4eeLUu4O3o5rWvJwhpkFYfQU+Nx4rkvbvQslBqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PE97/zO/LQTtlZxKo4OBhu7dk01KFoajA1JLRkJy0bV9DU0llMFnWYCicexsX1g5NCSPgBKCVCMtK1wHZk6Y1SX6VbnZvqadMIxPOou/1yynUPziyRhubAbGAUYEFmPd7iBYoSaKXb3iq50eqzD9LfgoV5VtA5GIZYeeFAdMrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIoIUa5d; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIoIUa5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767267583; x=1798803583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=87WQ4eeLUu4O3o5rWvJwhpkFYfQU+Nx4rkvbvQslBqc=;
  b=aIoIUa5deyfMJTKiNhXhwqgOv1411A5958C5Yq8BIszPekOhqSR5bveG
   Kebij48ggGGKlpP20RWD1T65m5ICdXh/rI5JdUtALsVUZnkHLrHcdsAR6
   ktX43Zp3+ig0hQn4sdoSerrF6FiP1ifrxVWShhN4vEwEU2LiBlrYCCskK
   i7Xtvejk8ey88U9lrkARBgBwaANtBP8dh1LENgXRHmbNEaBHg/9zctwZg
   pw1+McgOV+54EwDMMoypfPkMeSKoh5KnrVPL3oUMio4USxPh2rF1Kc1G5
   2XZL0YB4OKCEpy3c2Mfbxg3q7cqlPikIGvEItslflM7nc1zNDoPU7uQSJ
   A==;
X-CSE-ConnectionGUID: sHv5s2ZtQ/+EjCTsFtILqg==
X-CSE-MsgGUID: jyw/R/LlRAymNBxnOxdFfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67814019"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67814019"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 03:39:39 -0800
X-CSE-ConnectionGUID: N48pUfIfTa+PPbN/0WjNhw==
X-CSE-MsgGUID: 0Q4PEoVoQ2CzQ+gQLe87FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="201616614"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jan 2026 03:39:37 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbH1j-000000001qz-2glM;
	Thu, 01 Jan 2026 11:39:35 +0000
Date: Thu, 01 Jan 2026 19:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cached-prefix-godz 37/37]
 lib/dynamic_debug.c:1710:51: warning: shift count >= width of type
Message-ID: <202601011923.bwJAik1r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cached-prefix-godz
head:   2597763afcfbb4385a1f14cba0e170ccd7a95e68
commit: 2597763afcfbb4385a1f14cba0e170ccd7a95e68 [37/37] dyndbg: optimized caching of dynamic prefixes
config: powerpc-randconfig-002-20260101 (https://download.01.org/0day-ci/archive/20260101/202601011923.bwJAik1r-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011923.bwJAik1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011923.bwJAik1r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:1378:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct _ddebug_class_param *' [-Wnon-literal-null-conversion]
                   return false;
                          ^~~~~
>> lib/dynamic_debug.c:1710:51: warning: shift count >= width of type [-Wshift-count-overflow]
                  ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
                                                            ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +1710 lib/dynamic_debug.c

  1706	
  1707	static unsigned long ddebug_prefix_key(const struct _ddebug *desc)
  1708	{
  1709		return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
> 1710		       ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
  1711	}
  1712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
