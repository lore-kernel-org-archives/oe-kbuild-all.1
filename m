Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A31A6828
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788117066; cv=none; b=cFv3wsC+1gGHs6kgN4GRBOazQqwdwveV4YCzMB02Hfl05xqczMjLmcMgyUn1ButXLbM3a9p1lr2T96e3JMQQoqCvnHvWYz7Nz6gYZb1js9KcIPzBOV0ZpOmtssZKV8GhzxHqkoLilKtEkQrSb7S/I322B5MqQELCtVIPLAYEy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788117066; c=relaxed/simple;
	bh=fXix4Y9LbNisczfCzJUPcq/nphElHQbUPHyUMaz3Gbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nrqO58WYs7m/jrf32mbVGe3w2yaTEN+Ukr89ZmiA6oGVWEc0ZVpp9ipH/HWRjyWs/gNNmEBg2/PTl78wukTId18FgOahGXVSiVZS8N1zElQdohZ32EvL999FQs4RWLviSwtU6Ufh/xxAAHg1jrCmJI38XTfM49EzW4iwqVXMl7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISpLP5yf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISpLP5yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788117064; x=1819653064;
  h=date:from:to:cc:subject:message-id;
  bh=fXix4Y9LbNisczfCzJUPcq/nphElHQbUPHyUMaz3Gbo=;
  b=ISpLP5yfQBX+CUWu9q9iTVj8S8/pjJzCD+R/hVjIF62q9Jxb2le/OI3a
   JjpVr8BFIJHy+O9tPS4Ex/TNDZfzq3FC5yyeJlrXBY5DoOo/pH78xtdo8
   EbtFH0rpn0xr6arNGU4x9rM+D7e8qaOV9farfeKM/PG133MjmjQLQmCLK
   HleXXCLcfOHvWlLT0L6PzobCMDVVE7KAcQ+WBMc3TWHeVQ/z92OOSKXrW
   diZHrCzDh9S/r+xJEuv2Bi7AkyLd4f7NI2YvtNR67qBPd0XB08ttpwjlq
   D6gq1bTBxg/Y95x3AbD6tzn2E1o1eY2QiPvMVideL/jzxI5y0J31ExkL3
   w==;
X-CSE-ConnectionGUID: K7ljKb1cShe3HeUO/WnWIg==
X-CSE-MsgGUID: fjdYuT58SJuTpfp1dIKrKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99882945"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99882945"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 12:11:02 -0700
X-CSE-ConnectionGUID: EdBoG2OMTW+6twP8VEMLsg==
X-CSE-MsgGUID: VkvFfIkkQAShNZowDU3noA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266803926"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Aug 2026 12:11:00 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0kvi-000000000CR-1JnL;
	Sun, 30 Aug 2026 19:10:58 +0000
Date: Sun, 30 Aug 2026 21:10:33 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/media/platform/renesas/sh_vou.c:981:57: error:
 passing argument 3 of '((const struct v4l2_subdev_pad_ops
 *)__sd->ops->pad)->set_fmt' from incompatible pointer type
Message-ID: <202608302104.TikGbJ1M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-Documentation-Improve-pixel-rate-calculation-documentation/20260807-004311
head:   e0a6fe294ffbd4c2f0fae9bd3e777bc9375161dc
commit: e0a6fe294ffbd4c2f0fae9bd3e777bc9375161dc media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops
date:   3 weeks ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260830/202608302104.TikGbJ1M-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302104.TikGbJ1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302104.TikGbJ1M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/renesas/sh_vou.c:24:
   drivers/media/platform/renesas/sh_vou.c: In function 'sh_vou_s_selection':
>> drivers/media/platform/renesas/sh_vou.c:981:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     981 |                                          set_fmt, NULL, &format);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         struct v4l2_subdev_format *
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:980:15: note: in expansion of macro 'v4l2_device_call_until_err'
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:981:57: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                                          ^~~~
   drivers/media/platform/renesas/sh_vou.c:980:15: note: in expansion of macro 'v4l2_device_call_until_err'
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                 ^
   include/media/v4l2-device.h:448:9: note: in expansion of macro '__v4l2_device_call_subdevs_until_err_p'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:980:15: note: in expansion of macro 'v4l2_device_call_until_err'
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/media/v4l2-device.h:13:
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
--
>> drivers/staging/media/max96712/max96712.c:267:20: error: initialization of 'int (*)(struct v4l2_subdev *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-pointer-types]
     267 |         .set_fmt = v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/max96712/max96712.c:267:20: note: (near initialization for 'max96712_pad_ops.set_fmt')
   In file included from drivers/staging/media/max96712/max96712.c:17:
   include/media/v4l2-subdev.h:1477:5: note: 'v4l2_subdev_get_fmt' declared here
    1477 | int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
         |     ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/media/v4l2-device.h:13,
                    from drivers/media/platform/st/stm32/stm32-dcmi.c:33:
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_try_fmt':
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |                                                                      ^~~~~~~
         |                                                                      |
         |                                                                      struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1979:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    1979 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:36: note: in expansion of macro 'v4l2_subdev_call'
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |                                                                      ^~~~~~~
         |                                                                      |
         |                                                                      struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:70: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1982:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ^~~~
   include/media/v4l2-subdev.h:2047:36: note: in expansion of macro 'v4l2_subdev_call'
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c: In function 'dcmi_set_sensor_format':
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   drivers/media/platform/st/stm32/stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from sh_vou.c:24:
   sh_vou.c: In function 'sh_vou_s_selection':
   sh_vou.c:981:57: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
     981 |                                          set_fmt, NULL, &format);
         |                                                         ^~~~~~~
         |                                                         |
         |                                                         struct v4l2_subdev_format *
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                                          ^~~~
   sh_vou.c:980:15: note: in expansion of macro 'v4l2_device_call_until_err'
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   sh_vou.c:981:57: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
   include/media/v4l2-device.h:356:58: note: in definition of macro '__v4l2_device_call_subdevs_until_err_p'
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                                          ^~~~
   sh_vou.c:980:15: note: in expansion of macro 'v4l2_device_call_until_err'
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-device.h:356:33: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
     356 |                         __err = (sd)->ops->o->f((sd) , ##args);         \
         |                                 ^
   include/media/v4l2-device.h:448:9: note: in expansion of macro '__v4l2_device_call_subdevs_until_err_p'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,          \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sh_vou.c:980:15: note: in expansion of macro 'v4l2_device_call_until_err'
     980 |         ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/media/v4l2-device.h:13:
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
--
   In file included from include/media/v4l2-device.h:13,
                    from stm32-dcmi.c:33:
   stm32-dcmi.c: In function 'dcmi_try_fmt':
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |                                                                      ^~~~~~~
         |                                                                      |
         |                                                                      struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   stm32-dcmi.c:1066:70: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1979:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt'; expected 4, have 3
    1979 |                         __result = v4l2_subdev_call_wrappers.o->f(      \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:36: note: in expansion of macro 'v4l2_subdev_call'
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   stm32-dcmi.c:1066:70: error: passing argument 3 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |                                                                      ^~~~~~~
         |                                                                      |
         |                                                                      struct v4l2_subdev_format *
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   stm32-dcmi.c:1066:70: note: expected 'struct v4l2_subdev_state *' but argument is of type 'struct v4l2_subdev_format *'
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1982:36: error: too few arguments to function '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt'; expected 4, have 3
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                    ^~~~
   include/media/v4l2-subdev.h:2047:36: note: in expansion of macro 'v4l2_subdev_call'
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~
   stm32-dcmi.c:1066:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1066 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:856:15: note: declared here
     856 |         int (*set_fmt)(struct v4l2_subdev *sd,
         |               ^~~~~~~
   stm32-dcmi.c: In function 'dcmi_set_sensor_format':
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)v4l2_subdev_call_wrappers.pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1980:65: note: in definition of macro 'v4l2_subdev_call'
    1980 |                                                         __sd, ##args);  \
         |                                                                 ^~~~
   stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:2047:63: error: passing argument 2 of '((const struct v4l2_subdev_pad_ops *)__sd->ops->pad)->set_fmt' from incompatible pointer type [-Wincompatible-pointer-types]
    2047 |                         __result = v4l2_subdev_call(sd, o, f, state, ##args); \
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct v4l2_subdev_state *
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:63: note: expected 'const struct v4l2_subdev_client_info *' but argument is of type 'struct v4l2_subdev_state *'
   include/media/v4l2-subdev.h:1982:60: note: in definition of macro 'v4l2_subdev_call'
    1982 |                         __result = __sd->ops->o->f(__sd, ##args);       \
         |                                                            ^~~~
   stm32-dcmi.c:1227:15: note: in expansion of macro 'v4l2_subdev_call_state_try'
    1227 |         ret = v4l2_subdev_call_state_try(dcmi->source, pad, set_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +981 drivers/media/platform/renesas/sh_vou.c

a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   919  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   920  /* Assume a dull encoder, do all the work ourselves. */
61fbacc115731d drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   921  static int sh_vou_s_selection(struct file *file, void *fh,
61fbacc115731d drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   922  			      struct v4l2_selection *sel)
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   923  {
61fbacc115731d drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   924  	struct v4l2_rect *rect = &sel->r;
fd51625d6331c8 drivers/media/platform/sh_vou.c         Laurent Pinchart      2013-01-03   925  	struct sh_vou_device *vou_dev = video_drvdata(file);
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   926  	struct v4l2_subdev_selection sd_sel = {
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   927  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   928  		.target = V4L2_SEL_TGT_COMPOSE,
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   929  	};
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   930  	struct v4l2_pix_format *pix = &vou_dev->pix;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   931  	struct sh_vou_geometry geo;
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   932  	struct v4l2_subdev_format format = {
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   933  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   934  		/* Revisit: is this the correct code? */
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   935  		.format.code = MEDIA_BUS_FMT_YUYV8_2X8,
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   936  		.format.field = V4L2_FIELD_INTERLACED,
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   937  		.format.colorspace = V4L2_COLORSPACE_SMPTE170M,
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   938  	};
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   939  	unsigned int img_height_max;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   940  	int ret;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   941  
61fbacc115731d drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   942  	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT ||
61fbacc115731d drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   943  	    sel->target != V4L2_SEL_TGT_COMPOSE)
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   944  		return -EINVAL;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   945  
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   946  	if (vb2_is_busy(&vou_dev->queue))
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   947  		return -EBUSY;
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   948  
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   949  	if (vou_dev->std & V4L2_STD_525_60)
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   950  		img_height_max = 480;
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   951  	else
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   952  		img_height_max = 576;
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   953  
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   954  	v4l_bound_align_image(&rect->width,
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   955  			      VOU_MIN_IMAGE_WIDTH, VOU_MAX_IMAGE_WIDTH, 1,
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   956  			      &rect->height,
57af3ad59d953f drivers/media/platform/sh_vou.c         Hans Verkuil          2015-06-07   957  			      VOU_MIN_IMAGE_HEIGHT, img_height_max, 1, 0);
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   958  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   959  	if (rect->width + rect->left > VOU_MAX_IMAGE_WIDTH)
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   960  		rect->left = VOU_MAX_IMAGE_WIDTH - rect->width;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   961  
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   962  	if (rect->height + rect->top > img_height_max)
765fe17c4f018c drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-07-29   963  		rect->top = img_height_max - rect->height;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   964  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   965  	geo.output = *rect;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   966  	geo.in_width = pix->width;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   967  	geo.in_height = pix->height;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   968  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   969  	/* Configure the encoder one-to-one, position at 0, ignore errors */
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   970  	sd_sel.r.width = geo.output.width;
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   971  	sd_sel.r.height = geo.output.height;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   972  	/*
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   973  	 * We first issue a S_SELECTION, so that the subsequent S_FMT delivers the
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   974  	 * final encoder configuration.
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   975  	 */
10d5509c8d50a2 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-12-14   976  	v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
e0a6fe294ffbd4 drivers/media/platform/renesas/sh_vou.c Sakari Ailus          2026-06-08   977  				   set_selection, NULL, NULL, &sd_sel);
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   978  	format.format.width = geo.output.width;
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   979  	format.format.height = geo.output.height;
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   980  	ret = v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0, pad,
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09  @981  					 set_fmt, NULL, &format);
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   982  	/* Must be implemented, so, don't check for -ENOIOCTLCMD */
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   983  	if (ret < 0)
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   984  		return ret;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   985  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   986  	/* Sanity checks */
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   987  	if ((unsigned)format.format.width > VOU_MAX_IMAGE_WIDTH ||
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   988  	    (unsigned)format.format.height > img_height_max ||
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   989  	    format.format.code != MEDIA_BUS_FMT_YUYV8_2X8)
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   990  		return -EIO;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   991  
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   992  	geo.output.width = format.format.width;
ebf984bb151e99 drivers/media/platform/sh_vou.c         Hans Verkuil          2015-04-09   993  	geo.output.height = format.format.height;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   994  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   995  	/*
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   996  	 * No down-scaling. According to the API, current call has precedence:
02e6d2eaa9c3f7 drivers/media/platform/sh_vou.c         Ricardo Ribalda       2018-11-09   997  	 * https://linuxtv.org/downloads/v4l-dvb-apis/uapi/v4l/crop.html#cropping-structures
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   998  	 */
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17   999  	vou_adjust_input(&geo, vou_dev->std);
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1000  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1001  	/* We tried to preserve output rectangle, but it could have changed */
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1002  	vou_dev->rect = geo.output;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1003  	pix->width = geo.in_width;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1004  	pix->height = geo.in_height;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1005  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1006  	sh_vou_configure_geometry(vou_dev, vou_dev->pix_idx,
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1007  				  geo.scale_idx_h, geo.scale_idx_v);
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1008  
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1009  	return 0;
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1010  }
a81fb9b223508f drivers/media/video/sh_vou.c            Guennadi Liakhovetski 2010-03-17  1011  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
