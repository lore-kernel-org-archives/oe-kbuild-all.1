Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758533D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 04:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5i+9UFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700283333; x=1731819333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lXilnGAHY6psY9/cdspD1GbaROMAwLzShVc58G/xI5g=;
  b=O5i+9UFgTmOKoykLIMQC8fppUbsZZs1Pq0nrQSVl4cvq8XGGGdjMPaNt
   9H6H5i0FatTsR+xkdPjql0Q8C9Rdr63ABW2mN3aDiKrLT9f6XxGD/V6X9
   9LFOaTGt2dWJg34admO/JO+Wa1dVZu8jZMkfM5a24LuT3NlTu3rYdpH07
   5roGv2ckjVIf4AHWD6awbAcWiyJagFmMqrey3afXF3zuTuvl5fMaqtUFz
   MnwPDUzoVoAr59rGktzk7ajMW6Afc5xys5CuTDiZ/mKFmf1kxEBxohjn1
   1mnbjZut6MPcOPerAdxPEuThIUhdepInVItprru206dJoGk/sFdrzTfWd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="381793983"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="381793983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 20:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="765792349"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="765792349"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2023 20:55:31 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DMf-0003Wk-0y;
	Sat, 18 Nov 2023 04:55:29 +0000
Date: Sat, 18 Nov 2023 12:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH] mfd: wm831x: Remove redundant forever while loop
Message-ID: <202311181257.FLaZt746-lkp@intel.com>
References: <20231117154037.67676-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117154037.67676-1-mstrozek@opensource.cirrus.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Strozek/mfd-wm831x-Remove-redundant-forever-while-loop/20231117-234810
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20231117154037.67676-1-mstrozek%40opensource.cirrus.com
patch subject: [PATCH] mfd: wm831x: Remove redundant forever while loop
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311181257.FLaZt746-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181257.FLaZt746-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181257.FLaZt746-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mfd/wm831x-auxadc.c: In function 'wm831x_auxadc_read_polled':
>> drivers/mfd/wm831x-auxadc.c:155:23: warning: unused variable 'timeout' [-Wunused-variable]
     155 |         int ret, src, timeout;
         |                       ^~~~~~~


vim +/timeout +155 drivers/mfd/wm831x-auxadc.c

78bb3688ea1830 Mark Brown     2011-06-07  151  
78bb3688ea1830 Mark Brown     2011-06-07  152  static int wm831x_auxadc_read_polled(struct wm831x *wm831x,
78bb3688ea1830 Mark Brown     2011-06-07  153  				     enum wm831x_auxadc input)
78bb3688ea1830 Mark Brown     2011-06-07  154  {
78bb3688ea1830 Mark Brown     2011-06-07 @155  	int ret, src, timeout;
e69b6de181167a Mark Brown     2011-06-02  156  
e69b6de181167a Mark Brown     2011-06-02  157  	mutex_lock(&wm831x->auxadc_lock);
e69b6de181167a Mark Brown     2011-06-02  158  
e69b6de181167a Mark Brown     2011-06-02  159  	ret = wm831x_set_bits(wm831x, WM831X_AUXADC_CONTROL,
e69b6de181167a Mark Brown     2011-06-02  160  			      WM831X_AUX_ENA, WM831X_AUX_ENA);
e69b6de181167a Mark Brown     2011-06-02  161  	if (ret < 0) {
e69b6de181167a Mark Brown     2011-06-02  162  		dev_err(wm831x->dev, "Failed to enable AUXADC: %d\n", ret);
e69b6de181167a Mark Brown     2011-06-02  163  		goto out;
e69b6de181167a Mark Brown     2011-06-02  164  	}
e69b6de181167a Mark Brown     2011-06-02  165  
e69b6de181167a Mark Brown     2011-06-02  166  	/* We force a single source at present */
e69b6de181167a Mark Brown     2011-06-02  167  	src = input;
e69b6de181167a Mark Brown     2011-06-02  168  	ret = wm831x_reg_write(wm831x, WM831X_AUXADC_SOURCE,
e69b6de181167a Mark Brown     2011-06-02  169  			       1 << src);
e69b6de181167a Mark Brown     2011-06-02  170  	if (ret < 0) {
e69b6de181167a Mark Brown     2011-06-02  171  		dev_err(wm831x->dev, "Failed to set AUXADC source: %d\n", ret);
e69b6de181167a Mark Brown     2011-06-02  172  		goto out;
e69b6de181167a Mark Brown     2011-06-02  173  	}
e69b6de181167a Mark Brown     2011-06-02  174  
e69b6de181167a Mark Brown     2011-06-02  175  	ret = wm831x_set_bits(wm831x, WM831X_AUXADC_CONTROL,
e69b6de181167a Mark Brown     2011-06-02  176  			      WM831X_AUX_CVT_ENA, WM831X_AUX_CVT_ENA);
e69b6de181167a Mark Brown     2011-06-02  177  	if (ret < 0) {
e69b6de181167a Mark Brown     2011-06-02  178  		dev_err(wm831x->dev, "Failed to start AUXADC: %d\n", ret);
e69b6de181167a Mark Brown     2011-06-02  179  		goto disable;
e69b6de181167a Mark Brown     2011-06-02  180  	}
e69b6de181167a Mark Brown     2011-06-02  181  
5e253590978d7f Maciej Strozek 2023-11-17  182  	/* If we're not using interrupts then read the
5e253590978d7f Maciej Strozek 2023-11-17  183  	 * interrupt status register
5e253590978d7f Maciej Strozek 2023-11-17  184  	 */
5e253590978d7f Maciej Strozek 2023-11-17  185  	msleep(20);
e69b6de181167a Mark Brown     2011-06-02  186  	ret = wm831x_reg_read(wm831x,
e69b6de181167a Mark Brown     2011-06-02  187  				WM831X_INTERRUPT_STATUS_1);
e69b6de181167a Mark Brown     2011-06-02  188  	if (ret < 0) {
e69b6de181167a Mark Brown     2011-06-02  189  		dev_err(wm831x->dev,
e69b6de181167a Mark Brown     2011-06-02  190  			"ISR 1 read failed: %d\n", ret);
e69b6de181167a Mark Brown     2011-06-02  191  		goto disable;
e69b6de181167a Mark Brown     2011-06-02  192  	}
e69b6de181167a Mark Brown     2011-06-02  193  
e69b6de181167a Mark Brown     2011-06-02  194  	/* Did it complete? */
e69b6de181167a Mark Brown     2011-06-02  195  	if (ret & WM831X_AUXADC_DATA_EINT) {
e69b6de181167a Mark Brown     2011-06-02  196  		wm831x_reg_write(wm831x,
e69b6de181167a Mark Brown     2011-06-02  197  					WM831X_INTERRUPT_STATUS_1,
e69b6de181167a Mark Brown     2011-06-02  198  					WM831X_AUXADC_DATA_EINT);
e69b6de181167a Mark Brown     2011-06-02  199  	} else {
e69b6de181167a Mark Brown     2011-06-02  200  		dev_err(wm831x->dev,
e69b6de181167a Mark Brown     2011-06-02  201  			"AUXADC conversion timeout\n");
e69b6de181167a Mark Brown     2011-06-02  202  		ret = -EBUSY;
e69b6de181167a Mark Brown     2011-06-02  203  		goto disable;
e69b6de181167a Mark Brown     2011-06-02  204  	}
e69b6de181167a Mark Brown     2011-06-02  205  
e69b6de181167a Mark Brown     2011-06-02  206  	ret = wm831x_reg_read(wm831x, WM831X_AUXADC_DATA);
e69b6de181167a Mark Brown     2011-06-02  207  	if (ret < 0) {
e69b6de181167a Mark Brown     2011-06-02  208  		dev_err(wm831x->dev,
e69b6de181167a Mark Brown     2011-06-02  209  			"Failed to read AUXADC data: %d\n", ret);
e69b6de181167a Mark Brown     2011-06-02  210  		goto disable;
e69b6de181167a Mark Brown     2011-06-02  211  	}
e69b6de181167a Mark Brown     2011-06-02  212  
78bb3688ea1830 Mark Brown     2011-06-07  213  	src = ((ret & WM831X_AUX_DATA_SRC_MASK)
e69b6de181167a Mark Brown     2011-06-02  214  	       >> WM831X_AUX_DATA_SRC_SHIFT) - 1;
e69b6de181167a Mark Brown     2011-06-02  215  
e69b6de181167a Mark Brown     2011-06-02  216  	if (src == 14)
e69b6de181167a Mark Brown     2011-06-02  217  		src = WM831X_AUX_CAL;
e69b6de181167a Mark Brown     2011-06-02  218  
e69b6de181167a Mark Brown     2011-06-02  219  	if (src != input) {
e69b6de181167a Mark Brown     2011-06-02  220  		dev_err(wm831x->dev, "Data from source %d not %d\n",
e69b6de181167a Mark Brown     2011-06-02  221  			src, input);
e69b6de181167a Mark Brown     2011-06-02  222  		ret = -EINVAL;
e69b6de181167a Mark Brown     2011-06-02  223  	} else {
78bb3688ea1830 Mark Brown     2011-06-07  224  		ret &= WM831X_AUX_DATA_MASK;
e69b6de181167a Mark Brown     2011-06-02  225  	}
e69b6de181167a Mark Brown     2011-06-02  226  
e69b6de181167a Mark Brown     2011-06-02  227  disable:
e69b6de181167a Mark Brown     2011-06-02  228  	wm831x_set_bits(wm831x, WM831X_AUXADC_CONTROL, WM831X_AUX_ENA, 0);
e69b6de181167a Mark Brown     2011-06-02  229  out:
e69b6de181167a Mark Brown     2011-06-02  230  	mutex_unlock(&wm831x->auxadc_lock);
e69b6de181167a Mark Brown     2011-06-02  231  	return ret;
e69b6de181167a Mark Brown     2011-06-02  232  }
e69b6de181167a Mark Brown     2011-06-02  233  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
