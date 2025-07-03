Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E2D291C24
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 07:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526409; cv=none; b=sHRhgODd0DhBWgYBc2PIujnU4xBe4QHJTajaOeD9DnazM60Lkr1Jj+YZHlYuo7G1+lWxYIE3YzuaaRBFLk1Rxp5y7StDsU/nPPCC/FKlM/bORkW1+VVQl8ODoPdd6e7n7sIDNzDkLYByEKwcXcSAhrjS6oU7VaHMZaJvJ9sI8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526409; c=relaxed/simple;
	bh=SmT2SK7f86FhvZLVie/8s51ctllouS7639RcwcAtCC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XRen8XPIxUriSnPVWTPrLHCwFLDVOHmcJ/TxCRzgwnUeRx1qoRUvTWQvnpACxFEeE/BYL8ldXMhJCCo/pRws6Y4caPX4Y0N47zXMrP45WxtMD70pZEzKHyLjCWkPz64xcp1XE8l/zd9xCr+JqKr1e4hGNJXRpn0XUvvC4j7/Ppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpZ0405Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpZ0405Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751526408; x=1783062408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SmT2SK7f86FhvZLVie/8s51ctllouS7639RcwcAtCC0=;
  b=HpZ0405Q8OhQ28GuhVqEW6NpehpRwrzpOHz07n8YSMMrPz+ZE90Oi5ig
   vpDbbrHxyQb8nWxyx42r7QRqNxY9SP/SGFCa8Np3R7OMi3pF55kqB9Sv9
   1oocoJ3cbZYqeFqsRc+GIqTa3Fha70CRiq8jt9t9gNispYjuHNqyKDdOC
   KcEdnMgwDM+qDSg7eFinsfVl+pHVS29tjWZWlzL5lReKS7JcpTAXle7T6
   o0TlOiZp0h1Y5SIQKrcICq/6h8Qg5Jy6EWMuZ7bPgUKYaF954gFt+vXvt
   9xHUyXxZOe2baWZRpQQRfR0++/7oV7tk7uD+GSC3titrT9W2IJhEZHIIM
   w==;
X-CSE-ConnectionGUID: BDVhO5heS72qCoLwLyBxNw==
X-CSE-MsgGUID: LX0MEwJHRpm8wjEey9WvYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64436491"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="64436491"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 00:06:47 -0700
X-CSE-ConnectionGUID: rcM8TMjDREiBvtPlA5OWDw==
X-CSE-MsgGUID: V9SsCafATJSYBDeHKomLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="185313060"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 00:06:46 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXE1q-0000Qn-2r;
	Thu, 03 Jul 2025 07:06:42 +0000
Date: Thu, 3 Jul 2025 09:05:44 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605] arch/x86/mm/maccess.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202507030925.ESXy0WXt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   382711115afc1197da2c288679079946650ef017
commit: 22058d2bdaf6b0526395ceec2736c72c3b5f435a [1605/1605] uaccess: Add strict non-pagefault kernel-space read function
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030925.ESXy0WXt-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030925.ESXy0WXt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030925.ESXy0WXt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/maccess.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
