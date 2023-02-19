Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349229AC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676838707; x=1708374707;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aIFJybv52xkBwJmQNIRRucCZBGlBUSENcYZWyXVL+GU=;
  b=cmwiwFEFbTdSczXa6us8RwW38YU1D41v8DsbxoUsG1fdDwdYn75QLZ5Y
   B6Bpy21oaXVj1qvQVOn4ghh0EgU9dqlo6wp43pdQiiXMlk/AIMgJbjs8c
   GLt14n61KMWAJr638A12V9sy+nC5QWwVHEMwgId76IRwpBUDqQ+iKDAI+
   HCnfYkbJN6IPWvxO0eHYalAqW8Qj7Al+b2wkVZP00cSIUcrO0ht+sE/Nd
   SvfZV9vcG23yUqfT6K/W5SZ6Ra6MuKI5rX+x1gCaWlhUIOi1VfDGQCy9r
   c8wqOWr4iyJON/hcdp67EYjWVhITBJBj3YB1wes2oOEzDtU/ryKJb/LYD
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="396966658"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="396966658"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 12:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="794974398"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="794974398"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Feb 2023 12:31:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTqLY-000DRp-03;
	Sun, 19 Feb 2023 20:31:44 +0000
Date: Mon, 20 Feb 2023 04:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/watchdog.c:244: undefined reference to
 `watchdog_update_hrtimer_threshold'
Message-ID: <202302200422.o98fAdIk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Colin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 215b4b4c085f76d42696c118a4f4fc9a64f17cff CHROMIUM: hardlockup: detect hard lockups without NMIs using secondary cpus
date:   2 years, 2 months ago
config: x86_64-randconfig-a004-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200422.o98fAdIk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=215b4b4c085f76d42696c118a4f4fc9a64f17cff
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 215b4b4c085f76d42696c118a4f4fc9a64f17cff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200422.o98fAdIk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: kernel/watchdog.o: in function `set_sample_period':
>> kernel/watchdog.c:244: undefined reference to `watchdog_update_hrtimer_threshold'


vim +244 kernel/watchdog.c

58687acba59266 Don Zickus                2010-05-07  233  
0f34c400914f16 Chuansheng Liu            2012-12-17  234  static void set_sample_period(void)
58687acba59266 Don Zickus                2010-05-07  235  {
58687acba59266 Don Zickus                2010-05-07  236  	/*
586692a5a5fc57 Mandeep Singh Baines      2011-05-22  237  	 * convert watchdog_thresh from seconds to ns
86f5e6a7b19272 Fernando Luis Vázquez Cao 2012-02-09  238  	 * the divide by 5 is to give hrtimer several chances (two
86f5e6a7b19272 Fernando Luis Vázquez Cao 2012-02-09  239  	 * or three with the current relation between the soft
86f5e6a7b19272 Fernando Luis Vázquez Cao 2012-02-09  240  	 * and hard thresholds) to increment before the
86f5e6a7b19272 Fernando Luis Vázquez Cao 2012-02-09  241  	 * hardlockup detector generates a warning
58687acba59266 Don Zickus                2010-05-07  242  	 */
0f34c400914f16 Chuansheng Liu            2012-12-17  243  	sample_period = get_softlockup_thresh() * ((u64)NSEC_PER_SEC / 5);
7edaeb6841dfb2 Thomas Gleixner           2017-08-15 @244  	watchdog_update_hrtimer_threshold(sample_period);
58687acba59266 Don Zickus                2010-05-07  245  }
58687acba59266 Don Zickus                2010-05-07  246  

:::::: The code at line 244 was first introduced by commit
:::::: 7edaeb6841dfb27e362288ab8466ebdc4972e867 kernel/watchdog: Prevent false positives with turbo modes

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
