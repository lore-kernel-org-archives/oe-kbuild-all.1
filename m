Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203315381
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688756951; x=1720292951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kpObrnIIyyISCnD8TntuSfvF823PEZ7vVrNbdyVC68=;
  b=NxJ/DDaIs0be+7q+oLVx+ceIAeqnl49egxigRuSqo95j/Lp7KUtG6VZZ
   ghpL7GcqAVFwyw07u2DRN3M0w6PLSDKcYX+NPqrMFD8nZsEr3qksDbPLJ
   DMbDZapq6gk7rP8uTCQ961SiXriCk0ZVXAd9KFY43i6fXttkvjuHmsyEl
   OFUG6vZMicgqKGBfiW3pCFxZur3MsP6U3xqwoquVsOtDLJBesEdJVowC6
   /47pV7ZsAsA5E7uml5AFL3bn1y0r0CqlMpdJnY1WBrbKLQ0CCQDRs1GER
   gl4OZ0Y28qWVkVPGk/Qhtr/3lZErINJ220lTGr44I9QIdUBvmxAhE1sXM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366548547"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="366548547"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="864658380"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="864658380"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2023 12:09:08 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHqpH-0002DM-13;
	Fri, 07 Jul 2023 19:09:07 +0000
Date: Sat, 8 Jul 2023 03:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx6 2/9] include/linux/bpf_mprog.h:95: undefined
 reference to `bpf_mprog_free_rcu'
Message-ID: <202307080341.S9JJYXhB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx6
head:   2ca9ff83199a6107914894a890b2e425b00acacd
commit: e32fa7a0a789107cff988f10978f5c07007105d4 [2/9] bpf: Add fd-based tcx multi-prog infra with link support
config: i386-randconfig-i014-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080341.S9JJYXhB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080341.S9JJYXhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080341.S9JJYXhB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/sched/sch_ingress.o: in function `bpf_mprog_free':
>> include/linux/bpf_mprog.h:95: undefined reference to `bpf_mprog_free_rcu'
>> ld: include/linux/bpf_mprog.h:95: undefined reference to `bpf_mprog_free_rcu'
>> ld: include/linux/bpf_mprog.h:95: undefined reference to `bpf_mprog_free_rcu'


vim +95 include/linux/bpf_mprog.h

c10fc568c24fe8 Daniel Borkmann 2022-10-05  90  
c10fc568c24fe8 Daniel Borkmann 2022-10-05  91  static inline void bpf_mprog_free(struct bpf_mprog_entry *entry)
c10fc568c24fe8 Daniel Borkmann 2022-10-05  92  {
c10fc568c24fe8 Daniel Borkmann 2022-10-05  93  	struct bpf_mprog_bundle *bundle = entry->parent;
c10fc568c24fe8 Daniel Borkmann 2022-10-05  94  
c10fc568c24fe8 Daniel Borkmann 2022-10-05 @95  	call_rcu(&bundle->rcu, bpf_mprog_free_rcu);
c10fc568c24fe8 Daniel Borkmann 2022-10-05  96  }
c10fc568c24fe8 Daniel Borkmann 2022-10-05  97  

:::::: The code at line 95 was first introduced by commit
:::::: c10fc568c24fe863e0b76ea8104c859d7f33edc9 bpf: Add generic attach/detach/query API for multi-progs

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
