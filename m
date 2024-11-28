Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5974F211C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 23:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732837921; cv=none; b=qRfcQctz46okRdwp4n4Kx29E01hp39RVcwqkhT5aXmIDlSa1V3VHez+NDeIoRCqw+voF4ScvzQoF+tJr2MEzNHPoZx2ECukWSanNNL2YW9NDMquoOhEgTcgcIfVlIvAwts9HlTInMFzk1vIGvMd9HXaa2osQNBroRwHPbfTipKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732837921; c=relaxed/simple;
	bh=b92Q0nL2whxqX73Wg/hiOFW30Q+wnqQSiTKTwj8KRu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q+VJ8MfKF3KiVSKigOnAFDCVagOdl3S39t0iwGC1Fu/6pIDTifILPI42gTVBWgbpBcJzq9uYBeIMmOe0biAuPXRahrRqvUo1ZBLex3ECFKofDv/IAAyjK0FesR3P0bLooR5Cj66cnpg3z0Wbs9rAXiRIns9yEBj6Xnea6I46qJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fG90BrLv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fG90BrLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732837919; x=1764373919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b92Q0nL2whxqX73Wg/hiOFW30Q+wnqQSiTKTwj8KRu8=;
  b=fG90BrLv4tzUh5yK7xep2bqEXOi3m3SZ1S8+INVUZEF//pJS7aDDJDK0
   8h75B21wDmex94dtEapvifxM29f65jcUdgRnTWLY/puxT6TDsN49DZsmh
   dJal/eoEv/4qP8vSqZZP6Rmvvbhfmt20Dd5EnRlDd3kJJ0Oz4qc4srbR2
   TbE9yGzJCNL6oilU51LHanjWtHy5g4kR9KJJOP3u5+VIVFCKvksNxbISe
   2bT/Gz7cU3GT1jb8Fokh/klN/5qJjbMSpBBcWUz6rpxFKQByZS6A5jhuV
   iwq37tvEoGk04CTPxlTdfr7T+xFI2c4wDdv97hrE4u3DuE4TM+/w/8n3l
   Q==;
X-CSE-ConnectionGUID: ocnMrYiuThKHhCz3SR3mKw==
X-CSE-MsgGUID: ALlPv+p6QX+mMsZDS2Btxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33225486"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33225486"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 15:51:58 -0800
X-CSE-ConnectionGUID: aBnc6zs2RB6yacR5lfp34w==
X-CSE-MsgGUID: ydl2UhxdRSa7X/T5ISyO4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="92218327"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2024 15:51:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGoIb-000AAF-0D;
	Thu, 28 Nov 2024 23:51:53 +0000
Date: Fri, 29 Nov 2024 07:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1546/1546] <instantiation>:1:5: error: expected
 absolute expression
Message-ID: <202411290752.RSi29UP4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: cf5f2d9ff017873c792298693e593dc358db6035 [1546/1546] arm64: Faster SVC exception handler with xcall
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411290752.RSi29UP4-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290752.RSi29UP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290752.RSi29UP4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:5: error: expected absolute expression
   .if 1 == 0 && std == std
       ^
   arch/arm64/kernel/entry.S:587:2: note: while in macro instantiation
    kernel_entry 1
    ^
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:696:2: note: while in macro instantiation
    entry_handler 0, t, 64, sync
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:697:2: note: while in macro instantiation
    entry_handler 0, t, 64, irq
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:698:2: note: while in macro instantiation
    entry_handler 0, t, 64, fiq
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 64
    ^
   arch/arm64/kernel/entry.S:699:2: note: while in macro instantiation
    entry_handler 0, t, 64, error
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:701:2: note: while in macro instantiation
    entry_handler 0, t, 32, sync
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:702:2: note: while in macro instantiation
    entry_handler 0, t, 32, irq
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:703:2: note: while in macro instantiation
    entry_handler 0, t, 32, fiq
    ^
   <instantiation>:103:5: error: expected absolute expression
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
   <instantiation>:58:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:62:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:70:6: error: expected absolute expression
    .if std == std
        ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:103:5: error: expected absolute expression
   .if std == std
       ^
   <instantiation>:3:2: note: while in macro instantiation
    kernel_entry 0, 32
    ^
   arch/arm64/kernel/entry.S:704:2: note: while in macro instantiation
    entry_handler 0, t, 32, error
    ^
   <instantiation>:24:5: error: expected absolute expression
   .if std == std
       ^
   arch/arm64/kernel/entry.S:707:2: note: while in macro instantiation
    kernel_exit 1
    ^
   <instantiation>:24:5: error: expected absolute expression
   .if std == std
       ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:35:6: error: expected absolute expression
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
   <instantiation>:80:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:84:6: error: expected absolute expression
    .if std == std
        ^
   arch/arm64/kernel/entry.S:716:2: note: while in macro instantiation
    kernel_exit 0
    ^
   <instantiation>:109:6: error: expected absolute expression
    .if std == std

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
