Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE22C1587
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099940; cv=none; b=Zg2WNloVwXnBqwMsLTUL5qkTVxnbWSkMMWS8xFPeaDXoDb07PNGNv5w18leDhh1FQlsLu4uvabgK3rNWrnxfgBNslSl8QNnH8YuvyN9w2GeotFoyKeUotS42r9HGdDcLTkXHuN6FlRr8tti2tevqUYnzwKcgQsX70pAzMlNdD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099940; c=relaxed/simple;
	bh=6r3ZM1x5J3dct/sUwxTg/Cnm57CNoZ0yihnRWcK4S6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnKcAb4/1FB7OKPDy6cM6XaX91+lE6jZAZn1DiwjIEHsxjeCN7Z73hxOCYQiDxfCAiYbQ89GBCQc8mXtXiArjLhdGkgWAhbIjk9CeRxwoJCXpbauJJRatWl6RdgiYH6g51yVCqniBNed4+zW9/qBxzqDFVQ1sO9dFTmfQI7MCHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAFGbE7N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAFGbE7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753099938; x=1784635938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6r3ZM1x5J3dct/sUwxTg/Cnm57CNoZ0yihnRWcK4S6U=;
  b=OAFGbE7N8vucYp1O0mtRdJU3GJJznrFYLtXmSjx56udT9nCaDzRbOYCT
   GCvKUC+LGHuvnenk9yS+v7sDi7tty91Kc3xOF/xiu1fIrBPIjOrM7+V3N
   BrKgts7Wu0a65EFn4rR0AuHGL/m6rjFRdVuJb5eNWiOKQ/xGmZXWNZGL4
   bf7ftQWlbwok1pLoMl7ENKeWgJz0qGqG9xXES2qiwl2nyM/XviLuaU2je
   5wILYG0KqsuWCbEZDi+avhipyzrxAG2tdXXkL7FcptOnMvOlauPoWIwOw
   LJ8PfVF2KtTGhcXY31+JlXvHjpcytf7YuCoQvAjpr9W3GfqpzrABlgc0+
   Q==;
X-CSE-ConnectionGUID: 6LV9jAr3TJifBaSG4ad0Jw==
X-CSE-MsgGUID: dMff7Ni5Tsq5Z7feexoMYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66660984"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="66660984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:12:17 -0700
X-CSE-ConnectionGUID: flC/F4g0RnCWO/0yx2r8ew==
X-CSE-MsgGUID: Zzc9o5gfSI6/W0H7EZgxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159373078"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jul 2025 05:12:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpNO-000Gmd-2q;
	Mon, 21 Jul 2025 12:12:14 +0000
Date: Mon, 21 Jul 2025 20:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11052/11398] security/apparmor/lsm.c:182:44:
 warning: variable 'rules' set but not used
Message-ID: <202507212021.dc1RGBxE-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20250721 (https://download.01.org/0day-ci/archive/20250721/202507212021.dc1RGBxE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507212021.dc1RGBxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507212021.dc1RGBxE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/lsm.c: In function 'apparmor_capget':
>> security/apparmor/lsm.c:182:44: warning: variable 'rules' set but not used [-Wunused-but-set-variable]
     182 |                         struct aa_ruleset *rules;
         |                                            ^~~~~


vim +/rules +182 security/apparmor/lsm.c

b5e95b48685e348 John Johansen   2010-07-29  161  
b5e95b48685e348 John Johansen   2010-07-29  162  /* Derived from security/commoncap.c:cap_capget */
6672efbb685f7c9 Khadija Kamran  2023-08-07  163  static int apparmor_capget(const struct task_struct *target, kernel_cap_t *effective,
b5e95b48685e348 John Johansen   2010-07-29  164  			   kernel_cap_t *inheritable, kernel_cap_t *permitted)
b5e95b48685e348 John Johansen   2010-07-29  165  {
637f688dc3dc304 John Johansen   2017-06-09  166  	struct aa_label *label;
b5e95b48685e348 John Johansen   2010-07-29  167  	const struct cred *cred;
b5e95b48685e348 John Johansen   2010-07-29  168  
b5e95b48685e348 John Johansen   2010-07-29  169  	rcu_read_lock();
b5e95b48685e348 John Johansen   2010-07-29  170  	cred = __task_cred(target);
637f688dc3dc304 John Johansen   2017-06-09  171  	label = aa_get_newest_cred_label(cred);
c70c86c421427fd John Johansen   2017-06-09  172  
b1d9e6b0646d0e5 Casey Schaufler 2015-05-02  173  	/*
b1d9e6b0646d0e5 Casey Schaufler 2015-05-02  174  	 * cap_capget is stacked ahead of this and will
b1d9e6b0646d0e5 Casey Schaufler 2015-05-02  175  	 * initialize effective and permitted.
b1d9e6b0646d0e5 Casey Schaufler 2015-05-02  176  	 */
c70c86c421427fd John Johansen   2017-06-09  177  	if (!unconfined(label)) {
c70c86c421427fd John Johansen   2017-06-09  178  		struct aa_profile *profile;
c70c86c421427fd John Johansen   2017-06-09  179  		struct label_it i;
c70c86c421427fd John Johansen   2017-06-09  180  
c70c86c421427fd John Johansen   2017-06-09  181  		label_for_each_confined(i, label, profile) {
1ad22fcc4d0d2fb John Johansen   2022-09-05 @182  			struct aa_ruleset *rules;
ce9e3b3fa25a239 John Johansen   2024-01-04  183  			kernel_cap_t allowed;
ce9e3b3fa25a239 John Johansen   2024-01-04  184  
9afdc6abb007d5a John Johansen   2025-02-17  185  			rules = profile->label.rules[0];
ce9e3b3fa25a239 John Johansen   2024-01-04  186  			allowed = aa_profile_capget(profile);
ce9e3b3fa25a239 John Johansen   2024-01-04  187  			*effective = cap_intersect(*effective, allowed);
ce9e3b3fa25a239 John Johansen   2024-01-04  188  			*permitted = cap_intersect(*permitted, allowed);
c70c86c421427fd John Johansen   2017-06-09  189  		}
b5e95b48685e348 John Johansen   2010-07-29  190  	}
b5e95b48685e348 John Johansen   2010-07-29  191  	rcu_read_unlock();
637f688dc3dc304 John Johansen   2017-06-09  192  	aa_put_label(label);
b5e95b48685e348 John Johansen   2010-07-29  193  
b5e95b48685e348 John Johansen   2010-07-29  194  	return 0;
b5e95b48685e348 John Johansen   2010-07-29  195  }
b5e95b48685e348 John Johansen   2010-07-29  196  

:::::: The code at line 182 was first introduced by commit
:::::: 1ad22fcc4d0d2fb2e0f35aed555a86d016d5e590 apparmor: rework profile->rules to be a list

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
