Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479B9139579
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 23:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735342562; cv=none; b=cPBiAOIANiKzK/tpKei00G8OLxuCCAPIDyrlqPuZwyLjnasL/y5FznRE0zPXq4/rMNJqyNPv3coC1OSOl47sUwwgDXFZv5a6RopBMK6CAa58fCV9chBAJK141dIqpD8MZ32gZQGmAGYT8vs6yqTzgQTm9ORlSbVU0FXN+9ZkYWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735342562; c=relaxed/simple;
	bh=goM2gO9J3APoBZrJ4n4REAKWDGSJtYTlFicVg1sbxuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIrAgEQCUESDhdbP/IdHxYZqL6Ms90qBuWk0MLU/oDoQy2wkjWlh2EOCl+DxQRDJVl1BORR/p11jWaVFMVUcw/8h5l3vzcbHSi3XtFtSFc5UyITQTRbi1xhP2TrrH+WQEtQn47GtFx8cjC3lFO1lGU4FfOfHbrFvGD627U7wVYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pqn0Z1t2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pqn0Z1t2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735342560; x=1766878560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=goM2gO9J3APoBZrJ4n4REAKWDGSJtYTlFicVg1sbxuY=;
  b=Pqn0Z1t27uC7ai8QsLrgZO44F3PVgLO2uEod3Nm/ryaposzFvr86veJa
   8g5YtVEPlNzqytH8Tzkck2/D2TVS5rnX3cuVKP3FWbMXULkrLCUyvvdwW
   rT0mZh4WNNmlwmaPiRozViYlSFY5Yp1G+xfZ/gpb4Tlw+oKTGjxzI8cq2
   FTfQDURuk+HCST3DBRFl84slzKPmeCmSUoMNWPTa5jJNOyA1pBZUdiaj6
   dlyqZrP8UA5M6rGw+XLyjcCwT09FtkfJ1QKiFi/gHBccMZhIjAr7LPqFa
   AxI2RjVNXGmoCWVN9i3GtaynzmOMlNbMH2DaiSeVL4iy4EqMYxydhnAdj
   A==;
X-CSE-ConnectionGUID: qNPpNZCQT/adW6nU6PDrWw==
X-CSE-MsgGUID: 02Oj22t+SMC+eUfAJvCnRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35044401"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35044401"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 15:35:59 -0800
X-CSE-ConnectionGUID: 3xyfu9YITnKXjMGKS1PHCg==
X-CSE-MsgGUID: 0wyB3oLQSBG45jlsUMNe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105231789"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2024 15:35:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRJs3-0003jA-1n;
	Fri, 27 Dec 2024 23:35:55 +0000
Date: Sat, 28 Dec 2024 07:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: linya14x <linx.yang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Julian Chen <julian.chen@intel.com>,
	zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/d4xx.c:3752:64:
 warning: variable 'vc_id' set but not used
Message-ID: <202412280959.kFtqIa2m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi linya14x,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 95d40ab752ea6f924bcc11e8361f452cdb8dc69f [3/3] media: i2c: add D4XX support to Makefile and Kconfig
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412280959.kFtqIa2m-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280959.kFtqIa2m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280959.kFtqIa2m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/d4xx.c: In function '__ds5_sensor_set_fmt':
   drivers/media/i2c/d4xx.c:1385:34: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1385 |                 query_sub_stream = state->ctrls.query_sub_stream->qmenu_int;
         |                                  ^
   drivers/media/i2c/d4xx.c: In function 'ds5_g_volatile_ctrl':
   drivers/media/i2c/d4xx.c:2626:87: warning: passing argument 1 of 'get_sub_stream_vc_id' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2626 |                         int vc_id = get_sub_stream_vc_id(state->ctrls.query_sub_stream->qmenu_int,
         |                                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   drivers/media/i2c/d4xx.c:729:38: note: expected 's64 *' {aka 'long long int *'} but argument is of type 'const s64 *' {aka 'const long long int *'}
     729 | static int get_sub_stream_vc_id(s64 *query_sub_stream, int index)
         |                                 ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:2810:17: warning: initialized field overwritten [-Woverride-init]
    2810 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2810:17: note: (near initialization for 'ds5_ctrl_erb.step')
   drivers/media/i2c/d4xx.c:2824:17: warning: initialized field overwritten [-Woverride-init]
    2824 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2824:17: note: (near initialization for 'ds5_ctrl_ewb.step')
   drivers/media/i2c/d4xx.c:2838:17: warning: initialized field overwritten [-Woverride-init]
    2838 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2838:17: note: (near initialization for 'ds5_ctrl_hwmc.step')
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/media/i2c/d4xx.c:22:
   drivers/media/i2c/d4xx.c: In function 'ds5_ctrl_init':
   drivers/media/i2c/d4xx.c:3113:17: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
    3113 |                 "%s():!! can not get d4xx_controls_q_sub_stream: sd->name is %s\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/i2c/d4xx.c:3112:17: note: in expansion of macro 'dev_err'
    3112 |                 dev_err(state->rgb.sensor.sd.dev,
         |                 ^~~~~~~
   drivers/media/i2c/d4xx.c:3113:79: note: format string is defined here
    3113 |                 "%s():!! can not get d4xx_controls_q_sub_stream: sd->name is %s\n",
         |                                                                              ~^
         |                                                                               |
         |                                                                               char *
         |                                                                              %d
   drivers/media/i2c/d4xx.c:3113:17: warning: too many arguments for format [-Wformat-extra-args]
    3113 |                 "%s():!! can not get d4xx_controls_q_sub_stream: sd->name is %s\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/i2c/d4xx.c:3112:17: note: in expansion of macro 'dev_err'
    3112 |                 dev_err(state->rgb.sensor.sd.dev,
         |                 ^~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_set_fmt':
   drivers/media/i2c/d4xx.c:3602:34: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    3602 |                 query_sub_stream = state->ctrls.query_sub_stream->qmenu_int;
         |                                  ^
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:3718:5: warning: no previous prototype for 'd4xx_reset_oneshot' [-Wmissing-prototypes]
    3718 | int d4xx_reset_oneshot(struct ds5 *state)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_mux_s_stream':
>> drivers/media/i2c/d4xx.c:3752:64: warning: variable 'vc_id' set but not used [-Wunused-but-set-variable]
    3752 |         u16 config_status_base, stream_status_base, stream_id, vc_id;
         |                                                                ^~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_parse_cam':
>> drivers/media/i2c/d4xx.c:4388:32: warning: the comparison will always evaluate as 'true' for the address of 'depth_b' will never be NULL [-Waddress]
    4388 |         if ((&(state->depth_b) != NULL) && (&(state->rgb_b) != NULL)) {
         |                                ^~
   drivers/media/i2c/d4xx.c:467:11: note: 'depth_b' declared here
     467 |         } depth_b;
         |           ^~~~~~~
>> drivers/media/i2c/d4xx.c:4388:61: warning: the comparison will always evaluate as 'true' for the address of 'rgb_b' will never be NULL [-Waddress]
    4388 |         if ((&(state->depth_b) != NULL) && (&(state->rgb_b) != NULL)) {
         |                                                             ^~
   drivers/media/i2c/d4xx.c:476:11: note: 'rgb_b' declared here
     476 |         } rgb_b;
         |           ^~~~~
   In file included from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/sh/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:23,
                    from drivers/media/i2c/d4xx.c:20:
   drivers/media/i2c/d4xx.c: In function 'ds5_chrdev_init':
   include/linux/export.h:29:22: error: passing argument 1 of 'class_create' from incompatible pointer type [-Wincompatible-pointer-types]
      29 | #define THIS_MODULE (&__this_module)
         |                     ~^~~~~~~~~~~~~~~
         |                      |
         |                      struct module *
   drivers/media/i2c/d4xx.c:4794:43: note: in expansion of macro 'THIS_MODULE'
    4794 |                 *ds5_class = class_create(THIS_MODULE, DS5_DRIVER_NAME_CLASS);
         |                                           ^~~~~~~~~~~
   In file included from include/linux/device.h:31:
   include/linux/device/class.h:230:54: note: expected 'const char *' but argument is of type 'struct module *'
     230 | struct class * __must_check class_create(const char *name);
         |                                          ~~~~~~~~~~~~^~~~
   drivers/media/i2c/d4xx.c:4794:30: error: too many arguments to function 'class_create'
    4794 |                 *ds5_class = class_create(THIS_MODULE, DS5_DRIVER_NAME_CLASS);
         |                              ^~~~~~~~~~~~
   include/linux/device/class.h:230:29: note: declared here
     230 | struct class * __must_check class_create(const char *name);
         |                             ^~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_substream_init':
   drivers/media/i2c/d4xx.c:4855:28: error: assignment to 's64' {aka 'long long int'} from 's64 *' {aka 'long long int *'} makes integer from pointer without a cast [-Wint-conversion]
    4855 |                 sub_stream = d4xx_query_sub_stream[j];
         |                            ^
   drivers/media/i2c/d4xx.c:4857:36: error: passing argument 1 of 'set_sub_stream_fmt' makes pointer from integer without a cast [-Wint-conversion]
    4857 |                 set_sub_stream_fmt(sub_stream, 0, MEDIA_BUS_FMT_UYVY8_1X16);
         |                                    ^~~~~~~~~~
         |                                    |
         |                                    s64 {aka long long int}
   drivers/media/i2c/d4xx.c:687:37: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     687 | static void set_sub_stream_fmt(s64 *query_sub_stream, int index, u32 code)
         |                                ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4858:34: error: passing argument 1 of 'set_sub_stream_h' makes pointer from integer without a cast [-Wint-conversion]
    4858 |                 set_sub_stream_h(sub_stream, 0, 480);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:693:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     693 | static void set_sub_stream_h(s64 *query_sub_stream, int index, u32 height)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4859:34: error: passing argument 1 of 'set_sub_stream_w' makes pointer from integer without a cast [-Wint-conversion]
    4859 |                 set_sub_stream_w(sub_stream, 0, 640);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:702:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     702 | static void set_sub_stream_w(s64 *query_sub_stream, int index, u32 width)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4860:35: error: passing argument 1 of 'set_sub_stream_dt' makes pointer from integer without a cast [-Wint-conversion]
    4860 |                 set_sub_stream_dt(sub_stream, 0, mipi_csi2_type);
         |                                   ^~~~~~~~~~
         |                                   |
         |                                   s64 {aka long long int}
   drivers/media/i2c/d4xx.c:711:36: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     711 | static void set_sub_stream_dt(s64 *query_sub_stream, int index, u32 dt)
         |                               ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4861:38: error: passing argument 1 of 'set_sub_stream_vc_id' makes pointer from integer without a cast [-Wint-conversion]
    4861 |                 set_sub_stream_vc_id(sub_stream, 0, 0);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      s64 {aka long long int}
   drivers/media/i2c/d4xx.c:720:39: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     720 | static void set_sub_stream_vc_id(s64 *query_sub_stream, int index, u32 vc_id)
         |                                  ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4863:36: error: passing argument 1 of 'set_sub_stream_fmt' makes pointer from integer without a cast [-Wint-conversion]
    4863 |                 set_sub_stream_fmt(sub_stream, 1, MEDIA_BUS_FMT_SGRBG8_1X8);
         |                                    ^~~~~~~~~~
         |                                    |
         |                                    s64 {aka long long int}
   drivers/media/i2c/d4xx.c:687:37: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     687 | static void set_sub_stream_fmt(s64 *query_sub_stream, int index, u32 code)
         |                                ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4864:34: error: passing argument 1 of 'set_sub_stream_h' makes pointer from integer without a cast [-Wint-conversion]
    4864 |                 set_sub_stream_h(sub_stream, 1, 1);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:693:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     693 | static void set_sub_stream_h(s64 *query_sub_stream, int index, u32 height)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4865:34: error: passing argument 1 of 'set_sub_stream_w' makes pointer from integer without a cast [-Wint-conversion]
    4865 |                 set_sub_stream_w(sub_stream, 1, 68);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:702:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     702 | static void set_sub_stream_w(s64 *query_sub_stream, int index, u32 width)
--
   drivers/media/i2c/d4xx.c:702:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     702 | static void set_sub_stream_w(s64 *query_sub_stream, int index, u32 width)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4904:35: error: passing argument 1 of 'set_sub_stream_dt' makes pointer from integer without a cast [-Wint-conversion]
    4904 |                 set_sub_stream_dt(sub_stream, 7, MIPI_CSI2_TYPE_EMBEDDED8);
         |                                   ^~~~~~~~~~
         |                                   |
         |                                   s64 {aka long long int}
   drivers/media/i2c/d4xx.c:711:36: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     711 | static void set_sub_stream_dt(s64 *query_sub_stream, int index, u32 dt)
         |                               ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4905:38: error: passing argument 1 of 'set_sub_stream_vc_id' makes pointer from integer without a cast [-Wint-conversion]
    4905 |                 set_sub_stream_vc_id(sub_stream, 7, 2);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      s64 {aka long long int}
   drivers/media/i2c/d4xx.c:720:39: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     720 | static void set_sub_stream_vc_id(s64 *query_sub_stream, int index, u32 vc_id)
         |                                  ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4908:36: error: passing argument 1 of 'set_sub_stream_fmt' makes pointer from integer without a cast [-Wint-conversion]
    4908 |                 set_sub_stream_fmt(sub_stream, 8, MEDIA_BUS_FMT_YUYV8_1X16);
         |                                    ^~~~~~~~~~
         |                                    |
         |                                    s64 {aka long long int}
   drivers/media/i2c/d4xx.c:687:37: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     687 | static void set_sub_stream_fmt(s64 *query_sub_stream, int index, u32 code)
         |                                ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4909:34: error: passing argument 1 of 'set_sub_stream_h' makes pointer from integer without a cast [-Wint-conversion]
    4909 |                 set_sub_stream_h(sub_stream, 8, 640);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:693:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     693 | static void set_sub_stream_h(s64 *query_sub_stream, int index, u32 height)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4910:34: error: passing argument 1 of 'set_sub_stream_w' makes pointer from integer without a cast [-Wint-conversion]
    4910 |                 set_sub_stream_w(sub_stream, 8, 480);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:702:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     702 | static void set_sub_stream_w(s64 *query_sub_stream, int index, u32 width)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4911:35: error: passing argument 1 of 'set_sub_stream_dt' makes pointer from integer without a cast [-Wint-conversion]
    4911 |                 set_sub_stream_dt(sub_stream, 8, mipi_csi2_type);
         |                                   ^~~~~~~~~~
         |                                   |
         |                                   s64 {aka long long int}
   drivers/media/i2c/d4xx.c:711:36: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     711 | static void set_sub_stream_dt(s64 *query_sub_stream, int index, u32 dt)
         |                               ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4912:38: error: passing argument 1 of 'set_sub_stream_vc_id' makes pointer from integer without a cast [-Wint-conversion]
    4912 |                 set_sub_stream_vc_id(sub_stream, 8, 3);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      s64 {aka long long int}
   drivers/media/i2c/d4xx.c:720:39: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     720 | static void set_sub_stream_vc_id(s64 *query_sub_stream, int index, u32 vc_id)
         |                                  ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4914:36: error: passing argument 1 of 'set_sub_stream_fmt' makes pointer from integer without a cast [-Wint-conversion]
    4914 |                 set_sub_stream_fmt(sub_stream, 9, MEDIA_BUS_FMT_SGRBG8_1X8);
         |                                    ^~~~~~~~~~
         |                                    |
         |                                    s64 {aka long long int}
   drivers/media/i2c/d4xx.c:687:37: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     687 | static void set_sub_stream_fmt(s64 *query_sub_stream, int index, u32 code)
         |                                ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4915:34: error: passing argument 1 of 'set_sub_stream_h' makes pointer from integer without a cast [-Wint-conversion]
    4915 |                 set_sub_stream_h(sub_stream, 9, 1);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:693:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     693 | static void set_sub_stream_h(s64 *query_sub_stream, int index, u32 height)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4916:34: error: passing argument 1 of 'set_sub_stream_w' makes pointer from integer without a cast [-Wint-conversion]
    4916 |                 set_sub_stream_w(sub_stream, 9, 68);
         |                                  ^~~~~~~~~~
         |                                  |
         |                                  s64 {aka long long int}
   drivers/media/i2c/d4xx.c:702:35: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     702 | static void set_sub_stream_w(s64 *query_sub_stream, int index, u32 width)
         |                              ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4917:35: error: passing argument 1 of 'set_sub_stream_dt' makes pointer from integer without a cast [-Wint-conversion]
    4917 |                 set_sub_stream_dt(sub_stream, 9, MIPI_CSI2_TYPE_EMBEDDED8);
         |                                   ^~~~~~~~~~
         |                                   |
         |                                   s64 {aka long long int}
   drivers/media/i2c/d4xx.c:711:36: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     711 | static void set_sub_stream_dt(s64 *query_sub_stream, int index, u32 dt)
         |                               ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:4918:38: error: passing argument 1 of 'set_sub_stream_vc_id' makes pointer from integer without a cast [-Wint-conversion]
    4918 |                 set_sub_stream_vc_id(sub_stream, 9, 3);
         |                                      ^~~~~~~~~~
         |                                      |
         |                                      s64 {aka long long int}
   drivers/media/i2c/d4xx.c:720:39: note: expected 's64 *' {aka 'long long int *'} but argument is of type 's64' {aka 'long long int'}
     720 | static void set_sub_stream_vc_id(s64 *query_sub_stream, int index, u32 vc_id)
         |                                  ~~~~~^~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c: In function 'ds5_probe':
>> drivers/media/i2c/d4xx.c:5193:25: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    5193 |         int ret, retry, err = 0;
         |                         ^~~
   drivers/media/i2c/d4xx.c: At top level:
   drivers/media/i2c/d4xx.c:5377:27: error: initialization of 'void (*)(struct i2c_client *)' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
    5377 |         .remove         = ds5_remove,
         |                           ^~~~~~~~~~
   drivers/media/i2c/d4xx.c:5377:27: note: (near initialization for 'ds5_i2c_driver.remove')
>> drivers/media/i2c/d4xx.c:945:36: warning: 'd46x_calibration_sizes' defined but not used [-Wunused-const-variable=]
     945 | static const struct ds5_resolution d46x_calibration_sizes[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/d4xx.c:929:36: warning: 'ds5_size_w10' defined but not used [-Wunused-const-variable=]
     929 | static const struct ds5_resolution ds5_size_w10 = {
         |                                    ^~~~~~~~~~~~
>> drivers/media/i2c/d4xx.c:759:18: warning: 'ds5_framerate_25' defined but not used [-Wunused-const-variable=]
     759 | static const u16 ds5_framerate_25 = 25;
         |                  ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/d4xx.c:743:18: warning: 'ds5_default_framerate' defined but not used [-Wunused-const-variable=]
     743 | static const u16 ds5_default_framerate = 30;
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/d4xx.c:600:12: warning: 'ds5_write_8' defined but not used [-Wunused-function]
     600 | static int ds5_write_8(struct ds5 *state, u16 reg, u8 val)
         |            ^~~~~~~~~~~


vim +/vc_id +3752 drivers/media/i2c/d4xx.c

e986ee1ba98444 zouxiaoh 2024-01-18  3744  
e986ee1ba98444 zouxiaoh 2024-01-18  3745  static int ds5_mux_s_stream(struct v4l2_subdev *sd, int on)
e986ee1ba98444 zouxiaoh 2024-01-18  3746  {
e986ee1ba98444 zouxiaoh 2024-01-18  3747  	struct ds5 *state = container_of(sd, struct ds5, mux.sd.subdev);
e986ee1ba98444 zouxiaoh 2024-01-18  3748  	u16 streaming, status;
e986ee1ba98444 zouxiaoh 2024-01-18  3749  	int ret = 0;
e986ee1ba98444 zouxiaoh 2024-01-18  3750  	unsigned int i = 0;
e986ee1ba98444 zouxiaoh 2024-01-18  3751  	int restore_val = 0;
e986ee1ba98444 zouxiaoh 2024-01-18 @3752  	u16 config_status_base, stream_status_base, stream_id, vc_id;
e986ee1ba98444 zouxiaoh 2024-01-18  3753  	struct ds5_sensor *sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3754  	struct d4xx_pdata *dpdata = state->client->dev.platform_data;
e986ee1ba98444 zouxiaoh 2024-01-18  3755  
e986ee1ba98444 zouxiaoh 2024-01-18  3756  	// spare duplicate calls
e986ee1ba98444 zouxiaoh 2024-01-18  3757  	if (state->mux.last_set->streaming == on)
e986ee1ba98444 zouxiaoh 2024-01-18  3758  		return 0;
e986ee1ba98444 zouxiaoh 2024-01-18  3759  	if (state->is_depth) {
e986ee1ba98444 zouxiaoh 2024-01-18  3760  		sensor = &state->depth.sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3761  		config_status_base = DS5_DEPTH_CONFIG_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3762  		stream_status_base = DS5_DEPTH_STREAM_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3763  		stream_id = DS5_STREAM_DEPTH;
e986ee1ba98444 zouxiaoh 2024-01-18  3764  		vc_id = 0;
e986ee1ba98444 zouxiaoh 2024-01-18  3765  		state->client->addr = dpdata->subdev_info[0].board_info.addr;
e986ee1ba98444 zouxiaoh 2024-01-18  3766  	} else if (state->is_rgb) {
e986ee1ba98444 zouxiaoh 2024-01-18  3767  		sensor = &state->rgb.sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3768  		config_status_base = DS5_RGB_CONFIG_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3769  		stream_status_base = DS5_RGB_STREAM_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3770  		stream_id = DS5_STREAM_RGB;
e986ee1ba98444 zouxiaoh 2024-01-18  3771  		vc_id = 1;
e986ee1ba98444 zouxiaoh 2024-01-18  3772  		state->client->addr = dpdata->subdev_info[0].board_info.addr;
e986ee1ba98444 zouxiaoh 2024-01-18  3773  	} else if (state->is_depth_b) {
e986ee1ba98444 zouxiaoh 2024-01-18  3774  		sensor = &state->depth_b.sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3775  		config_status_base = DS5_DEPTH_CONFIG_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3776  		stream_status_base = DS5_DEPTH_STREAM_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3777  		stream_id = DS5_STREAM_DEPTH;
e986ee1ba98444 zouxiaoh 2024-01-18  3778  		vc_id = 2;
e986ee1ba98444 zouxiaoh 2024-01-18  3779  		state->client->addr = dpdata->subdev_info[1].board_info.addr;
e986ee1ba98444 zouxiaoh 2024-01-18  3780  	} else if (state->is_rgb_b) {
e986ee1ba98444 zouxiaoh 2024-01-18  3781  		sensor = &state->rgb_b.sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3782  		config_status_base = DS5_RGB_CONFIG_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3783  		stream_status_base = DS5_RGB_STREAM_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3784  		stream_id = DS5_STREAM_RGB;
e986ee1ba98444 zouxiaoh 2024-01-18  3785  		vc_id = 3;
e986ee1ba98444 zouxiaoh 2024-01-18  3786  		state->client->addr = dpdata->subdev_info[1].board_info.addr;
e986ee1ba98444 zouxiaoh 2024-01-18  3787  	} else if (state->is_y8) {
e986ee1ba98444 zouxiaoh 2024-01-18  3788  		sensor = &state->motion_t.sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3789  		config_status_base = DS5_IR_CONFIG_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3790  		stream_status_base = DS5_IR_STREAM_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3791  		stream_id = DS5_STREAM_IR;
e986ee1ba98444 zouxiaoh 2024-01-18  3792  		vc_id = 2;
e986ee1ba98444 zouxiaoh 2024-01-18  3793  		state->client->addr = dpdata->subdev_info[0].board_info.addr;
e986ee1ba98444 zouxiaoh 2024-01-18  3794  	} else if (state->is_imu) {
e986ee1ba98444 zouxiaoh 2024-01-18  3795  		sensor = &state->imu.sensor;
e986ee1ba98444 zouxiaoh 2024-01-18  3796  		config_status_base = DS5_IMU_CONFIG_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3797  		stream_status_base = DS5_IMU_STREAM_STATUS;
e986ee1ba98444 zouxiaoh 2024-01-18  3798  		stream_id = DS5_STREAM_IMU;
e986ee1ba98444 zouxiaoh 2024-01-18  3799  		vc_id = 3;
e986ee1ba98444 zouxiaoh 2024-01-18  3800  		state->client->addr = dpdata->subdev_info[0].board_info.addr;
e986ee1ba98444 zouxiaoh 2024-01-18  3801  	} else {
e986ee1ba98444 zouxiaoh 2024-01-18  3802  		return -EINVAL;
e986ee1ba98444 zouxiaoh 2024-01-18  3803  	}
e986ee1ba98444 zouxiaoh 2024-01-18  3804  
e986ee1ba98444 zouxiaoh 2024-01-18  3805  	dev_warn(&state->client->dev, "s_stream for stream %s, on = %d\n",
e986ee1ba98444 zouxiaoh 2024-01-18  3806  			state->mux.last_set->sd.name, on);
e986ee1ba98444 zouxiaoh 2024-01-18  3807  
e986ee1ba98444 zouxiaoh 2024-01-18  3808  	restore_val = state->mux.last_set->streaming;
e986ee1ba98444 zouxiaoh 2024-01-18  3809  	state->mux.last_set->streaming = on;
e986ee1ba98444 zouxiaoh 2024-01-18  3810  	sensor->streaming = on;
e986ee1ba98444 zouxiaoh 2024-01-18  3811  
e986ee1ba98444 zouxiaoh 2024-01-18  3812  	if (on) {
e986ee1ba98444 zouxiaoh 2024-01-18  3813  
e986ee1ba98444 zouxiaoh 2024-01-18  3814  		ret = ds5_configure(state);
e986ee1ba98444 zouxiaoh 2024-01-18  3815  		if (ret)
e986ee1ba98444 zouxiaoh 2024-01-18  3816  			goto restore_s_state;
e986ee1ba98444 zouxiaoh 2024-01-18  3817  
e986ee1ba98444 zouxiaoh 2024-01-18  3818  		ret = ds5_write(state, DS5_START_STOP_STREAM,
e986ee1ba98444 zouxiaoh 2024-01-18  3819  				DS5_STREAM_START | stream_id);
e986ee1ba98444 zouxiaoh 2024-01-18  3820  		if (ret < 0)
e986ee1ba98444 zouxiaoh 2024-01-18  3821  			goto restore_s_state;
e986ee1ba98444 zouxiaoh 2024-01-18  3822  
e986ee1ba98444 zouxiaoh 2024-01-18  3823  		// check streaming status from FW
e986ee1ba98444 zouxiaoh 2024-01-18  3824  		for (i = 0; i < DS5_START_MAX_COUNT; i++) {
e986ee1ba98444 zouxiaoh 2024-01-18  3825  			ds5_read(state, stream_status_base, &streaming);
e986ee1ba98444 zouxiaoh 2024-01-18  3826  			ds5_read(state, config_status_base, &status);
e986ee1ba98444 zouxiaoh 2024-01-18  3827  			if ((status & DS5_STATUS_STREAMING) &&
e986ee1ba98444 zouxiaoh 2024-01-18  3828  					streaming == DS5_STREAM_STREAMING)
e986ee1ba98444 zouxiaoh 2024-01-18  3829  				break;
e986ee1ba98444 zouxiaoh 2024-01-18  3830  
e986ee1ba98444 zouxiaoh 2024-01-18  3831  			msleep_range(DS5_START_POLL_TIME);
e986ee1ba98444 zouxiaoh 2024-01-18  3832  		}
e986ee1ba98444 zouxiaoh 2024-01-18  3833  
e986ee1ba98444 zouxiaoh 2024-01-18  3834  		if (i == DS5_START_MAX_COUNT) {
e986ee1ba98444 zouxiaoh 2024-01-18  3835  			dev_err(&state->client->dev,
e986ee1ba98444 zouxiaoh 2024-01-18  3836  				"start streaming failed, exit on timeout\n");
e986ee1ba98444 zouxiaoh 2024-01-18  3837  			/* notify fw */
e986ee1ba98444 zouxiaoh 2024-01-18  3838  			ret = ds5_write(state, DS5_START_STOP_STREAM,
e986ee1ba98444 zouxiaoh 2024-01-18  3839  					DS5_STREAM_STOP | stream_id);
e986ee1ba98444 zouxiaoh 2024-01-18  3840  			ret = -EAGAIN;
e986ee1ba98444 zouxiaoh 2024-01-18  3841  			goto restore_s_state;
e986ee1ba98444 zouxiaoh 2024-01-18  3842  		} else {
e986ee1ba98444 zouxiaoh 2024-01-18  3843  			dev_dbg(&state->client->dev, "started after %dms\n",
e986ee1ba98444 zouxiaoh 2024-01-18  3844  				i * DS5_START_POLL_TIME);
e986ee1ba98444 zouxiaoh 2024-01-18  3845  		}
e986ee1ba98444 zouxiaoh 2024-01-18  3846  	} else { // off
e986ee1ba98444 zouxiaoh 2024-01-18  3847  		ret = ds5_write(state, DS5_START_STOP_STREAM,
e986ee1ba98444 zouxiaoh 2024-01-18  3848  				DS5_STREAM_STOP | stream_id);
e986ee1ba98444 zouxiaoh 2024-01-18  3849  		if (ret < 0)
e986ee1ba98444 zouxiaoh 2024-01-18  3850  			goto restore_s_state;
e986ee1ba98444 zouxiaoh 2024-01-18  3851  
e986ee1ba98444 zouxiaoh 2024-01-18  3852  		if (!state->depth.sensor.streaming
e986ee1ba98444 zouxiaoh 2024-01-18  3853  			&& !state->depth_b.sensor.streaming
e986ee1ba98444 zouxiaoh 2024-01-18  3854  			&& !state->rgb.sensor.streaming
e986ee1ba98444 zouxiaoh 2024-01-18  3855  			&& !state->rgb_b.sensor.streaming
e986ee1ba98444 zouxiaoh 2024-01-18  3856  			&& !state->motion_t.sensor.streaming
e986ee1ba98444 zouxiaoh 2024-01-18  3857  			&& !state->imu.sensor.streaming)
e986ee1ba98444 zouxiaoh 2024-01-18  3858  			d4xx_reset_oneshot(state);
e986ee1ba98444 zouxiaoh 2024-01-18  3859  	}
e986ee1ba98444 zouxiaoh 2024-01-18  3860  
e986ee1ba98444 zouxiaoh 2024-01-18  3861  	ds5_read(state, config_status_base, &status);
e986ee1ba98444 zouxiaoh 2024-01-18  3862  	ds5_read(state, stream_status_base, &streaming);
e986ee1ba98444 zouxiaoh 2024-01-18  3863  	dev_info(&state->client->dev,
e986ee1ba98444 zouxiaoh 2024-01-18  3864  			"%s %s, stream_status 0x%x:%x, config_status 0x%x:%x\n",
e986ee1ba98444 zouxiaoh 2024-01-18  3865  			ds5_get_sensor_name(state),
e986ee1ba98444 zouxiaoh 2024-01-18  3866  			(on)?"START":"STOP",
e986ee1ba98444 zouxiaoh 2024-01-18  3867  			stream_status_base, streaming,
e986ee1ba98444 zouxiaoh 2024-01-18  3868  			config_status_base, status);
e986ee1ba98444 zouxiaoh 2024-01-18  3869  
e986ee1ba98444 zouxiaoh 2024-01-18  3870  	return ret;
e986ee1ba98444 zouxiaoh 2024-01-18  3871  
e986ee1ba98444 zouxiaoh 2024-01-18  3872  restore_s_state:
e986ee1ba98444 zouxiaoh 2024-01-18  3873  
e986ee1ba98444 zouxiaoh 2024-01-18  3874  	ds5_read(state, config_status_base, &status);
e986ee1ba98444 zouxiaoh 2024-01-18  3875  	dev_err(&state->client->dev,
e986ee1ba98444 zouxiaoh 2024-01-18  3876  			"%s stream toggle failed! %x status 0x%04x\n",
e986ee1ba98444 zouxiaoh 2024-01-18  3877  			ds5_get_sensor_name(state), restore_val, status);
e986ee1ba98444 zouxiaoh 2024-01-18  3878  
e986ee1ba98444 zouxiaoh 2024-01-18  3879  	state->mux.last_set->streaming = restore_val;
e986ee1ba98444 zouxiaoh 2024-01-18  3880  	sensor->streaming = restore_val;
e986ee1ba98444 zouxiaoh 2024-01-18  3881  
e986ee1ba98444 zouxiaoh 2024-01-18  3882  	return ret;
e986ee1ba98444 zouxiaoh 2024-01-18  3883  }
e986ee1ba98444 zouxiaoh 2024-01-18  3884  

:::::: The code at line 3752 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
