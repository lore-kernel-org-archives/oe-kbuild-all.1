Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04589C126
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686498427; x=1718034427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAUH8I5bV0rLJjyIBLInv5sGrB6yke/WZq0UwXQC80Y=;
  b=HODbezsT0bKQmf5oCpXxMgdpXdlI8x6dJYgRUYaeZ8nakO12DU6NYLQY
   RwRAYiTLo/LK8WOKOYDPBOomdyyNKOkNU+w/Y5hX/16vowSCKmG7Mpta9
   hBnGmvWU5rWWZre9CyiKSGG8xqTe3W8lLL8lQBESazbXIELAkNQlyfXTb
   c4zgannzsmwD7eEZq339fJGWTW0hSY+eLjd6PdH88BSfWyHNhjzXxc8mi
   Ssz2/SGlFDn+o+iyeLT6Fa6LV1bobUIgWJHva5uY+j1Yiw3p0bxCySP8M
   /geyfStFpEFAf6hnWY0r4i0j9OEDwgCfvTfHv1VoCICuMEdsGL+CmkX9w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="361237890"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="361237890"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 08:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="1041060701"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="1041060701"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2023 08:47:05 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8NHV-000Aua-08;
	Sun, 11 Jun 2023 15:47:05 +0000
Date: Sun, 11 Jun 2023 23:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 14/74] include/sound/ump_msg.h:196:13: error:
 duplicate member 'reserved'
Message-ID: <202306112301.dMok4XSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   15253079ca300160c92c9c0ee2541836463043f6
commit: 0b5288f5fe63eab687c14e5940b9e0d532b129f2 [14/74] ALSA: ump: Add legacy raw MIDI support
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230611/202306112301.dMok4XSA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?id=0b5288f5fe63eab687c14e5940b9e0d532b129f2
        git remote add tiwai-sound https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
        git fetch --no-tags tiwai-sound for-next
        git checkout 0b5288f5fe63eab687c14e5940b9e0d532b129f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306112301.dMok4XSA-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD 15253079ca300160c92c9c0ee2541836463043f6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from sound/core/ump_convert.h:5,
                    from sound/core/ump.c:14:
>> include/sound/ump_msg.h:196:13: error: duplicate member 'reserved'
     196 |         u32 reserved:8;
         |             ^~~~~~~~
>> include/sound/ump_msg.h:197:13: error: duplicate member 'program'
     197 |         u32 program:8;
         |             ^~~~~~~
>> include/sound/ump_msg.h:198:13: error: duplicate member 'channel'
     198 |         u32 channel:4;
         |             ^~~~~~~
>> include/sound/ump_msg.h:199:13: error: duplicate member 'status'
     199 |         u32 status:4;
         |             ^~~~~~
>> include/sound/ump_msg.h:200:13: error: duplicate member 'group'
     200 |         u32 group:4;
         |             ^~~~~
>> include/sound/ump_msg.h:201:13: error: duplicate member 'type'
     201 |         u32 type:4;
         |             ^~~~


vim +/reserved +196 include/sound/ump_msg.h

   184	
   185	/* MIDI 1.0 Program Change (32bit) */
   186	struct snd_ump_midi1_msg_program {
   187	#ifdef __BIG_ENDIAN_BITFIELD
   188		u32 type:4;
   189		u32 group:4;
   190		u32 status:4;
   191		u32 channel:4;
   192		u32 program:8;
   193		u32 reserved:8;
   194	#else
   195	#endif
 > 196		u32 reserved:8;
 > 197		u32 program:8;
 > 198		u32 channel:4;
 > 199		u32 status:4;
 > 200		u32 group:4;
 > 201		u32 type:4;
   202	} __packed;
   203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
