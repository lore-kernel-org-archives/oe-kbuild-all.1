Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45BA18C033
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732315772; cv=none; b=e70mgI+8xCOsAq7Vu2ApZQFIsS2jHtSWr36yKhrIbZLU5STto56KQiSoA1tDXbe04AJ4LnPQuBurdLvaNWoplqsX3XjRMBpLNtuTy6nkVJIdcS1FPLxmbQBia02OUGvlroI4hLY/jhvyiU0e1IbFE2nAUHbKjj7FfcuxRgcBtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732315772; c=relaxed/simple;
	bh=ST8NQYd/QgjuWcz+8vpc5Arp6/XCi3M09TY109vKGx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+SFtB3pr5D6S8JvBOV2LHYtRgVKd4Mw5dr65TV8BrdU/Jx6eoyrZC5JxBHcSmWI58gNvXkMPx7CzcrvhJsXbbXn6dPPuSF3Pg6S+NLMbBXVlShdEIE15SCPr/u2UmFWLe7GI+CJVAQlbiAS/nfJLBsZaH6zGsUgRO5DTCI2sxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRIAO4qg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRIAO4qg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732315771; x=1763851771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ST8NQYd/QgjuWcz+8vpc5Arp6/XCi3M09TY109vKGx0=;
  b=JRIAO4qgeRFgpq/iEFPaNDxYVG5QNeGhqEIiOMrPIzKpWQcsGujrxEJ6
   qN97Uq5HZtw3u8WhHazLsHV1n8ZagZY/x3mwU0b2DT7Z/SJwE8Dk7VlI8
   ZAVtbROkfvasb4IT8IqJv8LYSHJrK6B8PRalbOhC4w6sA3Hh70CRi+a+X
   qGsf2esbWBebhzTYBhYsL5Q9wtOGZXI84G7xqEuKkDO34mYBAS05lMdVj
   PZHrt/ublixWvMDE06SWwYWDzlzXDHF2OXHSczGbPcQdKLHYhBzeGT78M
   quGkSpyRK8esIHwhDoK5T4mFenzPIrtFdBI6dUa9j1BWNJ2AwLyoeLDD4
   Q==;
X-CSE-ConnectionGUID: J2/MOAV6TFegA7fFvkMYpw==
X-CSE-MsgGUID: dRsRFbGrSt6CgbMYGK6v8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="36260140"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="36260140"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 14:49:31 -0800
X-CSE-ConnectionGUID: tmGr6VLlQveX7HVSKiKRQw==
X-CSE-MsgGUID: bSxAk8nhRh+tXCKNhnlf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="95120582"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2024 14:49:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEcSt-0004GR-1C;
	Fri, 22 Nov 2024 22:49:27 +0000
Date: Sat, 23 Nov 2024 06:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?unknown-8bit?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:landlock-audit 10/23] security/landlock/audit.c:173: warning:
 Function parameter or struct member 'domain' not described in
 'landlock_log_drop_domain'
Message-ID: <202411230624.KoxUNDEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git landlock-audit
head:   6da405a874858ad3a79d8762b442678e046e1111
commit: 170c11a69d564164a7a6458a12d98f76c9cabb23 [10/23] landlock: Log domain properties and release
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411230624.KoxUNDEM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230624.KoxUNDEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230624.KoxUNDEM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/audit.c:173: warning: Function parameter or struct member 'domain' not described in 'landlock_log_drop_domain'


vim +173 security/landlock/audit.c

   161	
   162	/**
   163	 * landlock_log_drop_domain - Create an audit record when a domain is deleted
   164	 *
   165	 * Only domains which previously appeared in the audit logs are logged again.
   166	 * This is useful to know when a domain will never show again in the audit log.
   167	 *
   168	 * This record is not directly tied to a syscall entry.
   169	 *
   170	 * Called by the cred_free() hook, in an uninterruptible context.
   171	 */
   172	void landlock_log_drop_domain(const struct landlock_ruleset *const domain)
 > 173	{
   174		struct audit_buffer *ab;
   175	
   176		if (WARN_ON_ONCE(!domain->hierarchy))
   177			return;
   178	
   179		if (!audit_enabled)
   180			return;
   181	
   182		/* Ignores domains that were not logged.  */
   183		if (READ_ONCE(domain->hierarchy->log_status) != LANDLOCK_LOG_RECORDED)
   184			return;
   185	
   186		ab = audit_log_start(audit_context(), GFP_ATOMIC,
   187				     AUDIT_LANDLOCK_DOM_DROP);
   188		if (!ab)
   189			return;
   190	
   191		audit_log_format(ab, "domain=%llx", domain->hierarchy->id);
   192		audit_log_end(ab);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
