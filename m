Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684763C2C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675685230; x=1707221230;
  h=date:from:cc:subject:message-id:mime-version;
  bh=e85x01LupFgxE0vHhp3XJ03IWmH6jTfK1NwlX4OfbnM=;
  b=SvlzT14fFHGUUg9rfE6l4IrQiR5l5VYiapwEV+Dh9BMnzLdpWC7GUrNp
   kDtnsvOorpN3CzJPlE0sKFHU/GJDLBclDKtpsRw4xmkYIswMKzfa6xabw
   eiBs1Jfk/GlCsjA9Eves6FRfHCjFw+Rl8Oc4dJAjgYbBB099oXdCDe7zG
   bwftaCe5eOH6uq/L82ZnxFaDHRKoN9qdMDc9o8y3R9vsxGoKexQFUj00z
   gSXbRFyWKfqJalr5db8UlTV/KACHUGoAizfs1Q7YmPKel5RU/YM7vmqUP
   5zbwxuMUiDHSnQ3bQwJDCJP/dHKoq4wWOV33lB3s/k42A1FbFTK064CgM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="415407966"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="415407966"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 04:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698809463"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="698809463"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Feb 2023 04:06:56 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP0Gt-0002Wu-0U;
	Mon, 06 Feb 2023 12:06:55 +0000
Date: Mon, 6 Feb 2023 20:06:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.10/yocto 12185/29177]
 drivers/video/fbdev/core/fbmem.c:736:21: warning: attribute declaration must
 precede definition
Message-ID: <202302062012.Qv2zmLnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: 3aeb5198342e78c3f2ed6bc9431e492a4550cd2a [12185/29177] fbmem: Mark proc_fb_seq_ops as __maybe_unused
config: i386-randconfig-a004-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062012.Qv2zmLnI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/3aeb5198342e78c3f2ed6bc9431e492a4550cd2a
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 3aeb5198342e78c3f2ed6bc9431e492a4550cd2a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/core/fbmem.c:736:21: warning: attribute declaration must precede definition [-Wignored-attributes]
   static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
                       ^
   include/linux/compiler_attributes.h:267:56: note: expanded from macro '__maybe_unused'
   #define __maybe_unused                  __attribute__((__unused__))
                                                          ^
   include/linux/seq_file.h:31:8: note: previous definition is here
   struct seq_operations {
          ^
   1 warning generated.


vim +736 drivers/video/fbdev/core/fbmem.c

   735	
 > 736	static const struct __maybe_unused seq_operations proc_fb_seq_ops = {
   737		.start	= fb_seq_start,
   738		.next	= fb_seq_next,
   739		.stop	= fb_seq_stop,
   740		.show	= fb_seq_show,
   741	};
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
