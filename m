Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3CC538F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 19:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676231092; x=1707767092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jvsg2AEd6UA3xVSNs4YedCkSYoFMdX9zs+UlDlshjEY=;
  b=lnhyuL8ehBO4a8nlGT38Ke3NITyvfYGQBDBIrJ6nwDnmvXeULb3ThfM4
   nyjMbimfmmUuw+IoDt5GL1ip+1mWYnNVyLRvk8Z3c29Y6XZlt9zIbY/dB
   KMiqNA8UbK1kWmYb/fMy0gK/I/We9oGVoYmOii0XJ/CjgjxotIdfWJFT0
   lPp6yxFJSRD0JJjxpruahOndJdXF/ZxuyYpo0+KwMoeJheMy7GvKP/mNg
   a7VjFH/+7KsvOpnjg0Ye/V2IbsQyXTlEreU24PDigYYDDnUXOQW4JB5T2
   8i2yN+xaxr52g7FJRb+5oNs9HzSQ6a8noKMKRgW5RqhSIBLbi41PbJTPA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332058838"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="332058838"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 11:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701040607"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="701040607"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Feb 2023 11:44:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRIHK-0007Mv-2D;
	Sun, 12 Feb 2023 19:44:50 +0000
Date: Mon, 13 Feb 2023 03:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:arch-cpu-idle-dead-noreturn 22/22]
 kernel/sched/build_policy.o: warning: objtool: do_idle() falls through to
 next function cpu_in_idle()
Message-ID: <202302130346.mZmQLwuS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git arch-cpu-idle-dead-noreturn
head:   a56b016f32a0ed70b1922e1c079dada827d72fa1
commit: a56b016f32a0ed70b1922e1c079dada827d72fa1 [22/22] sched/idle: Mark arch_cpu_idle_dead() __noreturn
config: x86_64-randconfig-a015-20230213 (https://download.01.org/0day-ci/archive/20230213/202302130346.mZmQLwuS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=a56b016f32a0ed70b1922e1c079dada827d72fa1
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe arch-cpu-idle-dead-noreturn
        git checkout a56b016f32a0ed70b1922e1c079dada827d72fa1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130346.mZmQLwuS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/build_policy.o: warning: objtool: do_idle() falls through to next function cpu_in_idle()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
