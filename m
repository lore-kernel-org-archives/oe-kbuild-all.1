Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F1F7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675825429; x=1707361429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iONJSW5t4Cfe6lQJnsPiHcNr256DHSlPYsE7CdfsQzk=;
  b=a5c4eH5D94QUiIjMpG/4ct92AZb9aTTZeJ2FxHEWadARGhJ6B+WM/RJh
   ccSJaaAqLJ4ssUpok3zYGs1CY5rNahoEKgfRRFCKYNI8a1W/bGvn0sp//
   DeW/KoS4LARrPv6/rJ6QTgSloZxY6XraoqevZnL1TdB+AlaSSeR2Q7KKG
   koT/BPoIQ0211aGYQevxW8uqTAHBHxHepJ1Uxv+/VKJTBO2OKi6yBBi41
   TrMHVvI8+3EnXp8hZfw7jd2w9QjEpDIHymSmiQZAKhXsFUues9ijvkxnH
   sXvILrP9q6tt55WbhSCs4tjHBii5F4L6xnxioU2DHH7tR8Et/FZkTl5dF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357079704"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="357079704"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 19:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="667078714"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="667078714"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Feb 2023 19:03:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPakM-00047W-0L;
	Wed, 08 Feb 2023 03:03:46 +0000
Date: Wed, 8 Feb 2023 11:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/input/keyboard/cros_ec_keyb.c:203:6: warning: no previous
 prototype for function 'cros_ec_keyb_bs_event'
Message-ID: <202302081017.p4jvTmYr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gwendal,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 3880014a2162ceae2f5f9e33d9964db3635cabe3 CHROMIUM: input: Add walker for buttons/switches map
date:   2 years, 2 months ago
config: powerpc-randconfig-r003-20230206 (https://download.01.org/0day-ci/archive/20230208/202302081017.p4jvTmYr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=3880014a2162ceae2f5f9e33d9964db3635cabe3
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 3880014a2162ceae2f5f9e33d9964db3635cabe3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/input/keyboard/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/input/keyboard/cros_ec_keyb.c:14:
   In file included from include/linux/module.h:12:
   In file included from include/linux/list.h:9:
   In file included from include/linux/kernel.h:12:
   In file included from include/linux/bitops.h:29:
   In file included from arch/powerpc/include/asm/bitops.h:62:
   arch/powerpc/include/asm/barrier.h:49:9: warning: '__lwsync' macro redefined [-Wmacro-redefined]
   #define __lwsync()      __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
           ^
   <built-in>:323:9: note: previous definition is here
   #define __lwsync __builtin_ppc_lwsync
           ^
>> drivers/input/keyboard/cros_ec_keyb.c:203:6: warning: no previous prototype for function 'cros_ec_keyb_bs_event' [-Wmissing-prototypes]
   void cros_ec_keyb_bs_event(struct cros_ec_keyb *ckdev,
        ^
   drivers/input/keyboard/cros_ec_keyb.c:203:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cros_ec_keyb_bs_event(struct cros_ec_keyb *ckdev,
   ^
   static 
>> drivers/input/keyboard/cros_ec_keyb.c:215:6: warning: no previous prototype for function 'cros_ec_keyb_bs_set' [-Wmissing-prototypes]
   void cros_ec_keyb_bs_set(struct cros_ec_keyb *ckdev,
        ^
   drivers/input/keyboard/cros_ec_keyb.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void cros_ec_keyb_bs_set(struct cros_ec_keyb *ckdev,
   ^
   static 
   3 warnings generated.


vim +/cros_ec_keyb_bs_event +203 drivers/input/keyboard/cros_ec_keyb.c

   199	
   200	/**
   201	 * cros_ec_keyb_bs_event - Report a given button switch event
   202	 */
 > 203	void cros_ec_keyb_bs_event(struct cros_ec_keyb *ckdev,
   204				   const struct cros_ec_bs_map *map,
   205				   u32 mask)
   206	{
   207		input_event(ckdev->bs_idev, map->ev_type, map->code,
   208			    !!(mask & BIT(map->bit)) ^ map->inverted);
   209	}
   210	
   211	
   212	/**
   213	 * cros_ec_keyb_bs_set - Set capability for a given button switch
   214	 */
 > 215	void cros_ec_keyb_bs_set(struct cros_ec_keyb *ckdev,
   216				 const struct cros_ec_bs_map *map,
   217				 u32 mask)
   218	{
   219		if (mask & BIT(map->bit))
   220			input_set_capability(ckdev->bs_idev, map->ev_type, map->code);
   221	}
   222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
