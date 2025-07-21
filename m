Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30932E4271
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119994; cv=none; b=Wj3zJzXJKt69/D6hdADn8GEazsM/vjbrSVVG/ndHB+F291ZcY1MQpxBGvOZ0Rti5VHH4ooMdVUdTBFF7HRcPSTfX0GmRamDTqTK/LpDic6E28fvQXhIm0xmJe7PHK8t8peCj6AAxqB9ImteNs+LXB7odPa1hrzh1k0zCLSLN7bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119994; c=relaxed/simple;
	bh=EfpywA2hQuOyhpZDFq8MRYMFNvPMc627QHLzbT+lhR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g1pp7nqILGNBJC1gyrdpl58n4QBsp30mdLAAEEmKGwbU1WCs6FcPwCLvcF4tP3qpBr2Bb4Fq0whkIPGdT4EDAhZaoW+G2FnZunzM6QssOnJ5tSyy5NGSJlzONj4lcKvxqc/ht8mD9b/EF5OUpLfU+3SaEt8cwq+H2VQp9VBRD0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgQ2M17w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgQ2M17w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753119992; x=1784655992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EfpywA2hQuOyhpZDFq8MRYMFNvPMc627QHLzbT+lhR8=;
  b=DgQ2M17wL/kkhWAx7GPT1lGvDwk8bCDbU3DA1LTT0j7GAKPYePaPveCR
   8nLhXXrUoxfZk+pE26M8U5s39vaFOmc3U9O7+3RdqgWU2UnNsdkCinjnJ
   xPP0oU0wjewOiCKLQqNlbCA4WlApM2toJklo5P+/J0lJ9KnCPDNLO//yF
   ygSnDftUKTpbqLk37yKqvSkZImntCIeQR2TTcy/WkdDdXZIvQNOqMwwSs
   KbIXX0jqJACzHDHUxwtxmPau0qRViTD0b01PRw9VBpeUSAAPD5cs55E63
   yyYxmD7oYciEUgqmfBgaXtnhepvhClkccDYQQTa9Jp+Dh09eXUnWcfFYh
   w==;
X-CSE-ConnectionGUID: Q7miKjfBRaqG70mFJAMrRQ==
X-CSE-MsgGUID: KjAJZ7XXTMaRRpS/hxZpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="42962668"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="42962668"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 10:46:32 -0700
X-CSE-ConnectionGUID: irpL3sm2RJmg5ZxtVHIJFA==
X-CSE-MsgGUID: TyPcXIILR26HuSWtVTwsQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159234854"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 21 Jul 2025 10:46:31 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uduar-0001Q9-08;
	Mon, 21 Jul 2025 17:46:29 +0000
Date: Mon, 21 Jul 2025 19:46:23 +0200
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11052/11398] security/apparmor/lsm.c:182:44:
 warning: variable 'rules' set but not used
Message-ID: <202507211959.jdeNhMK6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 9afdc6abb007d5a86f54e9f10870ac1468155ca5 [11052/11398] apparmor: transition from a list of rules to a vector of rules
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250721/202507211959.jdeNhMK6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211959.jdeNhMK6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211959.jdeNhMK6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/lsm.c: In function 'apparmor_capget':
>> security/apparmor/lsm.c:182:44: warning: variable 'rules' set but not used [-Wunused-but-set-variable]
     182 |                         struct aa_ruleset *rules;
         |                                            ^~~~~


vim +/rules +182 security/apparmor/lsm.c

b5e95b48685e34 John Johansen   2010-07-29  161  
b5e95b48685e34 John Johansen   2010-07-29  162  /* Derived from security/commoncap.c:cap_capget */
6672efbb685f7c Khadija Kamran  2023-08-07  163  static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effective,
b5e95b48685e34 John Johansen   2010-07-29  164  			   kernel_cap_t *inheritable, kernel_cap_t *permitted)
b5e95b48685e34 John Johansen   2010-07-29  165  {
637f688dc3dc30 John Johansen   2017-06-09  166  	struct aa_label *label;
b5e95b48685e34 John Johansen   2010-07-29  167  	const struct cred *cred;
b5e95b48685e34 John Johansen   2010-07-29  168  
b5e95b48685e34 John Johansen   2010-07-29  169  	rcu_read_lock();
b5e95b48685e34 John Johansen   2010-07-29  170  	cred = __task_cred(target);
637f688dc3dc30 John Johansen   2017-06-09  171  	label = aa_get_newest_cred_label(cred);
c70c86c421427f John Johansen   2017-06-09  172  
b1d9e6b0646d0e Casey Schaufler 2015-05-02  173  	/*
b1d9e6b0646d0e Casey Schaufler 2015-05-02  174  	 * cap_capget is stacked ahead of this and will
b1d9e6b0646d0e Casey Schaufler 2015-05-02  175  	 * initialize effective and permitted.
b1d9e6b0646d0e Casey Schaufler 2015-05-02  176  	 */
c70c86c421427f John Johansen   2017-06-09  177  	if (!unconfined(label)) {
c70c86c421427f John Johansen   2017-06-09  178  		struct aa_profile *profile;
c70c86c421427f John Johansen   2017-06-09  179  		struct label_it i;
c70c86c421427f John Johansen   2017-06-09  180  
c70c86c421427f John Johansen   2017-06-09  181  		label_for_each_confined(i, label, profile) {
1ad22fcc4d0d2f John Johansen   2022-09-05 @182  			struct aa_ruleset *rules;
ce9e3b3fa25a23 John Johansen   2024-01-04  183  			kernel_cap_t allowed;
ce9e3b3fa25a23 John Johansen   2024-01-04  184  
9afdc6abb007d5 John Johansen   2025-02-17  185  			rules = profile->label.rules[0];
ce9e3b3fa25a23 John Johansen   2024-01-04  186  			allowed = aa_profile_capget(profile);
ce9e3b3fa25a23 John Johansen   2024-01-04  187  			*effective = cap_intersect(*effective, allowed);
ce9e3b3fa25a23 John Johansen   2024-01-04  188  			*permitted = cap_intersect(*permitted, allowed);
c70c86c421427f John Johansen   2017-06-09  189  		}
b5e95b48685e34 John Johansen   2010-07-29  190  	}
b5e95b48685e34 John Johansen   2010-07-29  191  	rcu_read_unlock();
637f688dc3dc30 John Johansen   2017-06-09  192  	aa_put_label(label);
b5e95b48685e34 John Johansen   2010-07-29  193  
b5e95b48685e34 John Johansen   2010-07-29  194  	return 0;
b5e95b48685e34 John Johansen   2010-07-29  195  }
b5e95b48685e34 John Johansen   2010-07-29  196  

:::::: The code at line 182 was first introduced by commit
:::::: 1ad22fcc4d0d2fb2e0f35aed555a86d016d5e590 apparmor: rework profile->rules to be a list

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
