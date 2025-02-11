Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1E91F1908
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283141; cv=none; b=mOQWoeEclYrovCDHClYMAeELzv5/J9Cs8/kXzvAAEv27rD8KuiQaq5jsAe6++elkc6sCGAQZBzAquy70IAir1KDTzJ92PLe2UPtD0D8Lh1FbmmbUIVLI8u7mrMChMe/r1j6iHgoCmKHvCaM7Xl3D9/pRP6A/sN8hbU8GmPvpqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283141; c=relaxed/simple;
	bh=wZfygBnp4PnfD4Pr85KQ3iHG4vKFQOKAfv8kq1n4KoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZWQqFP/CnUqYqGrqSz/GZgzIxS4j9t+uY5ZZmbhqZ/EnT5omhnX1e5kwd/OnSeUbCEUBLdwQXKqXWGb/oKJ+mu/39+oIeGh3sBK6WiL2E4hrFLChO2LH2SZh/DJIce3YBh6uf1mBW7US+yXDJdqtPXhZLPA3aRvsMqNZBVLpKRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzyTexdK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzyTexdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739283140; x=1770819140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZfygBnp4PnfD4Pr85KQ3iHG4vKFQOKAfv8kq1n4KoY=;
  b=kzyTexdKRjg3kYSh60yveL2mg5YESymurnMe3ri0IBlY6QVsPiieq1iy
   VXlnRiEkF6JjG32AStVPvDWQBxHaMHixs1Nsih3I5xNKvH5wjfOqVg3lR
   jTSg9Lal7WWaQ+WREu/BZju04tifqR0vHNG9QSkkH1SBCySd3xYcrY8nO
   tx6hAQb82ChWPfRnTbQm/CuaGrHydRZSLGuEAm/yivhStz+7j0gqlFcRX
   lqSwwcHpkwKLFNrzeTsDQjgawGq+bd9o+FHe5m6fVi8NjYNioiItcgm1O
   rMnrt4lzBd2rHXuPDt6JMYOrsfpyZZjMTFg8G+0HVZWtKM0lGZgi5ZERd
   Q==;
X-CSE-ConnectionGUID: bWh7CCnVQ+G9KRZweBoomA==
X-CSE-MsgGUID: nvvuviY5THOT/u0xx4KfFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39764525"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39764525"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:12:19 -0800
X-CSE-ConnectionGUID: o8YUdXZrRXu5AOgTRT8bTg==
X-CSE-MsgGUID: ossSux/8RCy8PqLMufE61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117701741"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2025 06:12:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thqzn-0014Gq-1j;
	Tue, 11 Feb 2025 14:12:15 +0000
Date: Tue, 11 Feb 2025 22:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 217/217]
 drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:445:6: warning: no previous
 prototype for 'tracepoint_cleanup'
Message-ID: <202502112219.fG29GLRM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   d8b751fd3af6d588deedf36a0a932aeb3cc6355e
commit: 707c2a874f5d3773c20d83f761531c8e00c15547 [217/217] CHROMIUM: misc: mediatek: add cmmgr driver
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250211/202502112219.fG29GLRM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112219.fG29GLRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502112219.fG29GLRM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/misc/mediatek/dramc/: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/qos: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/drm/mediatek/mediatek_v2/: No such file or directory [-Wmissing-include-dirs]
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:445:6: warning: no previous prototype for 'tracepoint_cleanup' [-Wmissing-prototypes]
     445 | void tracepoint_cleanup(void)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_common.c:455:6: warning: no previous prototype for 'cm_mgr_process' [-Wmissing-prototypes]
     455 | void cm_mgr_process(struct work_struct *work)
         |      ^~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/dramc/: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/qos: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/drm/mediatek/mediatek_v2/: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: drivers/misc/mediatek/dramc/: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/qos: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/gpu/drm/mediatek/mediatek_v2/: No such file or directory [-Wmissing-include-dirs]
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_mt8196.c:106:14: warning: no previous prototype for 'csram_read' [-Wmissing-prototypes]
     106 | unsigned int csram_read(unsigned int offs)
         |              ^~~~~~~~~~
>> drivers/misc/mediatek/cm_mgr/mtk_cm_mgr_mt8196.c:113:6: warning: no previous prototype for 'csram_write' [-Wmissing-prototypes]
     113 | void csram_write(unsigned int offs, unsigned int val)
         |      ^~~~~~~~~~~


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
