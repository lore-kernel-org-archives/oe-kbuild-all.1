Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652211ADC98
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737802009; cv=none; b=erVntME8Qc5lywaBNrj2iWyKSN7Kg5AC/xH39KxL+S9i4bMq1i/TBxjytVg4U7iglM5LmMY303PEDatk7p/Eu0TPG+vSdMBzJ6dMserIaYVcFFyPAHqifPX/SU/1uX1YYeBh4Dq/+HcIdsa21VHO1NHGKavrAYFS9pX57OxAy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737802009; c=relaxed/simple;
	bh=60tE2Z4VpHwrRj3rIuM3Z8g5hbbe5OhGN6VarWY7I2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oOI7Ljb6vhTqp6SxwcCdPj8CSXOFg99DET6hc4aAr0SI0ITTdyKUQ1I995/NkifIUOlI2vgk+1cF1upw4UAIMYtQCT5t3ZMDJS7CxjczpaFtfutFqwAIswHHyXV6eDp33LaV3JgHBmvmG7fylK8g+/vkZE0BNYBMX0rvGivWd1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjUlZkiH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjUlZkiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737802007; x=1769338007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60tE2Z4VpHwrRj3rIuM3Z8g5hbbe5OhGN6VarWY7I2w=;
  b=YjUlZkiHb+tKn4yi10xIa1hikerWaIwsGuHGaW78oo3mhRxO5PwAutNj
   fljHSUC2iteCnhxpwILlPyWJOb6GgZZsWM7sSe+L/Pqqstdy939Kk0Uz0
   rtWRK/hWfmzFha9gs0wnF+YD3e/nqQFkRzQLSc8pfDH0ljbqSypJdv2ma
   riAmnCEYPS+up+4z2GkoRAgvYIw0Uv52ByExE1HN/Qy50HjDro+VLEakQ
   Awrn8K+yaqdoSAnAAR+nE1GZGklGe97TBI+p7EWeoFp0u2DqZrbOo9+Hn
   HyMx5hrtze30gaeIuIIx/a28+AIh9wqD0gqiTZm97p7huAgNMzicA3qXo
   A==;
X-CSE-ConnectionGUID: v6OFqFIXToaEYphHTTnHLw==
X-CSE-MsgGUID: AvZw5n8jT32g6TaJ5FQY4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="42262498"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="42262498"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 02:46:47 -0800
X-CSE-ConnectionGUID: Eh4nUnwJQEiRuklw9bAVrQ==
X-CSE-MsgGUID: mgZOv4QOTiCLKgUkQDooJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108529233"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 02:46:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbdgZ-000dj0-2T;
	Sat, 25 Jan 2025 10:46:43 +0000
Date: Sat, 25 Jan 2025 18:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 6/8] include/linux/compat.h:955:32: error:
 'struct cpumask_t' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202501251841.5aFgdw1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux compat_get_cpumask
head:   b7162e407638adc57cdf6d6f1acea90f9d84a638
commit: 2dc86881c56e6ed3f0b9640c3a402631aaeca482 [6/8] compat: add compat_get_cpumask
config: x86_64-randconfig-004-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251841.5aFgdw1g-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251841.5aFgdw1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251841.5aFgdw1g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/ia32.h:7,
                    from arch/x86/include/asm/elf.h:10,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from lib/test_bitops.c:10:
>> include/linux/compat.h:955:32: error: 'struct cpumask_t' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +955 include/linux/compat.h

   954	
 > 955	long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
   956			unsigned int len);
   957	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
