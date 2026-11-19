Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795050356;
	b=L0EfbkP0yu9G+cWa/oIJbY2NV/jhMI5o/A+m+sxlINxNbI/26NL1rFcuy9TyqrxHFV7C
	 dKgnjcEajaMog9ipjt4ZpeziMSbm6E251f79ZP/v9ABhO+4lNz5/FXQeotZsoX/UYOyW6
	 6pWtLXXTtQj5wLeTnogfCYJ/XrTipYH0Yj3KcLhr3QUfrGQ5LFDk0iyUrDi+AdZK8+HB+
	 QL1IqMetaf1cjaiwIBSRBs3Wb8Dd3RCldRZLjbuq7BCGBY6P6VN680VPycY2Tl88A4sk/
	 bwkODpurMKgfTJlP2VnnhP7zml6lDJK71NCvyJ1tYEQU3D6HLxV8FyFsULowUBPvl2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050356;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=D78KlNTdHv07eTrjygnqkcEv6JKiuhjQXZOT6Hmt9Bg=;
	b=Uw+xQQquRuThXY+yJOao9mo8bQKfHi3LQkucusEvoiRvYS4BwmOKIH4Km61cO+OrOdJH
	 i07l7IVQYBXXo9MhmItjIx5O9X7ul3NoBEbcZ9dKje+jQqOoHWDdPFaSNTRzDzm4cuJNl
	 JWgR1mnblWSPRBMfOAj5QK5Oge3hlwGaHF0+pxofkDIao+rr83/jiosD68WWJ18eAlrq4
	 +J5IWMHCvJ71wx3feAnoSoMuHSlkLP4EzaLW3HBcXRGIocepWhVeULAa12UDp4iRTLc0T
	 1FCCqeNwdmYF6zJHZGwcTw36u/vhSBRP6Du/EjRizzTL7p+uVj5DjKaz+ATciy9JyRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MER2Plbv;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC8606A32A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 01:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51EC8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MER2Plbv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795050354; x=1826586354;
  h=date:from:to:cc:subject:message-id;
  bh=VC5JKCRdinQkLl7Ac3w7HlNId0lLhOhYp+2+Epdyui8=;
  b=MER2PlbvYoN8ZH1iyuQMq/9U/jL6/1ff4+doVYY7A750MOQIHK4n9lfJ
   Dvudv6+3MA+Uj+8ulxhYRZlb0KFTcj6/f2b15AZLpAXF7xv0In8Sclwi6
   YgF8uUMNmWMZ03ka7SdtBRUKTvpBSGCw+bmvgMU0kyPV3e9oRRiqcxoN5
   bzLEmCgdCtqJh974ylvOoisITjT962eyspwoh5hbaCIlTr/rvCK/Rhrcx
   gNVV90lMwglIGrcy7+5XTqyKpGqL1AaXwquzCxbT45r4hGfIeDpS7XOCC
   o7ccNUgCUJwnc5/41xG+xX8k/tZ4varPTSkthVBl1g0tdq9tZD+debanO
   Q==;
X-CSE-ConnectionGUID: ZWgPVjz/RU+UFhEDJUScLA==
X-CSE-MsgGUID: UwkV8IyiTJCBQgaQIcWsvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3879169"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3879169"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 17:05:53 -0800
X-CSE-ConnectionGUID: p1si0ddkTDqXkk+FtRjpEQ==
X-CSE-MsgGUID: 85CNX6KVQPyvahmWcYRLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10183396"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 18 Nov 2026 17:05:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTqay-000000003Yr-2hle;
	Thu, 19 Nov 2026 01:05:48 +0000
Date: Thu, 19 Nov 2026 02:05:21 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 272/460]
 drivers/misc/lis3lv02d/lis3lv02d_spi.c:110:34: error: implicit declaration of
 function 'to_spi_device'; did you mean 'to_spi_driver'?
Message-ID: <20261119015509.C5jFelNp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   754c0efaaee1c85b67fd7f8a45f7be89900b661f
commit: b92d6bdb8a97a9e35c1baf80d282833e714e75de [272/460] spi: Convert to_spi_device() into an inline function
config: sh-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261119/20261119015509.C5jFelNp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119015509.C5jFelNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119015509.C5jFelNp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/max1111.c:19:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/hwmon/max1111.c: In function 'name_show':
   drivers/hwmon/max1111.c:102:37: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     102 |         return sprintf(buf, "%s\n", to_spi_device(dev)->modalias);
         |                                     ^~~~~~~~~~~~~
         |                                     to_spi_driver
   drivers/hwmon/max1111.c:102:55: error: invalid type argument of '->' (have 'int')
     102 |         return sprintf(buf, "%s\n", to_spi_device(dev)->modalias);
         |                                                       ^~
>> drivers/hwmon/max1111.c:103:1: warning: control reaches end of non-void function [-Wreturn-type]
     103 | }
         | ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/hwmon/max31722.c:13:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/hwmon/max31722.c: In function 'max31722_suspend':
   drivers/hwmon/max31722.c:119:41: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     119 |         struct spi_device *spi_device = to_spi_device(dev);
         |                                         ^~~~~~~~~~~~~
         |                                         to_spi_driver
>> drivers/hwmon/max31722.c:119:41: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/hwmon/max31722.c: In function 'max31722_resume':
   drivers/hwmon/max31722.c:127:41: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     127 |         struct spi_device *spi_device = to_spi_device(dev);
         |                                         ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/input/joystick/psxpad-spi.c:26:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/joystick/psxpad-spi.c: In function 'psxpad_spi_suspend':
   drivers/input/joystick/psxpad-spi.c:384:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     384 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/input/joystick/psxpad-spi.c:384:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   In file included from drivers/mfd/sprd-sc27xx-spi.c:14:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/mfd/sprd-sc27xx-spi.c: In function 'sprd_pmic_detect_charger_type':
   drivers/mfd/sprd-sc27xx-spi.c:101:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     101 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/mfd/sprd-sc27xx-spi.c:101:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/mfd/sprd-sc27xx-spi.c: In function 'sprd_pmic_spi_write':
   drivers/mfd/sprd-sc27xx-spi.c:139:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     139 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   drivers/mfd/sprd-sc27xx-spi.c: In function 'sprd_pmic_spi_read':
   drivers/mfd/sprd-sc27xx-spi.c:149:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     149 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/misc/lis3lv02d/lis3lv02d_spi.c:14:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/misc/lis3lv02d/lis3lv02d_spi.c: In function 'lis3lv02d_spi_suspend':
>> drivers/misc/lis3lv02d/lis3lv02d_spi.c:110:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     110 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/misc/lis3lv02d/lis3lv02d_spi.c:110:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/misc/lis3lv02d/lis3lv02d_spi.c: In function 'lis3lv02d_spi_resume':
   drivers/misc/lis3lv02d/lis3lv02d_spi.c:121:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     121 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/input/touchscreen/tsc2005.c:15:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/touchscreen/tsc2005.c: In function 'tsc2005_cmd':
>> drivers/input/touchscreen/tsc2005.c:33:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
      33 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/input/touchscreen/tsc2005.c:33:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors
--
   In file included from drivers/input/touchscreen/surface3_spi.c:18:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/touchscreen/surface3_spi.c: In function 'surface3_spi_suspend':
>> drivers/input/touchscreen/surface3_spi.c:367:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     367 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/input/touchscreen/surface3_spi.c:367:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/input/touchscreen/surface3_spi.c: In function 'surface3_spi_resume':
   drivers/input/touchscreen/surface3_spi.c:379:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/input/touchscreen/ads7846.c:29:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/touchscreen/ads7846.c: In function 'ads7846_read12_ser':
>> drivers/input/touchscreen/ads7846.c:354:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     354 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
         |                                  to_spi_driver
>> drivers/input/touchscreen/ads7846.c:354:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/input/touchscreen/ads7846.c: In function 'ads7845_read12_ser':
   drivers/input/touchscreen/ads7846.c:436:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     436 |         struct spi_device *spi = to_spi_device(dev);
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/input/touchscreen/apple_z2.c:16:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/input/touchscreen/apple_z2.c: In function 'apple_z2_suspend':
>> drivers/input/touchscreen/apple_z2.c:437:27: error: implicit declaration of function 'to_spi_device'; did you mean 'to_spi_driver'? [-Werror=implicit-function-declaration]
     437 |         apple_z2_shutdown(to_spi_device(dev));
         |                           ^~~~~~~~~~~~~
         |                           to_spi_driver
>> drivers/input/touchscreen/apple_z2.c:437:27: warning: passing argument 1 of 'apple_z2_shutdown' makes pointer from integer without a cast [-Wint-conversion]
     437 |         apple_z2_shutdown(to_spi_device(dev));
         |                           ^~~~~~~~~~~~~~~~~~
         |                           |
         |                           int
   drivers/input/touchscreen/apple_z2.c:426:50: note: expected 'struct spi_device *' but argument is of type 'int'
     426 | static void apple_z2_shutdown(struct spi_device *spi)
         |                               ~~~~~~~~~~~~~~~~~~~^~~
   drivers/input/touchscreen/apple_z2.c: In function 'apple_z2_resume':
>> drivers/input/touchscreen/apple_z2.c:444:47: warning: passing argument 1 of 'spi_get_drvdata' makes pointer from integer without a cast [-Wint-conversion]
     444 |         struct apple_z2 *z2 = spi_get_drvdata(to_spi_device(dev));
         |                                               ^~~~~~~~~~~~~~~~~~
         |                                               |
         |                                               int
   include/linux/spi/spi.h:332:62: note: expected 'const struct spi_device *' but argument is of type 'int'
     332 | static inline void *spi_get_drvdata(const struct spi_device *spi)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/usb/host/max3421-hcd.c:61:
   include/linux/spi/spi.h:284:1: error: attributes should be specified before the declarator in a function definition
     284 | static inline struct spi_device *to_spi_device(struct device *dev)
         | ^~~~~~
   include/linux/spi/spi.h:290:1: error: attributes should be specified before the declarator in a function definition
     290 | static inline struct spi_device *to_spi_device(void *dev)
         | ^~~~~~
   include/linux/spi/spi.h:296:1: error: attributes should be specified before the declarator in a function definition
     296 | static inline const struct spi_device *to_spi_device(const struct device *dev)
         | ^~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'spi_rd8':
>> drivers/usb/host/max3421-hcd.c:344:34: error: implicit declaration of function 'to_spi_device'; did you mean 'to_usb_device'? [-Werror=implicit-function-declaration]
     344 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
         |                                  to_usb_device
>> drivers/usb/host/max3421-hcd.c:344:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/usb/host/max3421-hcd.c: In function 'spi_wr8':
   drivers/usb/host/max3421-hcd.c:369:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     369 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'spi_rd_buf':
   drivers/usb/host/max3421-hcd.c:393:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     393 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'spi_wr_buf':
   drivers/usb/host/max3421-hcd.c:419:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     419 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_transfer_out':
   drivers/usb/host/max3421-hcd.c:525:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     525 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_select_and_start_urb':
   drivers/usb/host/max3421-hcd.c:631:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     631 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_check_unlink':
   drivers/usb/host/max3421-hcd.c:766:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     766 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_handle_error':
   drivers/usb/host/max3421-hcd.c:852:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     852 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_transfer_in_done':
   drivers/usb/host/max3421-hcd.c:941:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     941 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_irq_handler':
   drivers/usb/host/max3421-hcd.c:1136:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1136 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_reset_hcd':
   drivers/usb/host/max3421-hcd.c:1285:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1285 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_spi_thread':
   drivers/usb/host/max3421-hcd.c:1374:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1374 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_urb_enqueue':
   drivers/usb/host/max3421-hcd.c:1501:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1501 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c: In function 'max3421_hub_control':
   drivers/usb/host/max3421-hcd.c:1674:34: warning: initialization of 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1674 |         struct spi_device *spi = to_spi_device(hcd->self.controller);
         |                                  ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +110 drivers/misc/lis3lv02d/lis3lv02d_spi.c

bb233fdfc7b7cef drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-03-31  107  
4e9be650597bffe drivers/hwmon/lis3lv02d_spi.c Mark Brown        2011-01-20  108  static int lis3lv02d_spi_suspend(struct device *dev)
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  109  {
4e9be650597bffe drivers/hwmon/lis3lv02d_spi.c Mark Brown        2011-01-20 @110  	struct spi_device *spi = to_spi_device(dev);
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  111  	struct lis3lv02d *lis3 = spi_get_drvdata(spi);
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  112  
5facb097137e750 drivers/hwmon/lis3lv02d_spi.c Kuninori Morimoto 2010-09-17  113  	if (!lis3->pdata || !lis3->pdata->wakeup_flags)
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  114  		lis3lv02d_poweroff(&lis3_dev);
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  115  
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  116  	return 0;
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  117  }
2cd9645e2f0d60e drivers/hwmon/lis3lv02d_spi.c Daniel Mack       2009-09-21  118  

:::::: The code at line 110 was first introduced by commit
:::::: 4e9be650597bffec5885a8c1abad1e4ffb0bcca3 hwmon: (lis3lv02d) Convert SPI to dev_pm_ops

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Guenter Roeck <guenter.roeck@ericsson.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
