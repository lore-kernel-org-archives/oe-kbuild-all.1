Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978E3A874D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498588; cv=none; b=ttzLUjXM1gnzAlX+WSD1SzYAvJg9QibGRfVN9KToBpdrov0QiJaL+cQnYAQzlHSooVFiodL6raikQ4wBNDthdLXxa8yOYS0a74aUOyjaAdC55ZeqMr32nffmrkk/qwHs6lyWrcs8y0H+BUwhpOJC59f9cqsVn1NfJYj1zuALIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498588; c=relaxed/simple;
	bh=Q4uRTYQYfTglhHkxtMBpYx9+IGIyNoGcUir3mqY96Wk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZdmOWrZzQeyNTROE/fIa+Je+K1F1O3h9VybPF8f68KRdsyp5zRgK4bLjRwJeeWXJJvXOoPLYTysTOQBs+BDmcBxFW7rIYs0bLScxyoc6a7eaAIPD8h6p7fgqrwuclYOtYyBkNmcWXPZ9QTmL0X/sLboWxkj2YmmSRZsrrOEX2OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QveajR+h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QveajR+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777498587; x=1809034587;
  h=date:from:to:cc:subject:message-id;
  bh=Q4uRTYQYfTglhHkxtMBpYx9+IGIyNoGcUir3mqY96Wk=;
  b=QveajR+hrHKsctn9ZJszHnulKC/woE8RZdFVKgGfFsLmPWIHYC+AQAzP
   NjCHYNW7rWiD+t5DayD1tcjxd2ZvAoVW8O8m7jFMFod2xhU53DaP7os5O
   iGyAnjveGo3fRn+B9LgCQGSSIMcGZ9DVsv1uStrBZcFzFCCFhXgHAE85Z
   rR7HTFRfiFSjc86fxQoCDO6IAi3ywkJje0m0Laes8z72BIcZmAlsHmRmW
   N0b5eC3gR4MxCalnu2A1tUKkiBs1ot0esK9kGmP8EqpZ++Xh9IJUlgQ59
   /xs2WmTHMb4qA98vBc6hUnqmnTBuyoZxQds4nNrGYlQAvKl/e4uiBZSeg
   A==;
X-CSE-ConnectionGUID: 1jMozMsARZ2GZz/u2KlzGg==
X-CSE-MsgGUID: s0iDhqlWT7yJA1nOoae54A==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78546546"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78546546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 14:36:24 -0700
X-CSE-ConnectionGUID: KLXBQx/uSmaBPAExVR35KA==
X-CSE-MsgGUID: BnSpw9u4SbeF/6xwOQiLeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234657422"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 14:36:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wICZx-000000004a7-0hGX;
	Wed, 29 Apr 2026 21:36:21 +0000
Date: Wed, 29 Apr 2026 23:36:14 +0200
From: kernel test robot <lkp@intel.com>
To: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error:
 /kbuild/src/include/uapi/linux/goldfish_address_space.h: missing "WITH
 Linux-syscall-note" for SPDX-License-Identifier
Message-ID: <202604292351.XUyGYKrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wenzhao-Liao/uapi-add-goldfish_address_space-userspace-ABI-header/20260417-163828
head:   baf6fc99a94d4efae78273b11f66fcc307adffcf
commit: 0884317b0ceacbd0e2d07409ef19019074cdb3fc uapi: add goldfish_address_space userspace ABI header
date:   13 days ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce: (https://download.01.org/0day-ci/archive/20260429/202604292351.XUyGYKrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604292351.XUyGYKrA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: /kbuild/src/include/uapi/linux/goldfish_address_space.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [/kbuild/src/scripts/Makefile.headersinst:63: usr/include/linux/goldfish_address_space.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:1452: headers] Error 2
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'headers' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'headers' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
