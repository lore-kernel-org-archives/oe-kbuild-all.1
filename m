Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F260D1C17
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W549IWFl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697272485; x=1728808485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qoiUgyamFSDBfD+7QNhF36XhvWshjKit48vGV/MkrRI=;
  b=W549IWFl2npVtJZU0jfEg/KfIjUk/qD2EvBRQeoKyAt/+yZBXseArWh6
   3EED3JoNA5qrsdcaO7xWAYQ+WAAu2AF7To+QOVisVYnehQteAqD4DWNo8
   OvH3ED+WLWT01kpt2IH5V1g6/qgOXaOZBzkMM8a7To2pbkWyGvIrXMa3X
   2H8KxJBEJZuIciiUa8atTgd8XaqQycaVpoRUwReq4Y5ubB0v3a9egqcY3
   uhRMDIBh55oQK+ALsKgz+8eguwsuYgwpjdak784a1GBnnoN8FWFM48e6a
   bwbnisp1CGHVTyFJ/19gPaYY8GlPL6l3LdV8wkV5gAHvjYr5fNxpe+JYH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="389172515"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389172515"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 01:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871400489"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871400489"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 01:34:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qra6Y-0005tz-2U;
	Sat, 14 Oct 2023 08:34:38 +0000
Date: Sat, 14 Oct 2023 16:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 38/62] treewide: rename pinctrl_gpio_free_new()
Message-ID: <202310141624.Je7U4v7T-lkp@intel.com>
References: <20231011120830.49324-39-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011120830.49324-39-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231011]
[cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next brgl/gpio/for-next geert-renesas-drivers/renesas-pinctrl v6.6-rc5 v6.6-rc4 v6.6-rc3 linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/pinctrl-remove-unneeded-extern-specifiers-from-consumer-h/20231011-202505
base:   next-20231011
patch link:    https://lore.kernel.org/r/20231011120830.49324-39-brgl%40bgdev.pl
patch subject: [PATCH v2 38/62] treewide: rename pinctrl_gpio_free_new()
config: um-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141624.Je7U4v7T-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141624.Je7U4v7T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141624.Je7U4v7T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-cdev.c:22:
   include/linux/pinctrl/consumer.h:76:1: error: conflicting types for 'pinctrl_gpio_can_use_line'
      76 | pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:70:20: note: previous definition of 'pinctrl_gpio_can_use_line' was here
      70 | static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:87:1: error: conflicting types for 'pinctrl_gpio_request'
      87 | pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:81:19: note: previous definition of 'pinctrl_gpio_request' was here
      81 | static inline int pinctrl_gpio_request(unsigned gpio)
         |                   ^~~~~~~~~~~~~~~~~~~~
>> include/linux/pinctrl/consumer.h:97:1: error: conflicting types for 'pinctrl_gpio_free'
      97 | pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:92:20: note: previous definition of 'pinctrl_gpio_free' was here
      92 | static inline void pinctrl_gpio_free(unsigned gpio)
         |                    ^~~~~~~~~~~~~~~~~


vim +/pinctrl_gpio_free +97 include/linux/pinctrl/consumer.h

    95	
    96	static inline void
  > 97	pinctrl_gpio_free(struct gpio_chip *gc, unsigned int offset)
    98	{
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
