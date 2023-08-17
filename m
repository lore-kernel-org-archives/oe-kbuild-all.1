Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4227171BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 17:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692294219; x=1723830219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8iQtBOL6TFVexQw7PjGzWB5pHmcNabrqAze61EDszY=;
  b=eqqla8SfLlcoEWV283DyhHlRQMNwkNjHP8pNlCWTbPzB+Suja73BRXKJ
   p2iD5AZJKc3B66hTm/u3KUl0zf75o1b7WS3iD4A9S7pdQoHeaHVflfVVS
   Hb26JqZ9ZtoEmHD8EQ+af24XisGAKU3ZucZ01Ghm8RQ712AsFQ4QC2EQZ
   YzQvnSA3a5NhOxCkYWV+sNH+1a1Msp2TCWZC/8tkfX+G4JByQfHu5J+Zu
   2KZNq7w+gqnqr0AN30hFVZo7Qv1Uu4e58rT3kPoXqQVZJ8M8VyjFpI3n8
   OsBPvOVRoIsk5+RGBmtiezW7OY5P7XKDIAq9Bz1oMcaQw/CMW6q//fWqj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="370352845"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="370352845"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 10:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="848951576"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="848951576"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2023 10:43:35 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWh1z-0001M5-0n;
	Thu, 17 Aug 2023 17:43:35 +0000
Date: Fri, 18 Aug 2023 01:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14447/30000]
 sound/core/pcm_lib.c:2511: warning: Function parameter or member 'volume'
 not described in 'snd_pcm_add_volume_ctls'
Message-ID: <202308180139.RxlOgmFd-lkp@intel.com>
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
commit: 73b10269ae2eb525ac773239e9a32b939aac5b6b [14447/30000] ANDROID: GKI: ALSA: PCM: volume API implementation
config: x86_64-randconfig-x054-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180139.RxlOgmFd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180139.RxlOgmFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180139.RxlOgmFd-lkp@intel.com/

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
