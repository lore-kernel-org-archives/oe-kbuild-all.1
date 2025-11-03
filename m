Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF53291C33
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762200309; cv=none; b=Rbw1jFKt+FqFzlXYpLtlLWdcccXh6I6xNlK+R9vP2shLL0Bw9rmFi890SGeAChQMjcwL/2tlGSyMQw4+s2P2wfqh9YdAyiUZfhJmGzYYn1DwBm1adAdTWsQ/JRJ/uB7NBgmMZ8qUszCtfCTMQwZAkg4kHACRouZVcip62+gAGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762200309; c=relaxed/simple;
	bh=SC9hbS+tNCj5m1LJ77KHNJ+I8s0BV+7sKyA3x5tX8Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILD7yUJXsvnmffo2RjRtgHPDtOjCpEtdWQ2EwnFRbO5kwsrhee4tTitfX804iP2y4zlnN5nzbwRf75c/11smnumM1o7rGUxTyvlMNbraAohbXt1NVR4sRMhn/pEcJ0xYTKXSTPguwhRNIplzY7OVmynTKfdHlZhCnojYw8L3D8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqKiF3Vp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqKiF3Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762200307; x=1793736307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SC9hbS+tNCj5m1LJ77KHNJ+I8s0BV+7sKyA3x5tX8Ac=;
  b=FqKiF3Vpdr3++hANV5d7nMu18OCpmyzP5niBodVpfjKLfy3xQwFcy5lF
   z0DAsRD76KlvIIoV3IXCag3sLq1y/MX66n2MtaDLiUuauyi+fVcF0pZCL
   TDO8X6ffQl4+HPL4w4AMudOaS5j3Wotg9eoSWARsDKbDh0Gf2RES34rmd
   ckKKyrApx4eBJG+GxqgPx9xI4kDtx3SWOSd1RnnT312Jp7sRNbpaY1YFP
   lolBNGM/pG0GDTX89swvRYgmuIKcg4V5LYr/DMwwysVReVQcB/sZ92y/w
   ZK/nVbpYy2+DmN1uuNE1hd0Ebn1sasF2SXi0yZ15iPoEQiYGf1mwctDpS
   g==;
X-CSE-ConnectionGUID: Srn1RLiPROaqsl0f5c9m5A==
X-CSE-MsgGUID: 9Fkzf35ZRFK+aLPShGaiAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74888671"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="74888671"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:05:07 -0800
X-CSE-ConnectionGUID: AfjIvQDJQc+2K2G2gsPKww==
X-CSE-MsgGUID: 3FD0EIjKTGWsjJeR2RKXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="186907849"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 12:05:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG0nR-000QW8-1t;
	Mon, 03 Nov 2025 20:04:59 +0000
Date: Tue, 4 Nov 2025 04:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v2 53/58]
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:24: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 3 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202511040321.fy41ZaQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v2
head:   41e2962102e2318916f87f0ed7eb297a6b3224d3
commit: d031623b217ef2181892909a4ceb47568fe73a1e [53/58] rvtrace: Add trace ramsink driver
config: riscv-randconfig-002-20251103 (https://download.01.org/0day-ci/archive/20251104/202511040321.fy41ZaQg-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040321.fy41ZaQg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040321.fy41ZaQg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:6:
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c: In function 'rvtrace_ramsink_setup_buf':
>> drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     134 |   dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                ^~~
   include/linux/dev_printk.h:156:54: note: in expansion of macro 'dev_fmt'
     156 |  dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                      ^~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:3: note: in expansion of macro 'dev_warn'
     134 |   dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
         |   ^~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:63: note: format string is defined here
     134 |   dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
         |                                                            ~~~^
         |                                                               |
         |                                                               long long unsigned int
         |                                                            %x
   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:6:
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     148 |   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                ^~~
   include/linux/dev_printk.h:156:54: note: in expansion of macro 'dev_fmt'
     156 |  dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                      ^~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:3: note: in expansion of macro 'dev_warn'
     148 |   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |   ^~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:63: note: format string is defined here
     148 |   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                                                            ~~~^
         |                                                               |
         |                                                               long long unsigned int
         |                                                            %x
   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:6:
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:24: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     162 |   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
     110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
         |                ^~~
   include/linux/dev_printk.h:156:54: note: in expansion of macro 'dev_fmt'
     156 |  dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                      ^~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:3: note: in expansion of macro 'dev_warn'
     162 |   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |   ^~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:63: note: format string is defined here
     162 |   dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                                                            ~~~^
         |                                                               |
         |                                                               long long unsigned int
         |                                                            %x


vim +134 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

   107	
   108	static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp)
   109	{
   110		struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
   111		u64 start_min, limit_max, end;
   112		u32 low, high;
   113	
   114		/* Probe min and max values for start and limit registers */
   115		rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
   116		rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
   117		low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
   118		high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
   119		start_min = (u64)(high) << 32 | low;
   120	
   121		rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
   122		rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
   123		low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
   124		high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
   125		limit_max = (u64)(high) << 32 | low;
   126	
   127		if (priv->end < start_min) {
   128			dev_err(&comp->dev, "DMA memory not addressable by device\n");
   129			return -EINVAL;
   130		}
   131	
   132		/* Setup ram sink start addresses */
   133		if (priv->start < start_min) {
 > 134			dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
   135				 priv->start, start_min);
   136			priv->va += start_min - priv->start;
   137			priv->start = start_min;
   138		}
   139	
   140		priv->prev_head = priv->start;
   141		priv->end = priv->start + priv->size;
   142		rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
   143		rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
   144		rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
   145		rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
   146		/* Setup ram sink limit addresses */
   147		if (priv->end > limit_max) {
   148			dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
   149				 limit_max);
   150			priv->end = limit_max;
   151			priv->size = priv->end - priv->start;
   152		}
   153	
   154		/* Limit address needs to be set to end - 4 to avoid overflow */
   155		end = priv->end - 4;
   156		rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
   157		rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
   158		low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
   159		high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
   160		end = (u64)(high) << 32 | low;
   161		if (end != (priv->end - 4)) {
   162			dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
   163				 end);
   164			priv->end = end;
   165			priv->size = priv->end - priv->start;
   166		}
   167	
   168		return 0;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
