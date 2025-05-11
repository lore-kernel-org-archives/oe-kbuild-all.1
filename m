Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB4645
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746969525; cv=none; b=lXEqbSBB9lpTICfhEHUPo7csaReOVcrAy2B5zCStxtOdndzYnQpsSohi9xsurffJOsEH9S/Lpx3/ltf9W36aSayFhDaFY47EPzr4YyVOqCMKwOftlRK2k4gvbDCgtUvgrGAmYd++cPA9JUgL0S7aLbMvkEVq5sFqQXn0hQJiLUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746969525; c=relaxed/simple;
	bh=3T7TjgmQw4XwIkHp6Umj0ChxPbjgWDhWnqDsS+sKbss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=roxbuHBmXx0ZgQz04IdFVyThyjCk4O67KnW6nEyEihQYMRSQ3S4z/9b/7whtY6oTk9WfAxXakVVofXuWcVw06xVZJiMTDuc/RHumzYhY273XavuxLqE/N3bAIMgyMI0/Il63YVxRpgS8SbyY/vSUAMcXMfKy95jjVrMZxcBLDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEGkedkQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEGkedkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746969523; x=1778505523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3T7TjgmQw4XwIkHp6Umj0ChxPbjgWDhWnqDsS+sKbss=;
  b=SEGkedkQE/emkUSJFT8R28sWQ9wTxjIt15fYsa2XrKm5olJcoJRt/AVH
   Rrowz7CRd6hS8dYrAhvUREI5dEXdPwVu94/sQEmjAPKvnG37sULiNM+Gr
   u21yklKAMRHlXZfCS5ZhKNklRTE8RMJLop6FaK5PWMzinYHrYaVNp1jcC
   MsSz1zr/3EzsVJgHxpOVOIaDyagbsIPokyuJtVT2oM/s41CsL+yZEgb8F
   CKACpKMJzmjoGCAlKmCxyGLIGEoI1bLdHjLtlRDmd31AE0xxmHA9aM0H7
   mMJ1GweHqD8OviP/iUJHo8gjEn5KJrjkRWkYF7EiJA5vm03WGluwOeJd9
   g==;
X-CSE-ConnectionGUID: Fj+CYhlcRCe9cjOWz/Ml8g==
X-CSE-MsgGUID: 6TFeGWQkQ3eME+rsi+s7ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66303061"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="66303061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 06:18:42 -0700
X-CSE-ConnectionGUID: 16Hnb1k1Qi+icy2yKGYI9Q==
X-CSE-MsgGUID: COsh6PA4SBG9E2e51ytS9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="142231395"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2025 06:18:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE6Zj-000Dlz-0Z;
	Sun, 11 May 2025 13:18:39 +0000
Date: Sun, 11 May 2025 21:18:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94]
 drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for
 function 'vpsp_set_default_vid_permission'
Message-ID: <202505112150.oTOGp9zL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5b7daba404993131fe0d699e5acdccaa5bc3a017
commit: c064140695cecdb1ffb00447520a4e286081e5a6 [0/94] anolis: crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505112150.oTOGp9zL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505112150.oTOGp9zL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505112150.oTOGp9zL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for function 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^
   drivers/crypto/ccp/hygon/vpsp.c:589:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         | ^
         | static 
>> drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for function 'vpsp_do_cmd' [-Wmissing-prototypes]
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^
   drivers/crypto/ccp/hygon/vpsp.c:1055:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         | ^
         | static 
   2 warnings generated.


vim +/vpsp_set_default_vid_permission +589 drivers/crypto/ccp/hygon/vpsp.c

   582	
   583	/**
   584	 * When 'allow_default_vid' is set to 1,
   585	 * QEMU is allowed to use 'vid 0' by default
   586	 * in the absence of a valid 'vid' setting.
   587	 */
   588	uint32_t allow_default_vid = 1;
 > 589	void vpsp_set_default_vid_permission(uint32_t is_allow)
   590	{
   591		allow_default_vid = is_allow;
   592	}
   593	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
