Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20FC800
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 04:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766637702; cv=none; b=UtO7nVWWtkuY1/qSegbdriV9MJG3+RhyKABbDDC/XOfz1uGqbgwftNYRPIkNK3Gv2oidEPq2DNLFqc6RWCqMbBXIv7pqL0dL+cR2Kxwn3cqpVE7pvG61UVRzeWnPf/qbN0am+LdLNgp6p8Vp7PWkBABenJSOhSgG0q4qOXum8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766637702; c=relaxed/simple;
	bh=nXJPW1wlo/pM/TckQDQqA5G63Cu6zW3txjKVTct8gbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NxYYkOp5hwSypYxjtr0lAdVOG2sX0Xa+1jBjLIwmCZFdSzxyt6xh76G9SbIjgxPnJcvgEj7/AJvIFVUsE8uZJOpq8SOskzvreuqMfajcRL8Y4lWkPmKOVS1FVmHIVwoJ6UWfrgyPdNXf6LOEs0YajwCmXROey/9RkomhSPwIJfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1lIGEiD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1lIGEiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766637701; x=1798173701;
  h=date:from:to:cc:subject:message-id;
  bh=nXJPW1wlo/pM/TckQDQqA5G63Cu6zW3txjKVTct8gbc=;
  b=c1lIGEiDN9/+DA43C0ZUNFdFnrbuR4/EFVbGJ7FrvPSWEaqZZ/ZhEky4
   sxmRUZhFu3SaftJstsdXPjeQOZqQ3s8jlqPpM8cB/ROa9kKx5UTbE0hAO
   tJahbgT0RBZxKfBWfL3PWwVGLSRZSTljxvZWh0oh7n5CDlaQzEIH1ijGn
   MZD1ZDplW2k5MYH9NyRlcOYmhe5jMsczPYTOn4EDu8+EtoAWRtulDbdho
   uiLKaGarEdFcvKPj3kwco6+3AbyU/usnojOIQrGGOxkkVaEy5TejmMck7
   RKQvSGBhBi3FLQaSi2u2eIyN6boj0p6crphIZrWYcUoZp0umUOM/TDx7l
   Q==;
X-CSE-ConnectionGUID: H7UhCPUjQkunywxzHhzOZA==
X-CSE-MsgGUID: Gez1EGxGQ12p1lSWYAL1tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72081123"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="72081123"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:41:41 -0800
X-CSE-ConnectionGUID: MSLiAncxST20vENqW1HeMw==
X-CSE-MsgGUID: jV0vHOpSQC2mcGMBNgyJtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="199393280"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Dec 2025 20:41:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYdAO-000000003lB-0x2A;
	Thu, 25 Dec 2025 04:41:36 +0000
Date: Thu, 25 Dec 2025 12:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_dbtr_v2 47/55]
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:38: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 3 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202512251204.mja7zlZw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: b075ffc5fc01b16aa5fbcec10f5920402d301188 [47/55] rvtrace: Add trace ramsink driver
config: riscv-randconfig-002-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251204.mja7zlZw-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251204.mja7zlZw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251204.mja7zlZw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:6:
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c: In function 'rvtrace_ramsink_setup_buf':
>> drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     134 |                 dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:17: note: in expansion of macro 'dev_warn'
     134 |                 dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
         |                 ^~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:134:77: note: format string is defined here
     134 |                 dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
         |                                                                          ~~~^
         |                                                                             |
         |                                                                             long long unsigned int
         |                                                                          %x
   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:6:
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     148 |                 dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:17: note: in expansion of macro 'dev_warn'
     148 |                 dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                 ^~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:148:77: note: format string is defined here
     148 |                 dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                                                                          ~~~^
         |                                                                             |
         |                                                                             long long unsigned int
         |                                                                          %x
   In file included from include/linux/device.h:15,
                    from drivers/hwtracing/rvtrace/rvtrace-ramsink.c:6:
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     162 |                 dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:156:61: note: in expansion of macro 'dev_fmt'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:17: note: in expansion of macro 'dev_warn'
     162 |                 dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                 ^~~~~~~~
   drivers/hwtracing/rvtrace/rvtrace-ramsink.c:162:77: note: format string is defined here
     162 |                 dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
         |                                                                          ~~~^
         |                                                                             |
         |                                                                             long long unsigned int
         |                                                                          %x

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
   Depends on [n]: CACHEMAINT_FOR_DMA [=n]
   Selected by [y]:
   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]


vim +134 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

   > 6	#include <linux/device.h>
     7	#include <linux/platform_device.h>
     8	#include <linux/property.h>
     9	#include <linux/dma-mapping.h>
    10	#include <linux/rvtrace.h>
    11	#include <linux/types.h>
    12	#include <linux/sizes.h>
    13	
    14	#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
    15	#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
    16	#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
    17	#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
    18	#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
    19	#define   RVTRACE_RAMSINK_WPLOW_WRAP		0x1
    20	#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
    21	#define RVTRACE_RAMSINK_RPLOW_OFF		0x028
    22	#define RVTRACE_RAMSINK_RPHIGH_OFF		0x02c
    23	
    24	struct rvtrace_ramsink_priv {
    25		size_t size;
    26		void *va;
    27		dma_addr_t start;
    28		dma_addr_t end;
    29		/* WP from prev iteration */
    30		dma_addr_t prev_head;
    31	};
    32	
    33	struct trace_buf {
    34		void *base;
    35		size_t size;
    36		long cur;
    37		size_t len;
    38	};
    39	
    40	static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
    41	{
    42		return rvtrace_comp_is_empty(comp);
    43	}
    44	
    45	static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst)
    46	{
    47		int bytes_dst, bytes_src, bytes;
    48		void *dst_addr, *src_addr;
    49	
    50		while (src->size) {
    51			src_addr = src->base + src->cur;
    52			dst_addr = dst->base + dst->cur;
    53	
    54			if (dst->len - dst->cur < src->size)
    55				bytes_dst = dst->len - dst->cur;
    56			else
    57				bytes_dst = src->size;
    58			if (src->len - src->cur < src->size)
    59				bytes_src = src->len - src->cur;
    60			else
    61				bytes_src = src->size;
    62			bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
    63			memcpy(dst_addr, src_addr, bytes);
    64			dst->cur = (dst->cur + bytes) % dst->len;
    65			src->cur = (src->cur + bytes) % src->len;
    66			src->size -= bytes;
    67		}
    68	}
    69	
    70	static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
    71						    struct rvtrace_perf_auxbuf *buf)
    72	{
    73		struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
    74		struct trace_buf src, dst;
    75		u32 wp_low, wp_high;
    76		u64 buf_cur_head;
    77		size_t size;
    78	
    79		wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
    80		wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
    81		buf_cur_head = (u64)(wp_high) << 32 | (wp_low & ~RVTRACE_RAMSINK_WPLOW_WRAP);
    82	
    83		if (buf_cur_head == priv->prev_head)
    84			return 0;
    85	
    86		dst.base = buf->base;
    87		dst.len = buf->length;
    88		dst.cur = buf->pos;
    89	
    90		src.base = priv->va;
    91		src.len = priv->end - priv->start;
    92		if (buf_cur_head > priv->prev_head) {
    93			src.size = buf_cur_head - priv->prev_head;
    94		} else {
    95			src.size = priv->end - priv->prev_head;
    96			src.size += buf_cur_head - priv->start;
    97		}
    98	
    99		src.cur = buf_cur_head - priv->start;
   100		size = src.size;
   101		tbuf_to_pbuf_copy(&src, &dst);
   102		buf->pos = dst.cur;
   103		priv->prev_head = buf_cur_head;
   104	
   105		return size;
   106	}
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
