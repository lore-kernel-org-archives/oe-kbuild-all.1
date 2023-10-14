Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F5A1869
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDZf892A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697268193; x=1728804193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gFSf9mN+cIptjRmbwSQUYe7NqO7IpGmmRMv5lB5n8PE=;
  b=KDZf892AyLlGdwnYeo0V3cEQU9YbbQfl3kYfbuXFVhM7etQQ++XIrQNP
   opN1BKXISIbacN0sOcVnG28koCb4clO3FLdlMQKc4yvxGRR6hehdGY2kx
   uisn4Q+qxf0S8CZp9IwJz1HdwrQuYFAmTPIlpcscJFp09f+WSv0LDVONI
   aJEYKLgxTbAQ9IL9x1t7voOWcbJ6lZZwiCtpd4XpvN6qF6VBl6YJyTXct
   CtegIDVkIylS8uXaFTEYm8BtBva7cHbZhao8gyZzusY7kAWLiXtjfhA2S
   w88s1n7Cju5aj5sZjW3Du4anYjNpaufTpLB0+nE1kIzAoqKIyUFRmF/x7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471539360"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471539360"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784416664"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784416664"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 00:23:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrYzL-0005oh-0N;
	Sat, 14 Oct 2023 07:23:07 +0000
Date: Sat, 14 Oct 2023 15:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 36/62] treewide: rename pinctrl_gpio_can_use_line_new()
Message-ID: <202310141541.JUhZz2jP-lkp@intel.com>
References: <20231011120830.49324-37-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011120830.49324-37-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231011]
[cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next brgl/gpio/for-next geert-renesas-drivers/renesas-pinctrl v6.6-rc5 v6.6-rc4 v6.6-rc3 linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/pinctrl-remove-unneeded-extern-specifiers-from-consumer-h/20231011-202505
base:   next-20231011
patch link:    https://lore.kernel.org/r/20231011120830.49324-37-brgl%40bgdev.pl
patch subject: [PATCH v2 36/62] treewide: rename pinctrl_gpio_can_use_line_new()
config: um-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141541.JUhZz2jP-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141541.JUhZz2jP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141541.JUhZz2jP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-cdev.c:22:
>> include/linux/pinctrl/consumer.h:76:1: error: conflicting types for 'pinctrl_gpio_can_use_line'
      76 | pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:70:20: note: previous definition of 'pinctrl_gpio_can_use_line' was here
      70 | static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pinctrl_gpio_can_use_line +76 include/linux/pinctrl/consumer.h

    74	
    75	static inline bool
  > 76	pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
    77	{
    78		return true;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
