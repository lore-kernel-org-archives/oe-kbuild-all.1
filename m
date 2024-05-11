Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E2847A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715419261; cv=none; b=hdp1nVFJHvOCchQ4+BVckhul+Nh+tA/5gGMUiQCCcmE6yFo/qAeXBdEnyEFEmin0zvhM3CktRunrMhcCwTXnILfulK3MyS6juyWtb//wKdgpYtM/K/O1+5m/k4XJNb2pckN8IHSGzsV9Rbcfr/rzLxEPDf1jHnTDex/rmPIVYIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715419261; c=relaxed/simple;
	bh=2QV7NLOKyt/yS0H7xRDSnOu98xWHJBBVaBmI2uyKlr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGJraCzkGR1ABvCq04VvAalzJcSV6wj95JTln7VXeMFyF/9QEZfIJS0bm1Tr84l9Z6MgBTDxbON7xu5LeN+mqVT5AQhX3ud9JYYOtIs/eXYPUUOWAdZxm7oKMoOMrdgIOjmZEYtOujsV2Lq1XqihWvSKSP7sOeO4CUvEYCAqGHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeIiGsWN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeIiGsWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715419260; x=1746955260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2QV7NLOKyt/yS0H7xRDSnOu98xWHJBBVaBmI2uyKlr4=;
  b=OeIiGsWND4HkC7qhbnXcWP21epTxhqWL3Y8HiXG1Vqv/BcaBpfYUHFJu
   eBvjN3Cqc3UxOYdYLkDPZeopnOen9n1eYzOCt7AtwWcHT3id5DQUEefE0
   lW0MsW4EJtOETXEn9T3WYbmxt9o7nmD/XvAtEiSdhdWfPL8K5OsStcIJ+
   GGpEkmLkbcNs4Dyf3tLiB76C4XGr80juGlgU96rxcskhyS/dmPOc75EPt
   JvTcRTDeq08MgnBPiWTV6f66IPxJ1WmXHY/uqWISQOe4+IxalK4b371Js
   vfxkHUcAJYZPowBElKt9jOpjXTGDIUY6m5J3IafZMoaMFB43NshJ5fspN
   g==;
X-CSE-ConnectionGUID: 2Ycs3DHYTW6Pwurc5hjqZw==
X-CSE-MsgGUID: 8i6C1+/cQRaIUo9chWEnBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="22085913"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="22085913"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 02:20:59 -0700
X-CSE-ConnectionGUID: mAleevA5SLCbVMbwYDan3Q==
X-CSE-MsgGUID: eyXKS5QFRliI9jf/zIeFhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="34406988"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 02:20:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5iuV-0007BD-0o;
	Sat, 11 May 2024 09:20:55 +0000
Date: Sat, 11 May 2024 17:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 09/20] drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
Message-ID: <202405111645.xTy2cQ1s-lkp@intel.com>
References: <20240510181212.264622-31-matthew.auld@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510181212.264622-31-matthew.auld@intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on drm-misc/drm-misc-next next-20240510]
[cannot apply to linus/master v6.9-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-drm_managed-try-to-improve-the-drmm-DOC/20240511-061452
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240510181212.264622-31-matthew.auld%40intel.com
patch subject: [PATCH 09/20] drm/xe/guc_pc: s/pc_fini/pc_fini_hw/
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240511/202405111645.xTy2cQ1s-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111645.xTy2cQ1s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111645.xTy2cQ1s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc_pc.c:897: warning: Excess function parameter 'drm' description in 'xe_guc_pc_fini_hw'


vim +897 drivers/gpu/drm/xe/xe_guc_pc.c

dd08ebf6c3525a Matthew Brost          2023-03-30  890  
bef52b5c7a1904 Rodrigo Vivi           2023-12-08  891  /**
d4543ae6de1c7e Matthew Auld           2024-05-10  892   * xe_guc_pc_fini_hw - Finalize GuC's Power Conservation component
8a4587ef9f9521 Michał Winiarski       2024-02-19  893   * @drm: DRM device
8a4587ef9f9521 Michał Winiarski       2024-02-19  894   * @arg: opaque pointer that should point to Xe_GuC_PC instance
bef52b5c7a1904 Rodrigo Vivi           2023-12-08  895   */
d4543ae6de1c7e Matthew Auld           2024-05-10  896  static void xe_guc_pc_fini_hw(void *arg)
dd08ebf6c3525a Matthew Brost          2023-03-30 @897  {
8a4587ef9f9521 Michał Winiarski       2024-02-19  898  	struct xe_guc_pc *pc = arg;
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  899  	struct xe_device *xe = pc_to_xe(pc);
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  900  
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  901  	if (xe->info.skip_guc_pc) {
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  902  		xe_gt_idle_disable_c6(pc_to_gt(pc));
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  903  		return;
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  904  	}
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  905  
fb74b205cdd263 Rodrigo Vivi           2024-04-23  906  	if (xe_device_wedged(xe))
fb74b205cdd263 Rodrigo Vivi           2024-04-23  907  		return;
fb74b205cdd263 Rodrigo Vivi           2024-04-23  908  
649a125a88da64 Daniele Ceraolo Spurio 2024-03-18  909  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
1737785ae5313e Riana Tauro            2023-07-17  910  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
dd08ebf6c3525a Matthew Brost          2023-03-30  911  	XE_WARN_ON(xe_guc_pc_stop(pc));
8a4587ef9f9521 Michał Winiarski       2024-02-19  912  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
dd08ebf6c3525a Matthew Brost          2023-03-30  913  }
dd08ebf6c3525a Matthew Brost          2023-03-30  914  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
