Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABF7621
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 01:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692928117; x=1724464117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qfc4PiAnRH/EuRBAuaf/2V7X0KYsATCUGFII7DdwHSs=;
  b=ALkIPbeEjf7A3WycuFOOO6mr+mDMwKbZTy/oCm6keonnOzNgTYxnAdVa
   ttOrhflZkUK52StKhN20M1DPZHgIsR3pEcjAUbYJsCz3G67uKO2oeGywB
   BYDAgK+NYOme9tBVROYP6cYOVHAhatZztlY/BM8uIEPROzxp3EeDTcnhX
   AWqhi8YRr0y9qv5TD5ff43JqRbARKXTAZ+sp80lfYfmTui2Bnw/WprvtR
   7zu3Nt/t3OA42aH6FlnMNbrdu/A3oc0oz1yjfJmIe+fjQBIPYGJtgzLJ/
   TXFwAalWXplOW38zE8vzSMehAkWoZ4pFpIYl3vg0paAjK+eiJAxJRQZj+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="354936118"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="354936118"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="730866097"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="730866097"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2023 18:48:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLwA-00037R-1O;
	Fri, 25 Aug 2023 01:48:34 +0000
Date: Fri, 25 Aug 2023 09:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/4] super: wait until we passed kill super
Message-ID: <202308250920.J7SzhuBk-lkp@intel.com>
References: <20230818-vfs-super-fixes-v3-v2-4-cdab45934983@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818-vfs-super-fixes-v3-v2-4-cdab45934983@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f3aeab61fb15edef1e81828da8dbf0814541e49b]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/super-use-locking-helpers/20230821-103401
base:   f3aeab61fb15edef1e81828da8dbf0814541e49b
patch link:    https://lore.kernel.org/r/20230818-vfs-super-fixes-v3-v2-4-cdab45934983%40kernel.org
patch subject: [PATCH v2 4/4] super: wait until we passed kill super
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230825/202308250920.J7SzhuBk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250920.J7SzhuBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250920.J7SzhuBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/super.c:225: warning: Function parameter or member 's' not described in 'grab_super_dead'
>> fs/super.c:225: warning: Excess function parameter 'sb' description in 'grab_super_dead'


vim +225 fs/super.c

   210	
   211	/**
   212	 * grab_super_dead - acquire an active reference to a superblock
   213	 * @sb: superblock to acquire
   214	 *
   215	 * Acquire a temporary reference on a superblock and try to trade it for
   216	 * an active reference. This is used in sget{_fc}() to wait for a
   217	 * superblock to either become SB_BORN or for it to pass through
   218	 * sb->kill() and be marked as SB_DEAD.
   219	 *
   220	 * Return: This returns true if an active reference could be acquired,
   221	 *         false if not. The function acquires s_umount and returns with
   222	 *         it held.
   223	 */
   224	static bool grab_super_dead(struct super_block *s) __releases(sb_lock)
 > 225	{
   226		bool born;
   227	
   228		s->s_count++;
   229		spin_unlock(&sb_lock);
   230		born = super_lock_dead(s);
   231		if (born && atomic_inc_not_zero(&s->s_active)) {
   232			put_super(s);
   233			return true;
   234		}
   235		up_write(&s->s_umount);
   236		put_super(s);
   237		return false;
   238	}
   239	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
