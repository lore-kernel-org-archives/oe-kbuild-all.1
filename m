Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1C6824A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 02:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729737936; cv=none; b=blpZ7ONA3I+9A4KrFLK06WUzwgEiEJl6OLLmvs7mH4S7kk6TUBB5xmG7az6h9e4B0ewJJoeQM47EeVkzfeMePTmrnq57mGolAlXK+7ZpQTD3mInLjUe8BmgjvjKop9t4imET8GqtERhiG3w/oQmpnsNbWt1rGbwpyPgtxEeZYT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729737936; c=relaxed/simple;
	bh=x/j+UUBv15Xpqw4+YpW7W8zJsCeGGO0dmw7M2IvnCzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g+zYu6CVxbhMc0YI0pKOK736SzvldC/d1JR8tKpmGAnmR4Aj3nBGkGD6pC0mH1yd/MIFgF0sN7eXPEi07zkesWprbKlVG59kg7/tVCP6WTSgzzy6S83wHkhJuXCx+bZXt3+KeRFFXJxqNpofeDF/sOB4mwdbEudBTnIfPKkND+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4L9Kw3m; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4L9Kw3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729737934; x=1761273934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/j+UUBv15Xpqw4+YpW7W8zJsCeGGO0dmw7M2IvnCzE=;
  b=U4L9Kw3m2SFUCcw5qoKYqJD0XiruAVChkPODkPATCeB4xAOPPQDgHdpD
   wAe8BozfmN6lX/cpYAJgY4gQXcsnbaG2Sz6SRjpNxBELz6+fb1sFP0IKY
   rgkwWaZhMH45e+clJLs3Ou6RBVXYd7blFVoZFPguDJpzJ4nfrMRQEVjxq
   gHZy8o9qOby4ng5CHRETghtwQbn8bGM9K40EcfA0Z3v4Tlrzs6efF/vtP
   +Us0qKxFd8AlFkAEjKuarGJ7JUbc8W6uoiJELw3CouMAMSglXhwXWYvZq
   KiJ4x3dE9jEOFijl/QP/vuLepCEm1n533VggX9SsUMc1KWWE3hV53q5y5
   A==;
X-CSE-ConnectionGUID: G39KExVaTpmDnfOWmUxpgw==
X-CSE-MsgGUID: PBT048DPT7aKwBg4qFAKwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29517003"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29517003"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 19:45:31 -0700
X-CSE-ConnectionGUID: 1W9Goan9Q+2Ngn15uuI0gQ==
X-CSE-MsgGUID: 5/0oYzvFS4eMQRO8qszNMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80761749"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 19:45:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3nqq-000Vqq-1I;
	Thu, 24 Oct 2024 02:45:28 +0000
Date: Thu, 24 Oct 2024 10:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mic:landlock-audit 16/22] security/landlock/audit.c:166: warning:
 Cannot understand  *
Message-ID: <202410241011.Dc0YeKbK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git landlock-audit
head:   b3b217bbd19f28ca1b2d9f86cd12a7e590d98a39
commit: 0e90ecf523db0c30a5c5bfaf90f58699aaa533ea [16/22] landlock: Log domain properties and release
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241024/202410241011.Dc0YeKbK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241011.Dc0YeKbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241011.Dc0YeKbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/audit.c:166: warning: Cannot understand  *
    on line 166 - I thought it was a doc line


vim +166 security/landlock/audit.c

   164	
   165	/**
 > 166	 *
   167	 * landlock_log_drop_domain - Create an audit record when a domain is deleted
   168	 *
   169	 * Only domains which previously appeared in the audit logs are logged again.
   170	 * This is useful to know when a domain will never show again in the audit log.
   171	 *
   172	 * This record is not directly tied to a syscall entry.
   173	 *
   174	 * Called by the cred_free() hook, in an uninterruptible context.
   175	 */
   176	void landlock_log_drop_domain(const struct landlock_ruleset *const domain)
   177	{
   178		struct audit_buffer *ab;
   179	
   180		if (WARN_ON_ONCE(!domain->hierarchy))
   181			return;
   182	
   183		if (!audit_enabled)
   184			return;
   185	
   186		/* Ignores domains that were not logged.  */
   187		if (READ_ONCE(domain->hierarchy->log_status) != LANDLOCK_LOG_RECORDED)
   188			return;
   189	
   190		ab = audit_log_start(audit_context(), GFP_ATOMIC,
   191				     AUDIT_LANDLOCK_DOM_DROP);
   192		if (!ab)
   193			return;
   194	
   195		audit_log_format(ab, "domain=%llu", domain->hierarchy->id);
   196		audit_log_end(ab);
   197	}
   198	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
