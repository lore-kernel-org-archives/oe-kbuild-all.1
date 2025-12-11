Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0316D1EB19B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 16:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765470858; cv=none; b=iCa5lOdEpUdT1+acxfrK2ewpy0SrAmEMKH14QesuEeiD6bom04DxwdSAKlA/LefU6ROrkMdbGiMbRTqTHgMtwARGkpXf/oTtIeAQX3B+e5bglFGZOr/YzbFUDeAG12l1nAgtDtN2abEXoHH3kQyE678FZZbPOGN26PzQRc3/1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765470858; c=relaxed/simple;
	bh=TOkhd7SMkPlOPVofKT7JHA+i7dMPPP4sFgJApv+90/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKxaiPn+CznWd+9J50c+nOubcriI+ueFLEktRrQvpBA2IyB5DAbl4MTCNYt3K7+bxcl4TapEaOQ9q73VpeyEdPML2zu0YS8c2mA9FyvJKgi5ywOlIc/0hepTfjMREJ1/MWQm/H33hzeBz6KaLgCFZFRt8pfkeJvxvjZqqM8bv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBBdkQgI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBBdkQgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765470856; x=1797006856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TOkhd7SMkPlOPVofKT7JHA+i7dMPPP4sFgJApv+90/0=;
  b=aBBdkQgIDkU7HNVoTTYp0zib44tXOLMoOnSYopAE7FbLj8679jvCqpbX
   dD4IUHuKIRmPGx4Etk64MU+T74J2VXgMRIJOhraoxY5KwxsNRKH4B+hhL
   fHgDjj4jcfHBxgqOEmYx/rUYmPYRAekySYxB3VoWHIrYDNiuHZI5eBusn
   owHeg47AcQmLoBCCEruPnqTYCIU6Hd9/tWB03faMwNMrbmSGItsTWtoWb
   3YvJmRbtA41ChVLUzJjFKkVQ5jLvYUs05LQpRGnfRM24YWj0OoJeKdl+i
   yBF/OsLV+2NTD7UeUy3dq3D1TEyzxRaLw3vhbQi8HGnjYX0Yt/5/MPFXK
   g==;
X-CSE-ConnectionGUID: EXX6rXuKTP6PbKxFj9nhQg==
X-CSE-MsgGUID: 9RNdgaTKQsyjMW53GTprWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67498891"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67498891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 08:32:15 -0800
X-CSE-ConnectionGUID: +TUIN7xMTNKMp9tREgezgw==
X-CSE-MsgGUID: 9I3S9pddRISn1TBbOhZ4sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196905997"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2025 08:32:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTjaM-000000004sT-3IRc;
	Thu, 11 Dec 2025 16:32:10 +0000
Date: Fri, 12 Dec 2025 00:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3536/3536] kernel/livepatch/core.c:2046: warning:
 bad line:
Message-ID: <202512120043.Ja8LDkyR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 29f85d3cff2dfa35ace94d3e4036d5ea456eb859 [3536/3536] livepatch: Add klp_module_delete_safety_check
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512120043.Ja8LDkyR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120043.Ja8LDkyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120043.Ja8LDkyR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:2046: warning: bad line: 


vim +2046 kernel/livepatch/core.c

  2033	
  2034	/**
  2035	 * klp_module_delete_safety_check() - safety check in livepatch scenario when delete a module
  2036	 * @mod:	Module to be deleted
  2037	 *
  2038	 * Module refcnt ensures that there is no rare case between enable_patch and delete_module:
  2039	 * 1. safety_check -> try_enable_patch -> try_release_module_ref:
  2040	 *    try_enable_patch would increase module refcnt, which cause try_release_module_ref fails.
  2041	 * 2. safety_check -> try_release_module_ref -> try_enable_patch:
  2042	 *    after release module ref, try_enable_patch would fail because try_module_get fails.
  2043	 * So the problem that release resources unsafely when enable livepatch after safety_check is
  2044	 * passed during module deletion does not exist, complex synchronization protection is not
  2045	 * required.
> 2046	
  2047	 * Return: 0 on success, otherwise error
  2048	 */
  2049	int klp_module_delete_safety_check(struct module *mod)
  2050	{
  2051		int ret;
  2052	
  2053		if (!mod || !is_livepatch_module(mod))
  2054			return 0;
  2055	
  2056		ret = stop_machine(arch_klp_module_check_calltrace, (void *)mod, NULL);
  2057		if (ret) {
  2058			pr_debug("failed to check klp module calltrace: %d\n", ret);
  2059			return ret;
  2060		}
  2061	
  2062		return 0;
  2063	}
  2064	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
