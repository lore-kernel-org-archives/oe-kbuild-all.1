Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9A21877
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+/Cd17z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697270111; x=1728806111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2IDV9rbEHLCdb5fO366yW6Lnv+JZX5PVMSWOjzxVpj0=;
  b=i+/Cd17zsDDC9EqfhLFY9/GQo6eRoc1WMwyOY/uR3fiOl4ZSF7kb/Z+M
   q6/2cvfJDKuUMlvoKR2E1vSu6rCsl8+C4tRhlQwOmvsM1Io+y4MNrPUjq
   5x/IQxbg+hqadRYfp6dN4zfZyexTeZTBQY9cHLgjYIqB5wRH75Ayy4ll6
   Yk1chrnbu+Lyhs5zzqfiCk+fAvX1kMJG86X4A9oMuyaA02MIYCi+LkAd/
   XzJ8TTScAzo4SdKmpEviZV3p7FY1g3MQ+S3nkwHvkwePGX6JgdjWYaczO
   8CMoMA2FTgX31g2wnl19HTjDIfNfN2AZTAQFtOqL59HXkXa1dE2N1vFHg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365576879"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365576879"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898828465"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898828465"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2023 00:53:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrZUK-0005qQ-00;
	Sat, 14 Oct 2023 07:55:08 +0000
Date: Sat, 14 Oct 2023 15:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 37/62] treewide: rename pinctrl_gpio_request_new()
Message-ID: <202310141539.aho35JHn-lkp@intel.com>
References: <20231011120830.49324-38-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011120830.49324-38-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20231011]
[cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next brgl/gpio/for-next geert-renesas-drivers/renesas-pinctrl v6.6-rc5 v6.6-rc4 v6.6-rc3 linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/pinctrl-remove-unneeded-extern-specifiers-from-consumer-h/20231011-202505
base:   next-20231011
patch link:    https://lore.kernel.org/r/20231011120830.49324-38-brgl%40bgdev.pl
patch subject: [PATCH v2 37/62] treewide: rename pinctrl_gpio_request_new()
config: um-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141539.aho35JHn-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141539.aho35JHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141539.aho35JHn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpio/gpiolib-cdev.c:22:
   include/linux/pinctrl/consumer.h:76:1: error: conflicting types for 'pinctrl_gpio_can_use_line'
      76 | pinctrl_gpio_can_use_line(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:70:20: note: previous definition of 'pinctrl_gpio_can_use_line' was here
      70 | static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pinctrl/consumer.h:87:1: error: conflicting types for 'pinctrl_gpio_request'
      87 | pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/pinctrl/consumer.h:81:19: note: previous definition of 'pinctrl_gpio_request' was here
      81 | static inline int pinctrl_gpio_request(unsigned gpio)
         |                   ^~~~~~~~~~~~~~~~~~~~


vim +/pinctrl_gpio_request +87 include/linux/pinctrl/consumer.h

    85	
    86	static inline int
  > 87	pinctrl_gpio_request(struct gpio_chip *gc, unsigned int offset)
    88	{
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
