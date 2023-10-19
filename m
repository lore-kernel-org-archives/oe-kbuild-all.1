Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706332C6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nu9ehh8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697737999; x=1729273999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+NIsDDtmyvoxb1xMjBdxhdq4OMiy5IZOfNl1NsThl0E=;
  b=nu9ehh8wYcOYMinaNc0ghrM0jbvhtxmQG+1oNpG8P0xmtSDPyX/RxC+S
   gnn6l4P+4TjSA28FjW3mwaMjTXi5K/yhxrAVnTOxkQtBn9CFrHetyY437
   iNnkXg/Z2qj5tgVhDFPFAZQC4q2VTLtJTuL1KPT0SP4gzOzTDvkwqaL6C
   wn+vV1uJVajMpIfXKYUPt1gHwfuzY43d7tR+DzhYasBJMJImE1boOjay8
   HCTJKOXLdZty7dFv1TnmCFBuJwZQDbnj5YrYugLEKOtg3+7fv7117DNUG
   FvebVTtRAHDa9TYQ1CmzWRpyD1uW2DopAuk+3WzgqjSazkpbEDLIUPhcR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="383539689"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="383539689"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 10:53:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847782806"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="847782806"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2023 10:53:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtXCt-0002Iw-0u;
	Thu, 19 Oct 2023 17:53:15 +0000
Date: Fri, 20 Oct 2023 01:52:37 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 27/35] security/apparmor/task.c:290:
 warning: Function parameter or member 'tracer_cred' not described in
 'aa_may_ptrace'
Message-ID: <202310200156.X4t6sEG8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   157a3537d6bc28ceb9a11fc8cb67f2152d860146
commit: 90c436a64a6e20482a9a613c47eb4af2e8a5328e [27/35] apparmor: pass cred through to audit info.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310200156.X4t6sEG8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200156.X4t6sEG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200156.X4t6sEG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/task.c:290: warning: Function parameter or member 'tracer_cred' not described in 'aa_may_ptrace'
>> security/apparmor/task.c:290: warning: Function parameter or member 'tracee_cred' not described in 'aa_may_ptrace'
--
   security/apparmor/capability.c:66: warning: Function parameter or member 'ad' not described in 'audit_caps'
   security/apparmor/capability.c:66: warning: Excess function parameter 'as' description in 'audit_caps'
>> security/apparmor/capability.c:154: warning: Function parameter or member 'subj_cred' not described in 'aa_capable'
>> security/apparmor/capability.c:154: warning: Excess function parameter 'subj_cread' description in 'aa_capable'
--
>> security/apparmor/policy.c:859: warning: Function parameter or member 'subj_cred' not described in 'aa_may_manage_policy'
--
>> security/apparmor/domain.c:46: warning: Function parameter or member 'to_cred' not described in 'may_change_ptraced_domain'
>> security/apparmor/domain.c:46: warning: Excess function parameter 'cred' description in 'may_change_ptraced_domain'


vim +290 security/apparmor/task.c

eac931254d99c5 John Johansen 2021-11-22  278  
eac931254d99c5 John Johansen 2021-11-22  279  /**
eac931254d99c5 John Johansen 2021-11-22  280   * aa_may_ptrace - test if tracer task can trace the tracee
eac931254d99c5 John Johansen 2021-11-22  281   * @tracer: label of the task doing the tracing  (NOT NULL)
eac931254d99c5 John Johansen 2021-11-22  282   * @tracee: task label to be traced
eac931254d99c5 John Johansen 2021-11-22  283   * @request: permission request
eac931254d99c5 John Johansen 2021-11-22  284   *
eac931254d99c5 John Johansen 2021-11-22  285   * Returns: %0 else error code if permission denied or error
eac931254d99c5 John Johansen 2021-11-22  286   */
90c436a64a6e20 John Johansen 2022-09-19  287  int aa_may_ptrace(const struct cred *tracer_cred, struct aa_label *tracer,
90c436a64a6e20 John Johansen 2022-09-19  288  		  const struct cred *tracee_cred, struct aa_label *tracee,
eac931254d99c5 John Johansen 2021-11-22  289  		  u32 request)
eac931254d99c5 John Johansen 2021-11-22 @290  {

:::::: The code at line 290 was first introduced by commit
:::::: eac931254d99c5aeb12ace02366dd338c4371164 apparmor: move ptrace mediation to more logical task.{h,c}

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
