Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AB27E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 04:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675311191; x=1706847191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4tLIHufASDeeZIKVfGNwMMyG0Wx3MYzn701xXh7f1k=;
  b=kTWbauPZJXzFMk321DF4vRq/HLIjM54YwD/91VWYCvEHy69HUajvTqdY
   sU7w2JwABExmF/poUbfNld3NyyEkMRP1X0p2kl7PgcgZcCF97AniQ3s6T
   d60iwKmVpZxdUTfHO1Trhc8jzR7wYE3EjX2iZX/mi91/46MpNYwmPiJqU
   GcXmhcLj1atu/KtBaiNvpuGuGl8dZqnjGgOPdjR7t4kjfyxUIQwKffexH
   yMdDgILq/8L9IQhOcDJppv0oeJF/hAdNU0T2qtxnaGdXNgxeoZR9G9CYM
   P8CLXRR692WYxErnFlTfK575MlJOb7udpitg6H6S4HiU+c5ji5RQyDLzS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390736789"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="390736789"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 20:13:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="753934895"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="753934895"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2023 20:13:08 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNQyC-000683-0y;
	Thu, 02 Feb 2023 04:13:08 +0000
Date: Thu, 2 Feb 2023 12:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/paronl.2023.02.01a 7/9]
 arch/x86/kernel/smpboot.c:1361:31: error: implicit declaration of function
 'idle_thread_get'
Message-ID: <202302021243.bku0pJhm-lkp@intel.com>
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
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230202/202302021243.bku0pJhm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/5d245bcd0107a551fe69545ae757526932f9738a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/paronl.2023.02.01a
        git checkout 5d245bcd0107a551fe69545ae757526932f9738a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c:1266:5: warning: no previous prototype for 'do_cpu_up' [-Wmissing-prototypes]
    1266 | int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
         |     ^~~~~~~~~
   arch/x86/kernel/smpboot.c: In function 'native_cpu_kick':
>> arch/x86/kernel/smpboot.c:1361:31: error: implicit declaration of function 'idle_thread_get' [-Werror=implicit-function-declaration]
    1361 |         return do_cpu_up(cpu, idle_thread_get(cpu));
         |                               ^~~~~~~~~~~~~~~
   arch/x86/kernel/smpboot.c:1361:31: warning: passing argument 2 of 'do_cpu_up' makes pointer from integer without a cast [-Wint-conversion]
    1361 |         return do_cpu_up(cpu, idle_thread_get(cpu));
         |                               ^~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               int
   arch/x86/kernel/smpboot.c:1266:53: note: expected 'struct task_struct *' but argument is of type 'int'
    1266 | int do_cpu_up(unsigned int cpu, struct task_struct *tidle)
         |                                 ~~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/idle_thread_get +1361 arch/x86/kernel/smpboot.c

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
