Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5CEC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 00:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717978913; cv=none; b=N6awiFC9/6O7SGzewX/L2IvF+VzuV2FjUQthBNO6c/rOl4Ot7mfV5cZC4ZdAdTaKludTrN0QX61kYIFospF2WtqzL3ewLcJE0OmQhJDGt987jq2FkpPtVC9vJUQ37geXLV8QKbxNFltmpSqzU6dwcy/iSl4XJTbV7lW6IpfrW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717978913; c=relaxed/simple;
	bh=8D2CXYpedV6gLmRMka9bsAm9Hhqd5ALnuTJh/O5FS0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1ezKiuvXKvhOjVS1E2iVfV25uqMxPW8H7oK8OA0VFWYvvk9z3B7UK0mBiZ8+tvvMpZ3N2436dR9z9KihkxaFSDgQkiUgUNmbxj3aw4JcHiQ7vLXxSWSJfOq+EBTyOJxJOraX0nfxsO9x4Dest3pNIaO5xvmeGv9v+dAgU1HQBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifW2Dgqk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifW2Dgqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717978911; x=1749514911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8D2CXYpedV6gLmRMka9bsAm9Hhqd5ALnuTJh/O5FS0o=;
  b=ifW2Dgqk2fymLPisltT7cf1HJlfEvPS4VWOG1tOv9tzjXzuHtPprjwxT
   mn6H7NFYFtN4nn2gT0K6Oebzm0PQ7EmnZq3JixLZQ7CVkcpNC6VKDYbj3
   HawWmTkxsQDW8FNny4CncWtOYM2zMi+470YWgqQ/mftsN+74NXg45GtQ/
   4BhTAe6PzHZQyNS9DtL4DnNrdnmh83dYJEbC9GoPqJ5wREaaaMcrESBaK
   cptw+JAcX2WXcHM43ziT0tJrpu29m9WEoj67f8ZGKTm9b4vj7rfc0hhJ1
   j+Fths2mCl+KJ+XqNAecK4TguMqLY8DM5ynMxKDF/2GIDYjurqckydsdT
   A==;
X-CSE-ConnectionGUID: ly/cFZv/T1Cne7UJXuG1zg==
X-CSE-MsgGUID: StMzsW1wS/uUIYACwiAdQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14425525"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="14425525"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 17:21:50 -0700
X-CSE-ConnectionGUID: L2ylOLLYQ/a1QpT+srTt8A==
X-CSE-MsgGUID: aEat/9TIQYKBnKX3eb9w7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="69681630"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Jun 2024 17:21:49 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGSnD-0001iI-1T;
	Mon, 10 Jun 2024 00:21:47 +0000
Date: Mon, 10 Jun 2024 08:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip 14/39] ld.lld: error: undefined symbol:
 platform_irqchip_probe
Message-ID: <202406100834.2SKbeErX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   9b6b51fe8dad7c7e6e091bd99901171e42b1b80c
commit: 1a976563ab48d0c37e7ead6ec20f2c85bc094cfe [14/39] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
config: i386-buildonly-randconfig-006-20240610 (https://download.01.org/0day-ci/archive/20240610/202406100834.2SKbeErX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100834.2SKbeErX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100834.2SKbeErX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: platform_irqchip_probe
   >>> referenced by irq-renesas-rzg2l.c
   >>>               irqchip/irq-renesas-rzg2l.o:(rzg2l_irqc_driver) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
