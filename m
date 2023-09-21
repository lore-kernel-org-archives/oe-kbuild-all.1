Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C78665C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 04:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695271156; x=1726807156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R/HEFKTPrScP9EgSkdnDv9S7s+jAB0ErO3BR7WiVap0=;
  b=ko/M+gYziDpZ0NZcbndoBZVFNuI4mgOJP/0b21tEFR76D8Kg+1vBcbA0
   bVto5UZiw7j9z/RM94u8ubxOXPY7t2NSADH6nuN5xCTTN23MHnwkzI7pY
   1s08Rvl2sXEkP1Ere4BK9G9sq+aKZdzEFTY5w9JE8MPg8IuHaDWeXDqCf
   81Cldznu1b4cb17klkSfPbwpSC3l6mf6iqlFiXjh5tPjwunW5a2PU4US9
   2/OXqZM3NdwyQWO17Q7V6dIVTWDjh4oOkqW2THMJDSpPt8WhWhlkniJ50
   LGo/2doHDMlaj//XCvUFVPVf8HuDJXnCIZcp+tL+AOwgIoYKTwoHSRW2V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466724786"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="466724786"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 21:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750219479"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="750219479"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 21:39:14 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjBT6-0009Vc-0h;
	Thu, 21 Sep 2023 04:39:12 +0000
Date: Thu, 21 Sep 2023 12:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 5/38] sound/soc/soc-ops.c:659:1: warning:
 the frame size of 1232 bytes is larger than 1024 bytes
Message-ID: <202309211201.uEEwwGrS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   84126be72ac9e0b38c992e806417952deb3cd540
commit: ecb9493792851a5f22d39b544e305565a9cc6762 [5/38] ASoC: ops: Enforce platform maximum on initial value
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20230921/202309211201.uEEwwGrS-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211201.uEEwwGrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211201.uEEwwGrS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-ops.c: In function 'soc_clip_to_platform_max':
>> sound/soc/soc-ops.c:659:1: warning: the frame size of 1232 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     659 | }
         | ^


vim +659 sound/soc/soc-ops.c

   633	
   634	static int soc_clip_to_platform_max(struct snd_kcontrol *kctl)
   635	{
   636		struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
   637		struct snd_ctl_elem_value uctl;
   638		int ret;
   639	
   640		if (!mc->platform_max)
   641			return 0;
   642	
   643		ret = kctl->get(kctl, &uctl);
   644		if (ret < 0)
   645			return ret;
   646	
   647		if (uctl.value.integer.value[0] > mc->platform_max)
   648			uctl.value.integer.value[0] = mc->platform_max;
   649	
   650		if (snd_soc_volsw_is_stereo(mc) && 
   651		    uctl.value.integer.value[1] > mc->platform_max)
   652			uctl.value.integer.value[1] = mc->platform_max;
   653	
   654		ret = kctl->put(kctl, &uctl);
   655		if (ret < 0)
   656			return ret;
   657	
   658		return 0;
 > 659	}
   660	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
