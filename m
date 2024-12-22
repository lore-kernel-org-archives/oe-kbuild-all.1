Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B66DF59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734874388; cv=none; b=su4Oj5mXA7Xpj4qUEVR7hrd1bg0WZk+lnlv3HdqvSUSG8OsaOjxE6qkIst8A0QUpNFZKjZoZ6DAxm5nEN0gCDniUr/Nqdmrrr0M/3TyGBHg206ORBoyoMQsvoql16jNlFQX2iDKT4iu6N2nykK89FwMT7iyms1Zp7Lukta5DTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734874388; c=relaxed/simple;
	bh=zfQaVqp4gaDx84LQa7+HyJZ4omXleljcMUaaTxVSeV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xnm9nasqL5Ex8T31sidj76OcVOZpjwj2Qvf6S6vWieu/+HJ8vsTzu27pdkJiSLmQCYtRN6wfESWKbCImRo9YlBrrJNrLfXTak86r78TV+i0K0l5KzbJpJkdSPWPa+UodPqFG714Bt+fphorhbH/qqlxaa9bb7YbYgXLu7s7vjE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzZ+X09q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzZ+X09q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734874386; x=1766410386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zfQaVqp4gaDx84LQa7+HyJZ4omXleljcMUaaTxVSeV8=;
  b=ZzZ+X09qNO8/UggVbeLzRMr5VWfAAI+2Tnc4TotngNMgEFO6b9LlLihN
   UlVipcFjjlK1sPPoQ9AOp0TjJT3B7nJUMuriwADvuKLcQav9Z7PS99lgw
   5GfvRU9XjFTd2c/JjZ1xebjFNhs4gC17QvCxiyNwy22YL1+roKy4H1qB/
   ef1tiZltwOR91gPeEX0cz7ZFHatcw+1iW83/VZmLX+kS4383Se5dqn33s
   pAM8527/DjYpv1wNkc5hXuxH+eUb8EETTJGFCDl9jYZZ5RmtY1FUgK3uc
   sQDFhsOY8rul41XAAKUz9YSyZlC0peJLH6EmMfUhDiPaohxEZcwbHgR5k
   w==;
X-CSE-ConnectionGUID: sVQ9NbefSr6wwB5Hpjxzdw==
X-CSE-MsgGUID: 9T7FiWuXRnqvBfeAp6sfPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35241427"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="35241427"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 05:33:06 -0800
X-CSE-ConnectionGUID: pFLLoIvpR0CuVqVpaFTEig==
X-CSE-MsgGUID: yNZeBmlGRMapN6eqohxHxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99823074"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2024 05:33:06 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPM4t-0002yR-02;
	Sun, 22 Dec 2024 13:33:03 +0000
Date: Sun, 22 Dec 2024 21:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.13-rc2/truncated-nonstring 6/6]
 tools/power/acpi/include/acpi/actbl.h:69:35: error: expected ';' at end of
 declaration list
Message-ID: <202412222141.trauy7As-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.13-rc2/truncated-nonstring
head:   2618dfca21ab2b38484908efbe94e5d17c7dee3b
commit: 2618dfca21ab2b38484908efbe94e5d17c7dee3b [6/6] [WIP] Add __nonstring where needed to avoid -Wunterminated-string-initialization warnings
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412222141.trauy7As-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412222141.trauy7As-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from acpidbg.c:9:
   In file included from tools/power/acpi/include/acpi/acpi.h:26:
>> tools/power/acpi/include/acpi/actbl.h:69:35: error: expected ';' at end of declaration list
      69 |         char signature[ACPI_NAMESEG_SIZE] __nonstring;  /* ASCII table signature */
         |                                          ^
         |                                          ;
   1 error generated.
   make[4]: *** [../../Makefile.rules:25: tools/power/acpi/tools/acpidbg/acpidbg.o] Error 1
   make[3]: *** [Makefile:18: acpidbg] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
