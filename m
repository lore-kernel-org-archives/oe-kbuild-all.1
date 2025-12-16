Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668C33A9CD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889841; cv=none; b=bAYiAfqHfrDyL4BVmAqjSn8yP4PtUiSKhtSHnE1GoHmWkM4GZBOiWsglD6Sbc+O876banPMyf1Q9SsKlIULXUrPWxRRrubu59uc3A+qownr7DiDBQwQlQpkJ8AZvYSPxraxNnw4MdvAxZK9Aubpor1IuaY6G/LqfuJ5b5X4Za+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889841; c=relaxed/simple;
	bh=SC30EmYBkS5F37+zgGBDARZ9u9M0TdGGs1Tv7Hjp860=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCbyfzK4xlhct8F9wKmAJaqNnEj8/v0nW14lgZlxy9PCcQe0EqIWiRPMBBBFJNOp//n50EzacSwG3cdEEKuXMQloNeAJWKLQtuQM0qtq1CxWQ+fu/Yo9KVpBSWfE8+1jV/4NNW+9pABmVgbzLs31X3P0w7FY+jMxHuHzbfJdKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjhAgpVc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjhAgpVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765889839; x=1797425839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SC30EmYBkS5F37+zgGBDARZ9u9M0TdGGs1Tv7Hjp860=;
  b=MjhAgpVc2G7Jsd0lKTSMJBc3jvU4M1TQ/393I5e10NcwqHTY+kGmZzrc
   xPPOIj8leKWWhF4EAnXmdFDLlDm0SQ4sLVVWm4cta93khxukEMrKikUTA
   MnhT97ClZnvdp06go4hPoGBbckbhOk6lGN2qgNN9xLq04SiMuLFO8P9uK
   caGjKn7s0fmWKTWi9woRu2gkr7scqmPhLLjJ9fe5MloOmr3cpfL0uCIzZ
   OPgHEQoh/30vLqGeah/j2UwbI0bnLIxc1h/pgDlhU94GPORaqwc7SXtJB
   qXMr0UZ/ONXIopoBY46qbrro1Qs43cSBlWkYyD4mIxSDp7n1wkepnZpwx
   Q==;
X-CSE-ConnectionGUID: qPLatQ37SlKY9yY+hDIFAQ==
X-CSE-MsgGUID: CEtBOOKRRVWW7ynrsUYM4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67841850"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67841850"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:57:18 -0800
X-CSE-ConnectionGUID: TWozQG0gRN+G2GB+q6rpjw==
X-CSE-MsgGUID: eQNNHLUVQ6KmQsnVJvtL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197991657"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 04:57:17 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVUc6-0000000036I-35gi;
	Tue, 16 Dec 2025 12:57:14 +0000
Date: Tue, 16 Dec 2025 20:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for
 'vpsp_do_cmd'
Message-ID: <202512162023.WpbxgSMy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: 5ab469b781062d457ceaca813c0c52350b1f010b [11/11] anolis: crypto: ccp: move vpsp-related functions to vpsp.c
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251216/202512162023.WpbxgSMy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162023.WpbxgSMy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162023.WpbxgSMy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/vpsp.c:589:6: warning: no previous prototype for 'vpsp_set_default_vid_permission' [-Wmissing-prototypes]
     589 | void vpsp_set_default_vid_permission(uint32_t is_allow)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/vpsp.c:1055:5: warning: no previous prototype for 'vpsp_do_cmd' [-Wmissing-prototypes]
    1055 | int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
         |     ^~~~~~~~~~~


vim +/vpsp_do_cmd +1055 drivers/crypto/ccp/hygon/vpsp.c

  1054	
> 1055	int vpsp_do_cmd(int cmd, phys_addr_t phy_addr, int *psp_ret)
  1056	{
  1057		int rc;
  1058		int mutex_enabled = READ_ONCE(hygon_psp_hooks.psp_mutex_enabled);
  1059	
  1060		if (!hygon_psp_hooks.sev_dev_hooks_installed)
  1061			return -ENODEV;
  1062	
  1063		if (mutex_enabled) {
  1064			if (psp_mutex_lock_timeout(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex,
  1065						PSP_MUTEX_TIMEOUT) != 1) {
  1066				return -EBUSY;
  1067			}
  1068		} else {
  1069			mutex_lock(hygon_psp_hooks.sev_cmd_mutex);
  1070		}
  1071	
  1072		rc = __vpsp_do_cmd_locked(cmd, phy_addr, psp_ret);
  1073	
  1074		if (mutex_enabled)
  1075			psp_mutex_unlock(&hygon_psp_hooks.psp_misc->data_pg_aligned->mb_mutex);
  1076		else
  1077			mutex_unlock(hygon_psp_hooks.sev_cmd_mutex);
  1078	
  1079		return rc;
  1080	}
  1081	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
