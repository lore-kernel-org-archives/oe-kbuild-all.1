Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96EAE56C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692344346; x=1723880346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlxuriaBxb0FQCUjjZ2NRMAYJZ0hcsdXDsM+eLfM/rc=;
  b=QT2Rr3N6DkBlhda7HdoRtcJHvZ33Sz5etMtDiNfRM0Q9BMjEMuyJPZIO
   oymBTGiDoF5yKq4TkWGNs+wp1AD72WtldC4tZbR9k43S+MuqB4IeO4pd8
   PMjCfQXZ6byRV4aXXRFg9NUKcMgvtxBBspWqZrHZOptP8jS99lx3f5p0W
   J+frxP2ttqd/8ZiR8BxF1agct9SlBwibW1P7IkCACik9McKznr2Sh4Zr8
   QeV3yPbybZBnUQ97EDItJ+GOeW7tMCfcZkouaEp/TcDjbj9hBImzQY6QE
   zXLcqS2c8UZkvlhuymqckX69dYQmaBUib2srS9aKj+DRYqk0yWm7GY/iW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="373019751"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="373019751"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 00:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="805054016"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="805054016"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Aug 2023 00:39:05 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWu3i-0002E6-2V;
	Fri, 18 Aug 2023 07:39:04 +0000
Date: Fri, 18 Aug 2023 15:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14450/30000]
 sound/soc/soc-core.c:3283: warning: Function parameter or member 'online'
 not described in 'snd_soc_card_change_online_state'
Message-ID: <202308181558.AggdV0da-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: ca69a0e600a2ed2ef3900a7b639628f6c7067ad4 [14450/30000] ANDROID: GKI: ALSA: core: Add snd_soc_card_change_online_state() API
config: x86_64-randconfig-x054-20230817 (https://download.01.org/0day-ci/archive/20230818/202308181558.AggdV0da-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181558.AggdV0da-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181558.AggdV0da-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-core.c:2921: warning: Excess function parameter 'legacy_dai_naming' description in 'snd_soc_register_dais'
>> sound/soc/soc-core.c:3283: warning: Function parameter or member 'online' not described in 'snd_soc_card_change_online_state'


vim +3283 sound/soc/soc-core.c

  3276	
  3277	/**
  3278	 * snd_soc_card_change_online_state - Mark if soc card is online/offline
  3279	 *
  3280	 * @soc_card : soc_card to mark
  3281	 */
  3282	void snd_soc_card_change_online_state(struct snd_soc_card *soc_card, int online)
> 3283	{
  3284		snd_card_change_online_state(soc_card->snd_card, online);
  3285	}
  3286	EXPORT_SYMBOL_GPL(snd_soc_card_change_online_state);
  3287	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
