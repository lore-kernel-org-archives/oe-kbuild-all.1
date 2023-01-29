Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071417C3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 02:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674958746; x=1706494746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3m3VdvpG0PwBAE/kKwtdtmsoDr9kI3mcqpst6rTc6A=;
  b=MwoKT2EF09BOL1zvpwT+gkGDaA0KRo+Vef5yQvbhbxhXmDQw/Yp/B1m+
   fdqhVeqxzkBomaTqfziuynuMHGjdGrVB0VdST9Ma1AAKANlgVfdeEFRAY
   N+KBMCIdoxMt5rIBaQQys58KRrd+JqTxK2FFapj81RQl4qt7b33Yad3op
   SyAgy4GLdc436yZCj2aNlsc8mTOr/sy8zLlRzDvPme5u9K/gHrsPiiQRo
   LRV6J78rysk+Soj4S/P0Ex9en7bS3pOLUEuYBgODhSPRuXrUqoKUf9BJ5
   sijIg7qo8nN2LhZJYph4k3lf2Bt0cAsnBqm576DCPTFXbL1dJPwgcxPcW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="327372633"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="327372633"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 18:19:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="641144411"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="641144411"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2023 18:19:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLxHa-0001M6-31;
	Sun, 29 Jan 2023 02:19:02 +0000
Date: Sun, 29 Jan 2023 10:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:ivsense 34/37] sound/soc/apple/macaudio.c:1016:5: warning: no
 previous prototype for 'macaudio_sss_info'
Message-ID: <202301291014.RPz0jYhu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/povik/linux ivsense
head:   46630652178d7edeb72add30f186f264f4982c8a
commit: 75235fcd24ef0864f5e5314ec4cb23991b893c2f [34/37] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301291014.RPz0jYhu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/povik/linux/commit/75235fcd24ef0864f5e5314ec4cb23991b893c2f
        git remote add povik https://github.com/povik/linux
        git fetch --no-tags povik ivsense
        git checkout 75235fcd24ef0864f5e5314ec4cb23991b893c2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash sound/soc/apple/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for 'macaudio_sss_info' [-Wmissing-prototypes]
    1016 | int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
         |     ^~~~~~~~~~~~~~~~~
>> sound/soc/apple/macaudio.c:1026:5: warning: no previous prototype for 'macaudio_sss_get' [-Wmissing-prototypes]
    1026 | int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
         |     ^~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
