Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE0EEBA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762079840; cv=none; b=sPLFpnAHX6/OfOzSoJbydEX2hT9kVVaUlkUolJVD9fha4+LuS0CxLVOYQcP9uqOhhz00jIri7XpIvKq39QxgJrtHpgfOXNG2zneyEXST2XVjLrNiLHSt14SnSdcyGoM0gMPRM6uX53Zsq/JBP1vOFkYu10FhG+oTHNN0Gq0Do0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762079840; c=relaxed/simple;
	bh=Zm9BeSHL1qychFDqQd/khDdDlVacxTmEaFnSv6CYI2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oMyVJr7Y5nEJ9UgLYdEfFn3/z24YtLrsgwXC/XqsvaWLE7QuLxkndVl+DQIk+oe05TmjnANpUFcHyRC4nzx/QiTPjW8PKqctJHbLUbvU/4TzrTKWFijb+uioJEitwpbYg+z6A65EkjnHG9i1zYxnhsCgWX5UC3gVbXdxF6tJcwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ctgu4ySw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ctgu4ySw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762079839; x=1793615839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zm9BeSHL1qychFDqQd/khDdDlVacxTmEaFnSv6CYI2U=;
  b=Ctgu4ySw/3t3HA3NSmKa6k1kRYZDtG0fkbTF0/4P+Z/JmdR93tSXvZgh
   d0ckEviqBY3/vrsiZKRQYX6UVl5wpVXSY4GF9xgpOXp4fQ7ZeuezUMnm+
   eyQdOLR8jWCz+IEIrlHk8vZC7w9gcKBqy54p+LM52wKF89uod1QfPyS/Q
   udjWkHaSWZFRQHp7gpjX6MEfvlnuez4xKm3pyYmjui0iveVBel4+IgeBt
   rK56LYbZcu56yN5FCL9jdpzuv7OdbF9KTZpYMFbJKP74xzQ649KnGE8ZL
   tFbtyPkQkq6pN8lnP7yF5U5tei9MHNY+KUzUClQd35/Pjr+fwvApyE+AY
   Q==;
X-CSE-ConnectionGUID: HsYGQEviQXKhAhv8tPejsQ==
X-CSE-MsgGUID: D98UEgKnRZOWgPLvtBTA5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="89642625"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="89642625"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 02:37:18 -0800
X-CSE-ConnectionGUID: S3MzMhQ6Rf6Z+TjE0MJ1Hg==
X-CSE-MsgGUID: bd4Pmx/nS52Hc1LvESc3pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="187351454"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Nov 2025 02:37:17 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFVSV-000P9t-0i;
	Sun, 02 Nov 2025 10:37:15 +0000
Date: Sun, 2 Nov 2025 18:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 35/35] drivers/irqchip/irq-renesas-rzg2l.c:86:1:
 warning: useless storage class specifier in empty declaration
Message-ID: <202511021827.IIXE4y2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   1437bc669bcbba8be779d0aa04d07949d2c938c9
commit: 1437bc669bcbba8be779d0aa04d07949d2c938c9 [35/35] irqchip/renesas-rzg2l: Use contextual data instead of global variable
config: nios2-randconfig-r072-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021827.IIXE4y2S-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021827.IIXE4y2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021827.IIXE4y2S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-renesas-rzg2l.c:86:1: warning: useless storage class specifier in empty declaration
      86 | };
         | ^
>> drivers/irqchip/irq-renesas-rzg2l.c:436:23: warning: 'rzg2l_irqc_syscore' defined but not used [-Wunused-variable]
     436 | static struct syscore rzg2l_irqc_syscore = {
         |                       ^~~~~~~~~~~~~~~~~~
--
>> Warning: drivers/irqchip/irq-renesas-rzg2l.c:85 struct member 'syscore' not described in 'rzg2l_irqc_priv'


vim +86 drivers/irqchip/irq-renesas-rzg2l.c

    70	
    71	/**
    72	 * struct rzg2l_irqc_priv - IRQ controller private data structure
    73	 * @base:	Controller's base address
    74	 * @irqchip:	Pointer to struct irq_chip
    75	 * @fwspec:	IRQ firmware specific data
    76	 * @lock:	Lock to serialize access to hardware registers
    77	 * @cache:	Registers cache for suspend/resume
    78	 */
    79	static struct rzg2l_irqc_priv {
    80		void __iomem			*base;
    81		const struct irq_chip		*irqchip;
    82		struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
    83		raw_spinlock_t			lock;
    84		struct rzg2l_irqc_reg_cache	cache;
  > 85		struct syscore			syscore;
  > 86	};
    87	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
