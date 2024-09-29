Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2EC127E18
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727640114; cv=none; b=Vg04M2kemE+n71r3IOVoLXygNxkR6yaOXMiMrZbBBUTNAlXGMH79aaHGfseDHPvLOt/NoQD0Wq5pX5/Cc1xzOmpj9qwBqpXKhhJDlMT/m2ob4A3hK6Wg6nn8uuWFqgGIyMMyk9mKSfipP5QhzHhBksUxaDqOSy7Jiky8U2uQbqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727640114; c=relaxed/simple;
	bh=kb4MRuMo21exDgB1t0gD/BlEG79A41GISXfIrdINjf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6to831mXoAfCnF1stGSy4K7j9iZQhsD8PPDMcjzzZha5ls2cxcre6xmuDBwK4A7OH5II//vGMRCMCXZiHJG7pGiS6bcSTv0PmZ9AD5GHb8VtLEYtFHRlsFjHejPcuqZDotu333wzVkbsmZAKVKPmgQkv1tbg38xMtsuyLtdYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfX2fmnU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfX2fmnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727640113; x=1759176113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kb4MRuMo21exDgB1t0gD/BlEG79A41GISXfIrdINjf8=;
  b=jfX2fmnUhPkfzFblIFBtaTyubbqsBldOmZJB18iiz17adtU0Q7bcT2BH
   k7wdCxD6/tEw78iAlR7UALC6vHUJjWKyu9uIpypleRbTc2+waznlyzpFS
   +qCtDadwoe1yxZBzDEAj5hiOuzd/cuPb5bqGVirYlI1CmBDZYZxlAV47o
   m9mlgm/ycpaVrwVdwr9+dHJ8yL+8tW02iF7UWWyPHS+mEamGsb7trWdt0
   BsPN/l3LIYW44BTauurgKr53+6yfCdiq0ExzkxkTiV8PO1qXoeHtrqfWt
   gXuWw7iafC6thIPzA5V6d/LEkMWLjEItB5r5+B3dYUfzg7KXH1Au3kRJI
   Q==;
X-CSE-ConnectionGUID: Iu2O2OgPSAao/8weKYFxAw==
X-CSE-MsgGUID: kkhjOG1mT/K3QTGAgOL7ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26849098"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26849098"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:01:52 -0700
X-CSE-ConnectionGUID: UUEd4yT1SzS8Xy+uF04BKA==
X-CSE-MsgGUID: eRxoAbNETJ6D7j0l/RmeUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="110573954"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Sep 2024 13:01:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv072-000Oed-2V;
	Sun, 29 Sep 2024 20:01:48 +0000
Date: Mon, 30 Sep 2024 04:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw-conversion 5/14] include/linux/irq.h:1300:25:
 warning: overflow in conversion from 'long unsigned int' to 'int' changes
 value from '18446744073709551615' to '-1'
Message-ID: <202409300351.ocoRQDuB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw-conversion
head:   d8f775093f32be0f662a6093041d941d372d4830
commit: 6a5d4ac02d5c62d620ab4bc46c1cebf0cfe64436 [5/14] Input: adp5589-keys: support gpi key events as 'gpio keys'
config: x86_64-buildonly-randconfig-004-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300351.ocoRQDuB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300351.ocoRQDuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300351.ocoRQDuB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/keyboard/adp5589-keys.c:13:
   drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpiomap_get_hwirq':
>> include/linux/irq.h:1300:25: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
    1300 | #define INVALID_HWIRQ   (~0UL)
         |                         ^
   drivers/input/keyboard/adp5589-keys.c:639:16: note: in expansion of macro 'INVALID_HWIRQ'
     639 |         return INVALID_HWIRQ;
         |                ^~~~~~~~~~~~~


vim +1300 include/linux/irq.h

2f75d9e1c90511 Thomas Gleixner 2017-09-13  1298  
d17bf24e695290 Qais Yousef     2015-12-08  1299  /* Contrary to Linux irqs, for hardware irqs the irq number 0 is valid */
d17bf24e695290 Qais Yousef     2015-12-08 @1300  #define INVALID_HWIRQ	(~0UL)
f9bce791ae2a1a Qais Yousef     2015-12-08  1301  irq_hw_number_t ipi_get_hwirq(unsigned int irq, unsigned int cpu);
3b8e29a82dd16c Qais Yousef     2015-12-08  1302  int __ipi_send_single(struct irq_desc *desc, unsigned int cpu);
3b8e29a82dd16c Qais Yousef     2015-12-08  1303  int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest);
3b8e29a82dd16c Qais Yousef     2015-12-08  1304  int ipi_send_single(unsigned int virq, unsigned int cpu);
3b8e29a82dd16c Qais Yousef     2015-12-08  1305  int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
d17bf24e695290 Qais Yousef     2015-12-08  1306  

:::::: The code at line 1300 was first introduced by commit
:::::: d17bf24e695290d3fe7943aca52ab48098a10653 genirq: Add a new generic IPI reservation code to irq core

:::::: TO: Qais Yousef <qais.yousef@imgtec.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
