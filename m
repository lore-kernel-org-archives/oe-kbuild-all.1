Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0115956C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726513711; cv=none; b=eiHGnkCNSaq/+787nAskg7xeRJApGhXCgXBW17t0UvcB9xMVvtLcJZdOVCr6F8PS4NiMCh8TX3IYxAHl2c6GfnylRX980jhyakukHbL7f8QvfUD9obQzowy3KTBQrfWAxBJE+CJcS5RU6v+LPvwDysjhBl4Q5k9OrqzDuR+fjY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726513711; c=relaxed/simple;
	bh=gM+3ComS+r9Bv6ec0DiGr0Sas/NT/+Wcbc8+mG3071w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GB4jfbBr9yC21AFyNdVjbgCbacz2Eyecgau9C8mrsLVfEtxosjgztR+jrysjbgDfefOcMSQjotjiQx8H2ajfpTB8cdYtQjgZ18R6k9KgbNp4VzQBD9K0AVYNS42fPx66cg11RNPpxcJ3sRuU/PZXxihUtL4mnHgpwP0UAWW3ph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YLT2IK2U; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLT2IK2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726513709; x=1758049709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gM+3ComS+r9Bv6ec0DiGr0Sas/NT/+Wcbc8+mG3071w=;
  b=YLT2IK2UgG0hZWwjOZAKYH0jnQq3KFy6RnbTDNxWxgL6ABJzTUjjxN+2
   jIDLZcZ94lEHZd/F3IOfm5syRcSEVFVphowoZaW14uRerVJ5BqOvL/Zxz
   gOtFMp4nz4KbPnRvO/HiswjkDMBdftogUmsilrfKVCpbNy/eSjVaEBI0+
   6gxgemNqITcN2MyD/wq2yTVKuQEB5FFSU5J2vPx9MqL00uqV2P0MX4mGL
   a3IkRKK4FctlfaN9R8tWDcpoK62q4iWhar8Sf2vTY0joJKpX4FD+uvPjH
   l6wF8JNelZOJen5klNHOkq1E/dZTaarbhe9Ic/UHPlIPwc30zS31Hqx+s
   w==;
X-CSE-ConnectionGUID: xz2xGrrMSFK5kh4fERF0eA==
X-CSE-MsgGUID: hhxen4GRTxWa4U5lBvjTOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25285777"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="25285777"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 12:08:26 -0700
X-CSE-ConnectionGUID: 73vngcNdTna6uBrd/OPy+w==
X-CSE-MsgGUID: +VDeL21bRI+xU/05cbTyRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68627121"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 12:08:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqH5C-000AQI-02;
	Mon, 16 Sep 2024 19:08:22 +0000
Date: Tue, 17 Sep 2024 03:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Duan, YayongX" <yayongx.duan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Emmanuel Berthier <emmanuel.berthier@intel.com>
Subject: [intel-lts:4.19/android_s 1327/30000] arch/x86/kernel/smp.c:126
 store_regs() warn: inconsistent indenting
Message-ID: <202409170218.bTdnP5xx-lkp@intel.com>
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
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240917/202409170218.bTdnP5xx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170218.bTdnP5xx-lkp@intel.com/

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
