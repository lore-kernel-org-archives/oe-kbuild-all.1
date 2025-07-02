Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AC1EEA5F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485623; cv=none; b=J62xkHUMgU+nGQ7CirVPJw2swELoFgtx0IGX5n+RPWTGeXmvZ8B7xHNesewj+YXyNkYBJPol8k81inWMep1TxkAtxEMOQ5uHn/vzVYPbCT/hpXyZAJSVEoX4k+cHQ/l9Din+oHRMbmDYg1PqonDWyV7mZCaWCb2+q71nokSDkO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485623; c=relaxed/simple;
	bh=tJfqFzynQJO9gljDmTmkT3avxv8ga+z1nFtzt69Li5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kj1+jdS6vSTri3e9mUTD5nMjJEwT7A8niUtITAUmU7EYmr2Fq2BKmUAYFQ34m9fP7DiWEY4igvvG1vVJiIXKXaikqYlMnQpi/WIUXKlIgpjmDdY+dpk4W8aAAfwSE4awd5WNaMTXBFtZg3Pwqr4y8n/aYtm/t9aUDb4kEpaTCsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8Grp2eW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8Grp2eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751485621; x=1783021621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJfqFzynQJO9gljDmTmkT3avxv8ga+z1nFtzt69Li5w=;
  b=X8Grp2eWZEF6iBviVodOTYhntRzsWN3EwdAgFRhl5q5HGj5YtpWPUTBJ
   NaEVoWrgteRXQzaoGq/AkgdVT0yNnYfB4BBMsOenaclaV3uJrMxAZhsx1
   AiD0axtFN5YoOkSwEhzYjScO4yenadiIvXgv1Zx2Fv+1I0aNRL8l65FhF
   1AIJIMUstcds6MU+BzbYHbWdbHIvHiAnAdVHCYmS81jwT6hfY5sY0GiMS
   HI2llt0cTnZquJ/fCnd84SzaMVCGB3va9T6yy/7z/BuytbbbPkqj8wxIx
   QfVUHHq5IRbfTrIdPOSkRmDqcCevnpq3iEBCskyO/CFVJCOnEF/gMAHC6
   w==;
X-CSE-ConnectionGUID: +FFJpmzPR6mr0H5ydE87Yw==
X-CSE-MsgGUID: sQbFeSTvT2Ky2/6ymynS8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53909035"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="53909035"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 12:47:01 -0700
X-CSE-ConnectionGUID: gEtPxAVLSMKLRK9kFFrNAg==
X-CSE-MsgGUID: ME4+NnpQSx6SqFiKx8Rabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="154733458"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 12:46:59 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX3Q1-00011j-2P;
	Wed, 02 Jul 2025 19:46:57 +0000
Date: Thu, 3 Jul 2025 03:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1687/1687] mm/mmu_gather.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202507030343.E83xAhC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d96cd567c8d8d584405abe92c2576bf58202fa6e
commit: 1f7b24152a85bec4ea4f5a6219b4702853ffd3e6 [1687/1687] mm/memory: Move mmu_gather and TLB invalidation code into its own file
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250703/202507030343.E83xAhC0-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030343.E83xAhC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030343.E83xAhC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmu_gather.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
