Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F151A9F82
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927538; cv=none; b=A/SKTfL1PAeEGX6WZ5SmOm6YKG9+OAfCq7qm76TPD1eaV5I/4PQVNjW4pK2xrkxQnWacl7DkjpTgc+zdHAbSgFl23OnIpv889bbm/EZm04f0BaJP6C77lqiqOIcQiVY+7sATcJV7Vq6sdlWvBsSUPn+mBwM8iNnK0jb1wN5isBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927538; c=relaxed/simple;
	bh=VY/kbCtztgx6sA9cKzQmVzJDFKcD+GZ+ZWZGU31s8wg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rk4bvcHyWHC5ZnHbb1Q7U0OJVN/xxiDkGydYeP7nPnD0h/kGosTXTHUCmjvJ7ZxZ4EYRrfBL7YrSu+BmYng+AzRincbXH9o0GPZ8QXi0qC3a89PntbFg1RtxIaVe1bJ+vlSnn6SVqqRk0/yp2MdzrFYqhlqMSmMqmIy6mko+3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9i4kY4Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9i4kY4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754927537; x=1786463537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VY/kbCtztgx6sA9cKzQmVzJDFKcD+GZ+ZWZGU31s8wg=;
  b=b9i4kY4Y02xMQIPLDtq19/a368DsaJJciPAbJB85TIJdfdNMGC7tuqOV
   ETj22IT2U9DxvcLIQvyDjNt/hgiNpzURe4BxlAcxQc8ChARSNJNErSFGC
   jL728thQZvPPEdmB9s1EYbNfxEzdiAOhyqBArxGe59uU+CHobadFKBa40
   lv6CsnQ6OGNctoTsaz5YwYmu4cmzR0K9H3Y09Js7yI1E55owY7ix8JHTr
   Eh6sWGGteF+g3sZAlsADL2ZNOAdHZYOlMfK1yYz+a3uB2/g29ioE2ojB+
   BV0lyTCPI7L9EeZg+GcO+1VbEeTSdsdiESuwhnuW3RYfexoS88z1Nmz1S
   Q==;
X-CSE-ConnectionGUID: wfYcMhpOTk+GewpkHV2Bdg==
X-CSE-MsgGUID: n8CWAgxDQkSmqCKLdZD8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67892753"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67892753"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 08:52:14 -0700
X-CSE-ConnectionGUID: GBLgcmPgSsGt9fNHWJJ8gA==
X-CSE-MsgGUID: BHsErBlZSnC02Qw6bgrkAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165444180"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2025 08:52:12 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulUok-000359-2O;
	Mon, 11 Aug 2025 15:52:10 +0000
Date: Mon, 11 Aug 2025 17:51:58 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] security/apparmor/task.c:293:
 warning: Function parameter or member 'tracer_cred' not described in
 'aa_may_ptrace'
Message-ID: <202508111741.uw0psqQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3b6fab0ff24f7108c71a4d9c12567455cb2a5a81
commit: 690f33e1edf5cd996b54094409de0067ae3fa216 [0/1] apparmor: pass cred through to audit info.
config: i386-buildonly-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111741.uw0psqQa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111741.uw0psqQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111741.uw0psqQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
--
   security/apparmor/capability.c:45: warning: Function parameter or member 'ab' not described in 'audit_cb'
   security/apparmor/capability.c:45: warning: Function parameter or member 'va' not described in 'audit_cb'
   security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
   security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'
>> security/apparmor/capability.c:154: warning: Function parameter or member 'subj_cred' not described in 'aa_capable'
>> security/apparmor/capability.c:154: warning: Excess function parameter 'subj_cread' description in 'aa_capable'


vim +293 security/apparmor/task.c

eac931254d99c5 John Johansen 2021-11-22  281  
eac931254d99c5 John Johansen 2021-11-22  282  /**
eac931254d99c5 John Johansen 2021-11-22  283   * aa_may_ptrace - test if tracer task can trace the tracee
eac931254d99c5 John Johansen 2021-11-22  284   * @tracer: label of the task doing the tracing  (NOT NULL)
eac931254d99c5 John Johansen 2021-11-22  285   * @tracee: task label to be traced
eac931254d99c5 John Johansen 2021-11-22  286   * @request: permission request
eac931254d99c5 John Johansen 2021-11-22  287   *
eac931254d99c5 John Johansen 2021-11-22  288   * Returns: %0 else error code if permission denied or error
eac931254d99c5 John Johansen 2021-11-22  289   */
690f33e1edf5cd John Johansen 2022-09-19  290  int aa_may_ptrace(const struct cred *tracer_cred, struct aa_label *tracer,
690f33e1edf5cd John Johansen 2022-09-19  291  		  const struct cred *tracee_cred, struct aa_label *tracee,
eac931254d99c5 John Johansen 2021-11-22  292  		  u32 request)
eac931254d99c5 John Johansen 2021-11-22 @293  {

:::::: The code at line 293 was first introduced by commit
:::::: eac931254d99c5aeb12ace02366dd338c4371164 apparmor: move ptrace mediation to more logical task.{h,c}

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
