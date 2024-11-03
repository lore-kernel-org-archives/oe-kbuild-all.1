Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C815D5C1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730660502; cv=none; b=FyELT2jZUnupollhcFiQ/OPgttgLGwE2+ryfvPkfySdFLxrQo29URteXNiGtamBays4u7zrlB+F4UcPjgJccEzAs+PTTMiyim7ka76Jb+k/wDcvzquO7/1jOAH/ONRkQ08U8mJRStxeaRHQZti2dQkCr+JyTEtmoK3vQmnVuM8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730660502; c=relaxed/simple;
	bh=fByrdZZ7rsAUdzZYUIPmw5Rbdq0zGf2mqoBkpI0GR1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BrEhyS37ZNVVgzNZAw5mNOMpELg2hEBQ9SoVK/csAfs6kLDaxbfLJbEI4vR0J09HiQAcNb3+RAotD5z7n7IQHMaCtnkOdlNOLUHKVTmmvfSFvkQLP6R418FuNO9O8Bk58QoKMmfwXTNdGPgIAkfYCXE93Sa33Z+d8VR3f7xEXmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdlRpQod; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdlRpQod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730660500; x=1762196500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fByrdZZ7rsAUdzZYUIPmw5Rbdq0zGf2mqoBkpI0GR1c=;
  b=gdlRpQod9IU2On3VCAl266DM/dxicoFi7b9M627lLyTE5yr9dyuvpDAu
   MCfs3JcL1BNKlMaQcirHpbPOWnw3rqn/Gru+CVsG9awzo8tkhs9RZUjjJ
   69tf7zF7Z0+FV2aBz6baAmXKwx5ja66n7XSD4m4RJBsdrMm29Zwebdb+F
   0TfnaFudw64q4xoD3vIQk8TTI01zIR8aV7VgF2xvsPpSo+mpzK+NnkaVp
   Hj8w4HZY+vSNbR9o09LyTbCkUGYlgGUAJ2C/L4YfEDqTYnewJTrz7h6/c
   d+Xm4oI5un/nN/8qJMiTFSv2/t+Vbg/C6Qm1DMkl5Q8ny3uDxYt5h1YHN
   A==;
X-CSE-ConnectionGUID: 87ElfuDgTEeYUW0dGxrrqw==
X-CSE-MsgGUID: EaJJrD2cTq+z0GKpWMJY1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="29786224"
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="29786224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 11:01:39 -0800
X-CSE-ConnectionGUID: IqMkKDOITJOb+Fk1URxrcw==
X-CSE-MsgGUID: hqCbP0eoT76qW8VvIh6q+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,255,1725346800"; 
   d="scan'208";a="84274149"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Nov 2024 11:01:38 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7fqx-000k93-1t;
	Sun, 03 Nov 2024 19:01:35 +0000
Date: Mon, 4 Nov 2024 03:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1231/1231]
 arch/arm64/kernel/mpam/mpam_ctrlmon.c:203:38: warning: variable 'rr' set but
 not used
Message-ID: <202411040244.T5Iwab5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: 344e656b7d90e2c612b1d28b38031f478b6ec6a7 [1231/1231] arm64/mpam: resctrl: Rebuild configuration and monitoring pipeline
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241104/202411040244.T5Iwab5V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411040244.T5Iwab5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411040244.T5Iwab5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'resctrl_group_parse_resource':
>> arch/arm64/kernel/mpam/mpam_ctrlmon.c:203:38: warning: variable 'rr' set but not used [-Wunused-but-set-variable]
     203 |         struct raw_resctrl_resource *rr;
         |                                      ^~
   arch/arm64/kernel/mpam/mpam_ctrlmon.c: In function 'resctrl_group_schemata_show':
   arch/arm64/kernel/mpam/mpam_ctrlmon.c:307:38: warning: variable 'rr' set but not used [-Wunused-but-set-variable]
     307 |         struct raw_resctrl_resource *rr;
         |                                      ^~


vim +/rr +203 arch/arm64/kernel/mpam/mpam_ctrlmon.c

19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  198  
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  199  static int resctrl_group_parse_resource(char *resname, char *tok, int closid)
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  200  {
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  201  	struct mpam_resctrl_res *res;
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  202  	struct resctrl_resource *r;
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29 @203  	struct raw_resctrl_resource *rr;
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  204  
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  205  	for_each_supported_resctrl_exports(res) {
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  206  		r = &res->resctrl_res;
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  207  
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  208  		if (r->alloc_enabled) {
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  209  			rr = (struct raw_resctrl_resource *)r->res;
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  210  			if (!strcmp(resname, r->name) && closid <
344e656b7d90e2c arch/arm64/kernel/mpam/mpam_ctrlmon.c Wang ShaoBo    2021-02-24  211  				mpam_sysprops_num_partid())
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  212  				return parse_line(tok, r);
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  213  		}
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  214  	}
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  215  	rdt_last_cmd_printf("unknown/unsupported resource name '%s'\n", resname);
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  216  	return -EINVAL;
19cab98fba25040 arch/arm64/kernel/mpam_ctrlmon.c      Xie XiuQi      2019-01-29  217  }
1abcabe9dab59ec arch/arm64/kernel/mpam_ctrlmon.c      Yang Yingliang 2019-01-30  218  

:::::: The code at line 203 was first introduced by commit
:::::: 19cab98fba25040817f1a6b9b6b70c6b458a169a arm64/mpam: use mpam_{read/write}_sysreg_s for debug

:::::: TO: Xie XiuQi <xiexiuqi@huawei.com>
:::::: CC: Xie XiuQi <xiexiuqi@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
