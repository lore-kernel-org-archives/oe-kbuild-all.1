Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB231FA7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBs8KfpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698901948; x=1730437948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8xYcStWtz+C0z7mzztAGPq0BZEhJhCg97IHMnqBIEI=;
  b=FBs8KfpNGBZC1c6rrItJ4ZYKawtdWjMf8fvGgfRyuhFu5EX8AjC70p93
   rycoIGZzMhf4lNx6guvDOEroIrCAumdKjafb5T9E20LiLvBfVtmxSuAKO
   OvC9yzQxeMJHjupGaHKfM4K9a/0UF5DAd+PUNBss2g1GYbXEIi+3x2ntP
   iWu1BfdC98drorJnDZZCfYTRUP+zPMaqhY1zDPY7/UQg3iIil7Wvc9B+i
   fqv6oVLtJGxTi5QVfk6zAtddVozH+kGKcHmXf/pWQA4CTQvD1D7kDSUUm
   zTH3ph/Zu5Cbj1pS/A0zDQ8ITwPaZEuBpnB13v+CCtkjPCsRmpUY5S5ZU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="367984413"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="367984413"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="826996857"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="826996857"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Nov 2023 22:12:27 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyQ0G-00018O-2T;
	Thu, 02 Nov 2023 05:12:24 +0000
Date: Thu, 2 Nov 2023 13:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 31/35]
 sound/soc/sof/intel/hda-loader.c:693:5: warning: no previous prototype for
 'hda_sdw_bpt_dma_enable'
Message-ID: <202311021318.yc0im5Q2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   435eecba9365ea702ed336be739716e72d20e78f
commit: 7cff7313e19c370b522bcf61cb705a1c9792d481 [31/35] [WIP] ASoC: SOF: Intel: hda-loader: add helpers for SoundWire BPT DMA
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231102/202311021318.yc0im5Q2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021318.yc0im5Q2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021318.yc0im5Q2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/intel/hda-loader.c:693:5: warning: no previous prototype for 'hda_sdw_bpt_dma_enable' [-Wmissing-prototypes]
     693 | int hda_sdw_bpt_dma_enable(struct snd_sof_dev *sdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/intel/hda-loader.c:735:5: warning: no previous prototype for 'hda_sdw_bpt_dma_disable' [-Wmissing-prototypes]
     735 | int hda_sdw_bpt_dma_disable(struct snd_sof_dev *sdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/sof/intel/hda-loader.c:764:5: warning: no previous prototype for 'sdw_bpt_transfer' [-Wmissing-prototypes]
     764 | int sdw_bpt_transfer(struct snd_sof_dev *sdev,
         |     ^~~~~~~~~~~~~~~~


vim +/hda_sdw_bpt_dma_enable +693 sound/soc/sof/intel/hda-loader.c

   692	
 > 693	int hda_sdw_bpt_dma_enable(struct snd_sof_dev *sdev,
   694				   struct hdac_ext_stream **sdw_bpt_stream,
   695				   struct snd_dma_buffer *dmab_bdl,
   696				   u8 *bpt_buffer, /* data already formatted for Cadence IP */
   697				   u32 bpt_num_bytes,
   698				   int direction)
   699	{
   700		struct hdac_ext_stream *bpt_stream;
   701		int ret;
   702		int ret1;
   703	
   704		bpt_stream = hda_cl_stream_prepare(sdev, HDA_CL_STREAM_FORMAT,
   705						   bpt_num_bytes,
   706						   dmab_bdl,
   707						   direction,
   708						   false);
   709		if (IS_ERR(bpt_stream)) {
   710			dev_err(sdev->dev, "SDW BTP DMA prepare failed: dir %d\n", direction);
   711			return PTR_ERR(bpt_stream);
   712		}
   713		*sdw_bpt_stream = bpt_stream;
   714	
   715		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
   716			memcpy(dmab_bdl->area, bpt_buffer, bpt_num_bytes);
   717	
   718		ret = cl_trigger(sdev, bpt_stream, SNDRV_PCM_TRIGGER_START);
   719		if (ret < 0) {
   720			dev_err(sdev->dev, "SDW BTP DMA trigger start failed: dir %d\n", direction);
   721	
   722			ret1 = hda_cl_cleanup(sdev, dmab_bdl, bpt_stream);
   723			if (ret1 < 0) {
   724				dev_err(sdev->dev, "SDW BTP DMA cleanup failed: %d\n", direction);
   725	
   726				/* set return value to indicate cleanup failure */
   727				if (!ret)
   728					ret = ret1;
   729			}
   730		}
   731	
   732		return ret;
   733	}
   734	
 > 735	int hda_sdw_bpt_dma_disable(struct snd_sof_dev *sdev,
   736				    struct hdac_ext_stream *sdw_bpt_stream,
   737				    struct snd_dma_buffer *dmab_bdl,
   738				    int direction)
   739	
   740	{
   741		int ret;
   742		int ret1;
   743	
   744		ret = cl_trigger(sdev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_STOP);
   745		if (ret < 0) {
   746			/* even if the stop fails we have to do the cleanup */
   747			dev_err(sdev->dev, "%s: SDW BTP DMA trigger stop failed: dir %d\n",
   748				__func__, direction);
   749		}
   750	
   751		ret1 = hda_cl_cleanup(sdev, dmab_bdl, sdw_bpt_stream);
   752		if (ret1 < 0) {
   753			dev_err(sdev->dev, "%s: SDW BTP DMA cleanup failed: dir %d\n",
   754				__func__, direction);
   755	
   756			/* set return value to indicate cleanup failure */
   757			if (!ret)
   758				ret = ret1;
   759		}
   760	
   761		return ret;
   762	}
   763	
 > 764	int sdw_bpt_transfer(struct snd_sof_dev *sdev,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
