Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDE03C02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676360942; x=1707896942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qLQcGrLYDgyWUZRDWaDbiuxLYyQpA/EbaMp/8Q2HF6c=;
  b=CgKCcGT+ZO6opjOwyVMCKQqrFi3EY4jM3nPnvKpEG9RTY5RPOxNttu7p
   y+KYc6XLKxTc8EUpqcL17Ku3iLonpj4h2C8bsY9xmEGWQ+VnrY8dgahV5
   pfywwhX8npyZA2z1wpUJmbWeZnLEIUr7bJzC18w7/jQmO3+7wD9bieSzY
   UNwH4zsKtsiRBzEVHIgKuHgqXrx9crzOdqj8lSafGy9x+UoC+E033mMNV
   IJ5P4I1QT10WiuEipWmWf1FS7DwPUubsXHNICWskjx+Xt6N9t5u/BjBiw
   SImIlEj+9HdSU+BmmJA4vu+6AnlqATWSGN41a9MkhUX7O7vBp/uXhCdCW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="417320584"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="417320584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 23:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="618951529"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="618951529"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 23:48:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRq3f-0008JH-0b;
	Tue, 14 Feb 2023 07:48:59 +0000
Date: Tue, 14 Feb 2023 15:48:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 5/11]
 arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for
 function 'rb_event_size'
Message-ID: <202302141536.IzACdpqv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   8e245b4c3a574fbb94b6b655f84e071febc147a6
commit: eab8f11bed73de6ca0cfe5a6897f53e0a1560bfb [5/11] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230214/202302141536.IzACdpqv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/eab8f11bed73de6ca0cfe5a6897f53e0a1560bfb
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout eab8f11bed73de6ca0cfe5a6897f53e0a1560bfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141536.IzACdpqv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/trace.c:150:49: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
           struct hyp_buffer_page *tail_page, *new_tail, *new_head;
                                                          ^
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for function 'rb_event_size' [-Wmissing-prototypes]
   unsigned long rb_event_size(unsigned long length)
                 ^
   arch/arm64/kvm/hyp/nvhe/trace.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long rb_event_size(unsigned long length)
   ^
   static 
   2 warnings generated.


vim +/rb_event_size +190 arch/arm64/kvm/hyp/nvhe/trace.c

   189	
 > 190	unsigned long rb_event_size(unsigned long length)
   191	{
   192		struct ring_buffer_event *event;
   193	
   194		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
