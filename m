Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A222A42056
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711219637; cv=none; b=CX100TsqgeEd/LlJ/q/wBdrX0tCEoby7okfD96fV9wgNQcK+oOulUmg2nm67Yp311NPmRGY4hkTve/woXYa94f0jOfIjLBcWr/bwJhtomuVAJkbOu6aODSK312UO6egusgBiPNX2AVmTOtP8UQD8N4QKVEpyv1VbW7wQ2I+s5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711219637; c=relaxed/simple;
	bh=xjicee+HUqCnL4uIM8zu1AJsVaTgwuoGfctM9etTwo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkjfDmj+Vje6xHCJrFTyjKZpGg4lAYkwkmSY9ChBgk/SdQeyjv89ekxYARPAgD2iTmI+eoJ1TmRGDTXaTeiJHoFRDr3wqJM80Fe7v9WIK/Q2txP13rJXBUB2gs940ovUozaYFraGB3t/pHhQeC8uIaOxV125TLhhUUiRtB5juns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwkfJg7u; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwkfJg7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711219636; x=1742755636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xjicee+HUqCnL4uIM8zu1AJsVaTgwuoGfctM9etTwo4=;
  b=LwkfJg7uD/B0zEEZomXVjOxUx0jg3jypBrrbUQCIw1Hh0ngkn6T0Kx0r
   iDITCnPCdH+SORbRzb5IPA9mfAQUWauQtWgNwLkYR+wVt/SKcAECOi+pF
   +XzvmI3FcixjB3CfRfeUkeVy+9/wi+8Ylx9u9duav7VVEFk9jBbjpVvsQ
   9I04yZm0XajU6OCjVxWXweg589BvcICyI6U/ystojjaebNRIaZHrDdeP9
   5wLX2rKNqeCn++52YuJrxGvJUBGPIpLuCWp4Rx7PV1W4eNSdHEpBeqnpR
   HVQl+UPqmiYjycO5beIhdnW+7sfjyxsaW/QtzD5GLT0YTBQ4oLWQB0wGm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6153966"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="6153966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 11:47:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15250981"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Mar 2024 11:47:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro6Od-000LPH-2W;
	Sat, 23 Mar 2024 18:47:11 +0000
Date: Sun, 24 Mar 2024 02:46:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1780/6857] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for function 'module_disable_ro'
Message-ID: <202403240225.chgQpK3C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1b4212c630731d88b07d5b6e28ecaff1a76d3839
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [1780/6857] livepatch/core: Revert module_enable_ro and module_disable_ro
config: x86_64-randconfig-015-20240323 (https://download.01.org/0day-ci/archive/20240324/202403240225.chgQpK3C-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240225.chgQpK3C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240225.chgQpK3C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for function 'module_disable_ro' [-Wmissing-prototypes]
      36 | void module_disable_ro(const struct module *mod)
         |      ^
   kernel/module/strict_rwx.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | void module_disable_ro(const struct module *mod)
         | ^
         | static 
   1 warning generated.


vim +/module_disable_ro +36 kernel/module/strict_rwx.c

    34	
    35	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
  > 36	void module_disable_ro(const struct module *mod)
    37	{
    38		if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
    39			return;
    40	#ifdef CONFIG_STRICT_MODULE_RWX
    41		if (!rodata_enabled)
    42			return;
    43	#endif
    44	
    45		module_set_memory(mod, MOD_TEXT, set_memory_rw);
    46		module_set_memory(mod, MOD_INIT_TEXT, set_memory_rw);
    47		module_set_memory(mod, MOD_RODATA, set_memory_rw);
    48		module_set_memory(mod, MOD_INIT_RODATA, set_memory_rw);
    49	}
    50	#endif /* CONFIG_LIVEPATCH_WO_FTRACE */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
