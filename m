Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8C171D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685547152; x=1717083152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToAgdbmYyBTVciOEZca9OHnOGaVAyu/4tvM8ja+xqKI=;
  b=jw6V+03qQxEAs5QHunXVnYns5xLBm80o0bFb9yiEoJCK9cef4EbErLMu
   xic7tdEJwcaBH7lXhsowy1ZD/W1ftNaalYpod9nDfc+F0SxlqxNOOAas9
   yYxhGqVUrbU+nlCPs9s3C3qIatVfQrgdaMja/cl5V6Mlo9+J2pJIq0hSE
   p1flDlXJaL1JSEPItduYuOIfp0xTrshWrxqChiImsgP+ni7w69oOUdCd0
   Dvvf13TNEU9Dj97WLRlnCG4BdVrP5V5I6mB/1y56EPck8CPlj9Zrywfko
   PEwVfG2X45AqzVbD78dQt94fppDLoiqScZv0ykJbRFD7p/jS2g7cATWqA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354116853"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354116853"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 08:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="701140918"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="701140918"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2023 08:32:29 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4NoL-0001Qj-0K;
	Wed, 31 May 2023 15:32:29 +0000
Date: Wed, 31 May 2023 23:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:topic/cpu-smt 6/9] kernel/cpu.c:2583:36: error:
 'cpu_smt_max_threads' undeclared; did you mean 'cpu_smt_num_threads'?
Message-ID: <202305312356.SfvJ8Iwh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cpu-smt
head:   7bb712baeffc4640f5511feec68add6f1767413f
commit: 570b70824d468facd197e44b6d40c9e79886b81c [6/9] cpu/SMT: Allow enabling partial SMT states via sysfs
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230531/202305312356.SfvJ8Iwh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=570b70824d468facd197e44b6d40c9e79886b81c
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc topic/cpu-smt
        git checkout 570b70824d468facd197e44b6d40c9e79886b81c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312356.SfvJ8Iwh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'control_show':
>> kernel/cpu.c:2583:36: error: 'cpu_smt_max_threads' undeclared (first use in this function); did you mean 'cpu_smt_num_threads'?
    2583 |             cpu_smt_num_threads != cpu_smt_max_threads)
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    cpu_smt_num_threads
   kernel/cpu.c:2583:36: note: each undeclared identifier is reported only once for each function it appears in


vim +2583 kernel/cpu.c

  2571	
  2572	static ssize_t control_show(struct device *dev,
  2573				    struct device_attribute *attr, char *buf)
  2574	{
  2575		const char *state = smt_states[cpu_smt_control];
  2576	
  2577		/*
  2578		 * If SMT is enabled but not all threads are enabled then show the
  2579		 * number of threads. If all threads are enabled show "on". Otherwise
  2580		 * show the state name.
  2581		 */
  2582		if (cpu_smt_control == CPU_SMT_ENABLED &&
> 2583		    cpu_smt_num_threads != cpu_smt_max_threads)
  2584			return sysfs_emit(buf, "%d\n", cpu_smt_num_threads);
  2585	
  2586		return snprintf(buf, PAGE_SIZE - 2, "%s\n", state);
  2587	}
  2588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
