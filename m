Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0941CD1EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 01:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731548456; cv=none; b=ZRDG4gVMD7tMY+VZGj+B9lUaiaFniufr4piTNinyVL/WzW8Wl5AMAqWBfuUeCtLmA0Rr1AJH3yIZGD43gDkKUnBnEVDbVPE9Y3/ardlo5PPcjbtk002BU4gNmGExhTuyJDTMh2u3hvNpUn1wJiPlQhYPKpG2O5TlvKUiHRDaVBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731548456; c=relaxed/simple;
	bh=VWKK1Yxy6osbx6FJboDIOxi+d3EAU3Zb6EwkVewLU7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5+f2QqxE0GEUfnTT+WJEylTN3z7WxKIiTsLdfBV0B3SBYHCteKJlT5GlpvfXr+5CWgCq5CXy7twpQSmTaraUk8virdFCYVw9+qOL6KUG30n4YWE8Nr7fJupO/7/ae6PqF7xobqM16ly1PnuSTJ798aLqj9D5F6OmJsl2NyNXZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPGpmxkS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPGpmxkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731548455; x=1763084455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VWKK1Yxy6osbx6FJboDIOxi+d3EAU3Zb6EwkVewLU7g=;
  b=ZPGpmxkSGGn2uqudFnfaP9Zb6FAbb73S5c5jrWt7sxaodZF8v5quLKAV
   VCB0Px4aYucri5o3ln0fDaOOnhDZLpGHixdvAYmg+5997mFSsCCiB1Bf/
   UTOSe9xKI8/zkMxWp/lqz6C+O2YEV37uRH/o/giv8E5pDr5b7ZRpiTtVe
   PmC14uOI8uukVQb4FwfbLH2MblybTIiMI8LVu255hnEtpUfRcchz7uzac
   BK6KvocWEQ5aK848oi+9cLkkDBpfy8P6RmT0ntPG9aWEBrGapmjPJRvsc
   1MEXFykAWXQDz0H5olT1Pr3vOia3hPOn9D5xYB35iYUMd8hIsJ9LJtH0+
   g==;
X-CSE-ConnectionGUID: Zhg6Kz/ZSVCY/dBDP9xs5g==
X-CSE-MsgGUID: q5HPtNPXQgeAjqmg/w13dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42891081"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="42891081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 17:40:54 -0800
X-CSE-ConnectionGUID: TPmBUbpsRYKQWF/HPy4rFg==
X-CSE-MsgGUID: 0CeCDXtNTe2y9oRPTQGL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88438714"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2024 17:40:53 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBOqo-00013F-2o;
	Thu, 14 Nov 2024 01:40:50 +0000
Date: Thu, 14 Nov 2024 09:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:kho/v4-WIP 13/20] WARNING: modpost: vmlinux: section mismatch
 in reference: show_stack+0x158 (section: .text.unlikely) ->
 __memblock_reserve (section: .init.text)
Message-ID: <202411140924.jsi28THs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4-WIP
head:   401fd7ef5ce8b2956ae43444f9aac07f7d31f068
commit: 33ee51ad3d391de67e60c28d987cabee8b32a46b [13/20] dev: memblock: add MEMBLOCK_RSRV_ALLOC flag
config: xtensa-randconfig-002-20241112 (https://download.01.org/0day-ci/archive/20241114/202411140924.jsi28THs-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140924.jsi28THs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140924.jsi28THs-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: strcpy.isra.0+0x14 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: show_stack+0x158 (section: .text.unlikely) -> __memblock_reserve (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: memblock_reserve.isra.0+0xb (section: .text.unlikely) -> __memblock_reserve (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
