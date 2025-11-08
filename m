Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6067082D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 01:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762567077; cv=none; b=B/extq0vN2zctYdNF/ItXSTESB/C4y0M3BTjUS3XuyQ2JAI1QhjO3XmrkR6RozoZflTC1noVGDqc0MYGMyTjqBaPh3TJsE1t9i6fLI2L39enIobdtnbDw+CXBUeVU62QbkcDnzRsGN3hi4jqqAEjO6JWI/4AVOvt+wI3aPjlxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762567077; c=relaxed/simple;
	bh=vXRBvhkmJvAWfRS7TEUkNavhXlE0fqKdgu2XRVDbcNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ateBZtdy2fT1gPc9PxjxLPVQlrtR4CqJ9oBVTL/RXHgVgLH3yUrBBOP3SXiUKJZzKBaGXG0dzWJ99SawpMWJI7RyhhIsLXytgGrW8MbI6Ihd3wcmw8A5DWMKZ5n0zuTdgIzc1GBifMBml8xCiKIFbui0pBElsTPwYX2+198N8C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFLdFQMC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFLdFQMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762567075; x=1794103075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vXRBvhkmJvAWfRS7TEUkNavhXlE0fqKdgu2XRVDbcNs=;
  b=SFLdFQMC4IIQoK0kb7mkH2RQ92DHFV62IAXri5PEtzYsyPNXRD27zdH4
   kHYa8NYiPcvDJ5abwO+Z1pugR9tzL/WCqPLW0/G5n9k/Lz3+BglVObi7I
   RLWw1FN4h/szx/Obqum98M8rj5ljMKONwgFXkC3FSP3n5rI8F9ZFe7Ghq
   nDRm8xYOzKiRc0001bnomAitQl00A0tsQ0p+sMZL9ThMqcztWjfAwnoMY
   +SqsxXXJELQYSVns2s2Z0SgNoKF8hVmnRQA2hvQZwUCY98FI1/g87LUBb
   Go5duFqDRkAjeObmqhwSAF0cYu9w3klI8n6yHNUfIa9ASWMz370ocPupW
   w==;
X-CSE-ConnectionGUID: yxMZOqzPT5C8y+CmbqbnXA==
X-CSE-MsgGUID: 1rdwxoWQQR2+fbHjloRW7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="68558573"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="68558573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 17:57:55 -0800
X-CSE-ConnectionGUID: 9ohtHOopQSO24a7RY6vCGw==
X-CSE-MsgGUID: yMFHVcUNQYOI7GrnbXg7gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="188140878"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Nov 2025 17:57:54 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHYDA-0000bX-0L;
	Sat, 08 Nov 2025 01:57:52 +0000
Date: Sat, 8 Nov 2025 09:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 3/8] arch/x86/kernel/uprobes.c:1439:36:
 warning: 'mov_xol_ops' defined but not used
Message-ID: <202511080936.80vkwsbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: a1e15dc94d1d860d6e066d7b547ee0451f2cc135 [3/8] emulate mov
config: i386-buildonly-randconfig-006-20251108 (https://download.01.org/0day-ci/archive/20251108/202511080936.80vkwsbh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080936.80vkwsbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080936.80vkwsbh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1439:36: warning: 'mov_xol_ops' defined but not used [-Wunused-const-variable=]
    1439 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~


vim +/mov_xol_ops +1439 arch/x86/kernel/uprobes.c

  1438	
> 1439	static const struct uprobe_xol_ops mov_xol_ops = {
  1440		.emulate  = mov_emulate_op,
  1441	};
  1442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
