Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06602F3C30
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102822; cv=none; b=VSl9oFUP8C1iQsCMNH1/VA2cX4FK6Hr8TIKRk7OUeLrJ1J6IfytWughSlJjUgWyevducyfuLFN46AjR5r99GRvdSsTyDwf4iag96RJOFblgMzyh3skkjWv/+pIY7JDaAJRz2+sFnEfLp0Dgu6gvmxYC4Z6r63OmR9VJ93R5TLfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102822; c=relaxed/simple;
	bh=3qh3oxsdu7hOpXKor939TGqvawVlWjjgtXczWTu6Fr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eUnCRLR5Dtg9eQDk6dFlH6a5j3eIA/rGHtTZHTQx84Ovix3REL4C3xreMAahln6dmXg+97gxsUzrtUhivJb83Vz/Q2TJq4a8R8ntPsReHXltCc7LF2ruJusyG8YPiGjaj8DCUa00uVDyUI49++9ZnI5SrDS3eMlRs6RPHTCBAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJ9mXebm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJ9mXebm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102820; x=1794638820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3qh3oxsdu7hOpXKor939TGqvawVlWjjgtXczWTu6Fr8=;
  b=iJ9mXebm7b275cibZewk+bcOZxszqSMory01ksUy/PrrJzGexmodt5Kq
   Aa+EsIKScRoyHS/oJfZGiVtq11LeSIjp7ued1b3eajogklKv55LtzsXhr
   CcY0GIT4YBFYwn0ELfkXjqfHgZ8F+bb5wDiNiYWBeqOgjmo+hchDaqEow
   D5I0LCp6r7yZi0ECOT1Axv7BwdmvLBtTZpi/3WkYanqH7NA2jE1nGc9Ih
   2JTCyTcdCC4Fp2Mm2+ULAsHHtaDcj78RWxb2QU24xZcqM30W+EH3sKlQz
   lCKpC99p4x6Nprodkr6U1gX0ocj2B1u3++Oxb8lFQ9fxWNxqCKJfyO88E
   A==;
X-CSE-ConnectionGUID: kqh77l2HTcOQDtBFqbs5Rw==
X-CSE-MsgGUID: VN1ED1tlRv2PWd0Gt8zCEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65227548"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="65227548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:47:00 -0800
X-CSE-ConnectionGUID: iavhMOSiQpmNlQvV4LvuSA==
X-CSE-MsgGUID: /dTJoD51RzWhUctoUCkhzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="193824045"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 22:47:00 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnaD-0006FD-0n;
	Fri, 14 Nov 2025 06:46:57 +0000
Date: Fri, 14 Nov 2025 14:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-numa-sched-domain-ANBZ26672 3/3]
 drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:487:13: warning: variable
 'test_mask' set but not used
Message-ID: <202511141131.bXKpT9fi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-numa-sched-domain-ANBZ26672
head:   bf45c63d740e8e294a0a11035769798525015c5c
commit: 64dd2b7dd0383bf467423b91b0ed9d651a0977b1 [3/3] anolis: pinctrl: Zhaoxin: Add KH-50000 support
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251114/202511141131.bXKpT9fi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141131.bXKpT9fi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141131.bXKpT9fi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_set_gpio_mode_and_pull':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:123:13: warning: variable 'value_back' set but not used [-Wunused-but-set-variable]
     123 |         u16 value_back = 0;
         |             ^~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_get':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:249:13: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     249 |         int pin;
         |             ^~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_set':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:270:13: warning: variable 'pin' set but not used [-Wunused-but-set-variable]
     270 |         int pin;
         |             ^~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_irq_ack':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:330:13: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     330 |         int base_offset = 0;
         |             ^~~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_irq_mask_unmask':
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:363:13: warning: variable 'base_offset' set but not used [-Wunused-but-set-variable]
     363 |         int base_offset = 0;
         |             ^~~~~~~~~~~
   drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c: In function 'zhaoxin_gpio_irq_type':
>> drivers/pinctrl/zhaoxin/pinctrl-zhaoxin.c:487:13: warning: variable 'test_mask' set but not used [-Wunused-but-set-variable]
     487 |         u16 test_mask;
         |             ^~~~~~~~~


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
