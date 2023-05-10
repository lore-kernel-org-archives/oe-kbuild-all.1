Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D1021CF5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683754189; x=1715290189;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jSFykEbv6x4EAUCE6KfbAYqNc73Mquc3vKifPuuFrKk=;
  b=g9Jr3u572sF1JU0DQ+mGs+8ammYASS4PBwe00jaiSkohp9A7EhlulTd5
   /c5x7zxHMPv/K4TQOZjs4kldJOQ5168s7mzheZyEbt9Ygawh0aa2SwaXr
   67Vuscz2UNKLCp8oejgVQH6Q2y1gUEzp4hyADa5MUr4mJj1ReH79xKxch
   BVQvJDGqvj2VNxy4QPnlXddYIlnWU7HeBjG23M2FNojr2yQgVZj9jGz/B
   IW14HohPc4xMgcCLuz3oN9G/is5CMlAZ5WndOpXDvRYLB6OObLbXD5eAm
   Ql/jzIhWdVBsUgbJqM16nq3UYkJkEvx1S1t1WD72zJPjSYmuoY8F9ukgG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329948438"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="329948438"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 14:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="649884530"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="649884530"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 May 2023 14:29:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwrNa-0003aO-2E;
	Wed, 10 May 2023 21:29:46 +0000
Date: Thu, 11 May 2023 05:28:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 77/87]
 include/trace/define_trace.h:95:42: fatal error:
 ../../drivers/media/platform/chips-media/trace.h: No such file or directory
Message-ID: <202305110543.VVlFsVvZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5131dc945565a7c0536092202e27490824f1eca3
commit: 3535376e4f9618805ce0c36abaf8e567b61c95f7 [77/87] media: platform: chips-media: Move Coda to separate folder
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230511/202305110543.VVlFsVvZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3535376e4f9618805ce0c36abaf8e567b61c95f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/media/platform/chips-media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110543.VVlFsVvZ-lkp@intel.com/

Note: the ti/ti-rt-linux-6.1.y-cicd HEAD 5131dc945565a7c0536092202e27490824f1eca3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/chips-media/coda/trace.h:175,
                    from drivers/media/platform/chips-media/coda/coda-bit.c:32:
>> include/trace/define_trace.h:95:42: fatal error: ../../drivers/media/platform/chips-media/trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   compilation terminated.


vim +95 include/trace/define_trace.h

a8d154b0091683 Steven Rostedt 2009-04-10  94  
a8d154b0091683 Steven Rostedt 2009-04-10 @95  #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
a8d154b0091683 Steven Rostedt 2009-04-10  96  

:::::: The code at line 95 was first introduced by commit
:::::: a8d154b009168337494fbf345671bab74d3e4b8b tracing: create automated trace defines

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
