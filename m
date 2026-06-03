Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664AF1E531
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497153; cv=none; b=GH4EY91tSSFr+3exjdAwdM2ekF8V3uitPkhdeIc0IdF56vP5UGproMNj7OAxj+iB5fF2P2ETQJRRF7hE3sAfl0fYcheIS6Eeo+jZD90YPHB/Ohtxy+OkUP0aROExG+qdUSeMWKMslKuq4ktxCJwybqMAowkHcobqXybnI2bdw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497153; c=relaxed/simple;
	bh=xbJm0T8u7QgoWljC3gkJ90UyJ/TgTiMAfHCoV1q6onc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PZ0HLHZQvJW79VAKOviMsmu25QuaeMZPs3vDrIP2nO/61U4+aHBIO2qJcbIYGVhBjjt40G1ybjTUrs/O9jKojpW/SgUoQci8w8mQVt3UgO8mOGWRgsfI9diRMXPZjkGturSSlvkfSk5of8UTG3npuDN01ZXQ9U8ItbCjsorhchk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H4uelcPF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4uelcPF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780497151; x=1812033151;
  h=date:from:to:cc:subject:message-id;
  bh=xbJm0T8u7QgoWljC3gkJ90UyJ/TgTiMAfHCoV1q6onc=;
  b=H4uelcPFWBLIXxN/2hrJcLgDForJyfue4FjLFchRlqULWWsrQD5EZNJs
   UBia0hAYFI+bBGSi43ISDcpGrhxY02iSt2dMD9bQwXq2dSV6hgAFtN0c1
   V+ARNejQ/biKEAxMF8t7ylYH4oHpFknURGcoTH+BgxStE8cdZCxX0Vl9U
   6lhqRTfmB8om2DpVXI01CPcc3VMYi7dz69l17sK+JpfGmmtZRIaSpipxW
   hiNBfO2TYaSi7ILz4nOX9ZGZlyqjc8ZsX2b/sRtb3G1V5tVn9aruax7a4
   P5YKJTQm8fXj5/J+Utx7p4Zyr+J/+YEbqkqTNj1VQDUrinEesOWp02tfn
   g==;
X-CSE-ConnectionGUID: exBPOQ5SQwm397w0iM5jwg==
X-CSE-MsgGUID: X39pKFfFRWGMdjleOSE/0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81166656"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81166656"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 07:32:30 -0700
X-CSE-ConnectionGUID: ZffkNI67RSSi/we80fz6Dg==
X-CSE-MsgGUID: bZdMNOawRbWryKhUTNnMgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="244337625"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2026 07:32:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUmdu-00000000DX4-0wad;
	Wed, 03 Jun 2026 14:32:26 +0000
Date: Wed, 03 Jun 2026 22:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:irq/constify 8/8] kernel/irq/ipi.c:317:33:
 warning: initialization discards 'const' qualifier from pointer target type
Message-ID: <202606032231.CqGIh6FI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/constify
head:   2e8b4859e87ef8229ab12228b5e484171084a127
commit: 2e8b4859e87ef8229ab12228b5e484171084a127 [8/8] genirq/chip: Constify the 'chip' field in irq_data
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260603/202606032231.CqGIh6FI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606032231.CqGIh6FI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606032231.CqGIh6FI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/ipi.c: In function 'ipi_send_single':
>> kernel/irq/ipi.c:317:33: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     317 |         struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
         |                                 ^~~~
   kernel/irq/ipi.c: In function 'ipi_send_mask':
   kernel/irq/ipi.c:338:33: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     338 |         struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
         |                                 ^~~~


vim +/const +317 kernel/irq/ipi.c

3b8e29a82dd16c1 Qais Yousef  2015-12-08  304  
3b8e29a82dd16c1 Qais Yousef  2015-12-08  305  /**
3b8e29a82dd16c1 Qais Yousef  2015-12-08  306   * ipi_send_single - Send an IPI to a single CPU
3b35e7e6daef5a8 Randy Dunlap 2021-08-10  307   * @virq:	Linux IRQ number from irq_reserve_ipi()
3b8e29a82dd16c1 Qais Yousef  2015-12-08  308   * @cpu:	destination CPU, must in the destination mask passed to
3b8e29a82dd16c1 Qais Yousef  2015-12-08  309   *		irq_reserve_ipi()
3b8e29a82dd16c1 Qais Yousef  2015-12-08  310   *
3b35e7e6daef5a8 Randy Dunlap 2021-08-10  311   * Return: %0 on success or negative error number on failure.
3b8e29a82dd16c1 Qais Yousef  2015-12-08  312   */
3b8e29a82dd16c1 Qais Yousef  2015-12-08  313  int ipi_send_single(unsigned int virq, unsigned int cpu)
3b8e29a82dd16c1 Qais Yousef  2015-12-08  314  {
3b8e29a82dd16c1 Qais Yousef  2015-12-08  315  	struct irq_desc *desc = irq_to_desc(virq);
3b8e29a82dd16c1 Qais Yousef  2015-12-08  316  	struct irq_data *data = desc ? irq_desc_get_irq_data(desc) : NULL;
3b8e29a82dd16c1 Qais Yousef  2015-12-08 @317  	struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
3b8e29a82dd16c1 Qais Yousef  2015-12-08  318  
3b8e29a82dd16c1 Qais Yousef  2015-12-08  319  	if (WARN_ON_ONCE(ipi_send_verify(chip, data, NULL, cpu)))
3b8e29a82dd16c1 Qais Yousef  2015-12-08  320  		return -EINVAL;
3b8e29a82dd16c1 Qais Yousef  2015-12-08  321  
3b8e29a82dd16c1 Qais Yousef  2015-12-08  322  	return __ipi_send_single(desc, cpu);
3b8e29a82dd16c1 Qais Yousef  2015-12-08  323  }
3b8e29a82dd16c1 Qais Yousef  2015-12-08  324  EXPORT_SYMBOL_GPL(ipi_send_single);
3b8e29a82dd16c1 Qais Yousef  2015-12-08  325  

:::::: The code at line 317 was first introduced by commit
:::::: 3b8e29a82dd16c1f2061e0b955a71cd36eeb061b genirq: Implement ipi_send_mask/single()

:::::: TO: Qais Yousef <qais.yousef@imgtec.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
