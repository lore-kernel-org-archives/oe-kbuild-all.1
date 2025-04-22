Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1628E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 01:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745284049; cv=none; b=d9dNFAa9rEEjGTjFvGpc5JMekApLZioErB/eCM0BqIoIbCI3Egi4tty4g9wf1s+yIhFnsimyjvCn9vVyvryNo34Tj9I/nO6vYBNf5WSUnK1F9MeW6185t6qE2biAxS05ILhG0WbqTF99p1TGNlHGqtYYWfkm2NJKVz//zsagIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745284049; c=relaxed/simple;
	bh=NmzR+dT77SxAfxxrgeKr5nwrFyS8klIkkXxsg3EAQtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BSBZY+9eSHnSUJwXcxlQIDuqK49RqKbEQEIzp7fJ4dXjxDW2xVomCENShNO1DxAQxt45YXuyvZzhollpfku3G5ssvaLlJrbPMA1UtJ4bpenDw1oRVi79qPKoSPlojfy8JLPxGlE+nDRcQLJVvlRs4esOwn8wP2pAVYc9vkduwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8IK7Uuq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8IK7Uuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745284047; x=1776820047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NmzR+dT77SxAfxxrgeKr5nwrFyS8klIkkXxsg3EAQtg=;
  b=c8IK7UuqBpm2kdg+B43wjIwqGmFdI42/PbOYs+SNSy+H69Y70LnHpTew
   swPG9+PFrKRkcMnlseoYh4T3eGkNMNXn+SAICqRpahqznu2AkuWKFuAVz
   tllagk8OUzqgqlbb9jj9WDW5qdedYyi2W2VeGSHoptz6b2SnzTzlcNOwd
   U9hdq6Cm1eRl1srppbi0eJ/KNXV1F9spNY64HQIXEUTHHIesCKViNYXPs
   efm2L/uMEBSUQMQISlpvxLpq0ZcqTk6Fi9KcgRxfrEn9XJxlo94fFw3xY
   kG7VEY0H+5YPY90UZsBUi3L90+5feE3i7R3wHzpFGDuhZ2s9wJcTIOIZ3
   w==;
X-CSE-ConnectionGUID: o9sdORhFQWaGyZO4Piz/DQ==
X-CSE-MsgGUID: w2bx2aVXQ+ukEprgEsxkhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46745231"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46745231"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 18:07:26 -0700
X-CSE-ConnectionGUID: DIZXSklwQL24DVeqAaFJXw==
X-CSE-MsgGUID: e3Eo6QYzRRynKmlEkudZgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="155038598"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Apr 2025 18:07:24 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u726c-0000Up-1U;
	Tue, 22 Apr 2025 01:07:22 +0000
Date: Tue, 22 Apr 2025 09:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 1/36]
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c:194:4: error:
 call to undeclared function 'wrmsrq_safe_on_cpu'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202504220912.NpLHqSUj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   b89e689ba026bed67f85e02bd28f6f51bb6f0cd9
commit: 76d82edb22442f04b1dadc13b64632d9267e9322 [1/36] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: i386-buildonly-randconfig-005-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220912.NpLHqSUj-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220912.NpLHqSUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220912.NpLHqSUj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/intel/speed_select_if/isst_if_common.c:194:4: error: call to undeclared function 'wrmsrq_safe_on_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     194 |                         wrmsrq_safe_on_cpu(sst_cmd->cpu, sst_cmd->cmd,
         |                         ^
>> drivers/platform/x86/intel/speed_select_if/isst_if_common.c:214:5: error: call to undeclared function 'wrmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     214 |                                 wrmsrq_safe(sst_cmd->cmd, sst_cmd->data);
         |                                 ^
>> drivers/platform/x86/intel/speed_select_if/isst_if_common.c:409:8: error: call to undeclared function 'rdmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     409 |         ret = rdmsrq_safe(MSR_CPU_BUS_NUMBER, &data);
         |               ^
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c:527:9: error: call to undeclared function 'wrmsrq_safe_on_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     527 |                 ret = wrmsrq_safe_on_cpu(msr_cmd->logical_cpu,
         |                       ^
>> drivers/platform/x86/intel/speed_select_if/isst_if_common.c:538:9: error: call to undeclared function 'rdmsrq_safe_on_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     538 |                 ret = rdmsrq_safe_on_cpu(msr_cmd->logical_cpu,
         |                       ^
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c:834:7: error: call to undeclared function 'rdmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     834 |                 if (rdmsrq_safe(MSR_OS_MAILBOX_INTERFACE, &data) ||
         |                     ^
   6 errors generated.
--
>> drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c:42:3: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      42 |                 rdmsrq(MSR_OS_MAILBOX_INTERFACE, data);
         |                 ^
>> drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c:55:2: error: call to undeclared function 'wrmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         wrmsrq(MSR_OS_MAILBOX_DATA, command_data);
         |         ^
   drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c:67:3: error: call to undeclared function 'rdmsrq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |                 rdmsrq(MSR_OS_MAILBOX_INTERFACE, data);
         |                 ^
>> drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c:179:8: error: call to undeclared function 'rdmsrq_safe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     179 |         ret = rdmsrq_safe(MSR_OS_MAILBOX_INTERFACE, &data);
         |               ^
   4 errors generated.


vim +/wrmsrq_safe_on_cpu +194 drivers/platform/x86/intel/speed_select_if/isst_if_common.c

f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  173  
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  174  /**
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  175   * isst_resume_common() - Process Resume request
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  176   *
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  177   * On resume replay all mailbox commands and MSRs.
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  178   *
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  179   * Return: None.
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  180   */
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  181  void isst_resume_common(void)
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  182  {
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  183  	struct isst_cmd *sst_cmd;
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  184  	int i;
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  185  
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  186  	hash_for_each(isst_hash, i, sst_cmd, hnode) {
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  187  		struct isst_if_cmd_cb *cb;
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  188  
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  189  		if (sst_cmd->mbox_cmd_type) {
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  190  			cb = &punit_callbacks[ISST_IF_DEV_MBOX];
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  191  			if (cb->registered)
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  192  				isst_mbox_resume_command(cb, sst_cmd);
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  193  		} else {
27a23a544a55b5 drivers/platform/x86/intel/speed_select_if/isst_if_common.c Ingo Molnar         2025-04-09 @194  			wrmsrq_safe_on_cpu(sst_cmd->cpu, sst_cmd->cmd,
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  195  					   sst_cmd->data);
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  196  		}
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  197  	}
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  198  }
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  199  EXPORT_SYMBOL_GPL(isst_resume_common);
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  200  
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  201  static void isst_restore_msr_local(int cpu)
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  202  {
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  203  	struct isst_cmd *sst_cmd;
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  204  	int i;
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  205  
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  206  	mutex_lock(&isst_hash_lock);
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  207  	for (i = 0; i < ARRAY_SIZE(punit_msr_white_list); ++i) {
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  208  		if (!punit_msr_white_list[i])
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  209  			break;
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  210  
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  211  		hash_for_each_possible(isst_hash, sst_cmd, hnode,
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  212  				       punit_msr_white_list[i]) {
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  213  			if (!sst_cmd->mbox_cmd_type && sst_cmd->cpu == cpu)
6fa17efe45440f drivers/platform/x86/intel/speed_select_if/isst_if_common.c Ingo Molnar         2025-04-09 @214  				wrmsrq_safe(sst_cmd->cmd, sst_cmd->data);
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  215  		}
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  216  	}
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  217  	mutex_unlock(&isst_hash_lock);
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  218  }
f607874f35cbd2 drivers/platform/x86/intel_speed_select_if/isst_if_common.c Srinivas Pandruvada 2019-06-26  219  

:::::: The code at line 194 was first introduced by commit
:::::: 27a23a544a55b55259ee6b438497dd4384c387c5 x86/msr: Rename 'wrmsrl_safe_on_cpu()' to 'wrmsrq_safe_on_cpu()'

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
