Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9513B5AE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 17:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764696345; cv=none; b=XAjoYy6HiFmkNdOOfrxA7N2YFjVoxcAhCAdx0SHkgZShucB6y2xT6h/57v/Ec257+bjIyiGf+vMzGaiTol8cCmf3bJtlyVb8KbvyrzCx18CvFQWpl6eHFzRDJsU2RQr6JELhCBlHEC7Ejx/NqHzrxtOjjJiAtvLJmg7l34Hzyxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764696345; c=relaxed/simple;
	bh=dZfc7ZIPEjD77ehkKwdcro7NbDGpsd//dPSJM/qLu3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GLYj2oVo4SdeQMum0/RbitoXaqivYOcIxp1Zwa0rmKf5mQiZCzz4d2rhC1EO8LYounEJfI75ESrkr0PkO606ViVwRQy4uY51FY087skYkp8ftYQ1d6J0Lf7GXW9kwYB6BxQmJvx8e1yfTEWQ5zqEOBqF+D/5TD9jGX+o+WZAcM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5phkHsB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5phkHsB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764696343; x=1796232343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZfc7ZIPEjD77ehkKwdcro7NbDGpsd//dPSJM/qLu3M=;
  b=C5phkHsBC59GomAKKuCCWDKmWhNpZF9TRV5gBGUHymuAs6IakhPO3teI
   QDr8ZyTq25mGHL73g0uKrr6OKVDQVB6msr43pUx0fORP4GDicnspYOAG5
   0UUEmBdF6iQfgJv8yX/PfAmuADfF8tBncv/sul2rAA7Pz0zppoVIe75Cx
   P0iu20oc5TE/o88wmzicgV7QPF9P6suVz2l7QTanMsD0qv56OqD7bvDcO
   1m9ec2GM6pIBTThYbSoqiyvz7cvrSc2BCL7PY6BsNZB1sxk/RLo4KCnja
   47EIQ2t8a+7Ww/ML+nE1su+46plShu20iodDRJEXNPwd8P8vv6TK216Os
   g==;
X-CSE-ConnectionGUID: C5kdVA7TTI6eB5hwCWn8kg==
X-CSE-MsgGUID: h6VHCT2iTBKu0QPdahBuOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66392922"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66392922"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 09:25:43 -0800
X-CSE-ConnectionGUID: yq7auiqBQv2mooX4JXNhHw==
X-CSE-MsgGUID: cOKGmPVgT9eUrQcmIl5jGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194854988"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 09:25:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQU8B-00000000A3F-36hs;
	Tue, 02 Dec 2025 17:25:39 +0000
Date: Wed, 3 Dec 2025 01:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 3/9] kernel/trace/trace.h:907:24:
 error: dereferencing pointer to incomplete type 'struct ftrace_hash'
Message-ID: <202512030109.GpLnkO6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   60c6292b26f5405b3f8e6fb372ffbdbb8d406cc1
commit: 03b85d16087bb3d28584c4463c1834710f0869e1 [3/9] ftrace: Export some of hash related functions
config: arc-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251203/202512030109.GpLnkO6q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030109.GpLnkO6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030109.GpLnkO6q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/trace_dynevent.h:14,
                    from kernel/trace/trace_events_user.c:25:
   kernel/trace/trace.h: In function 'ftrace_hash_empty':
>> kernel/trace/trace.h:907:24: error: dereferencing pointer to incomplete type 'struct ftrace_hash'
     return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
                           ^~


vim +907 kernel/trace/trace.h

4046bf023b0647 Namhyung Kim            2017-01-20  904  
eb583cd484f9a7 Arnd Bergmann           2017-01-23  905  static __always_inline bool ftrace_hash_empty(struct ftrace_hash *hash)
4046bf023b0647 Namhyung Kim            2017-01-20  906  {
8c08f0d5c6fb10 Steven Rostedt (VMware  2017-06-26 @907) 	return !hash || !(hash->count || (hash->flags & FTRACE_HASH_FL_MOD));
4046bf023b0647 Namhyung Kim            2017-01-20  908  }
4046bf023b0647 Namhyung Kim            2017-01-20  909  

:::::: The code at line 907 was first introduced by commit
:::::: 8c08f0d5c6fb10ff93ffb1cbf416f4f1c3a52a80 ftrace: Have cached module filters be an active filter

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
