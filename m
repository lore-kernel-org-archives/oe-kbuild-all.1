Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9783CD1D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 19:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIYFTw27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697745573; x=1729281573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5L6DwHPhQ/sS54GokL5hmmQt1T0criMmAS8sdr+4Im8=;
  b=dIYFTw27sbHIcQxIAGyB+i7WP9TELK2vnlZ02LRIIZ8368IITCDaLsg1
   3a4J7qvXA+FvjsxOzwC6CtZMjOUALRO8OBviTF5G9/dHMu3TJAw+tvgJp
   SUPLrfdmWRjsjEnZ6GpjNwTYCOuwGBN7gTg2o2PjHAVVgtv+C02+5hIG+
   MRAJAGl0Sn6/QysYcobyhuVlQnK4UV07iQZCLBv2lE68vZfJUjbID1GS/
   iagfuMHTGjoWzlN3lw1n/GBUe2n83ldiarESQlf/bf5c2o/hx8VpL754q
   9qsgW8frhxYrAgpjAJ/Dscdj5FVAchXyLo5nEd4q1LEzMIjMRlCpDUK8O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386178724"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="386178724"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 12:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="750650646"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="750650646"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Oct 2023 12:59:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtZAz-0002Xq-1t;
	Thu, 19 Oct 2023 19:59:25 +0000
Date: Fri, 20 Oct 2023 03:59:09 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:mmap_sem.2023.10.18a 31/31] task_mmu.c:undefined
 reference to `__bad_udelay'
Message-ID: <202310200320.JSEpTicA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git mmap_sem.2023.10.18a
head:   4015256f2bc734d4175381762282784597f41cfa
commit: 4015256f2bc734d4175381762282784597f41cfa [31/31] EXP TESTING: introduce delay between getting a VMA and using it in show_map
config: arm-randconfig-002-20231019 (https://download.01.org/0day-ci/archive/20231020/202310200320.JSEpTicA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200320.JSEpTicA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200320.JSEpTicA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/proc/task_mmu.o: in function `show_map':
>> task_mmu.c:(.text+0x6c4): undefined reference to `__bad_udelay'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
