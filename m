Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34A6FA4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689315207; x=1720851207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ko0RPclQPZ7JAE9trAcszeFMAN4jsO6NXD+M9MAfuYA=;
  b=kKOLWsd78DPNplQrrk/of7leu6SDdKpOXhY4nrVdE50G1/cFHWw6iPdX
   kOfYNQHWzdByC5LkbOIRn1G4u8/DRiDTKBHqwaJD/fzGQg26m+iqZ46h5
   mXSSg/96hgUYcjEtabzMDJspUkdS6PIm3rEaoFUjp2tiGapi+C5qKNOHh
   BUFhkOG3JvFmG8CcJ0sVgIOKTy/HLhgSHlotmThxOjJikQC+Yzw3qRrwm
   5Tp7jvjrsGdelZUkJWIurhKczXNubjfaxFMZNlEufS+8H6yNwRb645XSl
   ip/k1woy37av4lcq+dIEj00jG10wlmEmSO8CxLF5fw0ey4lzeWiSblMmM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362864961"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="362864961"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 23:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="896296367"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="896296367"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Jul 2023 23:13:24 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKC3P-0007EB-0x;
	Fri, 14 Jul 2023 06:13:23 +0000
Date: Fri, 14 Jul 2023 14:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: hostaudio_kern.c:undefined reference to `unregister_sound_mixer'
Message-ID: <202307141416.vxuRVpFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b810bf037e524b54669acbe4e0df54b15d87ea1
commit: 8c6174503c7b7134c22072b45f92724c8a959f06 um: hostfs: define our own API boundary
date:   3 months ago
config: um-randconfig-r015-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141416.vxuRVpFv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141416.vxuRVpFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141416.vxuRVpFv-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_cleanup_module':
>> hostaudio_kern.c:(.exit.text+0xa): undefined reference to `unregister_sound_mixer'
>> /usr/bin/ld: hostaudio_kern.c:(.exit.text+0x15): undefined reference to `unregister_sound_dsp'
   /usr/bin/ld: arch/um/drivers/hostaudio_kern.o: in function `hostaudio_init_module':
>> hostaudio_kern.c:(.init.text+0x19): undefined reference to `register_sound_dsp'
>> /usr/bin/ld: hostaudio_kern.c:(.init.text+0x31): undefined reference to `register_sound_mixer'
>> /usr/bin/ld: hostaudio_kern.c:(.init.text+0x49): undefined reference to `unregister_sound_dsp'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
