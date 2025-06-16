Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122492BEFF0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095043; cv=none; b=EAzdQxPdV9zoqmhlvvvQlGI8zmnsnKeW9s+ebf6uhzO877yW4P8nm4/kxxCag40f0WYHBVJsLToVmFW69hoSW4iuIkO7n730uVtB/5IPNj8MjdAjT0IP6b+CXodiaj34l6eU037PQKmgIs83F6RXybz0o1njWv2egHS4ETa69WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095043; c=relaxed/simple;
	bh=bYKMIqZ4G5K3z1FUvr+FUVYy85Ipmual7nV7ti934oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ge+mkrfP+KtNwrr6zZ6NKc9Wa1WIor8SzzpiL0DTnEunFGRiV+SaMNj9WGOcumGGygbgND/Vp6BixSznxxBbBofmrBmr9adCJqANfH8rXwQvU/QffvVWjkotojYNASg6sDWYUCMdqm8QcH9O9f85yAgNEAYCZrqsNhoN/Bx7Zp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rn3B270Z; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rn3B270Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750095040; x=1781631040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYKMIqZ4G5K3z1FUvr+FUVYy85Ipmual7nV7ti934oQ=;
  b=Rn3B270ZCbu4MmVXqE0QOdMeSV9qPmAD407tvHJaCGdsHOnMmS7Dk/XY
   ffcDCBz0jaDR3YUzT0AR7BufVxGmQLaH2yOb5pTmIUTpQfEdplqziuswP
   OxTCguXbwvqF1i4pBy/89vlPLEuxFQw3YHVXXrZWzbZyK0SRG7iZqEKlb
   1FG2LpHDHDx9NSh9jXlN5ocY2R8sGcel+nleLZAjC4Vf1wXI9l3yA4ilR
   yBU9ySMbYF1uP2+L10GCqs0L0Y6hgr94JYJyXRuakf5f4IVRLc7t8wN2p
   Gxxw9NpgAJsUpRVLfySwQKUiDNxgPQvHZw8qQ/2oKbSr9lcrHXmmQO/55
   w==;
X-CSE-ConnectionGUID: S8VObVCKTpyojiXBwGUtbg==
X-CSE-MsgGUID: mwNULgYiQ0mku3vWIWM/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="56047857"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="56047857"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 10:30:39 -0700
X-CSE-ConnectionGUID: IXfrSgsrRgqShH26chXsgQ==
X-CSE-MsgGUID: c567pjN0Rk2Lgc6OSvlnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="149429496"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Jun 2025 10:30:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRDfI-000FDM-0X;
	Mon, 16 Jun 2025 17:30:36 +0000
Date: Tue, 17 Jun 2025 01:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2392/2392] <instantiation>:1:5: error: expected
 absolute expression
Message-ID: <202506170139.5RMGvcYK-lkp@intel.com>
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
head:   852df0842f6ca5e0b4808eb4b1368aed4b492917
commit: cf5f2d9ff017873c792298693e593dc358db6035 [2392/2392] arm64: Faster SVC exception handler with xcall
config: arm64-randconfig-003-20250616 (https://download.01.org/0day-ci/archive/20250617/202506170139.5RMGvcYK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170139.5RMGvcYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170139.5RMGvcYK-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   <instantiation>:27:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:37:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:42:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:46:6: error: expected absolute expression
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
