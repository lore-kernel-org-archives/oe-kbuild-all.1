Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA6A378
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 01:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685237033; x=1716773033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=26H5pm6czCi/jVEP89MTzbYASoITO6OPK5a72o+hbsc=;
  b=W2h7ZYowoIU8ujsK2SkhoAjBjBR4pxP+j3AlcawF2BBsyL5KpXNpKtNF
   cwzII/Hi8BJytOl2BtEBYYcRQfU6bjNC99De3Qtn6sdofNop1j4H0g3l9
   E2XucOwjvmvufX1ETM77lNT9zAb/nve2YsC2/vsTKadS8BBFRFVUXNvAn
   s25unEEWG1EitKC4XhfG/IGPJPEPSeM7pD+XhBi69Xdj+wPMxehEQPo6U
   hIhXoLBwod1ryqxV+kksY7bxUpuk1da59rcGTEwPtlYzGviX+Y9W02GsR
   qf4joJBYAWOSmNrXH0v4gkE/PPMHl7tWwVYN/t+0DUw5buGK/E6vQfCk6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334089560"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334089560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 18:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="879938053"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="879938053"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2023 18:23:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q358Q-000KMG-0U;
	Sun, 28 May 2023 01:23:50 +0000
Date: Sun, 28 May 2023 09:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 2111/4815] sound/pci/emu10k1/emufx.c:1124:
 undefined reference to `__divdi3'
Message-ID: <202305280916.VDhHUnPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a3d37b4d885129561e1cef361216f00472f7d2e
commit: bb5ceb43b7bfa166fd5d739d51ad46c1cfb225e3 [2111/4815] ALSA: emu10k1: fix non-zero mixer control defaults in highres mode
config: i386-randconfig-i001-20230526 (https://download.01.org/0day-ci/archive/20230528/202305280916.VDhHUnPQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bb5ceb43b7bfa166fd5d739d51ad46c1cfb225e3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bb5ceb43b7bfa166fd5d739d51ad46c1cfb225e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280916.VDhHUnPQ-lkp@intel.com/

Note: the linux-next/master HEAD 6a3d37b4d885129561e1cef361216f00472f7d2e builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: sound/pci/emu10k1/emufx.o: in function `snd_emu10k1_init_mono_control':
>> sound/pci/emu10k1/emufx.c:1124: undefined reference to `__divdi3'
   ld: sound/pci/emu10k1/emufx.o: in function `snd_emu10k1_init_stereo_control':
   sound/pci/emu10k1/emufx.c:1146: undefined reference to `__divdi3'


vim +1124 sound/pci/emu10k1/emufx.c

  1111	
  1112	static void
  1113	snd_emu10k1_init_mono_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
  1114				      const char *name, int gpr, int defval)
  1115	{
  1116		ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
  1117		strcpy(ctl->id.name, name);
  1118		ctl->vcount = ctl->count = 1;
  1119		if (high_res_gpr_volume) {
  1120			ctl->min = 0;
  1121			ctl->max = 0x7fffffff;
  1122			ctl->tlv = snd_emu10k1_db_linear;
  1123			ctl->translation = EMU10K1_GPR_TRANSLATION_NONE;
> 1124			defval = defval * 0x7fffffffLL / 100;
  1125		} else {
  1126			ctl->min = 0;
  1127			ctl->max = 100;
  1128			ctl->tlv = snd_emu10k1_db_scale1;
  1129			ctl->translation = EMU10K1_GPR_TRANSLATION_TABLE100;
  1130		}
  1131		ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
  1132	}
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
