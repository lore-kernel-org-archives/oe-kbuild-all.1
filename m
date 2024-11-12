Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF78149DFF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731446234; cv=none; b=A9cDeF1DyKUK7sYXCV0nQiodQoQKc+ENd0PfOwbkNWuPPEdVYvvJM4bcLNdGIA5HGI/OSo4ZWjc9gyKET1KN+8D+evKUwgIzjaBKeXlRZg/eM1fCCFjDSji4Cm84m9W4oko94osw8/dXCn3/PKsEcCF/8aua8Qo6LQ2kkLG4F34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731446234; c=relaxed/simple;
	bh=u3RpPp9yPNFe7I+FSzp0zQcYqNlZFzCyuaz3PaljEjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9Kxj91OW0oqD2NaRlI5qewpxO9eXKdT1cPRnJ6UWPeN/NcbU7THu/SlSYQsGZDeohTO/i3i9kqQLbqll8CQhNtT+aG4vqH+ZzLdasfKYgBbQvP+vVstq9LDsO/XK3SYZJFwYqHh1+cHb6bhXJEXsjL6bPoSHAE05nm+K2XniNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNewbPU/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNewbPU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731446233; x=1762982233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3RpPp9yPNFe7I+FSzp0zQcYqNlZFzCyuaz3PaljEjs=;
  b=UNewbPU/Qm+W9ErWk1JK3OF3b64OViMmujXGjhRFy+hthcu1im2FPU0L
   rsfYadMnA5DgEA1Txg+LWu667kKZvt6If8xcq8kTjc+L+sLjDSqbu1ihD
   aR5goJyd3p6vhukQcjM07kA795oiPNayGZdDtYbWkqvuouU74MrRpGvYr
   WbymN0fE2PSf6+MTaOGCs41vL6X3pmOYnitNHzX1ki4LzHpupDS9Sl/uz
   k2ZEZTePDfIfH8k6X99w5BhlWzfP7rHS9JIEHk8g2e80cfx9MK6vdXUFT
   NJrUTlH2CNj81c02ElQtZTkqEwcZTz0vWhENrG1iQ+PipPHhxdDcDTTZA
   g==;
X-CSE-ConnectionGUID: WaemMkqmRkCrrAUTR60pGg==
X-CSE-MsgGUID: fS/mR4VGQNWIdICKOZ31Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18920086"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="18920086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 13:17:12 -0800
X-CSE-ConnectionGUID: t4GGkVPmTEai1KIYIKtd7g==
X-CSE-MsgGUID: CuHYZ1xlTJq3k9IsSnIAnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="92107850"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2024 13:17:11 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAyG4-0001jZ-0p;
	Tue, 12 Nov 2024 21:17:08 +0000
Date: Wed, 13 Nov 2024 05:16:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Jialin <lujialin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2417/2417] kernel/sched/psi.c:199:23: warning:
 no previous prototype for 'to_psi_group_ext'
Message-ID: <202411130536.ah7Yo4Qa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   400fd9ccb52e01bf78acae2bbc1710923a15f033
commit: 65479800e82741cf74021459e951eccc3c07c6d4 [2417/2417] psi: add struct psi_group_ext
config: x86_64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130536.ah7Yo4Qa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130536.ah7Yo4Qa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130536.ah7Yo4Qa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/psi.c:199:23: warning: no previous prototype for 'to_psi_group_ext' [-Wmissing-prototypes]
     199 | struct psi_group_ext *to_psi_group_ext(struct psi_group *psi)
         |                       ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/to_psi_group_ext +199 kernel/sched/psi.c

   198	
 > 199	struct psi_group_ext *to_psi_group_ext(struct psi_group *psi)
   200	{
   201		if (psi == &psi_system)
   202			return &psi_stat_system;
   203		else
   204			return container_of(psi, struct psi_group_ext, psi);
   205	}
   206	#else
   207	static inline struct psi_group_ext *to_psi_group_ext(struct psi_group *psi)
   208	{
   209		return NULL;
   210	}
   211	#endif
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
