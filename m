Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743E7E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 02:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675306208; x=1706842208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GlVIR3IvaSHmxC4JpJ/aqD8hjuN86To3dAWnvfND1lY=;
  b=iCSX+EDO7MbA7nhzv00eYNwMDET3HNBI7inf+G/wSrh+mBUs41TH/rkv
   wz/XmGpIVs5CZLfZDXV+hegjVcl8WeLJjtURukds3I+RC8SDg1h6NNVhN
   utcIte+xu79mdl8unvyWdlG60M+XPd+5s7FUWgTFafascU7Cl7elISTEJ
   ybg+U+IaD0vTT1XtVmHgDvSp9nFm2o1C5dWMWD1IDYqXSx1OMpCk9MXQJ
   k4fLlr1/jei7WrmknFVq6+XvzhjJ1fpT82Q/BB7QK9F3o2a3QbdzrpgWn
   xlGerzLW6kiLpPqve2g77HCl34qLFuf0mSZl9aIyq8TzCQIqej6CX6tAE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355672135"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="355672135"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="910546540"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="910546540"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2023 18:50:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNPfn-00063E-2T;
	Thu, 02 Feb 2023 02:50:03 +0000
Date: Thu, 2 Feb 2023 10:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/paronl.2023.02.01a 7/9]
 arch/x86/kernel/smpboot.c:1361:31: warning: passing argument 2 of
 'do_cpu_up' makes pointer from integer without a cast
Message-ID: <202302021052.NLAk6zgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/paronl.2023.02.01a
head:   05792727280c094a8dcd1aa4950a61a2d214ddb8
commit: 5d245bcd0107a551fe69545ae757526932f9738a [7/9] x86/smpboot: Send INIT/SIPI/SIPI to secondary CPUs in parallel
config: x86_64-randconfig-a001-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021052.NLAk6zgv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/5d245bcd0107a551fe69545ae757526932f9738a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/paronl.2023.02.01a
        git checkout 5d245bcd0107a551fe69545ae757526932f9738a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c:1266:5: warning: no previous prototype for 'do_cpu_up' [-Wmissing-prototypes]
    1266 | int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
         |     ^~~~~~~~~
   arch/x86/kernel/smpboot.c: In function 'native_cpu_kick':
   arch/x86/kernel/smpboot.c:1361:31: error: implicit declaration of function 'idle_thread_get' [-Werror=implicit-function-declaration]
    1361 |         return do_cpu_up(cpu, idle_thread_get(cpu));
         |                               ^~~~~~~~~~~~~~~
>> arch/x86/kernel/smpboot.c:1361:31: warning: passing argument 2 of 'do_cpu_up' makes pointer from integer without a cast [-Wint-conversion]
    1361 |         return do_cpu_up(cpu, idle_thread_get(cpu));
         |                               ^~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   arch/x86/kernel/smpboot.c:1266:53: note: expected 'struct task_struct *' but argument is of type 'int'
    1266 | int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/do_cpu_up +1361 arch/x86/kernel/smpboot.c

  1357	
  1358	/* Bringup step one: Send INIT/SIPI to the target AP */
  1359	static int native_cpu_kick(unsigned int cpu)
  1360	{
> 1361		return do_cpu_up(cpu, idle_thread_get(cpu));
  1362	}
  1363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
