Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794020117;
	b=ieCY9dVzcvpuC6TFSfHt/aYGHFEFVHts4rGgzxhYnzY1VYsxXpxSZPQotsHxX81c027H
	 TvhfbcnYq9tNZZCppLw6sbHYkieBpL0aqn46+XLEKh1kCk4AeHZs8wjvtVDGPg1lLWLru
	 mXEAn1HQDFp57s34KMtHli1bWQsLN5JO96g5XkE0FzRojs+UWc5yTJ9m5fsdZw5n6qxQ4
	 OuJmscMVbiSwwUOUt11BzFyfvj9tovw5b6CXD+4GVAeBs+eey7yg+NZER6NN6R25FzhlA
	 7DnIz2ui/RybqD+JI3hLvs8cWhQXXnqYMKNB8/A580HBYjCc2bJq2UgfVOCfltq0dYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794020117;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mIk3sH0MdxvmLh1kydz8vxUlhpL8+0q3pSRW332KJgM=;
	b=4AIxSYQ9mz8kDQPzuTtoR9I8idzgFYCSAOAy4eL9MKA6o7PVKmHbqHzQGjtG9pv/euSx
	 tTBKDKx8P9LyepsPmsJsMw4WmnofgA7TSO/1GevScAqQMloyufAvj1BauGkkZIzUxyH8J
	 ePqGUI2xyfGTtxKj36/sspjkZEIpqHlsEbH5lAhJuOMERPEQX7QifV4Kk9m/D1XQ8mDGI
	 p9Ljzze2UjGm4Sxb+UqIqctA4LYagiC4fc0Rg1Ue7BTNm7H6TrpDpUlQ7vsEcpunbcZrQ
	 Ed2KGdnnkQIK/sYXu3xH9T5Lg8zImRBZ35/QsYrOGQxFQphuycZ7DMvwHbOB7lI8+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PKK24lQA;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA9606A33C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 02:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EA9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PKK24lQA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794020115; x=1825556115;
  h=date:from:to:cc:subject:message-id;
  bh=Kd4A6A10lj0cUqODEhX59zHEQv6z9p5Gs7eU/6GNEqc=;
  b=PKK24lQAox38JwovBtM8tTsifHVJ6aYqbNXnfN8AxwGFYMXuwtmPQpuW
   zRnSsVDWgFoLVMNV+yhH523gJdg1f5MnzEdHs4zJPiBOwRm9CKzIOTtRE
   9Ngohqkq2y1Wrn+3l9GGly6IoQ5LY6/iYzKqWruEujYfTFvP0YlksOMa4
   e56Bdd5nDvoEvW0oI4lrD7jLn07aCDj0KGL/O56YQWLcs36Z4O1PnVjij
   VU6uIP3QQOsgqooj2iErm4jd2z/gwR/NySmYGs4zhYyJ7qp6t6KI34siH
   1la1u2/ohWSRqebyUvAYmORq779BlE7cozFm0lTpLUhoroc0E2D+TB6RN
   g==;
X-CSE-ConnectionGUID: kw7x1Rd6Tj+nd3yyb8k/Lw==
X-CSE-MsgGUID: q9/UxPPHTJ6SYMY8OZon+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2866154"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2866154"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 18:55:13 -0800
X-CSE-ConnectionGUID: pwwq+qfIQqifWGS6ab05Yg==
X-CSE-MsgGUID: 1FVBqb7WQ/G8bVWSdJCwkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7411015"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 18:55:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPWaD-00000000qHN-0j88;
	Sat, 07 Nov 2026 02:55:09 +0000
Date: Sat, 07 Nov 2026 10:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [superna9999:topic/sm8650/deckard-el2 1/1]
 sound/soc/qcom/lpass-platform.c:641:29: warning: format '%x' expects argument
 of type 'unsigned int', but argument 3 has type 'dma_addr_t' {aka 'long long
 unsigned int'}
Message-ID: <202611071025.7EFKHpoJ-lkp@intel.com>
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
config: arm64-randconfig-1001-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071025.7EFKHpoJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071025.7EFKHpoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071025.7EFKHpoJ-lkp@intel.com/

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
