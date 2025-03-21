Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF122AE5D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742596819; cv=none; b=abYnc/nU6stAyimGNqNiWd6Xc7657U+OSBM6+6u7g1NU62vu/aHglECijWx7twln6a1jv4TjjJCwHXf39eWmu27H5LH586XQzlqV5CgBuMfEoqWbmMFsY7R/xaOWVFdnP6+3o74Ic6at+ACUKOmiCOXqnn5/q98gI1Liw87LG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742596819; c=relaxed/simple;
	bh=EshyZnGr3VS1mSvxDHh0ueafRb+ymsClwHtR5gNophM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AaYXCQCQZ889LcHQIaJQBlSC8BD1c4kLv1kMiLz8+CQOfPudlc1Wb0f5RKnYrm0xYYyBczoQHc+U8iT6MBRrZOgfqAO5/oT5quPcjo0ST49qHr22JudlmPluaQDKiLLIOofvA1WK71acwmvRMZOO9f1mpxdG0MyQmKBNVl0l5HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8eYp0hB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8eYp0hB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742596818; x=1774132818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EshyZnGr3VS1mSvxDHh0ueafRb+ymsClwHtR5gNophM=;
  b=b8eYp0hBYEN5dYgWXo+id8z6d2cJppavQcZmUhRYunITCqfSBiHq/E5z
   bygq2qL5dVRV0IbUYlxZRifMeqmCL46pKpWv51j7o5+zy427yQ8+gsV9H
   Iym7xQpa7fBa78ugPA2dBRcDTxlEj9jZRQYwxtYiidLYwdFSS7rcEBwhZ
   YoNDAIe9J7mxQmb7r3OfyTxfhrgie2p/y8K8O60zcmrxQD5b3PUu5ZddT
   xWjPVaGJ0yRBVJZqJx0GXeQlyQTC0gVxeUhog/4npGPfnTC/JiRUlxN9K
   xIpzkUBSPLg5jVBaDhMDNmusPOrn8Z3VvC7T93D3Nl5MMuvKyYyn2eAjX
   w==;
X-CSE-ConnectionGUID: PlzVmUsLRtOD9a/w5saAeA==
X-CSE-MsgGUID: fEkrgQbUTRWjutXvsjot2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43041091"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="43041091"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 15:40:17 -0700
X-CSE-ConnectionGUID: xQUStoBeS2qy4E5NPDFWMw==
X-CSE-MsgGUID: o5Ug8C2AQd2a9mQeNjwHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128348369"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2025 15:40:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvl2D-0001kM-20;
	Fri, 21 Mar 2025 22:40:13 +0000
Date: Sat, 22 Mar 2025 06:39:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:next 25/36] security/landlock/syscalls.c:482:22: warning:
 variable 'log_new_exec' set but not used
Message-ID: <202503220604.1FlfJaWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   b93810652d504e23b545dceefe1513bb70858737
commit: 161686d8d3ec0029fc4dd6d36fe4cdf318d72158 [25/36] landlock: Add LANDLOCK_RESTRICT_SELF_LOG_*_EXEC_* flags
config: arc-randconfig-001-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220604.1FlfJaWA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220604.1FlfJaWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220604.1FlfJaWA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/landlock/syscalls.c: In function '__do_sys_landlock_restrict_self':
>> security/landlock/syscalls.c:482:22: warning: variable 'log_new_exec' set but not used [-Wunused-but-set-variable]
     482 |  bool log_same_exec, log_new_exec;
         |                      ^~~~~~~~~~~~
   security/landlock/syscalls.c:482:7: warning: variable 'log_same_exec' set but not used [-Wunused-but-set-variable]
     482 |  bool log_same_exec, log_new_exec;
         |       ^~~~~~~~~~~~~


vim +/log_new_exec +482 security/landlock/syscalls.c

   448	
   449	/**
   450	 * sys_landlock_restrict_self - Enforce a ruleset on the calling thread
   451	 *
   452	 * @ruleset_fd: File descriptor tied to the ruleset to merge with the target.
   453	 * @flags: Supported values:
   454	 *
   455	 * - %LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF
   456	 * - %LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON
   457	 *
   458	 * This system call enables to enforce a Landlock ruleset on the current
   459	 * thread.  Enforcing a ruleset requires that the task has %CAP_SYS_ADMIN in its
   460	 * namespace or is running with no_new_privs.  This avoids scenarios where
   461	 * unprivileged tasks can affect the behavior of privileged children.
   462	 *
   463	 * Possible returned errors are:
   464	 *
   465	 * - %EOPNOTSUPP: Landlock is supported by the kernel but disabled at boot time;
   466	 * - %EINVAL: @flags contains an unknown bit.
   467	 * - %EBADF: @ruleset_fd is not a file descriptor for the current thread;
   468	 * - %EBADFD: @ruleset_fd is not a ruleset file descriptor;
   469	 * - %EPERM: @ruleset_fd has no read access to the underlying ruleset, or the
   470	 *   current thread is not running with no_new_privs, or it doesn't have
   471	 *   %CAP_SYS_ADMIN in its namespace.
   472	 * - %E2BIG: The maximum number of stacked rulesets is reached for the current
   473	 *   thread.
   474	 */
   475	SYSCALL_DEFINE2(landlock_restrict_self, const int, ruleset_fd, const __u32,
   476			flags)
   477	{
   478		struct landlock_ruleset *new_dom,
   479			*ruleset __free(landlock_put_ruleset) = NULL;
   480		struct cred *new_cred;
   481		struct landlock_cred_security *new_llcred;
 > 482		bool log_same_exec, log_new_exec;
   483	
   484		if (!is_initialized())
   485			return -EOPNOTSUPP;
   486	
   487		/*
   488		 * Similar checks as for seccomp(2), except that an -EPERM may be
   489		 * returned.
   490		 */
   491		if (!task_no_new_privs(current) &&
   492		    !ns_capable_noaudit(current_user_ns(), CAP_SYS_ADMIN))
   493			return -EPERM;
   494	
   495		if ((flags | LANDLOCK_MASK_RESTRICT_SELF) !=
   496		    LANDLOCK_MASK_RESTRICT_SELF)
   497			return -EINVAL;
   498	
   499		/* Translates "off" flag to boolean. */
   500		log_same_exec = !(flags & LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF);
   501		/* Translates "on" flag to boolean. */
   502		log_new_exec = !!(flags & LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON);
   503	
   504		/* Gets and checks the ruleset. */
   505		ruleset = get_ruleset_from_fd(ruleset_fd, FMODE_CAN_READ);
   506		if (IS_ERR(ruleset))
   507			return PTR_ERR(ruleset);
   508	
   509		/* Prepares new credentials. */
   510		new_cred = prepare_creds();
   511		if (!new_cred)
   512			return -ENOMEM;
   513	
   514		new_llcred = landlock_cred(new_cred);
   515	
   516		/*
   517		 * There is no possible race condition while copying and manipulating
   518		 * the current credentials because they are dedicated per thread.
   519		 */
   520		new_dom = landlock_merge_ruleset(new_llcred->domain, ruleset);
   521		if (IS_ERR(new_dom)) {
   522			abort_creds(new_cred);
   523			return PTR_ERR(new_dom);
   524		}
   525	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
