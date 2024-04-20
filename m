Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96B205E26
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 06:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713593134; cv=none; b=fNQPz38s5BMmj4B+nQYKK3+BsfSU5s5qtX4NdeYRYf6FvfWou0JhAZ6HsETSkt6Q8TWcYMiDfhDY0fg/ZluT4eCWjuYjigATURCIerNBiH3/L67jNK5ebzfsjf4Y9hnF3t2+sUwmB0OgujLS/rp4mA3PqLevzDub7OlfZJvU6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713593134; c=relaxed/simple;
	bh=wd2XNwMSKs04CA0Lbueys31oAeHFgJkgDuM6eHsWCRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWivuSLvdOPj7dDHwbD108kCqELtw6R/9rUunkh91Kt/Bv/m1JKwoijYvX7JuPNhVyXmbIzK0+qUasnbVsNO5ja2HChnC6SB35e9VQn3p3T6P21NyEE9i6+fFaV5IABaT+4ZcYARNGJQYidNWSzbCCBYKMub5+7j2CYA3V1329k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXxQ7GBx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXxQ7GBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713593133; x=1745129133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wd2XNwMSKs04CA0Lbueys31oAeHFgJkgDuM6eHsWCRI=;
  b=RXxQ7GBxp0KWqFeQxXQ+F5JomcXbHf4YF9drAwIumP7/qXdX658TpMRf
   qgh4pKSj0T91UTBAFCKFt/9iWAdvJv8/6sd39wM6Vy6fzq+XLUImAZJ6X
   D086shISzekfE5mItYVdQcTg7jqI/1P2SvgmkBUPuUmdVDsm6pCRVQAzO
   74z+JfFQu0wFQ2q5ii7la55nAq/R0vu8qUFgahV5zOKjJjDl5wqlGteCV
   20ED0olzNtr9MB5DDen9CnUbGOMHM/vPtZihqeWIQBi4B01hQVrf3HKpq
   47NkzD5RMWAMP3zZi02dr0cGv4l6cr1N3utmClPwAp+4YruKBfmIizFOw
   w==;
X-CSE-ConnectionGUID: 50I061RnTvy/cg6U8yRXWQ==
X-CSE-MsgGUID: a7CSSkSMQniz5KHCReJ1Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="26723188"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="26723188"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 23:05:32 -0700
X-CSE-ConnectionGUID: 6np1lrx+S2CjmbdbY1Y7ew==
X-CSE-MsgGUID: RGXkY9M1TXmt8mUf4M5fDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="54458968"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Apr 2024 23:05:28 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ry3qm-000Am4-1o;
	Sat, 20 Apr 2024 06:05:24 +0000
Date: Sat, 20 Apr 2024 14:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Pugin <rilian.la.te@ya.ru>
Cc: oe-kbuild-all@lists.linux.dev,
	Konstantin Pugin <ria.freelander@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lech Perczak <lech.perczak@camlingroup.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 3/3] serial: sc16is7xx: add support for EXAR XR20M1172
 UART
Message-ID: <202404201342.vL0TYDQf-lkp@intel.com>
References: <20240419124506.1531035-4-rilian.la.te@ya.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419124506.1531035-4-rilian.la.te@ya.ru>

Hi Konstantin,

kernel test robot noticed the following build errors:

[auto build test ERROR on c6795fbffc4547b40933ec368200bd4926a41b44]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Pugin/serial-sc16is7xx-announce-support-of-SER_RS485_RTS_ON_SEND/20240420-004819
base:   c6795fbffc4547b40933ec368200bd4926a41b44
patch link:    https://lore.kernel.org/r/20240419124506.1531035-4-rilian.la.te%40ya.ru
patch subject: [PATCH v4 3/3] serial: sc16is7xx: add support for EXAR XR20M1172 UART
config: arc-randconfig-002-20240420 (https://download.01.org/0day-ci/archive/20240420/202404201342.vL0TYDQf-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404201342.vL0TYDQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404201342.vL0TYDQf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/sc16is7xx_i2c.c:49:42: error: 'xr20m1172_devtype' undeclared here (not in a function)
      49 |         { "xr20m1172",  (kernel_ulong_t)&xr20m1172_devtype, },
         |                                          ^~~~~~~~~~~~~~~~~
--
>> drivers/tty/serial/sc16is7xx_spi.c:72:42: error: 'xr20m1172_devtype' undeclared here (not in a function)
      72 |         { "xr20m1172",  (kernel_ulong_t)&xr20m1172_devtype, },
         |                                          ^~~~~~~~~~~~~~~~~
--
   {standard input}: Assembler messages:
>> {standard input}:16: Error: symbol `__export_symbol_sc16is762_devtype' is already defined


vim +/xr20m1172_devtype +49 drivers/tty/serial/sc16is7xx_i2c.c

    40	
    41	static const struct i2c_device_id sc16is7xx_i2c_id_table[] = {
    42		{ "sc16is74x",	(kernel_ulong_t)&sc16is74x_devtype, },
    43		{ "sc16is740",	(kernel_ulong_t)&sc16is74x_devtype, },
    44		{ "sc16is741",	(kernel_ulong_t)&sc16is74x_devtype, },
    45		{ "sc16is750",	(kernel_ulong_t)&sc16is750_devtype, },
    46		{ "sc16is752",	(kernel_ulong_t)&sc16is752_devtype, },
    47		{ "sc16is760",	(kernel_ulong_t)&sc16is760_devtype, },
    48		{ "sc16is762",	(kernel_ulong_t)&sc16is762_devtype, },
  > 49		{ "xr20m1172",	(kernel_ulong_t)&xr20m1172_devtype, },
    50		{ }
    51	};
    52	MODULE_DEVICE_TABLE(i2c, sc16is7xx_i2c_id_table);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
