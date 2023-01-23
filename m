Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC57C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 20:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674504203; x=1706040203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcS4fnIwfmjh7YQV73pqL/LT0kcUTZwDaq/D4F/4kOw=;
  b=S8hrapbX2Yl4W0tfkB5fzI+/IZOhgafb5kZULMFBDtJVvLwwaHAXbvIw
   iBfGkupa2hA/wEoITHEW9JjMT5N8xQI+mSnAxCThZiSQy5+DcZqOEybxJ
   PUBhL7cTc6ILfTP7qNm8Em7wwJcvggehKxthrdRaIaXVxxlLRHGnhNhkq
   +dUSvdFbfUqmn+mEf0erSroeucFtsVOKGPgdVS1gb2tFPenh3XyXMv/Vt
   nRBIiKgD6vWhbJbfS8ceTMD64S17wzQWfzx34Jt9urcIlDfcjatMYjU9T
   RQYuOx7q+pq8dJSrGe2Zh/98QYOHPKP50qnE1I5CkXODnDKXfLxWShPCr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353405673"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353405673"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 12:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750566759"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="750566759"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2023 12:03:21 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK32G-0005rU-0u;
	Mon, 23 Jan 2023 20:03:20 +0000
Date: Tue, 24 Jan 2023 04:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [brgl:gpio/for-current 2/2] include/linux/gpio/driver.h:782:68:
 error: parameter 4 ('lflags') has incomplete type
Message-ID: <202301240409.tZdm0o0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-current
head:   de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
commit: de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f [2/2] gpiolib: fix linker errors when GPIOLIB is disabled
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230124/202301240409.tZdm0o0a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
        git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
        git fetch --no-tags brgl gpio/for-current
        git checkout de5f701724ac1078deaf19ca2aa8dbf4bcd4b04f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/of_gpio.h:14,
                    from drivers/net/phy/mdio_bus.c:27:
>> include/linux/gpio/driver.h:782:68: error: parameter 4 ('lflags') has incomplete type
     782 |                                             enum gpio_lookup_flags lflags,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/gpio/driver.h:779:33: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     779 | static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/ssb/ssb.h:10,
                    from include/linux/ssb/ssb_driver_gige.h:5,
                    from drivers/net/ethernet/broadcom/tg3.c:54:
>> include/linux/gpio/driver.h:782:68: error: parameter 4 ('lflags') has incomplete type
     782 |                                             enum gpio_lookup_flags lflags,
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/gpio/driver.h:783:62: error: parameter 5 ('dflags') has incomplete type
     783 |                                             enum gpiod_flags dflags)
         |                                             ~~~~~~~~~~~~~~~~~^~~~~~
>> include/linux/gpio/driver.h:779:33: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     779 | static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +782 include/linux/gpio/driver.h

   778	
 > 779	static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
   780						    unsigned int hwnum,
   781						    const char *label,
 > 782						    enum gpio_lookup_flags lflags,
 > 783						    enum gpiod_flags dflags)
   784	{
   785		/* GPIO can never have been requested */
   786		WARN_ON(1);
   787		return ERR_PTR(-ENODEV);
   788	}
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
