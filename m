Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2621CA9B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 22:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQjEXBO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702249094; x=1733785094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PW61A4y1C+OToibpimpgZ7W0iU0c4BJHw+t9s76rU/k=;
  b=KQjEXBO186ssFoQP1irfeopndX8PiX4pNpw3BkwVpF7I0FnFXuvy7poQ
   trEDkbOuHcTL/XXgRFoPEhF7c/OeZ5t9IfjVEqQ+AoTX/PXfMh+u+X0NQ
   9d0U/Whe+9zDAzN56IjSY5TSsIO/tjEFzqjy8qZODTszcaSnB8lg0+yVL
   fF9CzWtbSjmuqw4XlDz0hPGPW8pQnE5AEL+u0rK9zETufP6XIhwLK/siM
   5iYY7OGM33otFetzTN97Duuzx0xCvonOlbc7UW2R7KYP4tAfDCfXC8hoH
   WMz74ht4suu8w0KVzg8sH9YTxgJGmiR4Z4Uy6uleTj6fIM3fdPFCKuj98
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="394309368"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="394309368"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 14:58:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="801775342"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="801775342"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2023 14:58:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCSkU-000HLz-0Z;
	Sun, 10 Dec 2023 22:58:10 +0000
Date: Mon, 11 Dec 2023 06:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] LSM: Officially support appending LSM hooks after
 boot.
Message-ID: <202312110637.aKk3lLkW-lkp@intel.com>
References: <09e4992c-9def-41b5-a806-2978b3ae35c6@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09e4992c-9def-41b5-a806-2978b3ae35c6@I-love.SAKURA.ne.jp>

Hi Tetsuo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pcmoore-audit/next]
[also build test WARNING on pcmoore-selinux/next linus/master v6.7-rc4]
[cannot apply to next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/LSM-Officially-support-appending-LSM-hooks-after-boot/20231209-162924
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git next
patch link:    https://lore.kernel.org/r/09e4992c-9def-41b5-a806-2978b3ae35c6%40I-love.SAKURA.ne.jp
patch subject: [RFC PATCH v3] LSM: Officially support appending LSM hooks after boot.
config: i386-randconfig-011-20231211 (https://download.01.org/0day-ci/archive/20231211/202312110637.aKk3lLkW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110637.aKk3lLkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110637.aKk3lLkW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/security.c:554:5: warning: no previous prototype for 'mod_security_add_hooks' [-Wmissing-prototypes]
     554 | int mod_security_add_hooks(struct security_hook_list *hooks, int count, const char *lsm)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/mod_security_add_hooks +554 security/security.c

   553	
 > 554	int mod_security_add_hooks(struct security_hook_list *hooks, int count, const char *lsm)
   555	{
   556		int i;
   557	
   558		if (!static_branch_unlikely(&mod_security_enabled)) {
   559			pr_info("Modular LSM support is not enabled.\n");
   560			return -EINVAL;
   561		}
   562		pr_info("Registering modular LSM: %s\n", lsm);
   563		for (i = 0; i < count; i++) {
   564			hooks[i].lsm = lsm;
   565			hlist_add_tail_rcu(&hooks[i].list, hooks[i].head);
   566		}
   567		return 0;
   568	}
   569	EXPORT_SYMBOL_GPL(mod_security_add_hooks);
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
