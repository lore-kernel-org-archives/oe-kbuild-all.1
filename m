Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17B12D8DA3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772848603; cv=none; b=WpzkL6e0U83hHDdbx9glkaDVeL39foLcftnb5xfHtdF3WrklIep1dS53EAvo0164/CFeFQzest+fKC0LFvTGXHpiUCvfsfu1BO0gekorHim5VXGmst937gryUIymqkQsCBFUD7KI8Z817S1WvD3gMturf/POKsy7oL9jB/C51EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772848603; c=relaxed/simple;
	bh=4KkiSIkmcsUUjhDsGlgCY3FhirtVFCrYEGWFVmVmz3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FokqZiuAlTeoLtzyC3DE6OKXzGzZSDE6sIE29CGniZkOt2ODBvBIq1Pi4LUHsuNz6asUa5WTChWlUDVFNTkoK8E5wQO6qyQkIGROjV6KsMzVLwdI+NwJrZsrGRmnCSAMe/y2ZwbfgRGKuPzT9QMs+KQEjXEg+f8BV/XERQ9Cr/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Djl1UcW1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Djl1UcW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772848597; x=1804384597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4KkiSIkmcsUUjhDsGlgCY3FhirtVFCrYEGWFVmVmz3I=;
  b=Djl1UcW16YbQIKydB5/EGgHbfaw3CuW1qdA12WbSufh03rH4gRElvUGe
   efxHDWLaSlBEQV2ciqVswclxFDptN1E2gXKsAMQNDODmEH32PTmxoacBj
   gOhjhLYU9dpO6VIN5GwRHt2yQZx0lu+XFVdE8bU69B2I/tU6TWLZlUsCf
   Sg/ZAHuY6ZOWqsoAJqoCgu/9JlNiGclMT6LskY2k/FFQ5s4A0FiHrPHRy
   DZPyd+RnKeApjFqAUzjRXzMh8LQMTDlM5jvUYnmpWvJ9WLJx142tPO8Qk
   60eYW9FsmHo+CNbe0NxsvdLUWQRuoQMbpGxxPVDek5uDntXv8SVuuoVG7
   Q==;
X-CSE-ConnectionGUID: YyvmoVA+R6CbzVJ1fxTLQQ==
X-CSE-MsgGUID: PcAZAPQYQ1ODQN8uF0xt2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="91347071"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="91347071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 17:56:32 -0800
X-CSE-ConnectionGUID: fPUKtHanSNOD/eBAP3RPQQ==
X-CSE-MsgGUID: B6dacdi9RLe28YSS6XQoJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223659731"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 17:56:28 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vygu1-000000001aF-1UhP;
	Sat, 07 Mar 2026 01:56:25 +0000
Date: Sat, 7 Mar 2026 09:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 2/7] mfd: Add driver for ASUS Transformer embedded
 controller
Message-ID: <202603070925.iN0ySWQA-lkp@intel.com>
References: <20260304185751.83494-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304185751.83494-3-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on robh/for-next linus/master v7.0-rc2 next-20260305]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-embedded-controller-document-ASUS-Transformer-EC/20260305-030907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
patch link:    https://lore.kernel.org/r/20260304185751.83494-3-clamor95%40gmail.com
patch subject: [PATCH v5 2/7] mfd: Add driver for ASUS Transformer embedded controller
config: openrisc-randconfig-r134-20260305 (https://download.01.org/0day-ci/archive/20260307/202603070925.iN0ySWQA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070925.iN0ySWQA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070925.iN0ySWQA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/asus-transformer-ec.c:482:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *src @@     got char const [noderef] __user *buf @@
   drivers/mfd/asus-transformer-ec.c:482:36: sparse:     expected void const *src
   drivers/mfd/asus-transformer-ec.c:482:36: sparse:     got char const [noderef] __user *buf
>> drivers/mfd/asus-transformer-ec.c:476:16: sparse: sparse: dereference of noderef expression

vim +482 drivers/mfd/asus-transformer-ec.c

   467	
   468	static int dockram_write_one(struct i2c_client *client, int reg,
   469				     const char __user *buf, size_t count)
   470	{
   471		struct dockram_ec_data *priv = i2c_get_clientdata(client);
   472		int ret;
   473	
   474		if (!count || count > DOCKRAM_ENTRY_SIZE)
   475			return -EINVAL;
 > 476		if (buf[0] != count - 1)
   477			return -EINVAL;
   478	
   479		guard(mutex)(&priv->ctl_lock);
   480	
   481		priv->ctl_data[0] = (u8)count;
 > 482		memcpy(priv->ctl_data + 1, buf, count);
   483		ret = asus_dockram_write(client, reg, priv->ctl_data);
   484	
   485		return ret;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
