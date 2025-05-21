Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010422B8B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812935; cv=none; b=nDowZ5LgKVQRjCi52WD3nAdRQv2qrsFETnZXKD0StqZkNMVw/gYInU4yWue6U9avNv7nPZVs2y4O9C8s2vS2BGsGiHOKP6FjWi+zREAOa6WZEqHaCXsyyOCErJvkYKImX7U9jOdLlAhAbQ2rYa+KNYLrELv8wU1XLMf6JKGm10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812935; c=relaxed/simple;
	bh=BgBSXeJVvimE5/HYUqHfTSY1rH0cCJnUKKQcj1P+P/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpUzOBQEZeKYYfdtrqtbGR1D9x2RMZ8u9FLpcN/yxWspED83lOlddpZgxna+NsrA94swPix4it7dZlAS/zkECOY1/TT6sXbtvDgRK0vaHVTsbeFNFlRwYp0XxtObresu4M6GcEV7MKzKLlBRwg9C+H1vSwuPxV3xGOk2RZEABEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HdemV5we; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdemV5we"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747812932; x=1779348932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BgBSXeJVvimE5/HYUqHfTSY1rH0cCJnUKKQcj1P+P/E=;
  b=HdemV5we/2jTxioPWD1pt96IdYZfuoVLioQhxqAy7Vg6f8/vLtB+6N4D
   X5wWu7ZRQ3wnaRkfoJG07ef0yRqfiTVAKPuHQhoEqOyMomiYsCT5RroZm
   Y/bLeERBWkLfgReoJ5xFu/90PrmjivqZak0toDgwPgCi2qpN+vdqwWSf7
   qqbUTg8EQvXzQSo3PLLcSHt9dJiDMnP2BMubadCvGo0sHOiGlhs+K/4ax
   gMIcaH8xAFM9AZfQ0WdFWYrgXAO048ZUtvVY568FC1WPdnEZbqGlhRAhy
   6MvMJQOStbyBphGAVkcgiFdpPp/ZRNNt/PmtFJV+XKrNSKuotDOY/j+qB
   w==;
X-CSE-ConnectionGUID: vhDoLVZEQzmcRuLlQDlYzA==
X-CSE-MsgGUID: Mi4vn/SLQvmhqe+J56czNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52403324"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="52403324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 00:35:31 -0700
X-CSE-ConnectionGUID: Jqm2kfVnTn6Ob/rpwV4NVw==
X-CSE-MsgGUID: rzXRQQfPTXmGK5f1rfZMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144680135"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 00:35:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHdz5-000NzU-2H;
	Wed, 21 May 2025 07:35:27 +0000
Date: Wed, 21 May 2025 15:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 16/19] kismet: WARNING: unmet direct
 dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202505211540.RlACNglM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 [16/19] mips: Add EcoNet MIPS platform support
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250521/202505211540.RlACNglM-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250521/202505211540.RlACNglM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211540.RlACNglM-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
