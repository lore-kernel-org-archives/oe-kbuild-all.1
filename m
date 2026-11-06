Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003717;
	b=LZ+OhYHZ7uZ0Wp8EokYVSsnXdYVFBerJ4iFWbFFtMJNUy9893WbWc0D8BTNnS+OHEg7H
	 37ygy3bZBX24fQwsyymQXEXkWKeiUorpEROFggFSwo6UulZDOm54Ywmb1K0+aCIQ0kUP0
	 sIsAwxJW/pPTb5tLx8Q1PjfWfprVtFjox7oLpRjRXaDaeXQcSifen/XnHZZ4XFpCLuKlm
	 /tVr8anwHTRJsp1ScVzOzLLF7ERzd/FFGFMCmw0BHmwigTnY1ldxxqTOvEUIolHl/6kQ2
	 0jCq4rLCzw+kniCyKnUy3HdExDgJRmvS1ri/Jk7HDzthHLj1RVhjVJVvgW02lxGvlJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003717;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/XE7SGFS+oJhhLKhRRRgAWCVZVf7SHO1W9Zk4UrHWW4=;
	b=G6FMscDiqxPAUi9r3v/suaErp137QgV+6ueGJCf92bo3sRh4oXGcm+EBZmjOxKf219zZ
	 PoGt0SYYuREchvHK7/FWpjJSDlf1KtJ9LVLgOTft9XnIsmmEwwVB0MjEbmMZidoE/Z3q3
	 7uCaznc6XPFfKxWPbhyBd/wAcHxgcMY8yCwrrJKbsuM/EVB2tH5RDx8/+SX68RliXNQ81
	 eRLB+WMz23qiSLXikcTzIbG/G427IUficoDR/7jEI7CYi7MEICKJ526WV78oqp4tXREAg
	 H2qWNlkyb816LCGNKmGCeVC0G0wU9zMB5mVT1aCi077IXQHRiL9XXWCoVf/iMK3EFLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y3CnJklo;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E05606A32D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 22:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E05606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y3CnJklo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794003715; x=1825539715;
  h=date:from:to:cc:subject:message-id;
  bh=/DXTJqku2+8iagT2nvCehuXeuFaKowS3mHIXmX6be5o=;
  b=Y3CnJkloA1NEqJlwL3QtrKzSsRYi75uRpaQcyQZxuqJ3JGrXRENwnkv/
   A3h7eIwJwMKzdgNAYwQUYkryy5hXNEN3rlRu5+mjv4oIZQiIye9LWDUbL
   0zotw5Aq2wRyPSlNoy1kC1L9vruHaaAz2VMYERrMGksmwpBk+5/JNHx/y
   kRcBW5NVeA0pa+AqQv0PyxH1VXrEI5OsN/YZWuxWdHv9fChHkSHqVijVG
   NAX7Xdt41jbdhfBbsxQE7NvXu413BPOxCbSVDwBS29rAjyO33UB7L9uVh
   PHCdnaUCl0Qk55tvWxAVCDZjTcrFGgyn77KRxFYhhqjCr6JadtOuoG9K+
   g==;
X-CSE-ConnectionGUID: s5mCGaUmTTyXW62dHyEoUg==
X-CSE-MsgGUID: Q2rNxUaKQtCXSpOyHHuw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2866799"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2866799"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 14:21:54 -0800
X-CSE-ConnectionGUID: XN96boqBSjOdjteuRaQYGg==
X-CSE-MsgGUID: obqJQZI0RBmqtL4e7eFFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7260506"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2026 14:21:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPSJi-00000000ANX-2POG;
	Fri, 06 Nov 2026 22:21:50 +0000
Date: Fri, 06 Nov 2026 23:21:13 +0100
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/deckard-el2 1/1]
 sound/soc/qcom/lpass-platform.c:641:29: warning: format '%x' expects argument
 of type 'unsigned int', but argument 3 has type 'dma_addr_t' {aka 'long long
 unsigned int'}
Message-ID: <202611062333.wbFHlQ9e-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/superna9999/linux topic/sm8650/deckard-el2
head:   4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65
commit: 4eb3bf9a5093f47916b0d4fc5fd45c97dd0b2c65 [1/1] WiP
config: sparc64-randconfig-2000-20261106 (https://download.01.org/0day-ci/archive/20261106/202611062333.wbFHlQ9e-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062333.wbFHlQ9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611062333.wbFHlQ9e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from sound/soc/qcom/lpass-platform.c:9:
   sound/soc/qcom/lpass-platform.c: In function 'lpass_platform_pcmops_prepare':
>> sound/soc/qcom/lpass-platform.c:641:29: warning: format '%x' expects argument of type 'unsigned int', but argument 3 has type 'dma_addr_t' {aka 'long long unsigned int'} [-Wformat=]
     dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   sound/soc/qcom/lpass-platform.c:641:2: note: in expansion of macro 'dev_info'
     dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
     ^~~~~~~~
>> sound/soc/qcom/lpass-platform.c:641:29: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   sound/soc/qcom/lpass-platform.c:641:2: note: in expansion of macro 'dev_info'
     dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
     ^~~~~~~~
   sound/soc/qcom/lpass-platform.c:641:29: warning: format '%d' expects argument of type 'int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:160:51: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                      ^~~~~~~
   sound/soc/qcom/lpass-platform.c:641:2: note: in expansion of macro 'dev_info'
     dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
     ^~~~~~~~


vim +641 sound/soc/qcom/lpass-platform.c

   595	
   596	static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
   597						 struct snd_pcm_substream *substream)
   598	{
   599		struct snd_pcm_runtime *runtime = substream->runtime;
   600		struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
   601		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
   602		struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
   603		struct snd_pcm_runtime *rt = substream->runtime;
   604		struct lpass_pcm_data *pcm_data = rt->private_data;
   605		const struct lpass_variant *v = drvdata->variant;
   606		struct lpaif_dmactl *dmactl;
   607		struct regmap *map;
   608		int ret, id, ch, dir = substream->stream;
   609		unsigned int dai_id = cpu_dai->driver->id;
   610	
   611		ch = pcm_data->dma_ch;
   612	
   613		dmactl = __lpass_get_dmactl_handle(substream, component);
   614		id = __lpass_get_id(substream, component);
   615		map = __lpass_get_regmap_handle(substream, component);
   616	
   617		ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
   618					runtime->dma_addr);
   619		if (ret) {
   620			dev_err(soc_runtime->dev, "error writing to rdmabase reg: %d\n",
   621				ret);
   622			return ret;
   623		}
   624	
   625		ret = regmap_write(map, LPAIF_DMABUFF_REG(v, ch, dir, dai_id),
   626				(snd_pcm_lib_buffer_bytes(substream) >> 2) - 1);
   627		if (ret) {
   628			dev_err(soc_runtime->dev, "error writing to rdmabuff reg: %d\n",
   629				ret);
   630			return ret;
   631		}
   632	
   633		ret = regmap_write(map, LPAIF_DMAPER_REG(v, ch, dir, dai_id),
   634				(snd_pcm_lib_period_bytes(substream) >> 2) - 1);
   635		if (ret) {
   636			dev_err(soc_runtime->dev, "error writing to rdmaper reg: %d\n",
   637				ret);
   638			return ret;
   639		}
   640		
 > 641		dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
   642	
   643		if (is_cdc_dma_port(dai_id)) {
   644			ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
   645			if (ret) {
   646				dev_err(soc_runtime->dev, "error writing fifowm field to dmactl reg: %d, id: %d\n",
   647					ret, id);
   648				return ret;
   649			}
   650		}
   651		ret = regmap_fields_write(dmactl->enable, id, LPAIF_DMACTL_ENABLE_ON);
   652		if (ret) {
   653			dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
   654				ret);
   655			return ret;
   656		}
   657	
   658		return 0;
   659	}
   660	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
