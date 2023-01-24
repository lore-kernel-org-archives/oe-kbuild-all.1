Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432CEA3C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 04:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674535542; x=1706071542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C0b3Jk2Ehp41+CKL3p5WlSXvkKdebx8bqgNjcFG3sUk=;
  b=SoovXltRupwnOHI9gLa1ZWfWEnv5VclArtF83zLSfQKsQASzYqMUWnef
   F8rq1HX0rxbrr0gnOgZmso02aZuvW6gT631f7Pc10xokbh26YjMZkDCzV
   ZXuifV6UKk+g6keL/i7kgJpCMTR3kdZoCrB1bB5JbhBjQvTsgVuUIRX4K
   ggY3Ut83V9AZXE5Q4heCDHRg/bE7HzsSao/XpPqwjAIUhHWZMj/6fbWe9
   H7aAppj9WgquClBUwUIajMoDwLDsRo/9th97wyWZr6/pJF42fStX+t4Zk
   tQX3W59qlxMS87oHFUr49HprHVOTClIAtJAafLRn+7p6iwWSIcYlxwdrC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="327486802"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="327486802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 20:45:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692473711"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="692473711"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2023 20:45:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKBBj-000692-37;
	Tue, 24 Jan 2023 04:45:39 +0000
Date: Tue, 24 Jan 2023 12:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 09/25] ASoC: rt: use helper function
Message-ID: <202301241201.jBsUFSYu-lkp@intel.com>
References: <87lelsu1gz.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lelsu1gz.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tegra/for-next rockchip/for-next linus/master v6.2-rc5 next-20230123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-soc-dai-h-add-missing-snd_soc_dai_set_widget/20230124-102030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/87lelsu1gz.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH v2 09/25] ASoC: rt: use helper function
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301241201.jBsUFSYu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/26f9b884f20e9f6837c9017ab89747d8381a55c8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuninori-Morimoto/ASoC-soc-dai-h-add-missing-snd_soc_dai_set_widget/20230124-102030
        git checkout 26f9b884f20e9f6837c9017ab89747d8381a55c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   sound/soc/codecs/rt1318-sdw.c: In function 'rt1318_set_sdw_stream':
   sound/soc/codecs/rt1318-sdw.c:578:12: error: 'struct snd_soc_dai' has no member named 'stream'
     578 |         dai->stream[direction].dma_data = stream;
         |            ^~
>> sound/soc/codecs/rt1318-sdw.c:564:37: warning: parameter 'direction' set but not used [-Wunused-but-set-parameter]
     564 |                                 int direction)
         |                                 ~~~~^~~~~~~~~


vim +/direction +564 sound/soc/codecs/rt1318-sdw.c

6ad73a2b42ea6d Shuming Fan       2022-11-08  562  
6ad73a2b42ea6d Shuming Fan       2022-11-08  563  static int rt1318_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
6ad73a2b42ea6d Shuming Fan       2022-11-08 @564  				int direction)
6ad73a2b42ea6d Shuming Fan       2022-11-08  565  {
6ad73a2b42ea6d Shuming Fan       2022-11-08  566  	struct sdw_stream_data *stream;
6ad73a2b42ea6d Shuming Fan       2022-11-08  567  
6ad73a2b42ea6d Shuming Fan       2022-11-08  568  	if (!sdw_stream)
6ad73a2b42ea6d Shuming Fan       2022-11-08  569  		return 0;
6ad73a2b42ea6d Shuming Fan       2022-11-08  570  
6ad73a2b42ea6d Shuming Fan       2022-11-08  571  	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
6ad73a2b42ea6d Shuming Fan       2022-11-08  572  	if (!stream)
6ad73a2b42ea6d Shuming Fan       2022-11-08  573  		return -ENOMEM;
6ad73a2b42ea6d Shuming Fan       2022-11-08  574  
6ad73a2b42ea6d Shuming Fan       2022-11-08  575  	stream->sdw_stream = sdw_stream;
6ad73a2b42ea6d Shuming Fan       2022-11-08  576  
6ad73a2b42ea6d Shuming Fan       2022-11-08  577  	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
26f9b884f20e9f Kuninori Morimoto 2023-01-24  578  	dai->stream[direction].dma_data = stream;
6ad73a2b42ea6d Shuming Fan       2022-11-08  579  
6ad73a2b42ea6d Shuming Fan       2022-11-08  580  	return 0;
6ad73a2b42ea6d Shuming Fan       2022-11-08  581  }
6ad73a2b42ea6d Shuming Fan       2022-11-08  582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
