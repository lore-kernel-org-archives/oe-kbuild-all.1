Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741023D7FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766397209; cv=none; b=ObYJ0Rwc3zNvEBqd4RRhtNI8kQZ9ALmfWYhvt1LHIBKDwJ7HzmC/erEzPbCMLBJ7SF8imjdybVDFzZVl6ra4axtqSiNjZL8GJ9wjTWMd/m0OozvI0JHmtQ2gYOy6XAj/hyC73doD+Fl4VW8eWd8CT8eF63G0xozeZfbGiPU+0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766397209; c=relaxed/simple;
	bh=b6SIH68Sc+FZp4v7g6P4gwyZOEur1hiiI9l7jaFnX08=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R2bmMbyCJ70ZaiGOCNoVzAt9TYevIjuMSshCrRK7V9I9A3Mgqw9oD6Du7zl8XIhNvfmyuXXBafTow63ystM/mhaVf3Sgy5KY1S6wjipZoR+DsTH+hF1mKf1F+ljv35lORhBhxE2+DUlbAjkZ2c3omkeq8xuTGJjNXJa4EmYm2XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bl7uSDuN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bl7uSDuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766397207; x=1797933207;
  h=date:from:to:cc:subject:message-id;
  bh=b6SIH68Sc+FZp4v7g6P4gwyZOEur1hiiI9l7jaFnX08=;
  b=bl7uSDuNIv+1Npro4XhZTmCW/CIEqxLuJ+pUzd1cKrKX4ULTRD7GrqTu
   k3fJJ8pWyR/mEecm5kFi3wS4G9T1FiImIx0012ImpVlqv4gNLIL354ZZD
   eD79B1f9g5B0Ve4QNtd+jcNgqkqPaNXgurn8uMs/x1b9wQuZL6kmNeea0
   s6bOk3Xg9/FdQDQ85Bp1NpkjaovoN5ruhqeGramCHK4s9+4NHlck97Esc
   1Ld1kN63lgPNLpT1PAcIqwFwK2nzD4TWvKmAX/9c+D/8xueBRcQ11hp3m
   q+LXIATPMQezpvw4fsmH1K1rrE21PscUqjDcaHhd1wcDQB3IkydVGt70C
   g==;
X-CSE-ConnectionGUID: b/BEHSlsQdK9Z76paxGlUQ==
X-CSE-MsgGUID: 8edeuN08RS+owRaox/WozQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72111725"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72111725"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:53:26 -0800
X-CSE-ConnectionGUID: 13DgYKPeQ+u9kwiN/6UUkQ==
X-CSE-MsgGUID: i4gGX5OJS3qYX3eLhPnLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="200376690"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 01:53:23 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXcao-000000000LZ-2i19;
	Mon, 22 Dec 2025 09:52:58 +0000
Date: Mon, 22 Dec 2025 17:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 security/apparmor/capability.c:154: warning: Function parameter or member
 'subj_cred' not described in 'aa_capable'
Message-ID: <202512221746.st75QlIw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ed6006fe58ea42e07515e5ba526df366cdcc9fef
commit: 690f33e1edf5cd996b54094409de0067ae3fa216 [2/2] apparmor: pass cred through to audit info.
config: x86_64-randconfig-103-20251213 (https://download.01.org/0day-ci/archive/20251222/202512221746.st75QlIw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221746.st75QlIw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221746.st75QlIw-lkp@intel.com/

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
