Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684941C2DA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 22:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227955; cv=none; b=BfSH7YS+HSyDSBC8npUfeiyObljSvtVYc0W81mEZMA1mEVq2XWGB2fcFiU9XYiKwB+FH8LvcIwkws0lupU2C8g6siXtQZAz5mA2cOpVSLDz14/Dzh7Pp91c6eruECRwlSCAQrF1v8ciYVuCJrBkYG7Iz4R+N1WYMy/fcvKgSJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227955; c=relaxed/simple;
	bh=2Qo4HhZRwP3/CZ0GFX92Pubc6GSsZTPWOrKL4KAcchA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qi8LEd6yl6ag8lInyBdCdWcSnpWmSSkyr95aHSAWqn4/qa+TSxkXTiV8xNLGPrvOaFLBm/JLxoca8/QiP5aPvkYOJLVZiqCuiG8Lmn+TD3ESNS3zijg2+YoCwEZMsQy2sfCFAAtjvC+LmZOZDQ/ustN9G2bgTgcaatHAAGjBcxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaxDbRn6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaxDbRn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739227953; x=1770763953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Qo4HhZRwP3/CZ0GFX92Pubc6GSsZTPWOrKL4KAcchA=;
  b=DaxDbRn6bMNS+wgcwGWrgZYW3V2RNs/k5EsnLagXp8kOCxpB/HJrnkgI
   IIdKRacfvYJfk0/wJk0GhPDSB9hR9IikS3I9kEKfvJ0j6qmZmdXPNQcs3
   wuw8792yHDi8CEhKPYcibUq/fFwlUBekYRkaoeefHH/BrQisO/iXigdpf
   FwTGIhmTjQjsiWEsTW1jf7PC6j9caVk1UFt+L0Ycqut5o/bI2OoUm+iV1
   FWo/TS/TfKD4q/hfmuXpJi+odNWYqZzb9FEsxhHpneILrkRUDvWvhcPBG
   czXUUgbECpAfLiiADD+NEjaSAy34/uKKNW7WvoOvtu8UAX8/0uhW1lBhy
   A==;
X-CSE-ConnectionGUID: lawq9qZEQ0qLBlhoWO39pw==
X-CSE-MsgGUID: k8ojXYfVRJOSBICu1tHc6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39071205"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39071205"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 14:52:32 -0800
X-CSE-ConnectionGUID: 3Ug5aI1xR/6Z5rP2QxnRUQ==
X-CSE-MsgGUID: T3Yi1R/tS/iRIsj+wzgsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112298647"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 14:52:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thcdh-0013Uh-1u;
	Mon, 10 Feb 2025 22:52:29 +0000
Date: Tue, 11 Feb 2025 06:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 217/217]
 drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:445:6: warning: no previous
 prototype for function 'tracepoint_cleanup'
Message-ID: <202502110610.sOUuC284-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b603fe68bcf1fd8aa46dd46190c53d641dce5cf0
commit: 707c2a874f5d3773c20d83f761531c8e00c15547 [217/217] CHROMIUM: misc: mediatek: add cmmgr driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250211/202502110610.sOUuC284-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110610.sOUuC284-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110610.sOUuC284-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:445:6: warning: no previous prototype for function 'tracepoint_cleanup' [-Wmissing-prototypes]
     445 | void tracepoint_cleanup(void)
         |      ^
   drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:445:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     445 | void tracepoint_cleanup(void)
         | ^
         | static 
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:455:6: warning: no previous prototype for function 'cm_mgr_process' [-Wmissing-prototypes]
     455 | void cm_mgr_process(struct work_struct *work)
         |      ^
   drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:455:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     455 | void cm_mgr_process(struct work_struct *work)
         | ^
         | static 
   2 warnings generated.
--
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_mt8196.c:106:14: warning: no previous prototype for function 'csram_read' [-Wmissing-prototypes]
     106 | unsigned int csram_read(unsigned int offs)
         |              ^
   drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_mt8196.c:106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     106 | unsigned int csram_read(unsigned int offs)
         | ^
         | static 
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_mt8196.c:113:6: warning: no previous prototype for function 'csram_write' [-Wmissing-prototypes]
     113 | void csram_write(unsigned int offs, unsigned int val)
         |      ^
   drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_mt8196.c:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | void csram_write(unsigned int offs, unsigned int val)
         | ^
         | static 
   2 warnings generated.


vim +/tracepoint_cleanup +445 drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c

   444	
 > 445	void tracepoint_cleanup(void)
   446	{
   447		if (cm_mgr_tracepoints.registered) {
   448			tracepoint_probe_unregister(cm_mgr_tracepoints.tp,
   449							cm_mgr_tracepoints.func,
   450							NULL);
   451			cm_mgr_tracepoints.registered = false;
   452		}
   453	}
   454	
 > 455	void cm_mgr_process(struct work_struct *work)
   456	{
   457		if (cmmgr_data.hk.cm_mgr_get_perfs)
   458			icc_set_bw(cmmgr_data.cm_mgr_bw_path, 0,
   459				   cmmgr_data.hk.cm_mgr_get_perfs(cmmgr_data.cm_mgr_cpu_to_dram_opp));
   460	}
   461	EXPORT_SYMBOL_GPL(cm_mgr_process);
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
