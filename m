Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D6915BF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 02:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711247307; cv=none; b=ozPGKGO8rni7Y4oh7xkeWCNr+7NALU2lNkgzRlm3XQe34qlvH7bHosszcSrW4gmut7ge9ezNPR8m6M7q/ruLgIsDm47MwSAY/1vJ3pntO3zGNoH90NLWs/hZVkFdaIsZn/DmfMS2AQHKzyspBJ/0pa/17mVflJidRuJp74wwL2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711247307; c=relaxed/simple;
	bh=NqBZ9dFPhUs2F6eYGKBJ8cMSGSVD+NVLuKB088JhtTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ge5ageeVptPaBRnGnrWghqapFRpd5osALOesFDY+DVzE3FqXoQhA3rHFFsllcISKXZHrDuecp6X4a13BrHhiDSnEdqdnu6kglmb7dWaKirEBZBxmrfDUcuLJ1Vg4IVD2x7Cx0J86z39A7DPzccU+WSddL8rrK9j77SNF0KbjJ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPZz17/O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPZz17/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711247305; x=1742783305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqBZ9dFPhUs2F6eYGKBJ8cMSGSVD+NVLuKB088JhtTQ=;
  b=LPZz17/O2KFd4A6BNXmxvAmcMwmge8OdmwiYpV0RODnSeGoJ7EPlAEZ+
   S69JDYCZYfk1v21f/PaG+Q2epxio6uMPw2d8o6Her1fu2pZy/1u5Sp6n+
   QepkXnQBINR12DIyOcy8sD7garZPisHYMbaNyc0ZjQKyTCmldDHyfQBTH
   00YVXDgLk7dAxCatRf5cYDBauab3d8y7cuNSjHrNpljgvqjggudYUeVew
   YT3x58K3GbMBgff4/Th7/kU4h8/jSqlzDRMAtRNKK9uzCR6A69hGucquP
   3JncZdXPkxMQo8hMsES0CwoHUvXWOL/xoxTTNcsWX34AcKM1K/lrT/9iM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="16816454"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="16816454"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 19:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15362424"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Mar 2024 19:28:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roDau-000LcJ-27;
	Sun, 24 Mar 2024 02:28:20 +0000
Date: Sun, 24 Mar 2024 10:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 14627/30000] ld.lld: error: undefined symbol:
 kernel_swap_enabled
Message-ID: <202403241008.Fq0JzJes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: 79c68ab3280fab8ace1b10bf8eadce508ee89c3c [14627/30000] etmem: add original kernel swap enabled options
config: x86_64-randconfig-001-20240323 (https://download.01.org/0day-ci/archive/20240324/202403241008.Fq0JzJes-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241008.Fq0JzJes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241008.Fq0JzJes-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kernel_swap_enabled
   >>> referenced by vmscan.c:3467 (mm/vmscan.c:3467)
   >>>               vmscan.o:(try_to_free_pages) in archive mm/built-in.a
   >>> referenced by vmscan.c:3467 (mm/vmscan.c:3467)
   >>>               vmscan.o:(kswapd) in archive mm/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
