Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0238278753
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769972828; cv=none; b=D+aAcBxgCVSArhlj0qJTIwWayEgxE/nyx4H3vNmw5R6NSVXM+GPSJ9UuD+i6sLVC53kNPDU6XoXPib3U3SLhMnVRDB2+4QKa1BNPKsDf1BoXrUrUEmuYmzECS73XdNodJWUEIEJDPQfulUAp+y73GTdGhvEtB8Ff0ghJAbsYRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769972828; c=relaxed/simple;
	bh=HDc8MgK94VWVzVgRm9d6Qx3vZrZMN40UDaueJ4l3KF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVV9dJCkUWaOg33q1uIMQ/WQyu18TiLI/OvlAX3Q6rpWYveCZQmoOnJwhcZ6jA6drZU0z0RxM2qM8Nr51IOIP3dyEqxmFVMXYK+ZeVH6HGDc3+bz+JlAwbIAlsa7CH84ZpcBzNeOfbbWvCBu19YNU/RWggy/nBmP7KbqUbSUJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lT0hLrvm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lT0hLrvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769972827; x=1801508827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HDc8MgK94VWVzVgRm9d6Qx3vZrZMN40UDaueJ4l3KF8=;
  b=lT0hLrvmzXJPAVX7iY5In7NQfckt7EvraEJz6ryAh+Ek6f98jYy9jFhh
   XEyd62L63+6I/J8EDftWCtVgc0PBI3bbkHcVFsY8Ecu7wiP9XpmJvWFKx
   hQwFaEF7prLHYHe0f/BpH/YN8MqDBuZccYeMizAF9PBQZoLKQckklrCol
   KCxG58Y61ToSrPNolhKjjRR/mwGOtBm38GCVGVeq3+Pzb4YRez9M+3qcj
   S6xWLrejR6maLQDS6Db8x2ftyHp586w3RA5G0cLiPksAwrlv5YvDjPCXL
   FLohU6JblOHaP2EiWf97I84rq03pPhEd3sBAMQFCcXre5IV5Y9mi9TbhV
   w==;
X-CSE-ConnectionGUID: LszAfS4yTMig5Mm4oNj4wA==
X-CSE-MsgGUID: P0IBOlVFS0uGISeHbZjoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82255927"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="82255927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 11:07:07 -0800
X-CSE-ConnectionGUID: ugA4nLfWSjyZvYiWt2l5kQ==
X-CSE-MsgGUID: 7tL4sXaqRAS0Y96Yzv4Lsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="209116615"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Feb 2026 11:07:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmcmh-00000000eye-2ywo;
	Sun, 01 Feb 2026 19:06:59 +0000
Date: Mon, 2 Feb 2026 03:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Ion Agorria <ion@agorria.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 4/9] mfd: Add driver for Asus Transformer embedded
 controller
Message-ID: <202602020344.ZGXToDMx-lkp@intel.com>
References: <20260201104343.79231-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201104343.79231-5-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260130]
[also build test WARNING on linus/master v6.19-rc7]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes dtor-input/next dtor-input/for-linus sre-power-supply/for-next v6.19-rc7 v6.19-rc6 v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-misc-document-ASUS-Transformers-EC-Dockram/20260201-184740
base:   next-20260130
patch link:    https://lore.kernel.org/r/20260201104343.79231-5-clamor95%40gmail.com
patch subject: [PATCH v1 4/9] mfd: Add driver for Asus Transformer embedded controller
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260202/202602020344.ZGXToDMx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020344.ZGXToDMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020344.ZGXToDMx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:13,
                    from drivers/mfd/asus-ec.c:7:
   drivers/mfd/asus-ec.c: In function 'asus_ec_read':
>> drivers/mfd/asus-ec.c:107:35: warning: field width specifier '*' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
     107 |         dev_dbg(&priv->self->dev, "EC read: %*ph, ret = %d%s\n",
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/mfd/asus-ec.c:107:9: note: in expansion of macro 'dev_dbg'
     107 |         dev_dbg(&priv->self->dev, "EC read: %*ph, ret = %d%s\n",
         |         ^~~~~~~
   drivers/mfd/asus-ec.c:107:46: note: format string is defined here
     107 |         dev_dbg(&priv->self->dev, "EC read: %*ph, ret = %d%s\n",
         |                                             ~^~
         |                                              |
         |                                              int


vim +107 drivers/mfd/asus-ec.c

   100	
   101	static int asus_ec_read(struct asus_ec_data *priv, bool in_irq)
   102	{
   103		int ret = i2c_smbus_read_i2c_block_data(priv->self, 0x6A,
   104							sizeof(priv->ec_data),
   105							priv->ec_data);
   106	
 > 107		dev_dbg(&priv->self->dev, "EC read: %*ph, ret = %d%s\n",
   108			sizeof(priv->ec_data), priv->ec_data,
   109			ret, in_irq ? "; in irq" : "");
   110	
   111		return ret;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
