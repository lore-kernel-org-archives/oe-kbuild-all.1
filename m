Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF07219A8D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 03:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764991179; cv=none; b=pkfWLNqBiGrN84/7M+F0SqUFYJdedQLt0z8ONR3XZFqKZvUfYryArhAbqDWZQMZW+3wxSoVCPUwCB2ygGQxCNbwBagNLblPr3QwdNiG0TBOhnIrcJbCoungz80m/xhcIHw38JNcs/SJklUteX7PAqLNbzM00M9qVnopNz9yoQGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764991179; c=relaxed/simple;
	bh=s4jDf/tff2f82UUa/VsZcSZlhUBHV8/t2ywUAHB6Kzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GTba6EO1U2Ot9mlDEOMwaruhjnn+yak5yA8q1T5tv3tDy5DqEtaIyRPKxEhgmLFKpnLr1I+jKfsj+wPklPjAlAMJLnQI5H+coowo8YJncvG29ysq2IynyBrB2LF/Qox9K2wD4b7Rp6yO42vJlgn5J5aO8IT8l5PkCADgHITyFe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biriGyEk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biriGyEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764991178; x=1796527178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4jDf/tff2f82UUa/VsZcSZlhUBHV8/t2ywUAHB6Kzk=;
  b=biriGyEkLa86YrZfBwotOHKiiMgeTirTWoOAHyZg0wvpoOtmh26WYOH+
   6IQp0d2T/n+s53F8PmjlSlNBGJ73JtW0++ZO5SAAjCit2yl466UpwOIlt
   PVpN4uBAINeW1YHXKrry6g39Ww0x6BFmEV9tz/yc7psz5Ryxqq+3+5lxF
   LgCaztX6aR/ziyenPUp6P9ymlIba97eAoVGLQTPGFE19g49KwrFUGJO7x
   4yH4uDKkeZmnPbMbr7kWIlnkx7P2Nm1OhUH8iDflnC8RhjWDjP5NNRr9d
   Qwy2Yrx73H6k2sFu1eFLRrZucihfp/9rckWsPx9WmN6Oz7oLmmaZuhSHI
   g==;
X-CSE-ConnectionGUID: D2aklR9FQymtrk24D9yUFQ==
X-CSE-MsgGUID: 5tl2IgvATDOiShHP10V5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70877762"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="70877762"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 19:19:37 -0800
X-CSE-ConnectionGUID: 13r4MBmKR2iJjT4MwixoyQ==
X-CSE-MsgGUID: VbyvxX5vRBmBLXjCo7OByA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="199929288"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2025 19:19:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRipZ-00000000Fod-2Vwb;
	Sat, 06 Dec 2025 03:19:33 +0000
Date: Sat, 6 Dec 2025 11:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3382/3382] drivers/irqchip/irq-gic-v3.c:829:30:
 warning: 'xint_proc_ops' defined but not used
Message-ID: <202512061109.moN53LxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   06a8b520851290347ca458d4335bebc607fe3b58
commit: a05426a568e457640f58698c8ebd636fcde4d202 [3382/3382] arm64: Introduce Xint software solution
config: arm64-randconfig-r122-20251205 (https://download.01.org/0day-ci/archive/20251206/202512061109.moN53LxE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061109.moN53LxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061109.moN53LxE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:829:30: warning: 'xint_proc_ops' defined but not used [-Wunused-const-variable=]
    static const struct proc_ops xint_proc_ops = {
                                 ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_IOV
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - CRYPTO_DEV_HISI_MIGRATION [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]

sparse warnings: (new ones prefixed by >>)
>> kernel/softirq.c:352:6: sparse: sparse: symbol 'xint_enter_rcu' was not declared. Should it be static?

vim +/xint_proc_ops +829 drivers/irqchip/irq-gic-v3.c

   828	
 > 829	static const struct proc_ops xint_proc_ops = {
   830		.proc_open	= xint_proc_open,
   831		.proc_read	= seq_read,
   832		.proc_lseek	= seq_lseek,
   833		.proc_release	= single_release,
   834		.proc_write	= xint_proc_write,
   835	};
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
