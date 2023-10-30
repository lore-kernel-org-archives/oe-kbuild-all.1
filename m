Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672923C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 22:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjjvTjAb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698703336; x=1730239336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jfzh0ip6bSohVXGujADTB1xLhPFtMHVGpGbmPmLH2XI=;
  b=KjjvTjAbqlNp/5a7XRbEcFa6HWvKtcOD7zn6y1yNFa9VxaUl1xK5jotg
   rZGMr4r+6cxnPli/jTq9WfUeBQwMDSB9gxiJkzIBeb0gwuvyPZuDJoao9
   ZeznJs7ut0q75122LPz2QP11pIjCKjign1fairYpOyDP/MCkR714YXjCh
   8FNb9436w70GZN2x/suPyrHGSW2lWwF9abkYu0X0xP1gxik9F6SkGKfKX
   gw0ZQsIjkSN2Yl59PkXNH+z43GV6NhHjj0gRUj4VgDcXwHOa37Ts8P6CU
   BixFCzEOrTdTEWWtTkZbZ8MINU9ao3IxPvTVtIZy8BA5EUj+mSrXejE0L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="474412997"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="474412997"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 15:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764050683"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="764050683"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Oct 2023 15:02:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxaKn-000DaR-03;
	Mon, 30 Oct 2023 22:02:09 +0000
Date: Tue, 31 Oct 2023 06:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/generic/simple-card-utils.c:28:33: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202310310501.Yb4dFWIo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   14ab6d425e80674b6a0145f05719b11e82e64824
commit: 047a05366f4bb2e32eabbd3c8990d1d91ab87c89 ASoC: simple-card-utils: Fixup DAI sample format
date:   1 year, 3 months ago
config: x86_64-randconfig-x014-20230805 (https://download.01.org/0day-ci/archive/20231031/202310310501.Yb4dFWIo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310501.Yb4dFWIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310501.Yb4dFWIo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/generic/simple-card-utils.c:28:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] val @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/generic/simple-card-utils.c:28:33: sparse:     expected unsigned int [usertype] val
   sound/soc/generic/simple-card-utils.c:28:33: sparse:     got restricted snd_pcm_format_t [usertype]
   sound/soc/generic/simple-card-utils.c:29:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] val @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/generic/simple-card-utils.c:29:33: sparse:     expected unsigned int [usertype] val
   sound/soc/generic/simple-card-utils.c:29:33: sparse:     got restricted snd_pcm_format_t [usertype]
   sound/soc/generic/simple-card-utils.c:30:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] val @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/generic/simple-card-utils.c:30:33: sparse:     expected unsigned int [usertype] val
   sound/soc/generic/simple-card-utils.c:30:33: sparse:     got restricted snd_pcm_format_t [usertype]
   sound/soc/generic/simple-card-utils.c:31:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] val @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/generic/simple-card-utils.c:31:33: sparse:     expected unsigned int [usertype] val
   sound/soc/generic/simple-card-utils.c:31:33: sparse:     got restricted snd_pcm_format_t [usertype]
   sound/soc/generic/simple-card-utils.c:32:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] val @@     got restricted snd_pcm_format_t [usertype] @@
   sound/soc/generic/simple-card-utils.c:32:33: sparse:     expected unsigned int [usertype] val
   sound/soc/generic/simple-card-utils.c:32:33: sparse:     got restricted snd_pcm_format_t [usertype]

vim +28 sound/soc/generic/simple-card-utils.c

    17	
    18	static void asoc_simple_fixup_sample_fmt(struct asoc_simple_data *data,
    19						 struct snd_pcm_hw_params *params)
    20	{
    21		int i;
    22		struct snd_mask *mask = hw_param_mask(params,
    23						      SNDRV_PCM_HW_PARAM_FORMAT);
    24		struct {
    25			char *fmt;
    26			u32 val;
    27		} of_sample_fmt_table[] = {
  > 28			{ "s8",		SNDRV_PCM_FORMAT_S8},
    29			{ "s16_le",	SNDRV_PCM_FORMAT_S16_LE},
    30			{ "s24_le",	SNDRV_PCM_FORMAT_S24_LE},
    31			{ "s24_3le",	SNDRV_PCM_FORMAT_S24_3LE},
    32			{ "s32_le",	SNDRV_PCM_FORMAT_S32_LE},
    33		};
    34	
    35		for (i = 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
    36			if (!strcmp(data->convert_sample_format,
    37				    of_sample_fmt_table[i].fmt)) {
    38				snd_mask_none(mask);
    39				snd_mask_set(mask, of_sample_fmt_table[i].val);
    40				break;
    41			}
    42		}
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
