Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3B3B7744
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700865; cv=none; b=lTSOGQB4KqUrQrESUnfUcoehGTX+a/bGe3eOpnS7ePhgOpwJlqNmtyfKIItll34pNo1kwPgTmsKwJi5jw4QeAg5gdKllkPzwUPV2UtbHcyXPBdf3rwqHg9UZ344XN13HpPe2tkgINLd8bq7IuPT5L2cah6Vj3u899CgA3vD594Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700865; c=relaxed/simple;
	bh=DWoo+aWQq1YCynJlpufbLapg9lu1c+L6oooK5vEj6UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGBB+uRqnizmlrE1HJgJkoGJE3VvNnW0gxaCO5d1RgS+eH4IpDox6VshPghk/IAhPuYwE+n7RMcjO2ZTngOMAHoaMWJ2t4J7/weCeZURSyNFE0Zu4YTKQkPsu5r9095lS/5l37/R9Ws6NZQVSKeXxu0GdpO0Ub9aqZTRfNXFb8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2CWRBvc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2CWRBvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778700864; x=1810236864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWoo+aWQq1YCynJlpufbLapg9lu1c+L6oooK5vEj6UI=;
  b=l2CWRBvcQDsss1lnMgDlsdT2uVPM55oqeyuz/wXYwRn0+giJumfj8Wbc
   aK76lpUqlx9lcQXzNVZWTA7RhG/Nq44ksTrY0DkgdtUQFtj3QwYNet0XZ
   FywCykrIiT5vAkhds2k8ZQRiwDnwxW/ycV2pKLNBOHBlaiT7OVEx68dgR
   kBGtTXPjMiBhgTdaJHSJJprc3z68bDboF/9UVkluHdh/pL/XCYLSL4LWx
   obV8/h+14jv2j6NB22jeWj7mB+HSzuIGt616HXQtebLlM74Z/TnC34Pe6
   VTlcW0sz4sPxR/4L+H06r/pEIN846V+EQSpCc9IZR0F4E6T5d1LgJCioj
   Q==;
X-CSE-ConnectionGUID: azeW99LYSUyy6imw/3I84w==
X-CSE-MsgGUID: qienetY9QY2XOZJoVw12nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82205409"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="82205409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:34:22 -0700
X-CSE-ConnectionGUID: kG6pWQ7MTFO6maONVv46hQ==
X-CSE-MsgGUID: HjgUY3S7ScCFqYKhrznmew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238415587"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 May 2026 12:34:18 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNFLV-000000004xP-1LOC;
	Wed, 13 May 2026 19:34:17 +0000
Date: Thu, 14 May 2026 03:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, linusw@kernel.org, brgl@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
Message-ID: <202605140349.KZOdtI2I-lkp@intel.com>
References: <20260502210354.160439-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502210354.160439-1-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/gpio-twl4030-Use-guard-mutex-over-manual-locking/20260513-231548
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260502210354.160439-1-m32285159%40gmail.com
patch subject: [PATCH] gpio: twl4030: Use guard(mutex)() over manual locking
config: arc-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140349.KZOdtI2I-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140349.KZOdtI2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140349.KZOdtI2I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpio/gpio-twl4030.c: In function 'twl_get':
>> drivers/gpio/gpio-twl4030.c:310:6: warning: unused variable 'ret' [-Wunused-variable]
     int ret;
         ^~~


vim +/ret +310 drivers/gpio/gpio-twl4030.c

e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  306  
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  307  static int twl_get(struct gpio_chip *chip, unsigned offset)
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  308  {
231a8680b78260f drivers/gpio/gpio-twl4030.c Linus Walleij  2015-12-07  309  	struct gpio_twl4030_priv *priv = gpiochip_get_data(chip);
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20 @310  	int ret;
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  311  	int status = 0;
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  312  
b833f746820a65c drivers/gpio/gpio-twl4030.c Maxwell Doose  2026-05-02  313  	guard(mutex)(&priv->mutex);
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  314  	if (!(priv->usage_count & BIT(offset))) {
b833f746820a65c drivers/gpio/gpio-twl4030.c Maxwell Doose  2026-05-02  315  		return -EPERM;
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  316  	}
72c7901ef00925c drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-06  317  
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  318  	if (priv->direction & BIT(offset))
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  319  		status = priv->out_state & BIT(offset);
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  320  	else
c111feabe2e200b drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-20  321  		status = twl4030_get_gpio_datain(offset);
72c7901ef00925c drivers/gpio/gpio-twl4030.c Peter Ujfalusi 2012-12-06  322  
b833f746820a65c drivers/gpio/gpio-twl4030.c Maxwell Doose  2026-05-02  323  	return (status < 0) ? status : !!status;
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  324  }
e9d359471dfed51 drivers/gpio/twl4030-gpio.c David Brownell 2008-10-20  325  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
