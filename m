Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5037E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676118910; x=1707654910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bF3DfXmDegtvkwXq5nBkgCi+E8PUEIsjaMAT1JTLrXE=;
  b=Gj7z/TT05/wjsrM7iULPbaYAjFM6U5nD39cS5XPmdfyhWtvWOaG7WkkM
   5Gl88xhyBtLR/q0uYsA9OD7SZvOXL1suBVjSbIx/Fx1G53oxt5AOqrU4X
   DMj/VRe1GV2ihYDnCHdSkM7jcIHlk5VQr4cAaVFWNRcTOW/MxaeWI6gwf
   J09dhcdgnnqs5Pwe/E2Y/5pLg4qgJX17FB+Su6GblrjPiNudpRUe7US+M
   75jUVzlmmXc6NOiRQUbDzvwNVSTgGXG86wyIycu+wU7bliPsHMel57yJA
   w1OHDgGvhFGrT80/N3n4Q4p4qQduwZBljsix6aIq6SZKwHlS74cIZFA84
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416831397"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="416831397"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 04:35:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="811109195"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="811109195"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2023 04:35:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQp5v-0006Ub-2C;
	Sat, 11 Feb 2023 12:35:07 +0000
Date: Sat, 11 Feb 2023 20:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [povik:ivsense 34/39] sound/soc/apple/macaudio.c:1016:5: warning: no
 previous prototype for 'macaudio_sss_info'
Message-ID: <202302112041.hzY2kAaN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

FYI, the error/warning still remains.

tree:   https://github.com/povik/linux ivsense
head:   34f7168e4161164e8b3879d8ad099346a63f764f
commit: 75235fcd24ef0864f5e5314ec4cb23991b893c2f [34/39] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302112041.hzY2kAaN-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302112041.hzY2kAaN-lkp@intel.com/

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
