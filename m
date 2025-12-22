Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355CE28CF49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387240; cv=none; b=pcrU8kQ8vwMf1g1n6/lOrNkO5WQ44/RObZXhYJ1lQ5Cw61QzMQNP3fYr7mGG4RqsCyh2Xca2NwBuoHGBi3Fz/Y6/Qwr1lCkIowIJUJ54miUhMvfG8LQwNx8oDoZfB5i+hNtm1qreLkvQqRoGA4jLikrNi+m1Ddv3URSB7dcNjPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387240; c=relaxed/simple;
	bh=NY5uReCKjX6Q++BT+YCdKA1tEg3VGSHaEjMV7GCG12Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TciGveuvz8nInJ0y7OMG6tcoBwn6A2i6vTcZ3LqFvfjNc+VQI0JWyNzVe13YmZipjK4NoyMHtO9CHfXu0nLxRPVSTymlOzbqTJLyCSPZXpzDTijOsykgzwlDaaEMamcQL6w/okLifYvUMh/nfCoVvycTnBwy1sYPeqWb1xRHOR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exc/xMA6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exc/xMA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387239; x=1797923239;
  h=date:from:to:cc:subject:message-id;
  bh=NY5uReCKjX6Q++BT+YCdKA1tEg3VGSHaEjMV7GCG12Y=;
  b=exc/xMA6n5GbslXeoQge+6wpCBFjGW0HV1qxBR9o3T+scqvodfA6a2qQ
   e/a8bAZwithvRKrSiHobRtNct1YtNci1O1k5TbeI8/6mqJMfMu4+xSfbB
   oDVuTFveoVc+6z1VVSF5h16uHLL+yoc+b/tu+jCNjPUEEXuxCj/mkTmpz
   P36D8gqbJWtQab9Fp1RVBj9EhVlmq+PPqTO/hi2iBvv5yT85GECe4pcz7
   CiiOCG2yHWr7NYMpzMm3RCMumFHCmeWR1QUC0UgjaVaOAcqLpk9qIqkdR
   KJ1hbTJDWPk93OfccphhqzmpVkK6CbFLxXAjS/gVoeMsxw1/io6vJHTia
   Q==;
X-CSE-ConnectionGUID: DnJ+kZUgQY2Vk1e85b0xQA==
X-CSE-MsgGUID: fF6jwtRsT0qu6RIPrA2tGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85824982"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85824982"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:07:18 -0800
X-CSE-ConnectionGUID: txaTE94JTBuL51m0COUTNw==
X-CSE-MsgGUID: SPXzdXjnRhGC6kR7IzLFdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199098967"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 23:07:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXa0d-000000000Bf-2i2u;
	Mon, 22 Dec 2025 07:07:12 +0000
Date: Mon, 22 Dec 2025 15:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 security/apparmor/capability.c:66: warning: Function parameter or member 'ad'
 not described in 'audit_caps'
Message-ID: <202512221453.jU22EMLm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   16aa689262af24cd0897f463b3d0dd9ecee6b37c
commit: c57bc80f4508acd8c52bd89b01d324889065320d [2/2] apparmor: combine common_audit_data and apparmor_audit_data
config: x86_64-randconfig-103-20251213 (https://download.01.org/0day-ci/archive/20251222/202512221453.jU22EMLm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221453.jU22EMLm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221453.jU22EMLm-lkp@intel.com/

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
