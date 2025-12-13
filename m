Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D7219E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656982; cv=none; b=C7zD0pk2plAwblrVUtoPG8YkhWDHcV/CUjeeqKN2csjLn1ApJDXeBcDVYTb+fQobgRPSEIEis+6NrLF/H5lF6ogvKq6XG4bk7jyzna7y54cRF7wfR0NMSvOEKotUis07oyHZLG8MHGb4qZzOHpuWL7OzNpGOsty1/NWhwipz4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656982; c=relaxed/simple;
	bh=RsfgyQ8WMaNUKhIwPf/htsUIbZFTw2pU2VSKSRu2aDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hRU2UWUDQYkBDzU5kyiZh/zc/bV981dipx+IPdoX9VsAcW6JMow5QfWAiqF8fPrsoaEra3heQX0GZHQWSiNThDZBgZyv3V9/Ed2dSklyiJXAmSJX9TVcWiSEpWmCJQBCrxRidwZKJxckcmGRIJdDID2bb7cNbGFMtBzAngYfqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gtPZYW2J; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gtPZYW2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765656980; x=1797192980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RsfgyQ8WMaNUKhIwPf/htsUIbZFTw2pU2VSKSRu2aDw=;
  b=gtPZYW2J/RCGXYmZgyBZy/dyPS+vBJPYW1qrrRieMbKtXkUAm6kyK3hk
   DhZ5o1UTYUwc/76id10Zwv6dAw+126tPZ2AkG9wSGqLavKHbSLlcyRfCb
   4lyoVjOE72i4e/AjrMLKDgDcZZ8DfSVh8QkZfXYxctH721BUssKsP+EYt
   zyO+Sr8jVvGXqrLuXmQ2ekto8LvoyW7BvRKWBfmzxy1epbQQ7I/+CDh1+
   uMg4JPg/k1FrZgs2kkTuCxI05r1OMpjfyxUSGG2/nLVLw3ACcG1wMejpW
   XbSVHiNbVm2H7u+4OeNhWxsGHGBQX+lsUk2lWwwC8Fm9rFE3bTzMBXUHR
   A==;
X-CSE-ConnectionGUID: uk6HELO3QyuWrWMZ30f3Aw==
X-CSE-MsgGUID: c6nTqLT1SkCJq8c0lgMF3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78992079"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78992079"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:16:19 -0800
X-CSE-ConnectionGUID: Wv6tGbQhQWqCW5dTvZX/qA==
X-CSE-MsgGUID: H098IghyRCu6fbXrYHS7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196647519"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 12:16:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUW2K-0000000089v-2312;
	Sat, 13 Dec 2025 20:16:16 +0000
Date: Sun, 14 Dec 2025 04:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 security/apparmor/capability.c:66: warning: Function parameter or member
 'ad' not described in 'audit_caps'
Message-ID: <202512140418.RHe5a4pF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: c57bc80f4508acd8c52bd89b01d324889065320d [2/2] apparmor: combine common_audit_data and apparmor_audit_data
config: x86_64-randconfig-103-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140418.RHe5a4pF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140418.RHe5a4pF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140418.RHe5a4pF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/capability.c:45: warning: Function parameter or member 'ab' not described in 'audit_cb'
   security/apparmor/capability.c:45: warning: Function parameter or member 'va' not described in 'audit_cb'
>> security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
>> security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'


vim +66 security/apparmor/capability.c

0ed3b28ab8bf46 John Johansen 2010-07-29   51  
0ed3b28ab8bf46 John Johansen 2010-07-29   52  /**
0ed3b28ab8bf46 John Johansen 2010-07-29   53   * audit_caps - audit a capability
c57bc80f4508ac John Johansen 2022-09-14   54   * @as: audit data
dd0c6e86f66080 John Johansen 2013-10-08   55   * @profile: profile being tested for confinement (NOT NULL)
0ed3b28ab8bf46 John Johansen 2010-07-29   56   * @cap: capability tested
0ed3b28ab8bf46 John Johansen 2010-07-29   57   * @error: error code returned by test
0ed3b28ab8bf46 John Johansen 2010-07-29   58   *
0ed3b28ab8bf46 John Johansen 2010-07-29   59   * Do auditing of capability and handle, audit/complain/kill modes switching
0ed3b28ab8bf46 John Johansen 2010-07-29   60   * and duplicate message elimination.
0ed3b28ab8bf46 John Johansen 2010-07-29   61   *
c57bc80f4508ac John Johansen 2022-09-14   62   * Returns: 0 or ad->error on success,  error code on failure
0ed3b28ab8bf46 John Johansen 2010-07-29   63   */
c57bc80f4508ac John Johansen 2022-09-14   64  static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile,
c70c86c421427f John Johansen 2017-06-09   65  		      int cap, int error)
0ed3b28ab8bf46 John Johansen 2010-07-29  @66  {
1ad22fcc4d0d2f John Johansen 2022-09-05   67  	struct aa_ruleset *rules = list_first_entry(&profile->rules,
1ad22fcc4d0d2f John Johansen 2022-09-05   68  						    typeof(*rules), list);
0ed3b28ab8bf46 John Johansen 2010-07-29   69  	struct audit_cache *ent;
0ed3b28ab8bf46 John Johansen 2010-07-29   70  	int type = AUDIT_APPARMOR_AUTO;
c70c86c421427f John Johansen 2017-06-09   71  
c57bc80f4508ac John Johansen 2022-09-14   72  	ad->error = error;
0ed3b28ab8bf46 John Johansen 2010-07-29   73  
0ed3b28ab8bf46 John Johansen 2010-07-29   74  	if (likely(!error)) {
0ed3b28ab8bf46 John Johansen 2010-07-29   75  		/* test if auditing is being forced */
0ed3b28ab8bf46 John Johansen 2010-07-29   76  		if (likely((AUDIT_MODE(profile) != AUDIT_ALL) &&
217af7e2f4deb6 John Johansen 2022-07-29   77  			   !cap_raised(rules->caps.audit, cap)))
0ed3b28ab8bf46 John Johansen 2010-07-29   78  			return 0;
0ed3b28ab8bf46 John Johansen 2010-07-29   79  		type = AUDIT_APPARMOR_AUDIT;
0ed3b28ab8bf46 John Johansen 2010-07-29   80  	} else if (KILL_MODE(profile) ||
217af7e2f4deb6 John Johansen 2022-07-29   81  		   cap_raised(rules->caps.kill, cap)) {
0ed3b28ab8bf46 John Johansen 2010-07-29   82  		type = AUDIT_APPARMOR_KILL;
217af7e2f4deb6 John Johansen 2022-07-29   83  	} else if (cap_raised(rules->caps.quiet, cap) &&
0ed3b28ab8bf46 John Johansen 2010-07-29   84  		   AUDIT_MODE(profile) != AUDIT_NOQUIET &&
0ed3b28ab8bf46 John Johansen 2010-07-29   85  		   AUDIT_MODE(profile) != AUDIT_ALL) {
0ed3b28ab8bf46 John Johansen 2010-07-29   86  		/* quiet auditing */
0ed3b28ab8bf46 John Johansen 2010-07-29   87  		return error;
0ed3b28ab8bf46 John Johansen 2010-07-29   88  	}
0ed3b28ab8bf46 John Johansen 2010-07-29   89  
0ed3b28ab8bf46 John Johansen 2010-07-29   90  	/* Do simple duplicate message elimination */
0ed3b28ab8bf46 John Johansen 2010-07-29   91  	ent = &get_cpu_var(audit_cache);
0ed3b28ab8bf46 John Johansen 2010-07-29   92  	if (profile == ent->profile && cap_raised(ent->caps, cap)) {
0ed3b28ab8bf46 John Johansen 2010-07-29   93  		put_cpu_var(audit_cache);
0ed3b28ab8bf46 John Johansen 2010-07-29   94  		if (COMPLAIN_MODE(profile))
0ed3b28ab8bf46 John Johansen 2010-07-29   95  			return complain_error(error);
0ed3b28ab8bf46 John Johansen 2010-07-29   96  		return error;
0ed3b28ab8bf46 John Johansen 2010-07-29   97  	} else {
0ed3b28ab8bf46 John Johansen 2010-07-29   98  		aa_put_profile(ent->profile);
0ed3b28ab8bf46 John Johansen 2010-07-29   99  		ent->profile = aa_get_profile(profile);
0ed3b28ab8bf46 John Johansen 2010-07-29  100  		cap_raise(ent->caps, cap);
0ed3b28ab8bf46 John Johansen 2010-07-29  101  	}
0ed3b28ab8bf46 John Johansen 2010-07-29  102  	put_cpu_var(audit_cache);
0ed3b28ab8bf46 John Johansen 2010-07-29  103  
c57bc80f4508ac John Johansen 2022-09-14  104  	return aa_audit(type, profile, ad, audit_cb);
0ed3b28ab8bf46 John Johansen 2010-07-29  105  }
0ed3b28ab8bf46 John Johansen 2010-07-29  106  

:::::: The code at line 66 was first introduced by commit
:::::: 0ed3b28ab8bf460a3a026f3f1782bf4c53840184 AppArmor: mediation of non file objects

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
