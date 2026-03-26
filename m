Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E41FF61E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 03:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495141; cv=none; b=R4kpUaqhkxSWzb08IGI/50xdM83b/y5GlZ60byq3lq2doNayKvELe+CLv9dQEu21LR3A8a1p6uxXXoCZNvxIt7gCjXkNDpywYkLs6psbQdJgq4F2gs8qsTZWfmdBVLt7iPu+affcP13BFgIt5LJNTRm+DankdqyGZiHlFxEPKO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495141; c=relaxed/simple;
	bh=tvUvJ4fXMbLnKKeLT7yKimYTNB9MnbJVjQ0xDgBssG4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AvUqjgDRpDtSWK0VnVc5qZhtgMUMQq4Afu44KL30k90gltQvBLwTaGYJWJvJ7pTG+gcJxJvZCsEmH67rvnWFkn2wmzmMxfPRjD4IN6uszU38ILBbeFhVCqaRQLKctygCOVxvmwrO+biePwP31+M0dYWq8udEoOuYfaECUaLrVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSEx6dKR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSEx6dKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495140; x=1806031140;
  h=date:from:to:cc:subject:message-id;
  bh=tvUvJ4fXMbLnKKeLT7yKimYTNB9MnbJVjQ0xDgBssG4=;
  b=YSEx6dKRl3CZM6ZBlWDpVUrWwe1SqwuRq7hHvpuk7OEoCCJXT+XKHi7/
   eGhK/QkeSWcopI0wHLx+vv4EykCk6jKFjNALXhZgZJmk0kGokPlUhMcLs
   gQj66Vhf6PJ0YDZtbzd/hxxliVkwMhM7HKKzydMg1LRP3aMYwsIPmE/SH
   NN23t64HNKs8qJOFiqNI05HQRC6j3pq5FiaQjAOoAh7iyccaIJYZR3UqJ
   0VZZvDLv2gR39CCSwUHG9jv5pWMSJL/N55XcHVm0J8T3O86VY9iXWGXSZ
   wLlRfE/7Mu/3s4XZRBK4TNOMV+uWvtO4GIgDPgPUtD1uN43fNl/FVQejT
   g==;
X-CSE-ConnectionGUID: cpcPGIURTBi7ROF4cf0FwA==
X-CSE-MsgGUID: +MRoToKyQE2FXd2Bbb1tkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75659297"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75659297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:18:59 -0700
X-CSE-ConnectionGUID: ZYfXqR3ARnmLJoSAdbrHYA==
X-CSE-MsgGUID: GNXMdQOzTG+DSrQBrOiQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224896214"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2026 20:18:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bFD-0000000083D-3aFi;
	Thu, 26 Mar 2026 03:18:51 +0000
Date: Thu, 26 Mar 2026 11:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 85/525] Warning: security/smack/smackfs.c:450
 function parameter 'data' not described in 'smk_write_rules_list'
Message-ID: <202603261150.0M3HiIgx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   d5f290ca006c2bdabff8aa383fd3cf9cf9194259
commit: 4753fc1ad1f616455ce83af8f59f6703abb31700 [85/525] smack: convert to read/write iterators
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261150.0M3HiIgx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261150.0M3HiIgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261150.0M3HiIgx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smackfs.c:450 function parameter 'data' not described in 'smk_write_rules_list'
>> Warning: security/smack/smackfs.c:830 function parameter 'data' not described in 'smk_set_cipso'
>> Warning: security/smack/smackfs.c:948 function parameter 'iocb' not described in 'smk_write_cipso'
>> Warning: security/smack/smackfs.c:948 function parameter 'from' not described in 'smk_write_cipso'
>> Warning: security/smack/smackfs.c:1032 function parameter 'iocb' not described in 'smk_write_cipso2'
>> Warning: security/smack/smackfs.c:1032 function parameter 'from' not described in 'smk_write_cipso2'
>> Warning: security/smack/smackfs.c:1160 function parameter 'iocb' not described in 'smk_write_net4addr'
>> Warning: security/smack/smackfs.c:1160 function parameter 'from' not described in 'smk_write_net4addr'
>> Warning: security/smack/smackfs.c:1421 function parameter 'iocb' not described in 'smk_write_net6addr'
>> Warning: security/smack/smackfs.c:1421 function parameter 'from' not described in 'smk_write_net6addr'
>> Warning: security/smack/smackfs.c:1808 function parameter 'iocb' not described in 'smk_write_ambient'
>> Warning: security/smack/smackfs.c:1808 function parameter 'from' not described in 'smk_write_ambient'
>> Warning: security/smack/smackfs.c:1984 function parameter 'iocb' not described in 'smk_write_onlycap'
>> Warning: security/smack/smackfs.c:1984 function parameter 'from' not described in 'smk_write_onlycap'
>> Warning: security/smack/smackfs.c:2072 function parameter 'iocb' not described in 'smk_write_unconfined'
>> Warning: security/smack/smackfs.c:2072 function parameter 'from' not described in 'smk_write_unconfined'
>> Warning: security/smack/smackfs.c:2233 function parameter 'iocb' not described in 'smk_write_load_self'
>> Warning: security/smack/smackfs.c:2233 function parameter 'from' not described in 'smk_write_load_self'
>> Warning: security/smack/smackfs.c:2373 function parameter 'iocb' not described in 'smk_write_load2'
>> Warning: security/smack/smackfs.c:2373 function parameter 'from' not described in 'smk_write_load2'
   Warning: security/smack/smackfs.c:2459 function parameter 'iocb' not described in 'smk_write_load_self2'
   Warning: security/smack/smackfs.c:2459 function parameter 'from' not described in 'smk_write_load_self2'
   Warning: security/smack/smackfs.c:2512 function parameter 'iocb' not described in 'smk_write_revoke_subj'
   Warning: security/smack/smackfs.c:2512 function parameter 'from' not described in 'smk_write_revoke_subj'
   Warning: security/smack/smackfs.c:2587 function parameter 'iocb' not described in 'smk_write_change_rule'
   Warning: security/smack/smackfs.c:2587 function parameter 'from' not described in 'smk_write_change_rule'
   Warning: security/smack/smackfs.c:2656 function parameter 'iocb' not described in 'smk_write_syslog'
   Warning: security/smack/smackfs.c:2656 function parameter 'from' not described in 'smk_write_syslog'
   Warning: security/smack/smackfs.c:2748 function parameter 'iocb' not described in 'smk_write_relabel_self'
   Warning: security/smack/smackfs.c:2748 function parameter 'from' not described in 'smk_write_relabel_self'
   Warning: security/smack/smackfs.c:450 function parameter 'data' not described in 'smk_write_rules_list'
   Warning: security/smack/smackfs.c:830 function parameter 'data' not described in 'smk_set_cipso'
   Warning: security/smack/smackfs.c:948 function parameter 'iocb' not described in 'smk_write_cipso'
   Warning: security/smack/smackfs.c:948 function parameter 'from' not described in 'smk_write_cipso'
   Warning: security/smack/smackfs.c:1032 function parameter 'iocb' not described in 'smk_write_cipso2'
   Warning: security/smack/smackfs.c:1032 function parameter 'from' not described in 'smk_write_cipso2'
   Warning: security/smack/smackfs.c:1160 function parameter 'iocb' not described in 'smk_write_net4addr'
   Warning: security/smack/smackfs.c:1160 function parameter 'from' not described in 'smk_write_net4addr'
   Warning: security/smack/smackfs.c:1421 function parameter 'iocb' not described in 'smk_write_net6addr'
   Warning: security/smack/smackfs.c:1421 function parameter 'from' not described in 'smk_write_net6addr'
   Warning: security/smack/smackfs.c:1808 function parameter 'iocb' not described in 'smk_write_ambient'
   Warning: security/smack/smackfs.c:1808 function parameter 'from' not described in 'smk_write_ambient'
   Warning: security/smack/smackfs.c:1984 function parameter 'iocb' not described in 'smk_write_onlycap'
   Warning: security/smack/smackfs.c:1984 function parameter 'from' not described in 'smk_write_onlycap'
   Warning: security/smack/smackfs.c:2072 function parameter 'iocb' not described in 'smk_write_unconfined'
   Warning: security/smack/smackfs.c:2072 function parameter 'from' not described in 'smk_write_unconfined'
   Warning: security/smack/smackfs.c:2233 function parameter 'iocb' not described in 'smk_write_load_self'
   Warning: security/smack/smackfs.c:2233 function parameter 'from' not described in 'smk_write_load_self'
   Warning: security/smack/smackfs.c:2373 function parameter 'iocb' not described in 'smk_write_load2'
   Warning: security/smack/smackfs.c:2373 function parameter 'from' not described in 'smk_write_load2'
   Warning: security/smack/smackfs.c:2459 function parameter 'iocb' not described in 'smk_write_load_self2'
   Warning: security/smack/smackfs.c:2459 function parameter 'from' not described in 'smk_write_load_self2'
   Warning: security/smack/smackfs.c:2512 function parameter 'iocb' not described in 'smk_write_revoke_subj'
   Warning: security/smack/smackfs.c:2512 function parameter 'from' not described in 'smk_write_revoke_subj'
   Warning: security/smack/smackfs.c:2587 function parameter 'iocb' not described in 'smk_write_change_rule'
   Warning: security/smack/smackfs.c:2587 function parameter 'from' not described in 'smk_write_change_rule'
   Warning: security/smack/smackfs.c:2656 function parameter 'iocb' not described in 'smk_write_syslog'
   Warning: security/smack/smackfs.c:2656 function parameter 'from' not described in 'smk_write_syslog'
   Warning: security/smack/smackfs.c:2748 function parameter 'iocb' not described in 'smk_write_relabel_self'
   Warning: security/smack/smackfs.c:2748 function parameter 'from' not described in 'smk_write_relabel_self'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
