Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F250D3232
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 18:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736707106; cv=none; b=fN/2d+BPDV8k7SVLgD8TQBz01R6o9t5OR2k2SP5i/XmcujTWrp2Qp+8tcPdiUZ0OpTvy17EOSehT0mMRgqNpGyTXrr4J6oUcQ0OiJpfmhIHMiWbYIrS7iGoJ9eAtayO7uyovs5KbX6TdPM7bla+Z4RjO9Yr4zRlqLyIuz7v6D2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736707106; c=relaxed/simple;
	bh=sjZJyk5LgloMm2Ge4uUxvN4ij09uuLMvJZrvllQZTYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNUy3uMvUgX+3fY4nTAqM8cn8z1oSQNcNSQgmIvuK8yYbkMf0PFl8Jv/VpdNvJwwoxbvDN86SSJuhMVmMY2yTlVM2e1ZZ4exiGALChY67Ab0nUjMP8zzS2jIH5GAdVCovvkGgXfd99i9iPFogbcStXZpj2vKyc+jtgCT6bucSBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCubYY8z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCubYY8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736707105; x=1768243105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sjZJyk5LgloMm2Ge4uUxvN4ij09uuLMvJZrvllQZTYs=;
  b=mCubYY8zUKBTXIyk+htGTK7JJOOEuKP+SpNLarHb72vRpaXsZ8wQGhYa
   8GpKXWfLEmy3nfc9z+uus/wtWYt1XYpiIZEE80t2xNpqytyMdNNeDK5Lv
   fS+hLb4ze5cX2JXpuEHDI9xQFe56wF3/eDYE9eUBWFbIQxgVZTsvtzQ10
   mqBd0fS7DxcTM9htpG7JghFtnKe6RB71440Jy812BGSbX4jVUG82/XdbE
   MZbW1X0H9CocX65TLcOsBO1A0nKnSokN8W9b3nWuuq3zeWXp/LatyBwpt
   DTMOVp+Y5Pi5xYi1iz1ci1v/o8UVyTC0+9JCaYjc9a8QVsVLQm8qqw4DR
   A==;
X-CSE-ConnectionGUID: 4q8cJy61TXqvf2dRA2vL0A==
X-CSE-MsgGUID: YlGHvOmhS1eiNGBfWNbxnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48304844"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="48304844"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 10:38:25 -0800
X-CSE-ConnectionGUID: XoTw71GMS0KhqdGTBA4NUQ==
X-CSE-MsgGUID: x+nhBctyTHCMSgQehIqn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="104019145"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Jan 2025 10:38:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tX2qq-000MHD-22;
	Sun, 12 Jan 2025 18:38:20 +0000
Date: Mon, 13 Jan 2025 02:38:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 77/504] drivers/misc/xlnx_dpu.h:21:9: warning:
 "in_range" redefined
Message-ID: <202501130240.R48qupR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: ea6276221dc185d33dccff6e834c440e3d9c53dc [77/504] misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20250113/202501130240.R48qupR8-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501130240.R48qupR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501130240.R48qupR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/xlnx_dpu.c:29:
>> drivers/misc/xlnx_dpu.h:21:9: warning: "in_range" redefined
      21 | #define in_range(b, start, len) (               \
         |         ^~~~~~~~
   In file included from include/linux/kernel.h:28,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/misc/xlnx_dpu.c:14:
   include/linux/minmax.h:313:9: note: this is the location of the previous definition
     313 | #define in_range(val, start, len)                                       \
         |         ^~~~~~~~
   drivers/misc/xlnx_dpu.c: In function 'dump_show':
>> drivers/misc/xlnx_dpu.c:1294:61: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1294 |                                 seq_printf(seq, "   0x%010llx-0x%010llx\t\t",
         |                                                       ~~~~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                       %010x
    1295 |                                            h->phy_addr,
         |                                            ~~~~~~~~~~~       
         |                                             |
         |                                             phys_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1294:71: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1294 |                                 seq_printf(seq, "   0x%010llx-0x%010llx\t\t",
         |                                                                 ~~~~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                 %010x
    1295 |                                            h->phy_addr,
    1296 |                                            h->phy_addr + h->size);
         |                                            ~~~~~~~~~~~~~~~~~~~~~       
         |                                                        |
         |                                                        phys_addr_t {aka unsigned int}
>> drivers/misc/xlnx_dpu.c:1297:58: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1297 |                                 seq_printf(seq, "0x%010llx-0x%010llx\n",
         |                                                    ~~~~~~^
         |                                                          |
         |                                                          long long unsigned int
         |                                                    %010x
    1298 |                                            h->dma_addr,
         |                                            ~~~~~~~~~~~    
         |                                             |
         |                                             dma_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1297:68: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1297 |                                 seq_printf(seq, "0x%010llx-0x%010llx\n",
         |                                                              ~~~~~~^
         |                                                                    |
         |                                                                    long long unsigned int
         |                                                              %010x
    1298 |                                            h->dma_addr,
    1299 |                                            (h->dma_addr + h->size));
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
