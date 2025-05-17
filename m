Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB24B1E5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747470321; cv=none; b=nQIaR9zJErcGmte8s8SNtEYV//j0k1kVNG2QUjEjvg5bhe/j7g2cijh8DMKNHEmnkklum1jN8hoHlSAVIQ6W8RNOiQNIfiU4oiFcmdK0qe+gFJKYrWNYOlFgxPSbuSCH2CnyU+BtkRYDG2cn4Ga+PI/WLV3yVUlFxQOutNZIKkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747470321; c=relaxed/simple;
	bh=crGj2J/BUn2jsqQT/GFzNTeE3W5rqWMFLCQi7N4hOVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GikGw6z3sfYICDbBCXFxWfZDFf+/ju++hQnad84vQczwtvfsOBZoKB5nruHSI1ZbyQSNGWWEVeHsKvThk3+53gvKcXUaF1HRQewe0ED3yTO9NIXgYbGqFHn31f1SuMMk1nwXy5DMZvvf0ACWtXFa/WRZQyynesitWyYoI+UmeT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0oDk712; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0oDk712"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747470320; x=1779006320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crGj2J/BUn2jsqQT/GFzNTeE3W5rqWMFLCQi7N4hOVw=;
  b=b0oDk712DZjymsr9TSdzSF02GNXrgJfkTahgXAz25WcHYrlbYy/ZJLxH
   lWsPBVux8IQCU/Sjm9WKovNw5w8v7ezkbCZ4MTyhFAaRY7kJ3U+UjjKV1
   YXBkyIeMasbdbUCZgnoMsRqiiVqu0Wym5EXb6E9l1slBDfX8cjkLxbf5L
   VofiUQbbzLyjKGo19Is5NKcHFxFnn755sh6qiCz4y6znhVKJiKF6qaG9i
   wO9OaRN4Y2E5XVlRz74hQp+QA3e1LL1uVFnwblpeciyu262CpGHhghzvp
   B8zyJvei6dgXx1vWYbE9M89xUR/+MffF3UCDfGk50dc+OO+Js0U87PbOY
   A==;
X-CSE-ConnectionGUID: Gf4b8PwcTf2/EO8WXrfVqQ==
X-CSE-MsgGUID: dqwh2M0gSP6rwpjTiUmMEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49578888"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="49578888"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 01:25:19 -0700
X-CSE-ConnectionGUID: WZHLS/3hRkGplS589+zsPA==
X-CSE-MsgGUID: qi9Uf6yXQqWQh4JuBZNltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="169837382"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2025 01:25:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGCr5-000K1L-2G;
	Sat, 17 May 2025 08:25:15 +0000
Date: Sat, 17 May 2025 16:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 227/228]
 fs/bcachefs/recovery_passes.c:285:6: error: conflicting types for
 'bch2_recovery_pass_needs_set'; have 'bool(struct bch_fs *, enum
 bch_recovery_pass,  enum bch_run_recovery_pass_flags)' {aka '_Bool(struct
 bch_fs *, enum bch_recovery_pass,  enum bch_run_re...
Message-ID: <202505171624.jhVEhlp7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   3af63ea6a739e1361c1d83b2fe1b7f2c09e17bdf
commit: 2c305f38bcc9b7216e5f21f1b562404a51251c54 [227/228] bcachefs: Run recovery passes asynchronously
config: csky-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505171624.jhVEhlp7-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505171624.jhVEhlp7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171624.jhVEhlp7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/recovery_passes.c:285:6: error: conflicting types for 'bch2_recovery_pass_needs_set'; have 'bool(struct bch_fs *, enum bch_recovery_pass,  enum bch_run_recovery_pass_flags)' {aka '_Bool(struct bch_fs *, enum bch_recovery_pass,  enum bch_run_recovery_pass_flags)'}
     285 | bool bch2_recovery_pass_needs_set(struct bch_fs *c,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/bcachefs/recovery_passes.c:18:
   fs/bcachefs/recovery_passes.h:20:6: note: previous declaration of 'bch2_recovery_pass_needs_set' with type 'bool(struct bch_fs,  enum bch_recovery_pass,  enum bch_run_recovery_pass_flags)' {aka '_Bool(struct bch_fs,  enum bch_recovery_pass,  enum bch_run_recovery_pass_flags)'}
      20 | bool bch2_recovery_pass_needs_set(struct bch_fs c,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +285 fs/bcachefs/recovery_passes.c

   284	
 > 285	bool bch2_recovery_pass_needs_set(struct bch_fs *c,
   286					  enum bch_recovery_pass pass,
   287					  enum bch_run_recovery_pass_flags flags)
   288	{
   289		struct bch_fs_recovery *r = &c->recovery;
   290	
   291		return __recovery_pass_needs_set(c, pass, flags) ||
   292			(!(flags & RUN_RECOVERY_PASS_ratelimit) &&
   293			 (r->passes_ratelimiting & BIT_ULL(pass)));
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
