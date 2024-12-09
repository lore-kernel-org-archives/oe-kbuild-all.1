Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6C155335
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717952; cv=none; b=UrHRbcw2iU4njzCI6CT0CY0Yxaw8xXria4F5kpaP1f2KfZLGdChZQRVMszaNxeJ1BoT1l5aPYia+HdhV9NIS6Aa48fLExzdjaDfgj44+YFKJCJg3YnhWgj59NZ+mnveHR72YKKKjLUpjzTW9pvVl9550mmqSArp0/A3wukv5Mfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717952; c=relaxed/simple;
	bh=pc/BL/Q6gdDRfe6U6klROe+OVDUcsnWuGDxJ0w3NDdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lt+Il5PCu0mT1cRNMq1RJez+aMqtSKB7HEeuIesVVxGnbaE9VKp8hUF5K5RG60a+ACLUmASYeF3PA93g0PRxdjpfJsONGes9ExdhsSZ50eYaquQxpEHWt94a2idDv8W6jA6NEN8QF3BJv6N1rmjkn7qC+2fkNoDzIaNGPETyyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huUopA0R; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huUopA0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717951; x=1765253951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pc/BL/Q6gdDRfe6U6klROe+OVDUcsnWuGDxJ0w3NDdQ=;
  b=huUopA0RoYNXAbz66YparfZh9efb6IlvvE612pvNpGSphzfU+cMb4GFp
   6v1auVUmVKh/DLYhlv80byVItSC5Cfg8Lw4f7cj9aKPFqontTgFt9OBoY
   SypHg8aVRsBkfikI+s/KbQJY/CZ5BwBfUjbmJovnzMSw0jLiJ2FmBUzzL
   rMpFdf2iuPWtC1zpdmDOZZYpPxP29Wnzt7FEFHMvjLWb1TM4KV+wnzE5e
   j9fk9T1yQuhK1wNWj51X99WZrhxGq3SWijKH1Iz128s5iaU6yX5odWqg4
   BEGXdkJLUmSAdHjHmWJKnpOZ+wjj0xsRzO+vWTU0KdMMPaYKNsNt3pjA+
   g==;
X-CSE-ConnectionGUID: doRCrsm6RCSqRwJXl6yLRw==
X-CSE-MsgGUID: ke+UE2snRjW0pxwlTlWNVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44682901"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="44682901"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:19:10 -0800
X-CSE-ConnectionGUID: CygpXtAlQvaahQprnMTRLw==
X-CSE-MsgGUID: QoRzZM1QQDWdBVmR1fWubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99776699"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Dec 2024 20:19:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVEg-0003pT-2B;
	Mon, 09 Dec 2024 04:19:06 +0000
Date: Mon, 9 Dec 2024 12:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1325/1325]
 sound/soc/soc-generic-dmaengine-pcm.c:318:25: warning: 'strncpy' accessing
 80 bytes at offsets 100 and 36 may overlap up to 0 bytes at offset
 [9223372036854775807, -9223372036854775808]
Message-ID: <202412071942.X656h6F5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   faa52e40c08916893e09ba030e616f92e4fc020b
commit: a24ec7d8d3462ba48b4bd932960c397d92de8782 [1325/1325] ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is not set
config: arm64-randconfig-004-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071942.X656h6F5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071942.X656h6F5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071942.X656h6F5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-generic-dmaengine-pcm.c: In function 'dmaengine_pcm_new':
>> sound/soc/soc-generic-dmaengine-pcm.c:318:25: warning: 'strncpy' accessing 80 bytes at offsets 100 and 36 may overlap up to 0 bytes at offset [9223372036854775807, -9223372036854775808] [-Wrestrict]
     318 |                         strncpy(rtd->pcm->streams[i].pcm->name,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     319 |                                 rtd->pcm->streams[i].pcm->id,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     320 |                                 sizeof(rtd->pcm->streams[i].pcm->name));
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +318 sound/soc/soc-generic-dmaengine-pcm.c

   260	
   261	static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
   262	{
   263		struct snd_soc_component *component =
   264			snd_soc_rtdcom_lookup(rtd, SND_DMAENGINE_PCM_DRV_NAME);
   265		struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
   266		const struct snd_dmaengine_pcm_config *config = pcm->config;
   267		struct device *dev = component->dev;
   268		struct snd_dmaengine_dai_dma_data *dma_data;
   269		struct snd_pcm_substream *substream;
   270		size_t prealloc_buffer_size;
   271		size_t max_buffer_size;
   272		unsigned int i;
   273		int ret;
   274	
   275		if (config && config->prealloc_buffer_size) {
   276			prealloc_buffer_size = config->prealloc_buffer_size;
   277			max_buffer_size = config->pcm_hardware->buffer_bytes_max;
   278		} else {
   279			prealloc_buffer_size = 512 * 1024;
   280			max_buffer_size = SIZE_MAX;
   281		}
   282	
   283		for (i = SNDRV_PCM_STREAM_PLAYBACK; i <= SNDRV_PCM_STREAM_CAPTURE; i++) {
   284			substream = rtd->pcm->streams[i].substream;
   285			if (!substream)
   286				continue;
   287	
   288			dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
   289	
   290			if (!pcm->chan[i] &&
   291			    (pcm->flags & SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME))
   292				pcm->chan[i] = dma_request_slave_channel(dev,
   293					dma_data->chan_name);
   294	
   295			if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
   296				pcm->chan[i] = dmaengine_pcm_compat_request_channel(rtd,
   297					substream);
   298			}
   299	
   300			if (!pcm->chan[i]) {
   301				dev_err(component->dev,
   302					"Missing dma channel for stream: %d\n", i);
   303				return -EINVAL;
   304			}
   305	
   306			ret = snd_pcm_lib_preallocate_pages(substream,
   307					SNDRV_DMA_TYPE_DEV_IRAM,
   308					dmaengine_dma_dev(pcm, substream),
   309					prealloc_buffer_size,
   310					max_buffer_size);
   311			if (ret)
   312				return ret;
   313	
   314			if (!dmaengine_pcm_can_report_residue(dev, pcm->chan[i]))
   315				pcm->flags |= SND_DMAENGINE_PCM_FLAG_NO_RESIDUE;
   316	
   317			if (rtd->pcm->streams[i].pcm->name[0] == '\0') {
 > 318				strncpy(rtd->pcm->streams[i].pcm->name,
   319					rtd->pcm->streams[i].pcm->id,
   320					sizeof(rtd->pcm->streams[i].pcm->name));
   321			}
   322		}
   323	
   324		return 0;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
