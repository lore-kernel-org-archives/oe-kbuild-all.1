Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15E241EA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRbrxp7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699048861; x=1730584861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cwS3JKDa4hP3hoRLv+DbIRI3lugnTW+baL64q1eqxyw=;
  b=mRbrxp7VKUOXfUG+zq3K5mVMBPys8pBDKaAyLtopTHhtI2soiGrSw1sn
   JP5BZYtLFvG83ljpeUzXDMTwDq1sHMzbwYb3m5ifis2tR4Up1MqazFy34
   fDVDz0N7tmc84+VDqUr5MiKHhakX4UMPc4uIWA8nCQvgDqfGZY3v0rvM8
   p2CyiyzKN6lLhYrJyDnsQ0dmxIJ107geyst8/NCLYkMRBzSoqe7QXBzTx
   oJD/X4YWCvI6pc4ot0fIxe8L8vIXWpcbt48TBrOasm2eDmrvpk/Qopcyw
   EQYXVmjymOH3XCldVN/6BRu+wnc+ZLcbnk2JPu0ziawqDVd3LLCqcZl1U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387918181"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="387918181"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765385308"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="765385308"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 15:00:57 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2Dn-0002z0-0X;
	Fri, 03 Nov 2023 22:00:55 +0000
Date: Sat, 4 Nov 2023 05:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Georgia Garcia <georgia.garcia@canonical.com>
Subject: security/apparmor/task.c:290: warning: Function parameter or member
 'tracee_cred' not described in 'aa_may_ptrace'
Message-ID: <202311040508.AUhi04RY-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e392ea4d4d00880bf94550151b1ace4f88a4b17a
commit: 90c436a64a6e20482a9a613c47eb4af2e8a5328e apparmor: pass cred through to audit info.
date:   2 weeks ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231104/202311040508.AUhi04RY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040508.AUhi04RY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040508.AUhi04RY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/apparmor/task.c:290: warning: Function parameter or member 'tracer_cred' not described in 'aa_may_ptrace'
>> security/apparmor/task.c:290: warning: Function parameter or member 'tracee_cred' not described in 'aa_may_ptrace'


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
