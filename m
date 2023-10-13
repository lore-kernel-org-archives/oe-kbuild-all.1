Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C38C3D017
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLbkB7a0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697173982; x=1728709982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iNJH/rQ0Zioi0fhgaJyWaENiUfZxSbeQhucM3s6E9Jw=;
  b=eLbkB7a0X+iwRSkrr/pccWMhC9OPM7/S/TiC6UK+RNQX9QqFS4lkqk/B
   zJW4sc/DFR47wAUiw0pWXhcfqUmUR20zzckY1PzQxAAjUWjKIUBuYH2TF
   1tysJ9NqE52io5MQfMt2rPTS4bKUH7E9GDqOTGFzJjtB1GXaHc4vAhkwF
   o/vnCx+zWw1/dwS2pRQtUgLEAVlQKjE2VskyO01hCHKcWB0hwnCVC/0lz
   YfBSiNY69fpxnprCSWnUhwcao6MjSpPtnGucwodDuDlar91LE1iQQDCIl
   BP1GdpKM7u1VrGptFvI+yBjQaBOgFitDjBv6qyo078sYs0wcUdvEKzg08
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451585692"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="451585692"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001798113"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1001798113"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 22:13:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrATq-0004MO-0I;
	Fri, 13 Oct 2023 05:12:58 +0000
Date: Fri, 13 Oct 2023 13:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: [brgl:gpio/devel 48/62] drivers/pinctrl/pinctrl-st.c:1326:9: error:
 implicit declaration of function 'st_gpio_direction_input'; did you mean
 'st_gpio_direction_output'?
Message-ID: <202310131321.jDp5kiph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
head:   78853aac42280ea9b48d7abc74b348463cf8588d
commit: e1e2007b6bb0ba0e1bb89235ffde4c0330655c29 [48/62] pinctrl: st: drop the wrapper around pinctrl_gpio_direction_input()
config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131321.jDp5kiph-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131321.jDp5kiph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131321.jDp5kiph-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-st.c: In function 'st_gpio_irq_request_resources':
>> drivers/pinctrl/pinctrl-st.c:1326:9: error: implicit declaration of function 'st_gpio_direction_input'; did you mean 'st_gpio_direction_output'? [-Werror=implicit-function-declaration]
    1326 |         st_gpio_direction_input(gc, d->hwirq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         st_gpio_direction_output
   cc1: some warnings being treated as errors


vim +1326 drivers/pinctrl/pinctrl-st.c

727b0f71a56de6 Srinivas Kandagatla 2014-01-16  1321  
e855fa9a65c407 Patrice Chotard     2017-03-16  1322  static int st_gpio_irq_request_resources(struct irq_data *d)
e855fa9a65c407 Patrice Chotard     2017-03-16  1323  {
e855fa9a65c407 Patrice Chotard     2017-03-16  1324  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
e855fa9a65c407 Patrice Chotard     2017-03-16  1325  
e855fa9a65c407 Patrice Chotard     2017-03-16 @1326  	st_gpio_direction_input(gc, d->hwirq);
e855fa9a65c407 Patrice Chotard     2017-03-16  1327  
c36f8c06ebd0c4 Linus Walleij       2023-04-04  1328  	return gpiochip_reqres_irq(gc, d->hwirq);
e855fa9a65c407 Patrice Chotard     2017-03-16  1329  }
e855fa9a65c407 Patrice Chotard     2017-03-16  1330  

:::::: The code at line 1326 was first introduced by commit
:::::: e855fa9a65c40788b5069abb0d094537daa22e05 pinctrl: st: add irq_request/release_resources callbacks

:::::: TO: Patrice Chotard <patrice.chotard@st.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
