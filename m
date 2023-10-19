Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43F29CE6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8GwdOLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697734161; x=1729270161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJVnJ2n8WuyfAWTHasGi4GWz9kia3drtOBgIcs5OyMU=;
  b=g8GwdOLHfSCP/3PqLDIT5GkrT6uT/jr6Bk2+naYJcTa3bivK7Ee+XA8F
   akebObAZY7xzGgGCrsDg6vBoOPjjGPRjgpRlZKYveEsItRB52OOY5NQun
   Hl3OYRMVOv/Ee5FoSr2zYkGlkae2wiMfUUKcQ5Mhz1+6FIyvjrUrK1SCw
   qtQqX/fVcX7xuRJ/XwzxPUhykPodzAEaY/2tcFDl/GXnS6VD7LeSshVBk
   RnNtFsi4YKzMQTUJdAjzf79m56owCvqTCCr0A3FzzHUETanvpG5gt3kil
   J3wF/aL5OgLufbtEo541RCQGWoZPUTo5qw2d2Q6dREz16+Pq71ThmayeH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386128372"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="386128372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 09:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4815072"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2023 09:48:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtWCv-0002Gi-39;
	Thu, 19 Oct 2023 16:49:13 +0000
Date: Fri, 20 Oct 2023 00:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 25/35] security/apparmor/capability.c:66:
 warning: Function parameter or member 'ad' not described in 'audit_caps'
Message-ID: <202310200045.Rco4bTN5-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   157a3537d6bc28ceb9a11fc8cb67f2152d860146
commit: bd7bd201ca46c211c3ab251ca9854787d1331a2f [25/35] apparmor: combine common_audit_data and apparmor_audit_data
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200045.Rco4bTN5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200045.Rco4bTN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200045.Rco4bTN5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
>> security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'


vim +66 security/apparmor/capability.c

0ed3b28ab8bf46 John Johansen 2010-07-29   51  
0ed3b28ab8bf46 John Johansen 2010-07-29   52  /**
0ed3b28ab8bf46 John Johansen 2010-07-29   53   * audit_caps - audit a capability
bd7bd201ca46c2 John Johansen 2022-09-14   54   * @as: audit data
dd0c6e86f66080 John Johansen 2013-10-08   55   * @profile: profile being tested for confinement (NOT NULL)
0ed3b28ab8bf46 John Johansen 2010-07-29   56   * @cap: capability tested
0ed3b28ab8bf46 John Johansen 2010-07-29   57   * @error: error code returned by test
0ed3b28ab8bf46 John Johansen 2010-07-29   58   *
0ed3b28ab8bf46 John Johansen 2010-07-29   59   * Do auditing of capability and handle, audit/complain/kill modes switching
0ed3b28ab8bf46 John Johansen 2010-07-29   60   * and duplicate message elimination.
0ed3b28ab8bf46 John Johansen 2010-07-29   61   *
bd7bd201ca46c2 John Johansen 2022-09-14   62   * Returns: 0 or ad->error on success,  error code on failure
0ed3b28ab8bf46 John Johansen 2010-07-29   63   */
bd7bd201ca46c2 John Johansen 2022-09-14   64  static int audit_caps(struct apparmor_audit_data *ad, struct aa_profile *profile,
c70c86c421427f John Johansen 2017-06-09   65  		      int cap, int error)
0ed3b28ab8bf46 John Johansen 2010-07-29  @66  {
1ad22fcc4d0d2f John Johansen 2022-09-05   67  	struct aa_ruleset *rules = list_first_entry(&profile->rules,
1ad22fcc4d0d2f John Johansen 2022-09-05   68  						    typeof(*rules), list);
0ed3b28ab8bf46 John Johansen 2010-07-29   69  	struct audit_cache *ent;
0ed3b28ab8bf46 John Johansen 2010-07-29   70  	int type = AUDIT_APPARMOR_AUTO;
c70c86c421427f John Johansen 2017-06-09   71  
bd7bd201ca46c2 John Johansen 2022-09-14   72  	ad->error = error;
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
bd7bd201ca46c2 John Johansen 2022-09-14  104  	return aa_audit(type, profile, ad, audit_cb);
0ed3b28ab8bf46 John Johansen 2010-07-29  105  }
0ed3b28ab8bf46 John Johansen 2010-07-29  106  

:::::: The code at line 66 was first introduced by commit
:::::: 0ed3b28ab8bf460a3a026f3f1782bf4c53840184 AppArmor: mediation of non file objects

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
