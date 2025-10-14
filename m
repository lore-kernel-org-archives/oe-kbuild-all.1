Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCB3EACD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760406666; cv=none; b=bPWnvJGRsR2yRLs1/IkKoaOGQ0jVHdmP3ktkd0hEToR0E9piFoxWdGDyhJHRle2fGXpb7Y8J+6EZSM7xKXFWutMwrCPEbjrUaaGzFxxvA7a28zESSJAl11wGxvdTDrFyOt662ShY6b9I/EnE3knE3WLwyNHmQx815HbjQAaxRyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760406666; c=relaxed/simple;
	bh=WbBpuU0pFtLjM18XActsqaJDtI2Rsf8yvpvxPo4WGMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzCL+YdOWB4uvHc4Jhz5TPsI1KplSkpfrAzesMQTciQhIu2rozf/HUv4n1Nz1i6rRi7qWJuRj1CzhTOEd5e9q0EyVPp1Q0ifRj8nmZzDpNqbaMyC3W41CY86JgkaYevqGVH0IMB7dRLOwNfZ+kS9KoeUm7ui2s5KSxT+vfvSs00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ59kfll; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ59kfll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760406664; x=1791942664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WbBpuU0pFtLjM18XActsqaJDtI2Rsf8yvpvxPo4WGMs=;
  b=lQ59kfll0kyKgxP6yXINf+HPRnUU36VNQ0cOvnXeXs7jJB2732uf4eAi
   ENBQZTIMze5Rs99c21t6o1pMGgSgN3J5czDHfse8GAZ0IzqNY64lty1L5
   zSU9Pyz/3wfkyS5e24Upp2+wkvXa0iH58fP/o+eUIHtdWfoach/BNkSQe
   HAFri53S9zWQoUrIVYMQolcacPiezLHe/8ycRHtZ+Sml2+9K7H+o3D3jL
   +7YezjMbH/Q+sr1rQi7ZN+f2avZPNQOFQZWhUz90+sx27Q5F+SiWmcSds
   JLC+vH8XQryrdgqXZKPJH8TqMRdWam8fX4mkYUV4bUM7s8ft4ieAAL5G6
   g==;
X-CSE-ConnectionGUID: gwAD052vQwqJ31rT3O04YA==
X-CSE-MsgGUID: lQxGMfQCSlmjj0NQGOcQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66380829"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="66380829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 18:51:04 -0700
X-CSE-ConnectionGUID: B1rxpqQ0SsSFnksWP6Zygw==
X-CSE-MsgGUID: mgsTnoYrQkSl9hXZwdBWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="181551500"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Oct 2025 18:51:02 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8U9d-0002Ex-2X;
	Tue, 14 Oct 2025 01:49:44 +0000
Date: Tue, 14 Oct 2025 09:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1833/1833] mm/.tmp_mmu_gather.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202510140917.DgHqVl2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   73b5f1b4acec251c96a2d0ba87dd39e1a68a0381
commit: 1f7b24152a85bec4ea4f5a6219b4702853ffd3e6 [1833/1833] mm/memory: Move mmu_gather and TLB invalidation code into its own file
config: x86_64-buildonly-randconfig-003-20251013 (https://download.01.org/0day-ci/archive/20251014/202510140917.DgHqVl2E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140917.DgHqVl2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140917.DgHqVl2E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/.tmp_mmu_gather.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
