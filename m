Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C070E2FDC53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 02:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787969744; cv=none; b=RzfT+oG+jP3MwSwfqbHRIyYXQwD0bzVpqn1A28HhSf6FpRyXbF4eyt6gW3Kfuxjt/mk3bnbCazUdr7YdlwhkpBVt86v/C4TB3SIZWM/dDIj/cGZnMJL0WxIvxCpdjbyY4hNJ0sZbaJuRecRSdNPMiRc89K+Y/06uUW8hth8KlnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787969744; c=relaxed/simple;
	bh=uIRk59zc+prQM6Q/eHww6mqoRMzqcK2rfdLmPWj4EEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qxr1gKZh64aq07HHCFVNChDJAm0gK9vAuuETbUILk5NIZPLTUP8Y+Eiyoda6D1eh1j+x0n043cfdLaecgDP02A7N8mXxjXJ+4lk9jcI1Z4PO/+hAPY2kuR4k3eFnLixofM59uj/hqWzQ8B4xG6VQmpeWRJK7NKLgwynVwxiPqj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dswa1kQ+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dswa1kQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787969742; x=1819505742;
  h=date:from:to:cc:subject:message-id;
  bh=uIRk59zc+prQM6Q/eHww6mqoRMzqcK2rfdLmPWj4EEU=;
  b=dswa1kQ+Ug287EoKy9uE8yFXRA0Y1/j38r3dGr4g9TB/kmj338Ap6XW2
   zAZLNMDd0cz84pXgsmxjb33Slm5RCZrr1GC3yOdZ43tXiEAj2yeZ238IC
   zsJWJV8VCaXpeGIn0oc6m8ammupdwBYS8BjFTBau9sYpDaH1946BWtAyz
   b8e4Fo1CeJyJ2AMji9kscGjmmZMR9gybX5V4ClHpjCyaUB+5tHmLyRDVf
   6+bmggvyP84QIE7jVeQIWa0zQhudRo6BUD0Z8oDXrGTiz1o/BtbmGsvAh
   qLp0Zqs+xvlawGSYXGPqPP3SHoy/S3KLF2kjEHor3FVSEpAWLPVLNsHLq
   g==;
X-CSE-ConnectionGUID: koAZIsa5TlmmqgiDEMcUNA==
X-CSE-MsgGUID: 2HJzTqxPQsmYVTR+fvSAiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="87609012"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="87609012"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 19:15:41 -0700
X-CSE-ConnectionGUID: urqXR+rbRV+eNKd+HzBjRQ==
X-CSE-MsgGUID: bTX797MoQvyOXQrPEtojNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="306537095"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Aug 2026 19:15:40 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x08bZ-00000000CFa-2LVJ;
	Sat, 29 Aug 2026 02:15:37 +0000
Date: Sat, 29 Aug 2026 10:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/vramstuff 22/28] Warning:
 drivers/gpu/drm/ttm/ttm_bo_util.c:1038 function parameter 'mem_type' not
 described in 'ttm_bo_lru_cursor_init'
Message-ID: <202608291051.dvnpJx40-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/vramstuff
head:   da1cf9de1bba45648450c64323fca70bcf2a65ae
commit: 4827fa587d7a6ea3e995dbe566fea71831cb0001 [22/28] drm/ttm: Add fast-path to evict from current bulk move
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260829/202608291051.dvnpJx40-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608291051.dvnpJx40-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608291051.dvnpJx40-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_bo_util.c:1038 function parameter 'mem_type' not described in 'ttm_bo_lru_cursor_init'
>> Warning: drivers/gpu/drm/ttm/ttm_bo_util.c:1038 function parameter 'mem_type' not described in 'ttm_bo_lru_cursor_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
