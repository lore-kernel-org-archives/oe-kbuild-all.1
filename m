Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1B1FD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692716905; x=1724252905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+g3fmS0bsDWMoDaDL5uRUfdsSBHG3Bmw5yCdeWl+wzE=;
  b=O8hdzEqQU1MElDfI28yeN3UgHPpj4GSMlOT+7OCkmCnr7kGmlp+iFyDO
   9wbpBfGTPNlr4s+1hinSxxzNVS3mZL2sokYXcMH+tTF3XS2Ga7qAA7LVK
   w5Z4u5pbH6XZURDZgV9/NBkDpVamIcggvS3/JaZQ/Ev9Gxce1CXCxZa+b
   r/ZrdanP/FAli2rEE4rP2Sua89R+fMXss/NcXDEKTqJP5v3a9dj6g5W5J
   Z+NodZbrA4wEYaRSgzcud6nYTNahh4sHfIBSBhBjHl+KJr5JI1FeBRzVC
   w8x34QTIHUOz56oayURzVKZCaVEZkZInkvtNim7kDObOxtsn+uWCu/hGZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404907922"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="404907922"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 08:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859952227"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="859952227"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 08:08:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYSzW-0000Ga-14;
	Tue, 22 Aug 2023 15:08:22 +0000
Date: Tue, 22 Aug 2023 23:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14445/30000]
 sound/core/pcm_lib.c:2511: warning: Function parameter or member 'volume'
 not described in 'snd_pcm_add_volume_ctls'
Message-ID: <202308222236.YbbjV6DV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   ef983429ea2180ce7f3b17f1c8f5bff8ae61c1fa
commit: 73b10269ae2eb525ac773239e9a32b939aac5b6b [14445/30000] ANDROID: GKI: ALSA: PCM: volume API implementation
config: x86_64-randconfig-006-20230822 (https://download.01.org/0day-ci/archive/20230822/202308222236.YbbjV6DV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222236.YbbjV6DV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222236.YbbjV6DV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/pcm_lib.c:2511: warning: Function parameter or member 'volume' not described in 'snd_pcm_add_volume_ctls'


vim +2511 sound/core/pcm_lib.c

  2494	
  2495	/**
  2496	 * snd_pcm_add_volume_ctls - create volume control elements
  2497	 * @pcm: the assigned PCM instance
  2498	 * @stream: stream direction
  2499	 * @max_length: the max length of the volume parameter of stream
  2500	 * @private_value: the value passed to each kcontrol's private_value field
  2501	 * @info_ret: store struct snd_pcm_volume instance if non-NULL
  2502	 *
  2503	 * Create volume control elements assigned to the given PCM stream(s).
  2504	 * Returns zero if succeed, or a negative error value.
  2505	 */
  2506	int snd_pcm_add_volume_ctls(struct snd_pcm *pcm, int stream,
  2507				   const struct snd_pcm_volume_elem *volume,
  2508				   int max_length,
  2509				   unsigned long private_value,
  2510				   struct snd_pcm_volume **info_ret)
> 2511	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
