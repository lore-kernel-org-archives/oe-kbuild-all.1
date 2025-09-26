Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B35C29B216
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879479; cv=none; b=f0cu0TYtogylTsUPCUllk4aQtDMI+KNImDgagSq0KY+RU5wqPqPa+mxMZahMiMa7D9QPexRZQfrOiF+J/gqSDerqfI6JdTskMvJwomZ5kEp34TGq5Ocn9ZhxjiqirdXOAOBXe12SYxTwNit7tMKjfhWsq9iRIb0gAKZ4ntmeHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879479; c=relaxed/simple;
	bh=0pIj8+3Ga3wiIsSnaOziM5gISs8vlMCaD0uo4PLkQp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7DdbSaN1zdgOoVM+eTdnLMrKxUdnnZHw1SOEyMia5uYAsBdgM60aDLsXKhsiSM4egLuZr2pgu6ekdCguyb49BgT++4Ji4gAmxzJHr23QWe/k2xSqXkfH5/MIuLKLmSO0NOLRYuiuP382FaiD7cXcIb7+Nu5/BEhoH2CPAW4UbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk27manX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk27manX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758879477; x=1790415477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pIj8+3Ga3wiIsSnaOziM5gISs8vlMCaD0uo4PLkQp4=;
  b=Nk27manX9LzgcJIt+NgfJn8g3ZLztha7rVXtS/SUfDUDYhbVtgD5S++T
   8LWxXNPTCBysUdP1KcRe1wTZ+Zc3ARjvr8JA5tEk7jdSJiosBt8k2Tmj+
   uPwdd65BanST5gnomMjQ3yg/aX29rF8NZzs1GFDz4RdmYoYm006bxLDRV
   GBC7Y9pn5OjK6S+H3HW+E4c7nxYY5H+v9Ei9Fa6vRZJZasI+YLFXzQHE6
   nvl2sNYN0ybKWE0RA749edgpoJatunk4eNoGTUQTfs/RASZaXKejYd0/R
   Ioj2yiL9nLTTMspg4Tc64EvreC4UEdxCoXEcvfjDWKgYE4PsZWT1MS2TI
   w==;
X-CSE-ConnectionGUID: cC9iogDjSpuxtZCJHuYgIA==
X-CSE-MsgGUID: OZ3XCfN9QamsHIFXplBIVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61161943"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61161943"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 02:37:56 -0700
X-CSE-ConnectionGUID: ww7FNrdyRC696LMI/NT3qQ==
X-CSE-MsgGUID: KtdYRZGHRiq1x7Sl8BmDDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="208505121"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Sep 2025 02:37:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v24ti-00065Z-01;
	Fri, 26 Sep 2025 09:37:50 +0000
Date: Fri, 26 Sep 2025 17:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2938/2938] arch/arm64/include/asm/xcall.h:13:31:
 error: use of undeclared identifier '__NR_syscalls'
Message-ID: <202509261758.dGIOcfV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3e16741023a15d92f4be3343cb4d8b508327dda3
commit: b5fb30ccdb3d8ed46e1e740d9aaebcb96f8db97a [2938/2938] arm64: Reserve a kabi in task_struct exclusively for xcall
config: arm64-randconfig-004-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261758.dGIOcfV5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261758.dGIOcfV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261758.dGIOcfV5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/xcall.c:10:
>> arch/arm64/include/asm/xcall.h:13:31: error: use of undeclared identifier '__NR_syscalls'
      13 |         DECLARE_BITMAP(xcall_enable, __NR_syscalls);
         |                                      ^~~~~~~~~~~~~
   arch/arm64/kernel/xcall.c:23:8: error: use of undeclared identifier '__NR_syscalls'
      23 |                             __NR_syscalls);
         |                             ^~~~~~~~~~~~~
   2 errors generated.


vim +/__NR_syscalls +13 arch/arm64/include/asm/xcall.h

    10	
    11	struct xcall_info {
    12		/* Must be first! */
  > 13		DECLARE_BITMAP(xcall_enable, __NR_syscalls);
    14	};
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
