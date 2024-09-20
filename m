Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BC727466
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 17:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726853527; cv=none; b=UhafAPrCp5dGZlJceRxMuJiPytUU/vtnXhQwSwpP51qCoFGtoshzptZQa6ZMhUfe2GhhUeY/4Vvm521NGfsWjqfVseakpJzUvP8IO1YLWCXNA0pLIyBX2QIH/PD1P6je5K9AOeJTCbulU6nY0yp37JfUNWoFQrCMb2U69eKja4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726853527; c=relaxed/simple;
	bh=FxpoiSCSHMCry+F41Mt+sJNSvrkENFovGc1lCr3FPc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gig0BW5tHTdNVHMuiboQoPBuLwZNz70AV2UEpnykQvyjo1WF3ReXAJ5YrGzY6j8O4VFZArsLgXFLUhpJdscumeRr5PO7cfayKKCQiYHfGrDa39tsgM6/3UFDGis/uPRyK6ycEt9wVhIQ1nbWnwzpmPyo/HbpNQQ7FWqyJxLKAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7IA5GP/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7IA5GP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726853526; x=1758389526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxpoiSCSHMCry+F41Mt+sJNSvrkENFovGc1lCr3FPc4=;
  b=g7IA5GP/PyTVRxR2+nlx/Kyz1fi+ek+E3mKlpjZHtpz1/YPKz26hXZH9
   0NRneYgPzE1IDutcEz91EOCwzvXCECmgi7aB331ulyjv3Xxbu4VzIrYg/
   Q8b4kjxhjCSjsKrPSWTERs72QJPQCdTyF6vTTbaUiwGJ75B98pr56Frq0
   rG+muDvdGWTFrqH8lMcp1xERqOxOu+o8JqvLFzZR3eZkhqmPn74pPsDFP
   c2FKg23YpA2loP2JTl/o8GDQgxtg2NmBw2rBAVFAnjYR/pZ1546evDrwS
   V0biUXbNPHeTLGD+QvOk32ntpsowmjGzoWr6REfxCyATF6iHz8xTaz/Zc
   A==;
X-CSE-ConnectionGUID: DK3YXN8NThWpQ3qaU+D5iw==
X-CSE-MsgGUID: xMm6XC3oQiO2QwubZDTt5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25742235"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25742235"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:32:06 -0700
X-CSE-ConnectionGUID: m5KUoVqiTMq9yWj5O9slIw==
X-CSE-MsgGUID: uDoriMdKRSWLJGXlT3GG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="101109664"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Sep 2024 10:32:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srhU9-000Eid-3D;
	Fri, 20 Sep 2024 17:32:02 +0000
Date: Sat, 21 Sep 2024 01:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Duan, YayongX" <yayongx.duan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Emmanuel Berthier <emmanuel.berthier@intel.com>
Subject: [intel-lts:4.19/android_s 1327/30000] arch/x86/kernel/smp.c:126
 store_regs() warn: inconsistent indenting
Message-ID: <202409210122.cToa3YVu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: cd7b77710e3d52d58e97881a7c6ba82586573ba9 [1327/30000] Debug: Add register dump
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240921/202409210122.cToa3YVu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210122.cToa3YVu-lkp@intel.com/

smatch warnings:
arch/x86/kernel/smp.c:126 store_regs() warn: inconsistent indenting

vim +126 arch/x86/kernel/smp.c

   121	
   122	/* Store regs of this CPU for RAM dump decoding help */
   123	static inline void store_regs(struct pt_regs *regs)
   124	{
   125	        struct pt_regs *print_regs;
 > 126	       print_regs = &get_cpu_var(cpu_regs);
   127	       crash_setup_regs(print_regs, regs);
   128	
   129	       /* Flush CPU cache */
   130	       wbinvd();
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
