Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DE033A6F2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 22:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632860; cv=none; b=TqLVUtEFb+Zjd8Ui3sK2syk0Ej5WUDkaAubSpAF1B40ZvU8g1ZCB3rhQBiGa3B5lAKmjqgoirIllSwYkNU7Rcf2KDoJJf0kMQarukt2AP/W55NQ6OlCEWOduJbbmWo3oWBEyFOhoOnrpWhuuwE5ZuzWYiUVyhLhbxGJMpuF/QUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632860; c=relaxed/simple;
	bh=QyHtypQDjNATvcAUbQwjIPpSxqr+wNYoj7ok+kosE7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UOoNhCj1U2LCr/3mYTSV2YDfh6uiH1sbuf/RLm6A5Zc6sAeYbjuKntKXC2I9hymUxEl8skIFM2Pj5tRYAco5w4i9wZg7gN8a6Bnhm0fyUXdrGlCy7LKKWqeOlXSRph+aL3fuNoIbfqiAQP3DUOtisnnqg/ZzNuh6V12McnP32hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFBC3HmE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFBC3HmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632859; x=1822168859;
  h=date:from:to:cc:subject:message-id;
  bh=QyHtypQDjNATvcAUbQwjIPpSxqr+wNYoj7ok+kosE7Q=;
  b=HFBC3HmEVRHaPhIMgli1zidyN5++6EGlLEp0ny+/gn48MoKyEHEU8F/p
   brwhI60KrXJA3KD4VpLTGzaKX4RjM8nzkvJ6heVMfSec2CoTFftIcxTNU
   ruJ1iTLL6IESkBdWdP4kqI7p7PAi5fM5NWF2Xy2Wdy4MZR9HLWhrXw664
   3bzgUgNp989/XMmTn1skfEDp9iWQiBptiXYBjKadwpR4pVTbT5vvqzHjc
   4CdvrHu8hmB4ZX8I3Jvr1C7+QcZia/G9igvYYQAlAohXNsBCKMMo8GY/M
   DxK/t7+1itaj+hoJ4/rFff/ghvouQ4VE1b2llTwGZZXZsPrsFjbmjUKY9
   A==;
X-CSE-ConnectionGUID: xYBlrc5VSJiP4Lk63BBsHA==
X-CSE-MsgGUID: F6bE4wQJQq+CyZkwuFf8wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90562994"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90562994"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 15:00:58 -0700
X-CSE-ConnectionGUID: NPLk4C0uSdGz3K198U2LRQ==
X-CSE-MsgGUID: qYupfv55TYGY7TiP1Vm0QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278538577"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2026 15:00:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBJP1-00000000OZP-2Qzd;
	Mon, 28 Sep 2026 22:00:51 +0000
Date: Tue, 29 Sep 2026 06:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 2/3]
 drivers/accel/adla/adla_job.c:54:9: error: implicit declaration of function
 'dev_info'
Message-ID: <202609290510.Hofxb6ZK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   b241726da9a0ab608a73cfcd35abe19291802e04
commit: 8fd3b956c364f13fc30b90a616b533dcb410a101 [2/3] accel: adla: Add driver for Amlogic NPU
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609290510.Hofxb6ZK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290510.Hofxb6ZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290510.Hofxb6ZK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/adla/adla_job.c: In function 'adla_rb_flush':
>> drivers/accel/adla/adla_job.c:54:9: error: implicit declaration of function 'dev_info' [-Wimplicit-function-declaration]
      54 |         dev_info(adla->drm.dev, "flush: wpt=0x%x\n", adla->rbf_wpt);
         |         ^~~~~~~~
   drivers/accel/adla/adla_job.c: In function 'adla_timedout_job':
>> drivers/accel/adla/adla_job.c:170:9: error: implicit declaration of function 'dev_warn' [-Wimplicit-function-declaration]
     170 |         dev_warn(adla->drm.dev, "timeout: IRQ_RAW=0x%x IRQ_MASKED=0x%x IRQ_MASK=0x%x PS_STS=0x%x TIME_STAMP=0x%x\n",
         |         ^~~~~~~~
>> drivers/accel/adla/adla_job.c:183:9: error: implicit declaration of function 'dev_err' [-Wimplicit-function-declaration]
     183 |         dev_err(adla->drm.dev, "job %u timed out, STS_REPORT=0x%08x\n",
         |         ^~~~~~~
   drivers/accel/adla/adla_job.c: In function 'adla_job_init':
>> drivers/accel/adla/adla_job.c:348:24: error: implicit declaration of function 'dev_err_probe' [-Wimplicit-function-declaration]
     348 |                 return dev_err_probe(dev, ret, "failed to init scheduler\n");
         |                        ^~~~~~~~~~~~~


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
