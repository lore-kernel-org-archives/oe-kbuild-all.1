Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE038FA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 03:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771039928; cv=none; b=ZPyUj3MXl+K7vqFUbt5coyWcxa2JKuiObWc1LId+QTs3EIKO4y4VclswYNSjSXp5w1TZyxsadPA9dvulEVC/YLSEQhfwfT42W02+qwmJ+oPCADsjDFLNejMlRGEDRrPt2EXe4j1GbgN31sKf3LcoSeHl2m2MGvpQ9hOj3rgBOFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771039928; c=relaxed/simple;
	bh=U3pUb296i9/MZQYXO8lY4GwoM7u/X22XjaMUXLwbSxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tsd8SBl7S63xW0BvGbJ6DMnXdHrVUd0NSLyc6G/e/4T5WEibnWfLniN/vNjc3wrzIiK7gUPJx0piF4wAzjFNLBbEdVsmI7ewCmhRoF7bhVRhpz/SaL2w/u10wT4chwTAx1DuMhnNkJnAJayJ6ZwZkwAkPgA8eXz9VcbO24/nPhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVhF4l5l; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVhF4l5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771039927; x=1802575927;
  h=date:from:to:cc:subject:message-id;
  bh=U3pUb296i9/MZQYXO8lY4GwoM7u/X22XjaMUXLwbSxU=;
  b=DVhF4l5lB3e39khJKxNBsjwUaIZxxintyIScMfnZ6SN8Q7fwr5iu+/1k
   +b4AN0dBDAFWEcdRG9ynbStFIgDm5DUggKeRVMvFgfrdPLkvLjXMRu3kP
   7NxZhlUbULmw1wLo/gi7TYqNPG3JiJjGe7VWPYGizZTzPRqjwycfbZKpv
   3k/nQ6nSmQPdRFGtNyS/qqjwl+hUWhelWsfpURHY2+PJOh7Ho+hlaPr/I
   cn8owkXJ+zMzCbdauvUGOD/PAzUNkGBPh1yfKC5GDxyIsBsA4Bs07Wcw7
   zJzzaxuJdzT0Yjk9jCwmkCbtDqaFKGvVYp2+k4i3fdOr6mdyzqHCPKAY7
   g==;
X-CSE-ConnectionGUID: 4AuS5NiATJy4h2fYZ42lhQ==
X-CSE-MsgGUID: 9JgtKuPnTWmBtoHdUj/Qtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72293739"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72293739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 19:32:06 -0800
X-CSE-ConnectionGUID: QsW+TK6SRoSrQq+ft45YXg==
X-CSE-MsgGUID: JiXyJB+ZTd6dvuG07fAkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="236078610"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2026 19:32:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr6O3-00000000w8I-03uI;
	Sat, 14 Feb 2026 03:32:03 +0000
Date: Sat, 14 Feb 2026 11:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Laszczak <pawell@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/cdns3/cdnsp-gadget.c:159:9: sparse: sparse: cast
 from restricted __le32
Message-ID: <202602141123.IHT5qoHR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f50822fd8675c68d294e89bd102f7b487ca3acd3
commit: 241e2ce88e5a494be7a5d44c0697592f1632fbee usb: cdnsp: Fix issue with resuming from L1
date:   10 months ago
config: riscv-randconfig-r131-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141123.IHT5qoHR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141123.IHT5qoHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141123.IHT5qoHR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/cdns3/cdnsp-gadget.c:157:16: sparse: sparse: cast to restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:159:9: sparse: sparse: cast from restricted __le32

vim +159 drivers/usb/cdns3/cdnsp-gadget.c

   141	
   142	static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
   143	{
   144		struct cdns *cdns = dev_get_drvdata(pdev->dev);
   145		__le32 __iomem *reg;
   146		void __iomem *base;
   147		u32 offset = 0;
   148		u32 val;
   149	
   150		if (!cdns->override_apb_timeout)
   151			return;
   152	
   153		base = &pdev->cap_regs->hc_capbase;
   154		offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
   155		reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
   156	
   157		val  = le32_to_cpu(readl(reg));
   158		val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
 > 159		writel(cpu_to_le32(val), reg);
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
