Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C019342F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754919609; cv=none; b=FwAxwOzSnL4vUVksiPIPiL0NrpOtsPyMxvIl/Vcm9rI+YbnZSDwyicEdtZt1iojo4Rd8MGSHmhcQtEBY1fikd/iw7XfHb/ZE4oroWArMeET7UEMcN4hueLaAPoN7ZGJaGfUl4S6XqLyaN6cUFYWT1Bp1UZhRGMPseQF6XWs+mQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754919609; c=relaxed/simple;
	bh=j+2ziKxfZjTh9GLlYiHqSLkNMLwMsAuaLQE6t6cx+hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENA4sloVVXWqbBvX3wMSr1inz53UQufeYu55+iCn3Fkw3a169uiZ7HHc2d8x73A0u0wjcJaUzP6ePD3EMqVJwP5FZF2WlU63V+fWwHTavxJtLBrz4+LGture7llq1lre47YuJxVCeBPofC0Pl6Z0PlYMwXAf3VyUvnf3D3Du1Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVSpFEao; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVSpFEao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754919608; x=1786455608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+2ziKxfZjTh9GLlYiHqSLkNMLwMsAuaLQE6t6cx+hk=;
  b=AVSpFEaoI64sykiuMR3HvlcD9Ye4FekEK6M95oU5tOehkBKd9i0cKneY
   8gmNXCQ0wxzmyW0wYW6uni9ss4mj3u0y1QoSv9X5OdbYWJoTva8YsCgOO
   RDMUyP6s2Z0G6X947fgZKaUhRGW7eyTz2VJqxCHHRWZyq1kbbrt0Qmmhs
   8Lsgnh8ZnFRGJINGAu/MaIKcMczPDD+jPGuQHtK5XrXgPas+83RcvJtgr
   JKku3LJ8TTpU+NL8aIMs24Hq/WdPYgZOyGJkprX/EjR2NjHzkDd0pSGrk
   +9vUB581QxfRUyCYamHhtOaiuuA6toMx/tqfei2CcOiF5RRNw/JQI0gz7
   g==;
X-CSE-ConnectionGUID: 9lflcZcYSMWjDKbV/AgHRw==
X-CSE-MsgGUID: NzA8uWw5QeCZ7bXWWiLbiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79742976"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="79742976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 06:40:07 -0700
X-CSE-ConnectionGUID: DTyDXshmR4+VkxulMzQm0A==
X-CSE-MsgGUID: kn2y/oD4SkmWH3PDXoUEcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165161940"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2025 06:40:06 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulSkt-00034V-0n;
	Mon, 11 Aug 2025 13:40:03 +0000
Date: Mon, 11 Aug 2025 15:39:37 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 security/apparmor/capability.c:66: warning: Function parameter or member
 'ad' not described in 'audit_caps'
Message-ID: <202508111519.1bTrYBmh-lkp@intel.com>
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
head:   f66b79911ed8ccb29c3129f3b35fbb418395f189
commit: c57bc80f4508acd8c52bd89b01d324889065320d [0/1] apparmor: combine common_audit_data and apparmor_audit_data
config: i386-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111519.1bTrYBmh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111519.1bTrYBmh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111519.1bTrYBmh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/capability.c:45: warning: Function parameter or member 'ab' not described in 'audit_cb'
   security/apparmor/capability.c:45: warning: Function parameter or member 'va' not described in 'audit_cb'
>> security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
>> security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'


vim +66 security/apparmor/capability.c

0ed3b28ab8bf46 John Johansen 2010-07-29   38  
0ed3b28ab8bf46 John Johansen 2010-07-29   39  /**
0ed3b28ab8bf46 John Johansen 2010-07-29   40   * audit_cb - call back for capability components of audit struct
0ed3b28ab8bf46 John Johansen 2010-07-29   41   * @ab - audit buffer   (NOT NULL)
0ed3b28ab8bf46 John Johansen 2010-07-29   42   * @va - audit struct to audit data from  (NOT NULL)
0ed3b28ab8bf46 John Johansen 2010-07-29   43   */
0ed3b28ab8bf46 John Johansen 2010-07-29   44  static void audit_cb(struct audit_buffer *ab, void *va)
0ed3b28ab8bf46 John Johansen 2010-07-29  @45  {
0ed3b28ab8bf46 John Johansen 2010-07-29   46  	struct common_audit_data *sa = va;
c70c86c421427f John Johansen 2017-06-09   47  
0ed3b28ab8bf46 John Johansen 2010-07-29   48  	audit_log_format(ab, " capname=");
0ed3b28ab8bf46 John Johansen 2010-07-29   49  	audit_log_untrustedstring(ab, capability_names[sa->u.cap]);
0ed3b28ab8bf46 John Johansen 2010-07-29   50  }
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
