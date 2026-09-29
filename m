Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33708189F43
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 01:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645114; cv=none; b=lKgiA1b+63wpUf/MPMf5vemYbjMpLz2jAw+RazN0lNkILRCJgyBnVW8kyjt1iyfKAoqVzyrZjHtQ007fnyGqpAsXbGwtkwptwNvGtAEfIg4TIiAoa6U2gl5djV8XRaaUH6Xxf+uw2yD/LFU2nYSgsI6Kme8VpHlF/6+qVAxYKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645114; c=relaxed/simple;
	bh=hAu49MIzZLfMlqbnTXwIkbp/0Zf4QidpFvLj30VgO+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=miz124w3dTLtRm4fiBxelxnlQie99cZFcIFgrhQUgMpqj4wFVxGjIhG0K63on18xujpeKJMSLJbZ1zqLtldmCE4T6fewdELNfHp34icltL9HRW+Am4kcgW60gHnW3ElI00sMNWnhnJ17FTQBYbhC606dRDP6StXi1hO6hoOQ86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnL20a54; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnL20a54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790645112; x=1822181112;
  h=date:from:to:cc:subject:message-id;
  bh=hAu49MIzZLfMlqbnTXwIkbp/0Zf4QidpFvLj30VgO+4=;
  b=VnL20a54blyc7ssUnHgVGH9qPXkHk3BWNOKlNJKC8xH/qG/kX2/uml4B
   Y5jm0WOJ6+HezSBm8DrErNiB8J+mvVaZJZAc98LCWujDW56NZ0+6HLfYj
   FSOAtG/d4fXi5hMpfJvbA+tNqvacxHjKnTiGoeZScXcoWAukFY62F4V9Y
   vwVWhA7YAiN/7FWmtiuTowBoVMD4qJ8Odmm10ZQmmKDKDbxzxTq7f9K0Q
   6h/ndJgOMfaR1oiTeX9GoPUn6uBS2LhUEw58w0UHu536RS6sV+Sg1XyNq
   YIr1F98xuT0ymcBE74qrYTtLuZdxWI86VU5Xzy1AOHOIMojLgOY7EgZA9
   Q==;
X-CSE-ConnectionGUID: j6HR+c1VTNCqmcZr0fE+NA==
X-CSE-MsgGUID: hbjA9JaGQTeTEkRyRoL6UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91454989"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91454989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 18:25:11 -0700
X-CSE-ConnectionGUID: Lr8UGXl3TgeEoKiD6SGNjg==
X-CSE-MsgGUID: NlDEykVJTEeVlDOp/d3T0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="304724378"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Sep 2026 18:25:10 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBMah-00000000OmK-2Akq;
	Tue, 29 Sep 2026 01:25:07 +0000
Date: Tue, 29 Sep 2026 09:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 2/3]
 drivers/accel/adla/adla_job.c:54:2: error: call to undeclared function
 'dev_info'; ISO C99 and later do not support implicit function declarations
Message-ID: <202609290942.PKB7gxv3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   b241726da9a0ab608a73cfcd35abe19291802e04
commit: 8fd3b956c364f13fc30b90a616b533dcb410a101 [2/3] accel: adla: Add driver for Amlogic NPU
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609290942.PKB7gxv3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290942.PKB7gxv3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290942.PKB7gxv3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/adla/adla_job.c:54:2: error: call to undeclared function 'dev_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      54 |         dev_info(adla->drm.dev, "flush: wpt=0x%x\n", adla->rbf_wpt);
         |         ^
   drivers/accel/adla/adla_job.c:151:2: error: call to undeclared function 'dev_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |         dev_info(adla->drm.dev, "job %u: wpt=0x%x rbf_base=0x%llx\n",
         |         ^
>> drivers/accel/adla/adla_job.c:170:2: error: call to undeclared function 'dev_warn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     170 |         dev_warn(adla->drm.dev, "timeout: IRQ_RAW=0x%x IRQ_MASKED=0x%x IRQ_MASK=0x%x PS_STS=0x%x TIME_STAMP=0x%x\n",
         |         ^
>> drivers/accel/adla/adla_job.c:183:2: error: call to undeclared function 'dev_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     183 |         dev_err(adla->drm.dev, "job %u timed out, STS_REPORT=0x%08x\n",
         |         ^
   drivers/accel/adla/adla_job.c:275:3: error: call to undeclared function 'dev_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |                 dev_err(adla->drm.dev, "xa_alloc failed: %d\n", ret);
         |                 ^
   drivers/accel/adla/adla_job.c:284:3: error: call to undeclared function 'dev_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |                 dev_err(adla->drm.dev, "drm_sched_job_init failed: %d\n", ret);
         |                 ^
>> drivers/accel/adla/adla_job.c:348:10: error: call to undeclared function 'dev_err_probe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     348 |                 return dev_err_probe(dev, ret, "failed to init scheduler\n");
         |                        ^
   7 errors generated.


vim +/dev_info +54 drivers/accel/adla/adla_job.c

    50	
    51	static void adla_rb_flush(struct adla_device *adla)
    52	{
    53		adla_rb_align(adla);
  > 54		dev_info(adla->drm.dev, "flush: wpt=0x%x\n", adla->rbf_wpt);
    55	
    56		dev_info(adla->drm.dev, "pre-flush: CLK_AUTOCLK=0x%x MC_CTL=0x%x\n",
    57			readl(adla->regs + REG_ADLA_CLK_AUTOCLK),
    58			readl(adla->regs + REG_ADLA_MC_CTL));
    59		dev_info(adla->drm.dev, "pre-flush: ENABLE=0x%x SMMU_EN=0x%x\n",
    60			readl(adla->regs + REG_ADLA_ENABLE),
    61			readl(adla->regs + REG_ADLA_SMMU_EN));
    62		dev_info(adla->drm.dev, "pre-flush: RBF_BASE=0x%x RBF_SIZE=0x%x\n",
    63			readl(adla->regs + REG_ADLA_PS_RBF_BASE),
    64			readl(adla->regs + REG_ADLA_PS_RBF_SIZE));
    65		dev_info(adla->drm.dev, "pre-flush: PS_STS=0x%x RPT=0x%x WPT=0x%x\n",
    66			readl(adla->regs + REG_ADLA_PS_STS),
    67			readl(adla->regs + REG_ADLA_PS_RBF_RPT),
    68			readl(adla->regs + REG_ADLA_PS_RBF_WPT));
    69		dev_info(adla->drm.dev, "ring buffer dump (%u bytes):\n", adla->rbf_wpt);
    70		for (u32 i = 0; i < adla->rbf_wpt / 4; i++)
    71			dev_info(adla->drm.dev, "  [%02x] 0x%08x\n",
    72				 i * 4, ((u32 *)adla->rbf_cpu)[i]);
    73	
    74		writel(adla->rbf_wpt & 0x0FFFFFFF, adla->regs + REG_ADLA_PS_RBF_WPT);
    75		dev_info(adla->drm.dev, "after WPT: PS_STS=0x%x\n",
    76			 readl(adla->regs + REG_ADLA_PS_STS));
    77		dev_info(adla->drm.dev, "PS_STS=0x%x RPT=0x%x IRQ_RAW=0x%x\n",
    78			 readl(adla->regs + REG_ADLA_PS_STS),
    79			 readl(adla->regs + REG_ADLA_PS_RBF_RPT),
    80			 readl(adla->regs + REG_ADLA_IRQ_RAW));
    81		//writel(ADLA_PS_CTRL_START, adla->regs + REG_ADLA_PS_CTRL);
    82		for (int i = 0; i < 20; i++) {
    83			udelay(100);
    84			dev_info(adla->drm.dev, "PS_STS[%d]=0x%x RPT=0x%x IRQ_RAW=0x%x\n",
    85				 i,
    86				 readl(adla->regs + REG_ADLA_PS_STS),
    87				 readl(adla->regs + REG_ADLA_PS_RBF_RPT),
    88				 readl(adla->regs + REG_ADLA_IRQ_RAW));
    89		}
    90		dev_info(adla->drm.dev, "after START: PS_STS=0x%x\n",
    91			 readl(adla->regs + REG_ADLA_PS_STS));
    92	
    93		udelay(10);
    94		dev_info(adla->drm.dev, "PS_CTRL=0x%x PS_STS=0x%x RPT=0x%x\n",
    95			 readl(adla->regs + REG_ADLA_PS_CTRL),
    96			 readl(adla->regs + REG_ADLA_PS_STS),
    97			 readl(adla->regs + REG_ADLA_PS_RBF_RPT));
    98	
    99		udelay(100);
   100		dev_info(adla->drm.dev, "PS_STS=0x%x RPT=0x%x\n",
   101			 readl(adla->regs + REG_ADLA_PS_STS),
   102			 readl(adla->regs + REG_ADLA_PS_RBF_RPT));
   103		dev_info(adla->drm.dev, "post-flush: PS_STS=0x%x PS_CTRL=0x%x\n",
   104			readl(adla->regs + REG_ADLA_PS_STS),
   105			readl(adla->regs + REG_ADLA_PS_CTRL));
   106	}
   107	
   108	static struct dma_fence *adla_run_job(struct drm_sched_job *sched_job)
   109	{
   110		struct adla_job *job  = container_of(sched_job, struct adla_job, base);
   111		struct adla_device *adla = job->adla;
   112		struct dma_fence *fence;
   113		u32 config_wpt, off;
   114	
   115		job->hw_fence = kmem_cache_zalloc(adla_fence_cache, GFP_KERNEL);
   116		dma_fence_init(job->hw_fence, &adla_fence_ops, &adla->fence_lock,
   117			       adla->fence_ctx, ++adla->fence_seqno);
   118	
   119		spin_lock(&adla->fence_lock);
   120		adla->current_fence = dma_fence_get(job->hw_fence);
   121		spin_unlock(&adla->fence_lock);
   122	
   123		adla_rb_write(adla, ADLA_CMD_SET_FENCE | 0x700000);
   124		adla_rb_write(adla, ADLA_CMD_RESET_ID);
   125		adla_rb_align(adla);
   126	
   127		adla_rb_write(adla, ADLA_CMD_SET_SW_ID | (job->id & ADLA_SW_ID_MASK));
   128		adla_rb_write(adla, ADLA_CMD_SET_DEPENDENCY | job->dep);
   129		adla_rb_write(adla, ADLA_CMD_EXECUTE        | job->output_modules);
   130		adla_rb_write(adla, ADLA_CMD_CONFIG         | job->active_modules);
   131	
   132		config_wpt = adla->rbf_wpt;
   133	
   134		for (int i = 0; i < job->config_size / sizeof(u32); i++)
   135			adla_rb_write(adla, job->config[i]);
   136	
   137		for (u32 i = 0; i < job->fixup_count; i++) {
   138			struct adla_fixup *f = &job->fixups[i];
   139			off = (config_wpt + f->blob_offset) % adla->rbf_size;
   140			*((u32 *)(adla->rbf_cpu + off)) = lower_32_bits(f->iova);
   141		}
   142	
   143		adla_rb_write(adla, ADLA_CMD_SET_FENCE | job->fence_modules);
   144		adla_rb_align(adla);
   145		adla_rb_write(adla, ADLA_CMD_SET_TIME_STAMP | ADLA_TIME_STAMP_IRQ);
   146		adla_rb_write(adla, job->id);
   147	
   148		fence = dma_fence_get(job->hw_fence);
   149	
   150		adla_rb_flush(adla);
   151		dev_info(adla->drm.dev, "job %u: wpt=0x%x rbf_base=0x%llx\n",
   152		 job->id, adla->rbf_wpt, (u64)adla->rbf_dma);
   153		dev_info(adla->drm.dev, "HW wpt=0x%x rpt=0x%x\n",
   154			 readl(adla->regs + REG_ADLA_PS_RBF_WPT),
   155			 readl(adla->regs + REG_ADLA_PS_RBF_RPT));
   156		dev_info(adla->drm.dev, "IRQ_MASK=0x%x IRQ_RAW=0x%x IRQ_MASKED=0x%x\n",
   157			 readl(adla->regs + REG_ADLA_IRQ_MASK),
   158			 readl(adla->regs + REG_ADLA_IRQ_RAW),
   159			 readl(adla->regs + REG_ADLA_IRQ_MASKED));
   160	
   161		return fence;
   162	}
   163	
   164	static enum drm_gpu_sched_stat adla_timedout_job(struct drm_sched_job *sched_job)
   165	{
   166		struct adla_job *job  = container_of(sched_job, struct adla_job, base);
   167		struct adla_device *adla = job->adla;
   168		//u32 sts;
   169	
 > 170		dev_warn(adla->drm.dev, "timeout: IRQ_RAW=0x%x IRQ_MASKED=0x%x IRQ_MASK=0x%x PS_STS=0x%x TIME_STAMP=0x%x\n",
   171			 readl(adla->regs + REG_ADLA_IRQ_RAW),
   172			 readl(adla->regs + REG_ADLA_IRQ_MASKED),
   173			 readl(adla->regs + REG_ADLA_IRQ_MASK),
   174			 readl(adla->regs + REG_ADLA_PS_STS),
   175			 readl(adla->regs + 0x60));
   176	
   177		/*sts = readl(adla->regs + REG_ADLA_PS_STS);
   178		if (!(sts & ADLA_PS_STS_BUSY)) {
   179			dev_warn(adla->drm.dev, "job %u: timed out but idle parser\n", job->id);
   180			return DRM_GPU_SCHED_STAT_NO_HANG;
   181		}*/
   182	
 > 183		dev_err(adla->drm.dev, "job %u timed out, STS_REPORT=0x%08x\n",
   184			job->id, readl(adla->regs + REG_ADLA_STS_REPORT));
   185	
   186		/* Reset hardware */
   187		writel(0, adla->regs + REG_ADLA_IRQ_MASK);
   188		writel(ADLA_SWRST_ASSERT, adla->regs + REG_ADLA_SWRST);
   189		udelay(10);
   190		writel(0, adla->regs + REG_ADLA_SWRST);
   191	
   192		/* Ring buffer reinit */
   193		adla->rbf_wpt = 0;
   194		writel(0, adla->regs + REG_ADLA_PS_RBF_WPT);
   195		writel(0, adla->regs + REG_ADLA_PS_RBF_RPT);
   196	
   197		if (readl(adla->regs + REG_ADLA_REVISION) == 0xFFFFFFFF) {
   198			dev_err(adla->drm.dev, "hardware unreachable after reset\n");
   199			return DRM_GPU_SCHED_STAT_ENODEV;
   200		}
   201	
   202		writel(ADLA_ENABLE_BIT, adla->regs + REG_ADLA_ENABLE);
   203		writel(ADLA_IRQ_PARSER_STOP_CMD |
   204		       ADLA_IRQ_PARSER_STOP_ERR |
   205		       ADLA_IRQ_INVALID_IOVA,
   206		       adla->regs + REG_ADLA_IRQ_MASK);
   207	
   208		return DRM_GPU_SCHED_STAT_RESET;
   209	}
   210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
