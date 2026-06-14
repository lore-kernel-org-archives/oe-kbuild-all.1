Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793F2236F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467247; cv=none; b=D8bts6/qkv7ULO0vyc9673+7zvC2uGW+FqVLPGb2jLgPke7xv1V8X09SzMZ4SqIS+QeeF6idhFT3BqlI5JISO9FzfmG99wh/aZ7K+YidUjiAkHUFMC9c7LHenLwp6T6Z0HecYJ2PRozJFD+6XnxKoxJLLcSgdAnqvArfTIOcQvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467247; c=relaxed/simple;
	bh=CP/YRZRABmpyLFHsaKNGXRRihD/fjVNWtTUeHKJnvyM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3JLexcqClDHrZui9YGeKbDV4XQ/w65QmBmudtFQ9XOMZrf9L8z4CTOVUBFAxNvoztmQpTxLVYFutTAHIDkWn27xtMybZ6GaYLkWqh5FVqKHxUEfxOniUKCwsELdrTbwc8Y1V/OZr11OBmoN55KImlhNfvM9yC5uOuWCyEATYb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNArwuJO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNArwuJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781467245; x=1813003245;
  h=date:from:to:cc:subject:message-id;
  bh=CP/YRZRABmpyLFHsaKNGXRRihD/fjVNWtTUeHKJnvyM=;
  b=cNArwuJOFwtTme1nUfl9fO3akOloXf+ITjOJAXnHY8Z8zH1r2hZN94cO
   RFxaTCAkeuIEh/u/gzH+iIO+xwshZr2QN548Fwit46psuF+7qQOauQLk4
   H3N061Hp20D/4wJAlpnyXu5Az4m9bCLbvP6C6m6Xr2SbQa8ckzfe88Kxn
   49LsWN57VqIQ3ysilVK03eoiy0+DG/1KtPezgd1nRThUptTAxesCRDNge
   paXCbPCkdedyzayaTORFWKHvbx5JZJ7cbJbXbcaKWgD5MSJ12UPufASLN
   U3biHIMY30P92yyttxO7jlBVnbqi1h447EGAryeXmPkx2yx7XLOVvRNCR
   w==;
X-CSE-ConnectionGUID: 8iyfkxYmRQKT3B8p4DEm/w==
X-CSE-MsgGUID: 6L4dXtu2RGK7XqXwMdKG4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="84781498"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="84781498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:00:45 -0700
X-CSE-ConnectionGUID: anQT/rNSRlGzNZrtj/xYuQ==
X-CSE-MsgGUID: aDyn9agBT6uz/GUxo4MknA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="249184045"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jun 2026 13:00:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYr0a-00000000RAk-3mY4;
	Sun, 14 Jun 2026 20:00:40 +0000
Date: Mon, 15 Jun 2026 04:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 130/1266]
 drivers/misc/xlnx_dpu.h:21:9: warning: 'in_range' redefined
Message-ID: <202606150326.Ztzf5rDZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ye,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   343f487d634122b137e2b1491d0c7fe1fb876c2e
commit: 2d9cdbf45fbb41f9314bcf7bcae8a3c19de020c9 [130/1266] misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20260615/202606150326.Ztzf5rDZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150326.Ztzf5rDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150326.Ztzf5rDZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/xlnx_dpu.c:29:
>> drivers/misc/xlnx_dpu.h:21:9: warning: 'in_range' redefined
      21 | #define in_range(b, start, len) (               \
         |         ^~~~~~~~
   In file included from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/misc/xlnx_dpu.c:14:
   include/linux/minmax.h:248:9: note: this is the location of the previous definition
     248 | #define in_range(val, start, len)                                       \
         |         ^~~~~~~~
   drivers/misc/xlnx_dpu.c: In function 'dump_show':
   drivers/misc/xlnx_dpu.c:1295:61: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1295 |                                 seq_printf(seq, "   0x%010llx-0x%010llx\t\t",
         |                                                       ~~~~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                       %010x
    1296 |                                            h->phy_addr,
         |                                            ~~~~~~~~~~~       
         |                                             |
         |                                             phys_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1295:71: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1295 |                                 seq_printf(seq, "   0x%010llx-0x%010llx\t\t",
         |                                                                 ~~~~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                 %010x
    1296 |                                            h->phy_addr,
    1297 |                                            h->phy_addr + h->size);
         |                                            ~~~~~~~~~~~~~~~~~~~~~       
         |                                                        |
         |                                                        phys_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1298:58: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1298 |                                 seq_printf(seq, "0x%010llx-0x%010llx\n",
         |                                                    ~~~~~~^
         |                                                          |
         |                                                          long long unsigned int
         |                                                    %010x
    1299 |                                            h->dma_addr,
         |                                            ~~~~~~~~~~~    
         |                                             |
         |                                             dma_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1298:68: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1298 |                                 seq_printf(seq, "0x%010llx-0x%010llx\n",
         |                                                              ~~~~~~^
         |                                                                    |
         |                                                                    long long unsigned int
         |                                                              %010x
    1299 |                                            h->dma_addr,
    1300 |                                            (h->dma_addr + h->size));
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~  
         |                                                         |
         |                                                         dma_addr_t {aka unsigned int}


vim +/in_range +21 drivers/misc/xlnx_dpu.h

    20	
  > 21	#define in_range(b, start, len) (		\
    22	{						\
    23	typeof(b) b_ = (b);				\
    24	typeof(start) start_ = (start);			\
    25	((b_) >= (start_) && (b_) < (start_) + (len));	\
    26	}						\
    27	)
    28	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
