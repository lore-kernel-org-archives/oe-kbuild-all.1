Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348702F5321
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765667614; cv=none; b=cHwyT4aPh1QJunMY/DJNp6B8JcYkhkPeSqZTUnSfpPvQluhyWOdNzFte1s2JyXVK3vnJWnjsxZkkzDeLRk06V/Kxd2u7+27m3CLTYPEesMa1R9cO75eQEbAI7kiZ4kAqvaKgGjPcJTQ6I673XnJm+dByXWYsWaTA1dOnllM2Jtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765667614; c=relaxed/simple;
	bh=E4tTeE8x9kSeNq2ywVHSa+Zw8UXBgJJ+SkPswaFwGhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUIb1UNi2v7CcKIw5snraMhdW7fHmSanh8rdJeLJWeNHByHHc4MzRJv2Q32LZah6j6x2NrHOsE54Sd3LQVk9y5jh38VBWglJsl947DJKZ1Kindc+Sv5st7qlKuh8JUQH/jXSS7kL26fmiUaf7f95ofAHkcEN2EI4hk31NtoM+nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7XTn5Zl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7XTn5Zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765667612; x=1797203612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4tTeE8x9kSeNq2ywVHSa+Zw8UXBgJJ+SkPswaFwGhM=;
  b=L7XTn5ZlD6LHQ4spaqaPCi3JlLZz6jhtZOdIoiJ8TR+vtLlzL5/HyaFK
   M7YTwPjP7eORXEUAxsZaqQUTsCOcgBQbjdoY5v+ij0ZtSpGVusf7hA1zU
   bpS/srGmANXHlYFRmJEgIGAZWoS0O6nx9oQU5x2PqkAUssRuYVr1RwfQB
   gS8wKR7QMjU+oU7j7wa/oJ16e2gGyKNvCIGzuX/DYyT3WudbRYYcmpgG2
   QtfZ9ZXaqQYgEPLHVKKu9an2/5+H+Hwvtm0alCLaZmCystpSv0le3vPLr
   x0/oUsX2OcqbeAcFOkIsmp9g93pw34FKx490f1a5BSm+6l3vJFXUN8UW9
   w==;
X-CSE-ConnectionGUID: 57LFwv1bRHe62cqYbFmszg==
X-CSE-MsgGUID: 3ZwRUbelTY+JjDwv55uw7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67664756"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67664756"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:13:28 -0800
X-CSE-ConnectionGUID: u/yu6hJrTJGCKaaDATF3Kg==
X-CSE-MsgGUID: a7l4OaavSKy6Bzmd40lU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220773906"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 15:13:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYnk-000000008Id-40LT;
	Sat, 13 Dec 2025 23:13:24 +0000
Date: Sun, 14 Dec 2025 07:12:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 security/apparmor/capability.c:154: warning: Function parameter or member
 'subj_cred' not described in 'aa_capable'
Message-ID: <202512140736.BUOo9kWs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 690f33e1edf5cd996b54094409de0067ae3fa216 [2/2] apparmor: pass cred through to audit info.
config: x86_64-randconfig-103-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140736.BUOo9kWs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140736.BUOo9kWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140736.BUOo9kWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/capability.c:45: warning: Function parameter or member 'ab' not described in 'audit_cb'
   security/apparmor/capability.c:45: warning: Function parameter or member 'va' not described in 'audit_cb'
   security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
   security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'
>> security/apparmor/capability.c:154: warning: Function parameter or member 'subj_cred' not described in 'aa_capable'
>> security/apparmor/capability.c:154: warning: Excess function parameter 'subj_cread' description in 'aa_capable'
--
>> security/apparmor/task.c:293: warning: Function parameter or member 'tracer_cred' not described in 'aa_may_ptrace'
>> security/apparmor/task.c:293: warning: Function parameter or member 'tracee_cred' not described in 'aa_may_ptrace'
--
>> security/apparmor/policy.c:859: warning: Function parameter or member 'subj_cred' not described in 'aa_may_manage_policy'
--
>> security/apparmor/domain.c:46: warning: Function parameter or member 'to_cred' not described in 'may_change_ptraced_domain'
>> security/apparmor/domain.c:46: warning: Excess function parameter 'cred' description in 'may_change_ptraced_domain'
   security/apparmor/domain.c:286: warning: Function parameter or member 'perms' not described in 'change_profile_perms'
   security/apparmor/domain.c:387: warning: Function parameter or member 'bprm' not described in 'find_attach'
   security/apparmor/domain.c:387: warning: Function parameter or member 'head' not described in 'find_attach'
   security/apparmor/domain.c:387: warning: Function parameter or member 'name' not described in 'find_attach'
   security/apparmor/domain.c:387: warning: Function parameter or member 'info' not described in 'find_attach'
   security/apparmor/domain.c:565: warning: Function parameter or member 'info' not described in 'x_to_label'


vim +154 security/apparmor/capability.c

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
0ed3b28ab8bf46 John Johansen 2010-07-29   66  {
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
0ed3b28ab8bf46 John Johansen 2010-07-29  107  /**
0ed3b28ab8bf46 John Johansen 2010-07-29  108   * profile_capable - test if profile allows use of capability @cap
0ed3b28ab8bf46 John Johansen 2010-07-29  109   * @profile: profile being enforced    (NOT NULL, NOT unconfined)
0ed3b28ab8bf46 John Johansen 2010-07-29  110   * @cap: capability to test if allowed
c1a85a00ea66cb Micah Morton  2019-01-07  111   * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
c57bc80f4508ac John Johansen 2022-09-14  112   * @ad: audit data (MAY BE NULL indicating no auditing)
0ed3b28ab8bf46 John Johansen 2010-07-29  113   *
0ed3b28ab8bf46 John Johansen 2010-07-29  114   * Returns: 0 if allowed else -EPERM
0ed3b28ab8bf46 John Johansen 2010-07-29  115   */
c1a85a00ea66cb Micah Morton  2019-01-07  116  static int profile_capable(struct aa_profile *profile, int cap,
c57bc80f4508ac John Johansen 2022-09-14  117  			   unsigned int opts, struct apparmor_audit_data *ad)
0ed3b28ab8bf46 John Johansen 2010-07-29  118  {
1ad22fcc4d0d2f John Johansen 2022-09-05  119  	struct aa_ruleset *rules = list_first_entry(&profile->rules,
1ad22fcc4d0d2f John Johansen 2022-09-05  120  						    typeof(*rules), list);
c70c86c421427f John Johansen 2017-06-09  121  	int error;
c70c86c421427f John Johansen 2017-06-09  122  
217af7e2f4deb6 John Johansen 2022-07-29  123  	if (cap_raised(rules->caps.allow, cap) &&
217af7e2f4deb6 John Johansen 2022-07-29  124  	    !cap_raised(rules->caps.denied, cap))
c70c86c421427f John Johansen 2017-06-09  125  		error = 0;
c70c86c421427f John Johansen 2017-06-09  126  	else
c70c86c421427f John Johansen 2017-06-09  127  		error = -EPERM;
c70c86c421427f John Johansen 2017-06-09  128  
c1a85a00ea66cb Micah Morton  2019-01-07  129  	if (opts & CAP_OPT_NOAUDIT) {
c70c86c421427f John Johansen 2017-06-09  130  		if (!COMPLAIN_MODE(profile))
c70c86c421427f John Johansen 2017-06-09  131  			return error;
c70c86c421427f John Johansen 2017-06-09  132  		/* audit the cap request in complain mode but note that it
c70c86c421427f John Johansen 2017-06-09  133  		 * should be optional.
c70c86c421427f John Johansen 2017-06-09  134  		 */
c57bc80f4508ac John Johansen 2022-09-14  135  		ad->info = "optional: no audit";
c70c86c421427f John Johansen 2017-06-09  136  	}
c70c86c421427f John Johansen 2017-06-09  137  
c57bc80f4508ac John Johansen 2022-09-14  138  	return audit_caps(ad, profile, cap, error);
0ed3b28ab8bf46 John Johansen 2010-07-29  139  }
0ed3b28ab8bf46 John Johansen 2010-07-29  140  
0ed3b28ab8bf46 John Johansen 2010-07-29  141  /**
0ed3b28ab8bf46 John Johansen 2010-07-29  142   * aa_capable - test permission to use capability
690f33e1edf5cd John Johansen 2022-09-19  143   * @subj_cread: cred we are testing capability against
c70c86c421427f John Johansen 2017-06-09  144   * @label: label being tested for capability (NOT NULL)
0ed3b28ab8bf46 John Johansen 2010-07-29  145   * @cap: capability to be tested
c1a85a00ea66cb Micah Morton  2019-01-07  146   * @opts: CAP_OPT_NOAUDIT bit determines whether audit record is generated
0ed3b28ab8bf46 John Johansen 2010-07-29  147   *
0ed3b28ab8bf46 John Johansen 2010-07-29  148   * Look up capability in profile capability set.
0ed3b28ab8bf46 John Johansen 2010-07-29  149   *
0ed3b28ab8bf46 John Johansen 2010-07-29  150   * Returns: 0 on success, or else an error code.
0ed3b28ab8bf46 John Johansen 2010-07-29  151   */
690f33e1edf5cd John Johansen 2022-09-19  152  int aa_capable(const struct cred *subj_cred, struct aa_label *label,
690f33e1edf5cd John Johansen 2022-09-19  153  	       int cap, unsigned int opts)
0ed3b28ab8bf46 John Johansen 2010-07-29 @154  {

:::::: The code at line 154 was first introduced by commit
:::::: 0ed3b28ab8bf460a3a026f3f1782bf4c53840184 AppArmor: mediation of non file objects

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
