Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17096B654
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709489942; cv=none; b=ZosmaEwckejzZhowJUbCXpGzkhNke0zqbVFzGB3dduzZzJrDMFp4WDM3ck6p4nV0DAUuoDZ3LG8IRg6TJiekGgHpLrApcKcyyXY20TqHQibPl+ZDbuogitun5Mxwmi2EyzuTuzPomQgEOGH1SdWl4GDu1hEQAeEimWJLZ7TFH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709489942; c=relaxed/simple;
	bh=fdSMtamAQIBw7nYBfs9Dg7vWp1cP8+M4TvcsbFyB260=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzGDC+5igW5hmDRaJL5aKIIh+Z10G+R3M5BulwHzh7/k3HU9sDL/Ab5fAdru51QGHuIL9/MBZ9/i8wQyZyZjnPE0dhKp3db/Pn/CRP/ikOTZ4uhWLkTcHpyucVEjxCseFqjj28YEM1oQ4i+YhfELp7PMMDy2kHH2La5BzqLMOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJCWJa9t; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJCWJa9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709489940; x=1741025940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fdSMtamAQIBw7nYBfs9Dg7vWp1cP8+M4TvcsbFyB260=;
  b=jJCWJa9tLMDFTUhpCrj0o8nk3mNDSRrgZWjGG0oGJIFrvyGB2JxKRNQy
   159aGIZzoEzkfsA5v0b9Iiu+oA2SEZOVJAlrrmBcz4EwKj2j6WURaO63x
   Cz76gnSncpSpNI025w1l6yu+CjaZctST+z2hXIl955iuw4LVg0KrzEtnA
   36smSXsYHPQmgdLYOly+I8bAnLCDydMYBC1hbn6aFXjjUI7TXfAO1IFjX
   +oZvxEWZv+4LanNz+qKSFJvRFfWZ2hyX8d0xHXN519FPUiWRD9+xrZsN1
   noo4sPqtf/AkWS3dsDAYxMiH2fba0YLw77QT98RQyLge5zhgTSpfu/Fji
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4142775"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4142775"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 10:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13415956"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2024 10:18:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgqQJ-00020S-0q;
	Sun, 03 Mar 2024 18:18:55 +0000
Date: Mon, 4 Mar 2024 02:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Galbraith <umgwanakikbuti@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Wagner <wagi@monom.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [cip:linux-4.19.y-cip-rt 1987/30000]
 drivers/gpu/drm/i915/intel_sprite.c:64:30: warning: 'pipe_update_lock'
 defined but not used
Message-ID: <202403040255.xMVl5xTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   dcbd51e7744fcf9baa3ea87a028b574fda95d428
commit: 4a5dc9c921e0179e0b99737c04aee3c9a184307d [1987/30000] drm,i915: Use local_lock/unlock_irq() in intel_pipe_update_start/end()
config: i386-buildonly-randconfig-001-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040255.xMVl5xTE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040255.xMVl5xTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040255.xMVl5xTE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/intel_sprite.c:39:
>> drivers/gpu/drm/i915/intel_sprite.c:64:30: warning: 'pipe_update_lock' defined but not used [-Wunused-const-variable=]
      64 | static DEFINE_LOCAL_IRQ_LOCK(pipe_update_lock);
         |                              ^~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/pipe_update_lock +64 drivers/gpu/drm/i915/intel_sprite.c

    63	
  > 64	static DEFINE_LOCAL_IRQ_LOCK(pipe_update_lock);
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
