Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9A118017
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683653703; x=1715189703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OI4pkOsWUJfe64YuNDT7+aOfc7oFJk0HvSSxUcUjsb8=;
  b=PDcQbQtNwuIrNZnF6kMxgTAJy6BGQnX9EX1AnqxGhGrB0dlazbrO/swv
   mnTmO2Bh3s4FGlrPZ3YbEXC0Zg/hSb62lNHdu46i7LftzELBpRx7ofMUb
   HLmHDZSahye0Upi6AnwER7/Dd6Q5ywNBP1wwR/+kjYEm3gQiftO1KiGEM
   GIKEbrG2DAUbmnx3mrTfjky3jKsh8zjr3MdzzkmhJZMsHdnZoDNbjm2A5
   MFbNIq85FVYSwMGR/vBb7iyZU105MvM6b9eDUE4MyWMSfvw+xjBp/pGsn
   uK8DhNA0nbL2Ah6pIdPKrDNucajw3f3xO0aHTGNCRTMiCaMlD1GmodjmX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413281214"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="413281214"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 10:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649424132"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="649424132"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 10:30:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwRA2-0002KO-1O;
	Tue, 09 May 2023 17:30:02 +0000
Date: Wed, 10 May 2023 01:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:sound/ivsense-improvements 51/57]
 sound/soc/apple/macaudio.c:1016:5: warning: no previous prototype for
 'macaudio_sss_info'
Message-ID: <202305100111.lYmQSWU0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/ivsense-improvements
head:   8db1ec849194a2607c8546306d0b9e0e1ed2a1da
commit: 7553794e9ed11bb344cec33d1460a2d06949a56c [51/57] ASoC: macaudio: Add 'Speakers Up Indicator' control
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305100111.lYmQSWU0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/7553794e9ed11bb344cec33d1460a2d06949a56c
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux sound/ivsense-improvements
        git checkout 7553794e9ed11bb344cec33d1460a2d06949a56c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash sound/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100111.lYmQSWU0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/apple/macaudio.c: In function 'macaudio_add_backend_dai_route':
   sound/soc/apple/macaudio.c:764:32: error: 'struct snd_soc_dai' has no member named 'capture_widget'
     764 |                 r->source = dai->capture_widget->name;
         |                                ^~
   sound/soc/apple/macaudio.c: At top level:
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
