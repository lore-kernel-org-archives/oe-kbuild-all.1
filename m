Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BD19DF8D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748069251; cv=none; b=n6NHeUg8KtQBGDi59WKvasbjbL0UNcKWKcNB6CU+hSHsMeyIkM9l2kKzkQxa7EMeFj8Ojt5bmP92ZYCk/p0zznQANkuQpZpnA+nvrTQ+Tn1wSPf11biVn15OwGJDc2qsSLe0BDvYq1th30H67kXl89Sbth6l0b22ZeRvxMVjIYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748069251; c=relaxed/simple;
	bh=vKvfr4JykXPM3/e8SPyiekmYYgi36BorKmQCvYpB+4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDq130HMATmhr29le1wE2OvHlte7nFPqVIku0aSj4LyvYXWuSf9X7n0j2fJ0fS53EjPd4W4CgAKdGZxvFW/5+j9pKi1YtIuKIBX3W4vomMAa8p9xoWpDEFPhTYYfa0a7q5ssMd3mlCWqpdenSJX06o7p5E84TY+2WbAPoUo4yY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRnY2tHW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRnY2tHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748069248; x=1779605248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vKvfr4JykXPM3/e8SPyiekmYYgi36BorKmQCvYpB+4A=;
  b=dRnY2tHWzuv7wkuTQIrMVlwcCArz50fxpsDn2gCyT+vMDJmdk3IWy7zd
   2sO3zeW3Ecsuntd3Dr95hbertX9mgF1KLmE1K2LPezZ0uTV5reH0M+A8w
   jXwDYn+E3v7sXOFqDWlkWs0lIDPug5n3kjVmCSn1cWOo3+hwQfbnWn44l
   ir1zfOBoxUek4cS5UQrNiiwTARk53yBwoiG4hfE6ktMkKWRp8QSi76cML
   BCwSX9YJNVaTNBfeCqayGpO/HAXcZ1qn5nxqst1MerL+OBq0T73Psgjaw
   VuyXyJX8E4wk1upqxN5kwdPIwyv0iyBuXvovfibdP+m2k8wOV7kyINchT
   Q==;
X-CSE-ConnectionGUID: 3O/7Pn2DRQ6DlJV9GDMG+Q==
X-CSE-MsgGUID: 8VMmtIdSSC660oTHX3XTfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50232035"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50232035"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:47:27 -0700
X-CSE-ConnectionGUID: Ds5+ztb9RvCuHG3kIoh82Q==
X-CSE-MsgGUID: CUEd3Hd7TB26H2sMpNIkvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146180841"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 May 2025 23:47:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIifE-000Qzo-0c;
	Sat, 24 May 2025 06:47:24 +0000
Date: Sat, 24 May 2025 14:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>
Subject: ERROR: modpost: "__ubsan_handle_add_overflow" [fs/hostfs/hostfs.ko]
 undefined!
Message-ID: <202505241410.cTEnLlJ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4856ebd997159f198e3177e515bda01143727463
commit: 47f4af43e7c0cf702d6a6321542f0c0d9c4216e3 ubsan/overflow: Enable ignorelist parsing and add type filter
date:   3 months ago
config: um-randconfig-r061-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241410.cTEnLlJ7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241410.cTEnLlJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241410.cTEnLlJ7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/hostfs/hostfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/hostfs/hostfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/configfs/configfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/configfs/configfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/exfat/exfat.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/autofs/autofs4.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/zonefs/zonefs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [crypto/blake2b_generic.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [crypto/blake2b_generic.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_mul_overflow" [crypto/blake2b_generic.ko] undefined!
WARNING: modpost: suppressed 79 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
