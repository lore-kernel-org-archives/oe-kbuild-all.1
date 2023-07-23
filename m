Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B426AB1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690149480; x=1721685480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKQpI3SDuf4lxx8prL9liYBncflw6E7xvAJVTdn7CQU=;
  b=akE9PyvFGSwcD5uFajrlPLNkKC3ke+ZDkLLjGwSv4Dh5kJ7khLtMnDmK
   gjjkRuFWtiCgpbscUihFS89EMX6ah716JMPnyjfPekRg475/96sAUGItu
   Si+1ZOUABZ99inoKZJjPGTpZJ9YqVPOJxe2+N+3P6eQfl8ckDLsAwpYvF
   iw1F0pjEwPTuiO8Z5kcqt1KjyXaTJYGu/olsGPxL6ihuaB1+ur+nAJcGW
   SJpSaanT6a5H4Cd+D7b8EG0X+PP1qTLcUq8bsDF4AjS8+gGaNZCRWebIF
   L3F/J4Idc08zL07cirZZYTVZKhvGcFM3ImamS7MPgw2OkRiJNVsrESHOW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="369984261"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="369984261"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 14:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="719443619"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="719443619"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Jul 2023 14:57:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNh5S-0009IN-1S;
	Sun, 23 Jul 2023 21:57:58 +0000
Date: Mon, 24 Jul 2023 05:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 483/507] kernel/bpf/verifier.c:3815:7:
 warning: GCC does not allow variable declarations in for loop initializers
 before C99
Message-ID: <202307240517.lZMFzJu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   2151fafc303ca2ee1be74a5197a5e3afa227f26c
commit: d487fdc3008aebf4e68bde2d83dd55bcf3beb45f [483/507] bpf: Repeat check_max_stack_depth for async callbacks
config: hexagon-randconfig-r045-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240517.lZMFzJu0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240517.lZMFzJu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240517.lZMFzJu0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:3815:7: warning: GCC does not allow variable declarations in for loop initializers before C99 [-Wgcc-compat]
    3815 |         for (int i = 0; i < env->subprog_cnt; i++) {
         |              ^
   1 warning generated.


vim +3815 kernel/bpf/verifier.c

  3809	
  3810	static int check_max_stack_depth(struct bpf_verifier_env *env)
  3811	{
  3812		struct bpf_subprog_info *si = env->subprog_info;
  3813		int ret;
  3814	
> 3815		for (int i = 0; i < env->subprog_cnt; i++) {
  3816			if (!i || si[i].is_async_cb) {
  3817				ret = check_max_stack_depth_subprog(env, i);
  3818				if (ret < 0)
  3819					return ret;
  3820			}
  3821			continue;
  3822		}
  3823		return 0;
  3824	}
  3825	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
