Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080883AF640
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146481; cv=none; b=iaszjqgsf5a0sDcWVvuYYsC919vFHpHQgWtkYvONa2dXgxLINIDX/q/tiXbi3+0pDcMRZDkQF1U7JAWa596uje6+T5+gt0BVXpjTQn9aOg0S4Rqa/6WQbB20SGmzbhEDGo5kw2TcplCL5ddHkxrl+xpFMokmgOMulkkAFC9CZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146481; c=relaxed/simple;
	bh=aIUkbBSo1zOqsgQr4HSYNpXK4G67hicI8TJiauO6+6I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AgfTQhugMrPQHAit5+nqDonzfRFIERmUs+bL95N585i3mN1fxyX5Mpq+kJuy3NGm/UX8GKRsfbwUDcXhPPBxjdOSrQzOoq5BtPrre1eGwaqtPeW4XPEiZ2MGUTBRfBviSGppLjvMejHJqx26jIlYsy4Id2cdyEYJmBnuvZsAlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knjYIs1/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knjYIs1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788146479; x=1819682479;
  h=date:from:to:cc:subject:message-id;
  bh=aIUkbBSo1zOqsgQr4HSYNpXK4G67hicI8TJiauO6+6I=;
  b=knjYIs1/Fs+nOjK8QG9W24L8L1a2dUVmTQSR2NCexv4vTcq0eXjS1b+N
   vRViXqR54//51qbIhTPydN4Eqt181utOQ7b1viN3istHTLgKvAfKp44FL
   pMDFSYf1DD89Ig4kJPlg0ENbGYAqelVimcZ3ONm6dCfw36/Xclm2HDMNO
   P2nfoSxnqIBleC+EIigb3vuj51B4gEIJyA/QtzOMyOzBPgFFXeNAYeECl
   2Pt3fkKSELYMkSs6RcCuKM+6DNF+EitK6lh81usmG55lB3E9yENFHaJeO
   7JajI18HoTsMymDAaP6XlKEKHJoKOpSiDgI1jr+FK0k48+aRYU4IbzSPK
   w==;
X-CSE-ConnectionGUID: tCf6gO1oSiKWyDpJ32ipKQ==
X-CSE-MsgGUID: EGsZBV7ASlKwB4Da21g2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88595551"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88595551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 20:21:19 -0700
X-CSE-ConnectionGUID: oSwGuBonQ6aC1RCoYuhfKw==
X-CSE-MsgGUID: qeypk3VlRaqxjp5xLuO1Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="298587928"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2026 20:21:17 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0saB-000000000Nf-0tdH;
	Mon, 31 Aug 2026 03:21:15 +0000
Date: Mon, 31 Aug 2026 05:20:38 +0200
From: kernel test robot <lkp@intel.com>
To: Wen Yang <wen.yang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter
 'binpath' not described in 'rv_uprobe_register'
Message-ID: <202608310514.CurHoWr4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wen,

First bad commit (maybe != root cause):

tree:   https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/rv-Introduce-DA_MON_ALLOCATION_STRATEGY/20260821-004510
head:   ea162b44eca3c65889cd39be8bbdc29084f58e43
commit: 8161ebbed0a8c3da681d32a7234399a1c814c2d5 rv: Add tlob hybrid automaton monitor
date:   10 days ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260831/202608310514.CurHoWr4-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310514.CurHoWr4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310514.CurHoWr4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter 'binpath' not described in 'rv_uprobe_register'
>> Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter 'offset' not described in 'rv_uprobe_register'
>> Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter 'p' not described in 'rv_uprobe_register'
>> Warning: kernel/trace/rv/rv_uprobe.c:49 function parameter 'p' not described in 'rv_uprobe_is_registered'
>> Warning: kernel/trace/rv/rv_uprobe.c:58 function parameter 'p' not described in 'rv_uprobe_unregister'
>> Warning: kernel/trace/rv/rv_uprobe.c:73 function parameter 'p' not described in 'rv_uprobe_unregister_nosync'
>> Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter 'binpath' not described in 'rv_uprobe_register'
>> Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter 'offset' not described in 'rv_uprobe_register'
>> Warning: kernel/trace/rv/rv_uprobe.c:17 function parameter 'p' not described in 'rv_uprobe_register'
>> Warning: kernel/trace/rv/rv_uprobe.c:49 function parameter 'p' not described in 'rv_uprobe_is_registered'
>> Warning: kernel/trace/rv/rv_uprobe.c:58 function parameter 'p' not described in 'rv_uprobe_unregister'
>> Warning: kernel/trace/rv/rv_uprobe.c:73 function parameter 'p' not described in 'rv_uprobe_unregister_nosync'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
