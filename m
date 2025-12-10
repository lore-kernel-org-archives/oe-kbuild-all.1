Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7982E92B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765376723; cv=none; b=hxSoVTRhJLMN+FbKJcrHN9skF+VQTfDdz/836BgrxPG2qfs1ekxB3ZgRWityobXIRrju1RbPoLcshJcOlwxOhHpTbIR6x7PI/h67hGgrX8AB+17Evk8fXoLsVLADwS78Jx4zVhGgK/CA+KGJDLGrb8PQ8oR03v+6EiJSLvRgZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765376723; c=relaxed/simple;
	bh=2w68UlmEJbO/S0b60ixSExloELa1v4zFGI8l0fcEMk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TIZPeWdbCeQE7E4PwlVs3SeKdvZEcQ6IhNYiihJZl2F5z7K3w1aOQLrUraWRMNxemtKfKFaSaO8KePY+L3KiHt6784VCI0wC1fw6w7CJT0SCIOmWKPadtxmC6vAREvV9M0WzJg85XaWTauaCUSmO8YDinSI6RuUbXrHL7N65bVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZP9BgajB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZP9BgajB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765376721; x=1796912721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2w68UlmEJbO/S0b60ixSExloELa1v4zFGI8l0fcEMk4=;
  b=ZP9BgajB2G0F8cpnk/iiJokf6F1FHioP61b4g5CRY7vMsdA+ye51nAjt
   XuWqr+tRcQ6Mt2nKVulIC4ad11XfT4CYprXfbhq5JFbP6ll8nBj4ILFQl
   zhMlNebMG6/cyOSk/nK7k7f/Une0osmy99zC8t8BM+WDszu8s081u8KvP
   8t2ydPP0jLBJtjuqqQTy/kdjAt/iXaMfkKIOzMla4Zdw7PK1mZ0r+1gGx
   ZVlymXYY+2OaUx6Uk2nPORF+niRiIK4WAYAID+h+/XkTmc1EkSNZqEXau
   rJcN1yUmHZYd4hg/3YwpnTCK+3dO2De3TKaoKL53BIHxxWDFacW2fi5Eh
   g==;
X-CSE-ConnectionGUID: xgAqhIowTWGNx07Qn9J3Tw==
X-CSE-MsgGUID: Rc/A1WeBTgu7PvVr3Q6Qzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54893104"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="54893104"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 06:25:21 -0800
X-CSE-ConnectionGUID: 8SRz8UMwSWmgK/e9z4m7jQ==
X-CSE-MsgGUID: jZ1lFPPdSIOVWtjK4qiusQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="219863627"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 06:25:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTL82-000000003GZ-0u6S;
	Wed, 10 Dec 2025 14:25:18 +0000
Date: Wed, 10 Dec 2025 22:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] fs/fs-writeback.c:138:6:
 warning: no previous prototype for function 'wb_wakeup'
Message-ID: <202512102250.JWOnfnZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7d9fe864dc6289d8c10246453b0c7d3cb3f983f6
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [0/3] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: x86_64-randconfig-006-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102250.JWOnfnZJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102250.JWOnfnZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102250.JWOnfnZJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:138:6: warning: no previous prototype for function 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | void wb_wakeup(struct bdi_writeback *wb)
         | ^
         | static 
   fs/fs-writeback.c:1349:6: warning: no previous prototype for function 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         | ^
         | static 
   2 warnings generated.


vim +/wb_wakeup +138 fs/fs-writeback.c

   137	
 > 138	void wb_wakeup(struct bdi_writeback *wb)
   139	{
   140		spin_lock_irq(&wb->work_lock);
   141		if (test_bit(WB_registered, &wb->state))
   142			mod_delayed_work(bdi_wq, &wb->dwork, 0);
   143		spin_unlock_irq(&wb->work_lock);
   144	}
   145	EXPORT_SYMBOL_GPL(wb_wakeup);
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
