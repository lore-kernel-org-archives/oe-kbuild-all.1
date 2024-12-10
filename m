Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195422CBF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733815456; cv=none; b=fJ925qZk5uYE7KT41bGvFnwmIVt3x/wkJTkYDTCeAInUUwt2o7GA9ZoLbssku1GvUJq5UD5EtTP2wUKwFhGNVztqNPMjv9vEhRySk/+hHyNEQR+AgVWQ4oCTnU/094I6IIqNOAmFQFBw+37RJv+I7L4mzd40b48k5+jz9yCEaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733815456; c=relaxed/simple;
	bh=9HUud1wGbfgspteQOTHhPngyyDILVPVsds6ePs/AK2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U74Be5HxhdQyW14SqJ9b4lgVP2dG/TDQU3EMdeQH3WfjhiB3qG3OYmVJtrO6S0m+3gqJ+KLsrVDpJs0jIllALE2E25bqZtd2mLc+b1Bs4MdbT/cBOliv2SU8UZNi1Rqz6SeG2rpYXw2yvAZ8QGCnfCWbG8Yk+5IK0JQ0hCIGQWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cF2NRuWA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF2NRuWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733815454; x=1765351454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9HUud1wGbfgspteQOTHhPngyyDILVPVsds6ePs/AK2g=;
  b=cF2NRuWA5RHzlZ8/QHgXJrFrR3REHw2NgfpE+MAmcAKkQPfm/0T1q3KY
   Vdkf4hZzHujBPY6GK5E9/ycxIwpF1guqIuz9V4GvFGxxi4XbHWglh9vp1
   OxD32s77f848KtQNe/A8rmWjMCxtnq4OXx11XexAwB5auP5O9uolg/DBh
   sDwJS1xoLkVCrli+4MCt7IERUX8W7XrfzZyQW7/NupA0tlHgW56QKOrMO
   TsobANzxeTUNKLajYXlVa5Rg1Bgv3vKqio9/GmLi9FEUFq4XC7p/6MVr9
   RJv41TSng/GckR9xo72oRrSMK12Us6f6vqa0T4hRm+8KiBIIA86p3AZwO
   A==;
X-CSE-ConnectionGUID: RZG3zMqkSNGjshI/gdlqlQ==
X-CSE-MsgGUID: m+l77DZeRzK+odzsl4YWCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34280519"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="34280519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 23:24:13 -0800
X-CSE-ConnectionGUID: Tzcc4pcvQ36ZIjgL08pAbg==
X-CSE-MsgGUID: mAXKtVILQlSDHfDzb2fKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="95516399"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 23:24:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKubI-0005El-34;
	Tue, 10 Dec 2024 07:24:08 +0000
Date: Tue, 10 Dec 2024 15:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] <instantiation>:1:5: error: expected
 absolute expression
Message-ID: <202412101536.8w9KRuyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yipeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c0c5f5fdc62998e0c68e6c77d6aae2566185bfd5
commit: cf5f2d9ff017873c792298693e593dc358db6035 [1613/1613] arm64: Faster SVC exception handler with xcall
config: arm64-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101536.8w9KRuyo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101536.8w9KRuyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412101536.8w9KRuyo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   arch/arm64/kernel/entry.S:587:2: note: while in macro instantiation
    kernel_entry 1
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:686:2: note: while in macro instantiation
    entry_handler 1, t, 64, sync
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:687:2: note: while in macro instantiation
    entry_handler 1, t, 64, irq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:688:2: note: while in macro instantiation
    entry_handler 1, t, 64, fiq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:689:2: note: while in macro instantiation
    entry_handler 1, t, 64, error
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:691:2: note: while in macro instantiation
    entry_handler 1, h, 64, sync
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:692:2: note: while in macro instantiation
    entry_handler 1, h, 64, irq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:693:2: note: while in macro instantiation
    entry_handler 1, h, 64, fiq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 1, 64
    ^
   arch/arm64/kernel/entry.S:694:2: note: while in macro instantiation
    entry_handler 1, h, 64, error
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
>> <instantiation>:1:5: error: expected absolute expression
   .if 0 == 0 && std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:33:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:39:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:44:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:48:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:56:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:11:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:21:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:26:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:30:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:55:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:75:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
