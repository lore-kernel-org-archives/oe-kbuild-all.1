Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB022A1CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 09:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883577; cv=none; b=bvJYZwM1LEFLgqgn/PY+KF9csFvjY+IUGpQAf0J5DJrjpq+aJGdWmEgkwZtDRFWQr+NTfEgVsCOTiWEJ0INUUHBCD573eCZTkPnYwlSg+SDSqrpZHVDL07mE7Ra74s9SUdRVSgF2z5pmhDvMQenxTBmf2PYR5x6BmwTePe6awMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883577; c=relaxed/simple;
	bh=AFSFimf4QNB8NkVhmFl1OjxBpEmH5LclSUipq7n8Fg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/+GTsnYZNSixNoVHH/cRWYIhEYgKKmY2oLQ+FdTc6oY22prg9duPK0dbYT3+ZAdFc2FYdxEBNk1XvMZfZe3MWKl8JyYCS11ojrelSBzoo+cX27ibVC9sSWVLWEUIH6h4NMmGsIdLENZGQtv+FYn9NxboY6xgvUvUKDfiPqzFNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTAoK1QT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTAoK1QT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744883575; x=1776419575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AFSFimf4QNB8NkVhmFl1OjxBpEmH5LclSUipq7n8Fg8=;
  b=WTAoK1QTXpnbdLtWjBlsZlriF2Dxg8TlVqGfm9jPjiyCpy5JGvDIaSeh
   iQD9mOkYyPdXic3aNE/elgXLU4wgjPn4cFWexpbzm9LMWUd5xl0/HJyR6
   PS6lxN5kM8kSMNJ6WLMvrsnuHnGYcxi7A5Efsvgu2kvLSG3Yr4K7x7spW
   r5nvlckEiM/eSZDFyOhkJMlzrBXT0vHlnCIqF/hClC7subiMNcIZ1E+86
   ojOhvoo4RbPUdNAdzNXgBy3PdhUZ5LUK38KB/JsfWgvyudT1zZ5EP9eyz
   R6qxa4eYwFnRdWoUTf1zTW8fjfh5L0jBmfuzkc1P74sHz+B4ShRyr1Y/L
   Q==;
X-CSE-ConnectionGUID: aLOPfEIRQ3+udx6Iw1rn1g==
X-CSE-MsgGUID: ZLUCGJEEQViACcwTXAh/xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46591058"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46591058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:52:53 -0700
X-CSE-ConnectionGUID: iqqnudJlQMiuDjZAbZFLEQ==
X-CSE-MsgGUID: RJnKb3/OThuJfMPyNNLgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131074408"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 02:52:51 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5LvN-000MH6-1e;
	Thu, 17 Apr 2025 09:52:49 +0000
Date: Thu, 17 Apr 2025 17:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4489/4779] include/asm-generic/io.h:596:15:
 error: call to '_outb' declared with attribute error: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202504171704.Err7oCDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc8aa6cdadcc00862f2b5720e5de2e17f696a081
commit: f031312c8e1903859a3a2a58ab5a3f97ba8b0ae9 [4489/4779] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250417/202504171704.Err7oCDu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171704.Err7oCDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171704.Err7oCDu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/io.h:93,
                    from include/linux/io.h:12,
                    from drivers/gpio/gpio-f7188x.c:16:
   drivers/gpio/gpio-f7188x.c: In function 'superio_enter':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:135:9: note: in expansion of macro 'outb'
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:136:9: note: in expansion of macro 'outb'
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
   drivers/gpio/gpio-f7188x.c: In function 'superio_inb':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:104:9: note: in expansion of macro 'outb'
     104 |         outb(reg, base);
         |         ^~~~
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/gpio/gpio-f7188x.c:105:16: note: in expansion of macro 'inb'
     105 |         return inb(base + 1);
         |                ^~~
   drivers/gpio/gpio-f7188x.c: In function 'superio_inw':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:112:9: note: in expansion of macro 'outb'
     112 |         outb(reg++, base);
         |         ^~~~
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/gpio/gpio-f7188x.c:113:15: note: in expansion of macro 'inb'
     113 |         val = inb(base + 1) << 8;
         |               ^~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:114:9: note: in expansion of macro 'outb'
     114 |         outb(reg, base);
         |         ^~~~
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/gpio/gpio-f7188x.c:115:16: note: in expansion of macro 'inb'
     115 |         val |= inb(base + 1);
         |                ^~~
   drivers/gpio/gpio-f7188x.c: In function 'superio_exit':
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:149:9: note: in expansion of macro 'outb'
     149 |         outb(SIO_LOCK_KEY, base);
         |         ^~~~
   In function 'superio_enter',
       inlined from 'f7188x_gpio_get_direction' at drivers/gpio/gpio-f7188x.c:295:8:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:135:9: note: in expansion of macro 'outb'
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:136:9: note: in expansion of macro 'outb'
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
   In function 'superio_select',
       inlined from 'f7188x_gpio_get_direction' at drivers/gpio/gpio-f7188x.c:298:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:143:9: note: in expansion of macro 'outb'
     143 |         outb(SIO_LDSEL, base);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:144:9: note: in expansion of macro 'outb'
     144 |         outb(ld, base + 1);
         |         ^~~~
   In function 'superio_inb',
       inlined from 'f7188x_gpio_get_direction' at drivers/gpio/gpio-f7188x.c:300:8:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:104:9: note: in expansion of macro 'outb'
     104 |         outb(reg, base);
         |         ^~~~
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/gpio/gpio-f7188x.c:105:16: note: in expansion of macro 'inb'
     105 |         return inb(base + 1);
         |                ^~~
   In function 'superio_exit',
       inlined from 'f7188x_gpio_get_direction' at drivers/gpio/gpio-f7188x.c:302:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:149:9: note: in expansion of macro 'outb'
     149 |         outb(SIO_LOCK_KEY, base);
         |         ^~~~
   In function 'superio_enter',
       inlined from 'f7188x_gpio_direction_in' at drivers/gpio/gpio-f7188x.c:320:8:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:135:9: note: in expansion of macro 'outb'
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:136:9: note: in expansion of macro 'outb'
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
   In function 'superio_select',
       inlined from 'f7188x_gpio_direction_in' at drivers/gpio/gpio-f7188x.c:323:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:143:9: note: in expansion of macro 'outb'
     143 |         outb(SIO_LDSEL, base);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:144:9: note: in expansion of macro 'outb'
     144 |         outb(ld, base + 1);
         |         ^~~~
   In function 'superio_inb',
       inlined from 'f7188x_gpio_direction_in' at drivers/gpio/gpio-f7188x.c:325:8:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:104:9: note: in expansion of macro 'outb'
     104 |         outb(reg, base);
         |         ^~~~
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/gpio/gpio-f7188x.c:105:16: note: in expansion of macro 'inb'
     105 |         return inb(base + 1);
         |                ^~~
   In function 'superio_outb',
       inlined from 'f7188x_gpio_direction_in' at drivers/gpio/gpio-f7188x.c:331:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:122:9: note: in expansion of macro 'outb'
     122 |         outb(reg, base);
         |         ^~~~
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:123:9: note: in expansion of macro 'outb'
     123 |         outb(val, base + 1);
         |         ^~~~
   In function 'superio_exit',
       inlined from 'f7188x_gpio_direction_in' at drivers/gpio/gpio-f7188x.c:333:2:
>> include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:149:9: note: in expansion of macro 'outb'
     149 |         outb(SIO_LOCK_KEY, base);
         |         ^~~~
   In function 'superio_enter',
       inlined from 'f7188x_gpio_set' at drivers/gpio/gpio-f7188x.c:401:8:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:135:9: note: in expansion of macro 'outb'
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:136:9: note: in expansion of macro 'outb'
     136 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
   In function 'superio_select',
       inlined from 'f7188x_gpio_set' at drivers/gpio/gpio-f7188x.c:404:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:143:9: note: in expansion of macro 'outb'
     143 |         outb(SIO_LDSEL, base);
         |         ^~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:144:9: note: in expansion of macro 'outb'
     144 |         outb(ld, base + 1);
         |         ^~~~
   In function 'superio_inb',
       inlined from 'f7188x_gpio_set' at drivers/gpio/gpio-f7188x.c:406:13:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:104:9: note: in expansion of macro 'outb'
     104 |         outb(reg, base);
         |         ^~~~
   include/asm-generic/io.h:542:14: error: call to '_inb' declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
     542 | #define _inb _inb
   include/asm-generic/io.h:643:13: note: in expansion of macro '_inb'
     643 | #define inb _inb
         |             ^~~~
   drivers/gpio/gpio-f7188x.c:105:16: note: in expansion of macro 'inb'
     105 |         return inb(base + 1);
         |                ^~~
   In function 'superio_outb',
       inlined from 'f7188x_gpio_set' at drivers/gpio/gpio-f7188x.c:411:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:122:9: note: in expansion of macro 'outb'
     122 |         outb(reg, base);
         |         ^~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:123:9: note: in expansion of macro 'outb'
     123 |         outb(val, base + 1);
         |         ^~~~
   In function 'superio_exit',
       inlined from 'f7188x_gpio_set' at drivers/gpio/gpio-f7188x.c:413:2:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:149:9: note: in expansion of macro 'outb'
     149 |         outb(SIO_LOCK_KEY, base);
         |         ^~~~
   In function 'superio_enter',
       inlined from 'f7188x_gpio_set_config' at drivers/gpio/gpio-f7188x.c:429:8:
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
     596 | #define _outb _outb
   include/asm-generic/io.h:655:14: note: in expansion of macro '_outb'
     655 | #define outb _outb
         |              ^~~~~
   drivers/gpio/gpio-f7188x.c:135:9: note: in expansion of macro 'outb'
     135 |         outb(SIO_UNLOCK_KEY, base);
         |         ^~~~
   include/asm-generic/io.h:596:15: error: call to '_outb' declared with attribute error: outb() requires CONFIG_HAS_IOPORT
..


vim +/_outb +596 include/asm-generic/io.h

9216efafc52ff9 Thierry Reding  2014-10-01  576  
f009c89df79abe John Garry      2020-03-28  577  #if !defined(inl) && !defined(_inl)
f009c89df79abe John Garry      2020-03-28 @578  #define _inl _inl
6f043e75744596 Niklas Schnelle 2024-10-24  579  #ifdef CONFIG_HAS_IOPORT
214ba3584b2e2c Stafford Horne  2020-07-26  580  static inline u32 _inl(unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  581  {
87fe2d543f8173 Sinan Kaya      2018-04-05  582  	u32 val;
87fe2d543f8173 Sinan Kaya      2018-04-05  583  
87fe2d543f8173 Sinan Kaya      2018-04-05  584  	__io_pbr();
c1d55d50139bea Stafford Horne  2020-07-29  585  	val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
abbbbc83a210e9 Will Deacon     2019-02-22  586  	__io_par(val);
87fe2d543f8173 Sinan Kaya      2018-04-05  587  	return val;
9216efafc52ff9 Thierry Reding  2014-10-01  588  }
6f043e75744596 Niklas Schnelle 2024-10-24  589  #else
6f043e75744596 Niklas Schnelle 2024-10-24  590  u32 _inl(unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  591  	__compiletime_error("inl() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  592  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  593  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  594  
f009c89df79abe John Garry      2020-03-28  595  #if !defined(outb) && !defined(_outb)
f009c89df79abe John Garry      2020-03-28 @596  #define _outb _outb
6f043e75744596 Niklas Schnelle 2024-10-24  597  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  598  static inline void _outb(u8 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  599  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  600  	__io_pbw();
a7851aa54c0cdd Sinan Kaya      2018-04-05  601  	__raw_writeb(value, PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  602  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  603  }
6f043e75744596 Niklas Schnelle 2024-10-24  604  #else
6f043e75744596 Niklas Schnelle 2024-10-24  605  void _outb(u8 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  606  	__compiletime_error("outb() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  607  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  608  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  609  
f009c89df79abe John Garry      2020-03-28  610  #if !defined(outw) && !defined(_outw)
f009c89df79abe John Garry      2020-03-28  611  #define _outw _outw
6f043e75744596 Niklas Schnelle 2024-10-24  612  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  613  static inline void _outw(u16 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  614  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  615  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  616  	__raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  617  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  618  }
6f043e75744596 Niklas Schnelle 2024-10-24  619  #else
6f043e75744596 Niklas Schnelle 2024-10-24  620  void _outw(u16 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  621  	__compiletime_error("outw() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  622  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  623  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  624  
f009c89df79abe John Garry      2020-03-28  625  #if !defined(outl) && !defined(_outl)
f009c89df79abe John Garry      2020-03-28 @626  #define _outl _outl
6f043e75744596 Niklas Schnelle 2024-10-24  627  #ifdef CONFIG_HAS_IOPORT
f009c89df79abe John Garry      2020-03-28  628  static inline void _outl(u32 value, unsigned long addr)
9216efafc52ff9 Thierry Reding  2014-10-01  629  {
a7851aa54c0cdd Sinan Kaya      2018-04-05  630  	__io_pbw();
c1d55d50139bea Stafford Horne  2020-07-29  631  	__raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
a7851aa54c0cdd Sinan Kaya      2018-04-05  632  	__io_paw();
9216efafc52ff9 Thierry Reding  2014-10-01  633  }
6f043e75744596 Niklas Schnelle 2024-10-24  634  #else
6f043e75744596 Niklas Schnelle 2024-10-24  635  void _outl(u32 value, unsigned long addr)
6f043e75744596 Niklas Schnelle 2024-10-24  636  	__compiletime_error("outl() requires CONFIG_HAS_IOPORT");
6f043e75744596 Niklas Schnelle 2024-10-24  637  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  638  #endif
9216efafc52ff9 Thierry Reding  2014-10-01  639  

:::::: The code at line 596 was first introduced by commit
:::::: f009c89df79abea5f5244b8135a205f7d4352f86 io: Provide _inX() and _outX()

:::::: TO: John Garry <john.garry@huawei.com>
:::::: CC: Wei Xu <xuwei5@hisilicon.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
