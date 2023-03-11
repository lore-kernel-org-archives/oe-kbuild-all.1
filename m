Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF716FC4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 23:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678577768; x=1710113768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kn6YdWbAadEtjiliC4pa5lo9S0xOY6/v9nD+wcUIbwk=;
  b=mhbNI0+biAbCF0lhSAGq4cA5X4tyEYXvd3PuNGAatQmbmqh8pmq6h66X
   ukVPHCLCNqihAcMBV3kl/Yt1Jky7USZHEHv0K6X08vVqW8QBMInrxYvuy
   6FTgoF7bXyG15TiT2Ru1Wf/mjx0FUHf89oZd+uuGgpyy/B/4Ts8D/zjUM
   VkTZbE5jxlEHpvmDi9oSz9DID8wmesYZgOiC9+NMHmOm3+WTITQwrBwzL
   IMMYMzYz/WSB2U0zexe38GkS73637cTzjC+US2G1qe1lTFeFHWBHiw63n
   FxrnbDrc8GQr3JAm4YEOMT8vvWK45IEJN2khuMXE+WaBGkmb7+ChoXBzp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="339317110"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="339317110"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="788464984"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="788464984"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2023 15:36:05 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb8ku-0004qx-1Q;
	Sat, 11 Mar 2023 23:36:04 +0000
Date: Sun, 12 Mar 2023 07:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-trusty-5.10
 1/1] drivers/trusty/trusty-sched-share.c:249:5: warning: no previous
 prototype for 'trusty_get_requested_nice'
Message-ID: <202303120753.ZwrNCoF2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Brandon,

FYI, the error/warning still remains.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-trusty-5.10
head:   de814afe14b14bf51d89ff8c1861b7a15ef2c3b2
commit: e399cfde2692714203fc1afa84819394082f4078 [1/1] ANDROID: escalate kthread nice for Trusty
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230312/202303120753.ZwrNCoF2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/e399cfde2692714203fc1afa84819394082f4078
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-trusty-5.10
        git checkout e399cfde2692714203fc1afa84819394082f4078
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120753.ZwrNCoF2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/trusty/trusty-sched-share.c:110:34: warning: no previous prototype for 'trusty_register_sched_share' [-Wmissing-prototypes]
     110 | struct trusty_sched_share_state *trusty_register_sched_share(struct device *device)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:409,
                    from include/linux/kernel.h:16,
                    from include/asm-generic/bug.h:20,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/arm/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/trusty/trusty-sched-share.c:10:
   drivers/trusty/trusty-sched-share.c: In function 'trusty_register_sched_share':
   drivers/trusty/trusty-sched-share.c:152:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     152 |                 (u64)sched_share_state);
         |                 ^
   include/linux/dynamic_debug.h:129:29: note: in definition of macro '__dynamic_func_call'
     129 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:161:9: note: in expansion of macro '_dynamic_func_call'
     161 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:123:9: note: in expansion of macro 'dynamic_dev_dbg'
     123 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/trusty/trusty-sched-share.c:151:9: note: in expansion of macro 'dev_dbg'
     151 |         dev_dbg(device, "%s: sched_share_state=%llx\n", __func__,
         |         ^~~~~~~
   drivers/trusty/trusty-sched-share.c: At top level:
   drivers/trusty/trusty-sched-share.c:183:6: warning: no previous prototype for 'trusty_unregister_sched_share' [-Wmissing-prototypes]
     183 | void trusty_unregister_sched_share(struct trusty_sched_share_state *sched_share_state)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/trusty/trusty-sched-share.c:249:5: warning: no previous prototype for 'trusty_get_requested_nice' [-Wmissing-prototypes]
     249 | int trusty_get_requested_nice(unsigned int cpu_num, struct trusty_sched_share_state *tcpu_state)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/trusty/trusty-sched-share.c:257:6: warning: no previous prototype for 'trusty_set_actual_nice' [-Wmissing-prototypes]
     257 | void trusty_set_actual_nice(unsigned int cpu_num,
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/trusty_get_requested_nice +249 drivers/trusty/trusty-sched-share.c

   248	
 > 249	int trusty_get_requested_nice(unsigned int cpu_num, struct trusty_sched_share_state *tcpu_state)
   250	{
   251		struct trusty_sched_shared *tsh = (struct trusty_sched_shared *)tcpu_state->sched_shared_vm;
   252	
   253		return map_trusty_prio_to_linux_nice(
   254				trusty_get_trusty_percpu_data(tsh, cpu_num)->ask_shadow_priority);
   255	}
   256	
 > 257	void trusty_set_actual_nice(unsigned int cpu_num,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
