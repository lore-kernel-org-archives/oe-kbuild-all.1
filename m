Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF431F868E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735334149; cv=none; b=uPysDRRyOKo2xL5wL9dDg27a4Cin1lMSQ6NrUDpXkOJfkD5sR8o7cVEX5J0uc8R3rdgbnm/JWk+VgGGC78Ab6BvkFbyzNsongOXadC635wSQnn8MWqqAOVF7vNpSvTj31Xbi3X9ttmLQ4ftKcNI8yfPJimOBkHhw92Rj4hUky0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735334149; c=relaxed/simple;
	bh=Pnq5pq/lLKIUcKURCXfm8Oraq0CAoehX3chMWOehrqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HY7R4bVM6SerEbo1tsRrACoCKYkIie/DAOuGKt9p2Wq6q4domSAcXrjUAnLk+sWZYruk40tSPLINnFbt70Y4NpeCiJFkvUkR/KFXv+M/VjqrUeFD98/ZJFqJTAKwMaLSU+zXN8vHQv5gDYYuM1zsL1A39annTINrZdxtVU+7+wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/e8fnJo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/e8fnJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735334147; x=1766870147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pnq5pq/lLKIUcKURCXfm8Oraq0CAoehX3chMWOehrqQ=;
  b=n/e8fnJoFe7aLK5oWN21Nax4FKbtvfh222LFXhQ/kkRKrLMwTw87gHBw
   1vm/ZXBzyuO0SkHoDM3hBd9lI4RSWGCVwlBWlwyw1ObuC9R/Mr52fcikr
   /0XV3d+ZJ/dtBBpQdfqvOs2sE8GJpuxMeNPOMs6Xoh3K4i4kjcJT9Lwk9
   lIXx4x0LtwnnGhlMaZqPBIXAUAe04Tawg7NBgKF7JCI7TDvGw51F+xSbB
   q9MLYPezJVieUGcprzMoEL0BelAEmyX2VSehgnMaPgH8rPIUiqEZSRZFN
   wqtDiliE9Kx2DhhwxNgU40/WmaaDomYc5vrFqRg8QbWZRca7B4fvwKDJT
   A==;
X-CSE-ConnectionGUID: eRc8RxvwS9mTpAcbwe1k3w==
X-CSE-MsgGUID: TdPTyg0uQYS4nyZjKxuhcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="47148584"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="47148584"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 13:15:45 -0800
X-CSE-ConnectionGUID: hAgc2HUvTjqKFjBEmfs6Pg==
X-CSE-MsgGUID: 8DWP5NoQSvWsurFiyOqHxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="100079364"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Dec 2024 13:15:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRHgL-0003cu-2v;
	Fri, 27 Dec 2024 21:15:41 +0000
Date: Sat, 28 Dec 2024 05:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: hepengpx <pengpengx.he@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Julian Chen <julian.chen@intel.com>,
	zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/ti960-reg.h:41:42:
 warning: 'ti960_init_settings' defined but not used
Message-ID: <202412280725.HfKHVg1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: c7f2087e27ce6a3052f8f9f38b790f2408bcd052 [3/3] driver: media: pci: i2c: support IMX390 on kernel 6.6
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412280725.HfKHVg1Z-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280725.HfKHVg1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280725.HfKHVg1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ti953-ser.c:19:
>> drivers/media/i2c/ti960-reg.h:41:42: warning: 'ti960_init_settings' defined but not used [-Wunused-const-variable=]
      41 | static const struct ti960_register_write ti960_init_settings[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ti960-reg.h:34:42: warning: 'ti960_gpio_settings' defined but not used [-Wunused-const-variable=]
      34 | static const struct ti960_register_write ti960_gpio_settings[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ti960-reg.h:17:42: warning: 'ti960_frame_sync_settings' defined but not used [-Wunused-const-variable=]
      17 | static const struct ti960_register_write ti960_frame_sync_settings[2][5] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
--
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/media/i2c/ti960-des.c:4:
   drivers/media/i2c/ti960-des.c: In function 'ti960_gpio_set':
   drivers/media/i2c/ti960-des.c:1424:55: error: invalid use of undefined type 'struct gpio_chip'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                                       ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/media/i2c/ti960-des.c:1424:37: note: in expansion of macro 'to_i2c_client'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                     ^~~~~~~~~~~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5:
   drivers/media/i2c/ti960-des.c:1424:55: error: invalid use of undefined type 'struct gpio_chip'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                                       ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/i2c.h:355:26: note: in expansion of macro 'container_of'
     355 | #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
         |                          ^~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1424:37: note: in expansion of macro 'to_i2c_client'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                     ^~~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1424:55: error: invalid use of undefined type 'struct gpio_chip'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                                       ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/i2c.h:355:26: note: in expansion of macro 'container_of'
     355 | #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
         |                          ^~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1424:37: note: in expansion of macro 'to_i2c_client'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                     ^~~~~~~~~~~~~
   include/linux/compiler_types.h:384:27: error: expression in static assertion is not an integer
     384 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/i2c.h:355:26: note: in expansion of macro 'container_of'
     355 | #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
         |                          ^~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1424:37: note: in expansion of macro 'to_i2c_client'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                     ^~~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c: In function 'ti960_probe':
   drivers/media/i2c/ti960-des.c:1569:16: error: implicit declaration of function 'gpiochip_add' [-Wimplicit-function-declaration]
    1569 |         rval = gpiochip_add(&va->gc);
         |                ^~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1586:17: error: implicit declaration of function 'devm_gpio_free'; did you mean 'devm_gpiod_get'? [-Wimplicit-function-declaration]
    1586 |                 devm_gpio_free(&client->dev,
         |                 ^~~~~~~~~~~~~~
         |                 devm_gpiod_get
   drivers/media/i2c/ti960-des.c:1471:22: warning: unused variable 'l' [-Wunused-variable]
    1471 |         int i, j, k, l, rval = 0;
         |                      ^
   drivers/media/i2c/ti960-des.c:1471:19: warning: unused variable 'k' [-Wunused-variable]
    1471 |         int i, j, k, l, rval = 0;
         |                   ^
   drivers/media/i2c/ti960-des.c:1471:16: warning: unused variable 'j' [-Wunused-variable]
    1471 |         int i, j, k, l, rval = 0;
         |                ^
   drivers/media/i2c/ti960-des.c: In function 'ti960_remove':
   drivers/media/i2c/ti960-des.c:1618:9: error: implicit declaration of function 'gpiochip_remove' [-Wimplicit-function-declaration]
    1618 |         gpiochip_remove(&va->gc);
         |         ^~~~~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c: At top level:
   drivers/media/i2c/ti960-des.c:1659:19: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
    1659 |         .remove = ti960_remove,
         |                   ^~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1659:19: note: (near initialization for 'ti960_i2c_driver.remove')
   In file included from drivers/media/i2c/ti960-des.c:21:
>> drivers/media/i2c/ti953.h:115:42: warning: 'ti953_FPD3_RX_ID' defined but not used [-Wunused-const-variable=]
     115 | static const struct ti953_register_devid ti953_FPD3_RX_ID[] = {
         |                                          ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/ti953.h:109:42: warning: 'ti953_init_settings_clk' defined but not used [-Wunused-const-variable=]
     109 | static const struct ti953_register_write ti953_init_settings_clk[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ti953.h:42:42: warning: 'ti953_init_settings' defined but not used [-Wunused-const-variable=]
      42 | static const struct ti953_register_write ti953_init_settings[] = {
         |                                          ^~~~~~~~~~~~~~~~~~~


vim +/ti960_init_settings +41 drivers/media/i2c/ti960-reg.h

e986ee1ba98444 zouxiaoh 2024-01-18  16  
e986ee1ba98444 zouxiaoh 2024-01-18 @17  static const struct ti960_register_write ti960_frame_sync_settings[2][5] = {
e986ee1ba98444 zouxiaoh 2024-01-18  18  	{
e986ee1ba98444 zouxiaoh 2024-01-18  19  		{0x18, 0x00}, /* Disable frame sync. */
e986ee1ba98444 zouxiaoh 2024-01-18  20  		{0x19, 0x00},
e986ee1ba98444 zouxiaoh 2024-01-18  21  		{0x1a, 0x00},
e986ee1ba98444 zouxiaoh 2024-01-18  22  		{0x1b, 0x00},
e986ee1ba98444 zouxiaoh 2024-01-18  23  		{0x1c, 0x00},
e986ee1ba98444 zouxiaoh 2024-01-18  24  	},
e986ee1ba98444 zouxiaoh 2024-01-18  25  	{
e986ee1ba98444 zouxiaoh 2024-01-18  26  		{0x19, 0x15}, /* Frame sync high time.*/
e986ee1ba98444 zouxiaoh 2024-01-18  27  		{0x1a, 0xb3},
e986ee1ba98444 zouxiaoh 2024-01-18  28  		{0x1b, 0xc3}, /* Frame sync low time. */
e986ee1ba98444 zouxiaoh 2024-01-18  29  		{0x1c, 0x4f},
e986ee1ba98444 zouxiaoh 2024-01-18  30  		{0x18, 0x01}, /* Enable frame sync. and use high/low mode */
e986ee1ba98444 zouxiaoh 2024-01-18  31  	}
e986ee1ba98444 zouxiaoh 2024-01-18  32  };
e986ee1ba98444 zouxiaoh 2024-01-18  33  
e986ee1ba98444 zouxiaoh 2024-01-18 @34  static const struct ti960_register_write ti960_gpio_settings[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  35  	{0x10, 0x81},
e986ee1ba98444 zouxiaoh 2024-01-18  36  	{0x11, 0x85},
e986ee1ba98444 zouxiaoh 2024-01-18  37  	{0x12, 0x89},
e986ee1ba98444 zouxiaoh 2024-01-18  38  	{0x13, 0x8d},
e986ee1ba98444 zouxiaoh 2024-01-18  39  };
e986ee1ba98444 zouxiaoh 2024-01-18  40  
e986ee1ba98444 zouxiaoh 2024-01-18 @41  static const struct ti960_register_write ti960_init_settings[] = {
e986ee1ba98444 zouxiaoh 2024-01-18  42  	{0x0c, 0x0f}, /* RX_PORT_CTL */
e986ee1ba98444 zouxiaoh 2024-01-18  43  	{0x1f, 0x06}, /* CSI_PLL_CTL */
e986ee1ba98444 zouxiaoh 2024-01-18  44  	{0x4c, 0x01}, /* FPD3_PORT_SEL */
e986ee1ba98444 zouxiaoh 2024-01-18  45  	{0x58, 0x5e}, /* BCC_CONFIG */
e986ee1ba98444 zouxiaoh 2024-01-18  46  	{0x5c, 0xb0}, /* SER_ALIAS_ID */
e986ee1ba98444 zouxiaoh 2024-01-18  47  	{0x5d, 0x6c}, /* SlaveID[0] */
e986ee1ba98444 zouxiaoh 2024-01-18  48  	{0x65, 0x60}, /* SlaveAlias[0] */
e986ee1ba98444 zouxiaoh 2024-01-18  49  	{0x6d, 0x7c}, /* PORT_CONFIG */
e986ee1ba98444 zouxiaoh 2024-01-18  50  	{0x7c, 0x01}, /* PORT_CONFIG2 */
e986ee1ba98444 zouxiaoh 2024-01-18  51  	{0x70, 0x2b}, /* RAW10_ID */
e986ee1ba98444 zouxiaoh 2024-01-18  52  	{0x71, 0x2c}, /* RAW12_ID */
e986ee1ba98444 zouxiaoh 2024-01-18  53  	{0x72, 0xe4}, /* CSI_VC_MAP */
e986ee1ba98444 zouxiaoh 2024-01-18  54  	{0x4c, 0x12}, /* FPD3_PORT_SEL */
e986ee1ba98444 zouxiaoh 2024-01-18  55  	{0x58, 0x5e},
e986ee1ba98444 zouxiaoh 2024-01-18  56  	{0x5c, 0xb2},
e986ee1ba98444 zouxiaoh 2024-01-18  57  	{0x5d, 0x6c},
e986ee1ba98444 zouxiaoh 2024-01-18  58  	{0x65, 0x62},
e986ee1ba98444 zouxiaoh 2024-01-18  59  	{0x6d, 0x7c},
e986ee1ba98444 zouxiaoh 2024-01-18  60  	{0x7c, 0x01},
e986ee1ba98444 zouxiaoh 2024-01-18  61  	{0x70, 0x2b},
e986ee1ba98444 zouxiaoh 2024-01-18  62  	{0x71, 0x2c},
e986ee1ba98444 zouxiaoh 2024-01-18  63  	{0x72, 0xee}, /* CSI_VC_MAP */
e986ee1ba98444 zouxiaoh 2024-01-18  64  	{0x4c, 0x24}, /* FPD3_PORT_SEL */
e986ee1ba98444 zouxiaoh 2024-01-18  65  	{0x58, 0x5e},
e986ee1ba98444 zouxiaoh 2024-01-18  66  	{0x5c, 0xb4},
e986ee1ba98444 zouxiaoh 2024-01-18  67  	{0x5d, 0x6c},
e986ee1ba98444 zouxiaoh 2024-01-18  68  	{0x65, 0x64},
e986ee1ba98444 zouxiaoh 2024-01-18  69  	{0x6d, 0x7c},
e986ee1ba98444 zouxiaoh 2024-01-18  70  	{0x7c, 0x01},
e986ee1ba98444 zouxiaoh 2024-01-18  71  	{0x70, 0x2b},
e986ee1ba98444 zouxiaoh 2024-01-18  72  	{0x71, 0x2c},
e986ee1ba98444 zouxiaoh 2024-01-18  73  	{0x72, 0xe4},
e986ee1ba98444 zouxiaoh 2024-01-18  74  	{0x4c, 0x38}, /* FPD3_PORT_SEL */
e986ee1ba98444 zouxiaoh 2024-01-18  75  	{0x58, 0x5e},
e986ee1ba98444 zouxiaoh 2024-01-18  76  	{0x5c, 0xb6},
e986ee1ba98444 zouxiaoh 2024-01-18  77  	{0x5d, 0x6c},
e986ee1ba98444 zouxiaoh 2024-01-18  78  	{0x65, 0x66},
e986ee1ba98444 zouxiaoh 2024-01-18  79  	{0x6d, 0x7c},
e986ee1ba98444 zouxiaoh 2024-01-18  80  	{0x7c, 0x01},
e986ee1ba98444 zouxiaoh 2024-01-18  81  	{0x70, 0x2b},
e986ee1ba98444 zouxiaoh 2024-01-18  82  	{0x71, 0x2c},
e986ee1ba98444 zouxiaoh 2024-01-18  83  	{0x72, 0xe4},
e986ee1ba98444 zouxiaoh 2024-01-18  84  	{0xb0, 0x14}, /* FPD3 RX Shared Reg */
e986ee1ba98444 zouxiaoh 2024-01-18  85  	{0xb1, 0x03},
e986ee1ba98444 zouxiaoh 2024-01-18  86  	{0xb2, 0x04},
e986ee1ba98444 zouxiaoh 2024-01-18  87  	{0xb1, 0x04},
e986ee1ba98444 zouxiaoh 2024-01-18  88  	{0xb2, 0x04},
e986ee1ba98444 zouxiaoh 2024-01-18  89  	{0x32, 0x12}, /* select TX1 R/W */
e986ee1ba98444 zouxiaoh 2024-01-18  90  	{0x33, 0x01}, /* CSI_ENABLE */
e986ee1ba98444 zouxiaoh 2024-01-18  91  	{0x34, 0x08}, /* CSI_PASS_MODE all */
e986ee1ba98444 zouxiaoh 2024-01-18  92  	{0x32, 0x01}, /* select TX0 R/W */
e986ee1ba98444 zouxiaoh 2024-01-18  93  	{0x33, 0x01}, /* CSI_ENABLE */
e986ee1ba98444 zouxiaoh 2024-01-18  94  	{0x34, 0x08}, /* CSI_PASS_MODE all */
e986ee1ba98444 zouxiaoh 2024-01-18  95  	{0x20, 0xf0},
e986ee1ba98444 zouxiaoh 2024-01-18  96  	{0x21, 0x03},
e986ee1ba98444 zouxiaoh 2024-01-18  97  };
e986ee1ba98444 zouxiaoh 2024-01-18  98  

:::::: The code at line 41 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
