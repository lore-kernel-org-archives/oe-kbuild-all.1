Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA82572
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 03:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721015531; cv=none; b=iUfkv/n9CF6Q0nkB2YQ+Q03NHmBn0bRgtszPmggPlfs4QgJ9qy0/t/2YSt+nl2NgJGvYbzR2j9O+pht0NpQ42bm9maCkHZeN9maOVVrHba9QVv2vnyNRBaI2wRXzryG0nxzixLUxihyhaY9XNffYLO6KG+EBdtJ+F2Dbsic0vtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721015531; c=relaxed/simple;
	bh=AAVckxw5g411GDJu58kzXY4oVGhb97Vodj0F3oDRsvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bdmzGZmjbo/RZm5EQCKp1V2SILGYPmAlsXw+z9IEdALDJWWfeDK/Y4rbJPIJ/ZG7ififXmxaB/m8wvSQRHT5eTf/8CEWSZZVxA3cKorikl03xK2f1khgvih60DGKuyFCg/2CIw1cN/VXcZqMBxSsnvAn7tJm+R9B+CUfa7C/cvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhbWH9A+; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhbWH9A+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721015529; x=1752551529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAVckxw5g411GDJu58kzXY4oVGhb97Vodj0F3oDRsvc=;
  b=IhbWH9A+fr1UnVclwwswBCjQl6azyXptm3cShIYGAaPKmLgqMh4HJUV7
   ckbVOadJuKOqO9QXxMrogxN9rilVbz9zKfxpwijH6+QamkDVKUPEzR75m
   YW4RmZVl9KVWhiFwMVBlxUDDqALTvpeZAv6A3kY73kXHEV4/HWPZWSgWu
   166RkNlU6P9heIi7KEPDmBhP40rDWVi93OtYs3KdoNSd/Y67za4BuDQLk
   cHFDlkrcBLxhH8WKpFv3XozzAQIgv66B0yda+jqv4HYowRuHW0KBPQ8E+
   7rsAXH+Y0k7GueoRbwOu3O25XJIfYzJshCR9Ry/FaRbL5vKHIUBt+hJMi
   A==;
X-CSE-ConnectionGUID: lYvuB4PnRs+dzB4gwPAhaw==
X-CSE-MsgGUID: eqMWnjVdQQKNpxU7x8W2/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="17994726"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="17994726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 20:52:08 -0700
X-CSE-ConnectionGUID: V0BaLq1pThuvi/cs3PniGA==
X-CSE-MsgGUID: 8kRaSbWUR4aILEwN63KlVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; 
   d="scan'208";a="49569965"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2024 20:52:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTCku-000dyw-2O;
	Mon, 15 Jul 2024 03:52:04 +0000
Date: Mon, 15 Jul 2024 11:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [linux-next:master 12386/12880] arch/x86/xen/multicalls.c:59:10:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202407151106.5s7Mnfpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 942d917cb92af2277db9e3be0d62345d770d5996 [12386/12880] xen: make multicall debug boot time selectable
config: x86_64-randconfig-123-20240715 (https://download.01.org/0day-ci/archive/20240715/202407151106.5s7Mnfpz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407151106.5s7Mnfpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407151106.5s7Mnfpz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/xen/multicalls.c:59:10: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct mc_debug_data [noderef] __percpu *static [toplevel] mc_debug_data @@     got struct mc_debug_data * @@
   arch/x86/xen/multicalls.c:59:10: sparse:     expected struct mc_debug_data [noderef] __percpu *static [toplevel] mc_debug_data
   arch/x86/xen/multicalls.c:59:10: sparse:     got struct mc_debug_data *
   arch/x86/xen/multicalls.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +59 arch/x86/xen/multicalls.c

    55	
    56	static DEFINE_PER_CPU(struct mc_buffer, mc_buffer);
    57	static struct mc_debug_data mc_debug_data_early __initdata;
    58	static struct mc_debug_data __percpu *mc_debug_data __refdata =
  > 59		&mc_debug_data_early;
    60	DEFINE_PER_CPU(unsigned long, xen_mc_irq_flags);
    61	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
