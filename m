Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C0F17A305
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752863508; cv=none; b=Qs+x6JZLV0mUPU8DeyTBPZ2O/+yKvaQvEHyMPT33OWU8nQyw3YIk1U4ebL/VPxRJcPlxeQXNnnYYxQ0l495CbTmABAOwEVl92EDx766Ja38klenCYA+8gNZnCjlWdRjwAHwTaPnBtSvm/ogUubyWsre9NcRUJOVsGZdLvIESF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752863508; c=relaxed/simple;
	bh=bscRBxLmu7CHAl6/5rKYM7jTdmtmnyeGODDR583mHD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vbw8jTMnodpBuc0/URCrDOklO11IOQLftlIhcmyBGJ6n26X/pwnMgZY14fhj6aNGlhG9HYqlgC1olObvJyWTpZ0QshN/LKrU/Dbi/4DOJ/BXPzOP/lepM7sLidsDoBEKmeW0x3mcyb2NDGhhxlxTbJMUEoT2X7Ls/aYeaKvWmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+/bJukJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+/bJukJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752863507; x=1784399507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bscRBxLmu7CHAl6/5rKYM7jTdmtmnyeGODDR583mHD4=;
  b=B+/bJukJRda24kd/hSEIn8yJOy+RQdOpaLEsRlM3KV75i935f0R6l79A
   bYgWHX9jR28MN8EToD4XpwzG9E6fQeedPgXKBW4EqWARoKQZgeySzx+cW
   Yqzke2KEWOPcii4Q2j3JK5gxXEJTXRBsoibtT7Go6/9zZtYN3tAsCvrfM
   178s6SdMApwTlWrf5mrukDxMbq6df91RXQ+iTW+VhLRLcMS2+5BupZgVR
   CgMaRYbwjZdUHUYZMYozvH3WcYtWO30uW19ZLc3ztg7/QIyqaZBAGgENR
   6nXolrXrRi4iZI7ZjalZiXQYfKCCoOdZcfsp0bMx6Cmlo3Q+JIe/+xq7w
   Q==;
X-CSE-ConnectionGUID: Jm6qVsurTwu28ID79bFfXQ==
X-CSE-MsgGUID: nZchKwk7Rhiwk7IEyIrBVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="80609824"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="80609824"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 11:31:44 -0700
X-CSE-ConnectionGUID: mYWCPEBvQ+qoqv+4uAAlHQ==
X-CSE-MsgGUID: p12SHIUiQwuj/csChn90GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162154038"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 11:31:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucprx-000ExF-0i;
	Fri, 18 Jul 2025 18:31:41 +0000
Date: Sat, 19 Jul 2025 02:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:unwind/sframe 11/23] kernel/unwind/user.c:45:13: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202507190253.m5aln3QA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace unwind/sframe
head:   2e9c59950d225f260c7407a54a10ea3fb682fde3
commit: 093e5fb51bd5ce5362654252862980b77e0b160a [11/23] unwind_user/x86: Enable frame pointer unwinding on x86
config: x86_64-randconfig-121-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190253.m5aln3QA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190253.m5aln3QA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190253.m5aln3QA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/user.c:45:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned long * @@
   kernel/unwind/user.c:45:13: sparse:     expected void const volatile [noderef] __user *ptr
   kernel/unwind/user.c:45:13: sparse:     got unsigned long *

vim +45 kernel/unwind/user.c

fed5e7b792b832 Josh Poimboeuf 2025-07-07  14  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  15  #define for_each_user_frame(state) \
fed5e7b792b832 Josh Poimboeuf 2025-07-07  16  	for (unwind_user_start(state); !(state)->done; unwind_user_next(state))
fed5e7b792b832 Josh Poimboeuf 2025-07-07  17  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  18  static int unwind_user_next_fp(struct unwind_user_state *state)
fed5e7b792b832 Josh Poimboeuf 2025-07-07  19  {
fed5e7b792b832 Josh Poimboeuf 2025-07-07  20  	struct unwind_user_frame *frame = &fp_frame;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  21  	unsigned long cfa, fp, ra = 0;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  22  	unsigned int shift;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  23  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  24  	if (frame->use_fp) {
fed5e7b792b832 Josh Poimboeuf 2025-07-07  25  		if (state->fp < state->sp)
fed5e7b792b832 Josh Poimboeuf 2025-07-07  26  			return -EINVAL;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  27  		cfa = state->fp;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  28  	} else {
fed5e7b792b832 Josh Poimboeuf 2025-07-07  29  		cfa = state->sp;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  30  	}
fed5e7b792b832 Josh Poimboeuf 2025-07-07  31  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  32  	/* Get the Canonical Frame Address (CFA) */
fed5e7b792b832 Josh Poimboeuf 2025-07-07  33  	cfa += frame->cfa_off;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  34  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  35  	/* stack going in wrong direction? */
fed5e7b792b832 Josh Poimboeuf 2025-07-07  36  	if (cfa <= state->sp)
fed5e7b792b832 Josh Poimboeuf 2025-07-07  37  		return -EINVAL;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  38  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  39  	/* Make sure that the address is word aligned */
fed5e7b792b832 Josh Poimboeuf 2025-07-07  40  	shift = sizeof(long) == 4 ? 2 : 3;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  41  	if (cfa & ((1 << shift) - 1))
fed5e7b792b832 Josh Poimboeuf 2025-07-07  42  		return -EINVAL;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  43  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  44  	/* Find the Return Address (RA) */
fed5e7b792b832 Josh Poimboeuf 2025-07-07 @45  	if (get_user(ra, (unsigned long *)(cfa + frame->ra_off)))
fed5e7b792b832 Josh Poimboeuf 2025-07-07  46  		return -EINVAL;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  47  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  48  	if (frame->fp_off && get_user(fp, (unsigned long __user *)(cfa + frame->fp_off)))
fed5e7b792b832 Josh Poimboeuf 2025-07-07  49  		return -EINVAL;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  50  
fed5e7b792b832 Josh Poimboeuf 2025-07-07  51  	state->ip = ra;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  52  	state->sp = cfa;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  53  	if (frame->fp_off)
fed5e7b792b832 Josh Poimboeuf 2025-07-07  54  		state->fp = fp;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  55  	return 0;
fed5e7b792b832 Josh Poimboeuf 2025-07-07  56  }
fed5e7b792b832 Josh Poimboeuf 2025-07-07  57  

:::::: The code at line 45 was first introduced by commit
:::::: fed5e7b792b832e49b641112636017abfe750077 unwind_user: Add user space unwinding API with frame pointer support

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
