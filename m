Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82D91E9915
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766257482; cv=none; b=JoQQcwwPrYN4m8DjuAUL6tUHSrY2zTmgwgmEfgQxpX/TJYatI+ZZOLvG7VYzy50KklIl8mTceZPL8+BudBz0PQIsYAyRb8lRVVKSYcH4upPJyp+PAS/3rRB/vGOxASEkuRfia3o0VqY9pqe6LLY8qpNXyCQbuvekeRX1WLIuGyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766257482; c=relaxed/simple;
	bh=wdhr4/IXNAzUncrm1k6pAaw4TDDtWv8mAeRVrlzswvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcg3Gk0NAQoy+yVi8dZV7H6ShnhK3G5kieA+Nl3OrWhOOTrDoI06M8EkF63263cmeZHiYl1sciHvBZEiHl1JWlme/nedkh0FGvlzxa6lGC6+OgRWAXQ8kAl6iWIK/yppFnhuQ+gF1cOgpQQ6JYLERyFgDVZMLbXFKy+wyVM4DXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0UoNukt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0UoNukt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766257481; x=1797793481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wdhr4/IXNAzUncrm1k6pAaw4TDDtWv8mAeRVrlzswvU=;
  b=A0UoNuktibEpmRcIhwmaFRAfyqso4QhDfc6kJ2pP45gSMnOqzbMBLzGr
   NfjmeunVmSPRklRwHEX4dqpnKMixuXYMaiXaoAxfGd2AzxBiwJVftf/ix
   dWK/tj0y4pgEXUp6VlbmHR9eVlJr+OHUDsJjt5q5mS+H/mJE2xyS0+wQK
   AHW015n7R6kbDdb+VFflNQo09Wtthi8dEEyeFs6YMQGnJqT6H0wDvt5YG
   O/gfjSdwJm1sPsi4PPBdOb2TuN+ReCHKIS8lMQ2bIBlcI1xtfQvpCBad3
   Bb+irzlvkVpZAbHbuVvrTHYZIBn3Sw69WF0bz5yfchKBJGejjIfZFlUox
   A==;
X-CSE-ConnectionGUID: c9gK+uNWS3StwT8CYv+CjA==
X-CSE-MsgGUID: 6coMVfcIQgmV9d7uSLS43Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="93657352"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="93657352"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:04:40 -0800
X-CSE-ConnectionGUID: jTjiAp+USR+znhgzCz0ikQ==
X-CSE-MsgGUID: tqSQVIzoTh+5sryO0QbIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198756445"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2025 11:04:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2Fp-0000000052R-0L4Y;
	Sat, 20 Dec 2025 19:04:37 +0000
Date: Sun, 21 Dec 2025 03:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3560/3560]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:487:6: warning: variable
 'test_mask' set but not used
Message-ID: <202512210228.QnsbClZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 5d01c9ec4f3b95b0629a38d936f69bc05e494cc9 [3560/3560] pinctrl: Zhaoxin: Add KH-50000 support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210228.QnsbClZ7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210228.QnsbClZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210228.QnsbClZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:123:6: warning: variable 'value_back' set but not used [-Wunused-but-set-variable]
     123 |         u16 value_back = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:249:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     249 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:270:6: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     270 |         int pin;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:330:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     330 |         int base_offset = 0;
         |             ^
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:363:6: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     363 |         int base_offset = 0;
         |             ^
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:487:6: warning: variable 'test_mask' set but not used [-Wunused-but-set-variable]
     487 |         u16 test_mask;
         |             ^
   6 warnings generated.


vim +/test_mask +487 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c

   471	
   472	static int zhaoxin_gpio_irq_type(struct irq_data *d, unsigned int type)
   473	{
   474		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
   475		struct zhaoxin_pinctrl *pctrl = gpiochip_get_data(gc);
   476		unsigned int gpio = irqd_to_hwirq(d);
   477		const struct index_cal_array *trigger_cal;
   478		unsigned int pin;
   479		unsigned long flags;
   480		u8 index;
   481		int position, point;
   482		u16 value;
   483		bool isup = true;
   484		bool high_bit = false;
   485		u16 mask = 0;
   486		int bits_num = 0;
 > 487		u16 test_mask;
   488	
   489		trigger_cal = pctrl->pin_topologys->trigger_cal;
   490		pin = zhaoxin_gpio_to_pin(pctrl, irqd_to_hwirq(d), NULL, NULL);
   491		if (type & IRQ_TYPE_EDGE_FALLING)
   492			isup = true;
   493		else if (type & IRQ_TYPE_EDGE_RISING)
   494			isup = true;
   495		else if (type & IRQ_TYPE_LEVEL_LOW)
   496			isup = true;
   497		else if (type & IRQ_TYPE_LEVEL_HIGH)
   498			isup = false;
   499	
   500		zhaoxin_gpio_set_gpio_mode_and_pull(pctrl, pin, isup);
   501	
   502		for (position = 0; position < trigger_cal->size; position++)
   503			if (trigger_cal->cal_array[position] == gpio)
   504				break;
   505		mask = trigger_cal->mask;
   506		bits_num = trigger_cal->bits_num;
   507		index = trigger_cal->index + ALIGN(position + 1, 4) / 4 - 1;
   508		point = position % 4;
   509		if (point > 1)
   510			high_bit = true;
   511	
   512		raw_spin_lock_irqsave(&pctrl->lock, flags);
   513	
   514		value = zx_pad_read16(pctrl, index);
   515	
   516		if ((type & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
   517			if (high_bit) {
   518				point = point - 2;
   519				position = 8;
   520			} else
   521				position = 0;
   522			test_mask = (~(mask << (point * bits_num + position)));
   523			value &= (~(mask << (point * bits_num + position)));
   524			value |= TRIGGER_BOTH_EDGE << (point * bits_num + position);
   525		} else if (type & IRQ_TYPE_EDGE_FALLING) {
   526			if (high_bit) {
   527				point = point - 2;
   528				position = 8;
   529			} else
   530				position = 0;
   531			test_mask = (~(mask << (point * bits_num + position)));
   532			value &= (~(mask << (point * bits_num + position)));
   533			value |= TRIGGER_FALL_EDGE << (point * bits_num + position);
   534		} else if (type & IRQ_TYPE_EDGE_RISING) {
   535			if (high_bit) {
   536				point = point - 2;
   537				position = 8;
   538			} else
   539				position = 0;
   540			test_mask = (~(mask << (point * bits_num + position)));
   541			value &= (~(mask << (point * bits_num + position)));
   542			value |= TRIGGER_RISE_EDGE << (point * bits_num + position);
   543		} else if (type & IRQ_TYPE_LEVEL_LOW) {
   544			if (high_bit) {
   545				point = point - 2;
   546				position = 8;
   547			} else
   548				position = 0;
   549			test_mask = (~(mask << (point * bits_num + position)));
   550			value &= (~(mask << (point * bits_num + position)));
   551			value |= TRIGGER_LOW_LEVEL << (point * bits_num + position);
   552		} else if (type & IRQ_TYPE_LEVEL_HIGH) {
   553			if (high_bit) {
   554				point = point - 2;
   555				position = 8;
   556			} else
   557				position = 0;
   558			test_mask = (~(mask << (point * bits_num + position)));
   559			value &= (~(mask << (point * bits_num + position)));
   560			value |= TRIGGER_HIGH_LEVEL << (point * bits_num + position);
   561		}
   562	
   563		zx_pad_write16(pctrl, index, value);
   564	
   565		if (type & IRQ_TYPE_EDGE_BOTH)
   566			irq_set_handler_locked(d, handle_edge_irq);
   567		else if (type & IRQ_TYPE_LEVEL_MASK)
   568			irq_set_handler_locked(d, handle_level_irq);
   569		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
   570	
   571		return 0;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
