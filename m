Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5977E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 06:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrypzY7o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697263500; x=1728799500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+6LrMWp5C2ZY5PbOFV0tZGmoe2iT4hw8grPBGPqb0E=;
  b=ZrypzY7o75rkGpTziWSWOkj84O6WfGrBjUH1v0KaXUaoB+QVN/xo2qGH
   Tma/hDL6MvINIBQtfdYGsQnNU1DdX5fxEejiDclr5EThiJH5uZ+lXjlXM
   22S4s+Xsi9O8xlP0Nw8Tj1078a2Oof06fmvuP6J4dEGrviBweG79awAxO
   fFdITMO1LkxuGQMOmq3p88HZ29zhwkIvdrDY65bEB6YY8YWr0CMKDHImL
   rZlXZccwR+1qhQ1IGNfgwuSY/4QTQXJWiC/obHy3ZiFybrLJ4o6HNzxnx
   fLGvVkYk2VwCNBCbSALQidc5ei7h2Vb0XVkAgy71IQU61DD1n3dgSyZUB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471535882"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471535882"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784403891"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784403891"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2023 23:04:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrXlf-0005l2-1P;
	Sat, 14 Oct 2023 06:04:55 +0000
Date: Sat, 14 Oct 2023 14:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sound/speaker-safety 167/199]
 sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for
 'macaudio_sss_info'
Message-ID: <202310141329.jT9k4Z5I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   0c49093e19a678be51c7207bbf9da61b29173375
commit: 8bd43018bef69c6c45eb8880b5649abab8d6e1c9 [167/199] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141329.jT9k4Z5I-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141329.jT9k4Z5I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141329.jT9k4Z5I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for 'macaudio_sss_info' [-Wmissing-prototypes]
    1016 | int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1026:5: warning: no previous prototype for 'macaudio_sss_get' [-Wmissing-prototypes]
    1026 | int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
   Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
   Selected by [m]:
   - SND_SOC_APPLE_MACAUDIO [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])


vim +/macaudio_sss_info +1016 sound/soc/apple/macaudio.c

  1015	
> 1016	int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
  1017	{
  1018		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
  1019		uinfo->count = 1;
  1020		uinfo->value.integer.min = 0;
  1021		uinfo->value.integer.max = 1;
  1022	
  1023		return 0;
  1024	}
  1025	
> 1026	int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1027	{
  1028		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1029		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1030	
  1031		/*
  1032		 * TODO: Check if any locking is in order here. I would
  1033		 * assume there is some ALSA-level lock, but DAPM implementations
  1034		 * of kcontrol ops do explicit locking, so look into it.
  1035		 */
  1036		uvalue->value.integer.value[0] = ma->speakers_streaming;
  1037	
  1038		return 0;
  1039	}
  1040	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
