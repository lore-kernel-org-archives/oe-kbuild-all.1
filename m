Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006190;
	b=wJPT4uUOcnlqXwymk/r81DQc0A69jPavDXdp/ZSVd/BtPlieqY+ngJF6Xhn7FqIZyPPm
	 YtLH+az1eNmYdekv7JPCdvDeSDQDSBrCR8AsNsIycfqPavyyS9/fpvX9cseChK6iEJHxv
	 OOcZsAUQFzxvLRP8Ekr5zGqrCYbjmVeO/az8Xo2cW+YWnLJt67YxNMWCSyEEvW63a0oS7
	 5ICXDBs30i9zCNFo1Yq9fQfz/Nrto0VlEbEZ5IOCSPJTLqzagPJ/3ueKUCCPZveNaIwZi
	 e7uD/3fmRovMIEt/Yn/+erJqmviajiW+/6mGAB7ROvHvrAaGPtKz2rE2w72NtOCK6Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006190;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zNZ+3nNXwnLfYs/+t0fYdIe54CS9wy692dBXTy9gIac=;
	b=voe48QXqMNTWkteZCjeb/86ooAqzKserKc7HOsbGJEaYsDHT0FPEQalcRfuixakbanlH
	 qhDwhvmLiYYjs4HUZxA+eKqGa950/kjiWYYeuCmtpL1/pAZ5i/NkyCIryhmrEy23lT/Yw
	 3fjMdtvtxLNX2FqdXmwSxBvf8tALNnujcGCoCacdy6u7eh/w9oQtIAp9JvkS53qoXUcwb
	 thffDvrEwh5g9zPH2f4AnkKjc20/rjN/jk80dRtlF0pmbvD3+JOc8/tRkpEkkht2BGe7w
	 Jzd62Ewx1Ny3BA6GYe8T7e+eDZPpx6QrFd7iLgnoNtHpEmqH8ccBkUkA9vT0lnfPTXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LqTsrzI4;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B2606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 23:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436B2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LqTsrzI4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794006180; x=1825542180;
  h=date:from:to:cc:subject:message-id;
  bh=ey5DYSDx16FztlQIGdu7dsQL/qqaZlEB5ou+xL1qfh0=;
  b=LqTsrzI4umT5Cq+kxOfBUKDP3cnLtFv0Bht4dScLaqO0QWxcVvfxRMwf
   dtYTHTRYk4XtzRWF/vdyeOTV3ZwxD506KdC+RY9Mw7jb6efEv2P4wbtPB
   RWkUuv+D33NEuRCLKjhMUzYc8fVWDIi76d8cJn1E6k0RziUCnjf15nTZZ
   WxG5xaunLrJpPvG/Ml4SoFFKj0WtRLeVDAyHlUcFaJncgxJbSIxfrwaE9
   e3FkwVfdJzPI7vzqqRLBPob21vGY4hkKoTVaBh2CMWT1plPf+i8MNVa02
   5AdZrlIpyie1rU0NeUhheS2txotCgwyv0e9IPVqEb7ihDXJNSkjSH74pl
   g==;
X-CSE-ConnectionGUID: rjR+HBOmTRuBlARgGpac7A==
X-CSE-MsgGUID: IBNfdYU1ScaVq0myFblDRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2869483"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2869483"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 15:02:59 -0800
X-CSE-ConnectionGUID: hspzscLqRz6n897Qactwtg==
X-CSE-MsgGUID: 965ypPUARIGsrfY4BAlUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="9245682"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 06 Nov 2026 15:02:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPSxT-00000000AOR-1tnd;
	Fri, 06 Nov 2026 23:02:55 +0000
Date: Sat, 07 Nov 2026 00:02:03 +0100
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/deckard-el2 1/1]
 sound/soc/qcom/lpass-platform.c:641:61: warning: format specifies type
 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long
 long')
Message-ID: <202611070021.s0543GAK-lkp@intel.com>
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
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261107/202611070021.s0543GAK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070021.s0543GAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070021.s0543GAK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/lpass-platform.c:641:61: warning: format specifies type 'unsigned int' but the argument has type 'dma_addr_t' (aka 'unsigned long long') [-Wformat]
     641 |         dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
         |                                              ~~                    ^~~~~~~~~~~~~~~~~
         |                                              %llx
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
>> sound/soc/qcom/lpass-platform.c:641:80: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     641 |         dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
         |                                                      ~~                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                      %zu
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   sound/soc/qcom/lpass-platform.c:641:128: warning: format specifies type 'int' but the argument has type 'size_t' (aka 'unsigned long') [-Wformat]
     641 |         dev_info(soc_runtime->dev, "dma base %x buff %d per %d\n", runtime->dma_addr, (snd_pcm_lib_buffer_bytes(substream) >> 2) - 1, (snd_pcm_lib_period_bytes(substream) >> 2) - 1);
         |                                                             ~~                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                             %zu
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   3 warnings generated.


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
