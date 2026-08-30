Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9079283FE5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788117725; cv=none; b=If5iupOigvM6WYnFGiDA4LSl36CQhCduobsLCRllfvuzqQAozR0r2AcVcdUEqrsHFJ3vOwN57s7iNAiuqWEGFOpgCDuD893naXaKOAiJm7lZtCY0EHy4oByRx2TQTUeAry+ze5o3pUsvTIRYFD6/TvYucJif7C9R/r9iF7Frcmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788117725; c=relaxed/simple;
	bh=mEZtljBcgsMD0Q0/s3DxMCEunQrD6n0t7014/UQ4FVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZFJDkWs2a8LgyC44hQIR8QHNErQHPdaFVU9/+c4H3OCstsxj1iBl/bgvJ/hOnUR9SjWoks/GmyzVjMxOhNuEOP6A4j0TLmatjIGdTCPhi9+C9ZFKMXXOG7sSGeSBRJairv7VFzzbiXmJXgyoAxF6SUomDJaDyABgZBeJJHebgvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qa8KqSDI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qa8KqSDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788117722; x=1819653722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mEZtljBcgsMD0Q0/s3DxMCEunQrD6n0t7014/UQ4FVI=;
  b=Qa8KqSDIdDEagnxiAK5YWe0Go00OAa1uVGNIjRtOIdOiQq7Nk4wXRPTn
   Y6hVJakiVz1j5oG8jhZ39ODqBMbYwyRBeB5YaKwKTxO8fP6aaRPA1i5QJ
   4DIOBfcY6o0eCa9oi0UzGsZL2DJ2NXn/IhBDgejt8Nz2hFvSUDBnoCeQa
   Gnnm/3QZUqj9+9RzJ7XOcf7O2qU2qhvZAykZ/cAEuVKZduq2ECwvWO9Sn
   aAckWlS7tVhj6KADJOxc7wkIrWt6OpDdby9RvIVpPKAt/QLxeed4WImuB
   urwgV95VZq6WLWAyrZ/jUPRy7cmBXe1XyU3d0S45oq0DI1ysjE7y67iQN
   w==;
X-CSE-ConnectionGUID: YLAy216uQgq7TBFcEN7OlQ==
X-CSE-MsgGUID: pU7V/SA+SEaiNLqV0O577w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="105908917"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="105908917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 12:22:02 -0700
X-CSE-ConnectionGUID: hv/sckytRKyqXAo65iSJiA==
X-CSE-MsgGUID: Wu6SxCapTsmKsEewxYIZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="262490383"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 30 Aug 2026 12:22:00 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0l6M-000000000CV-1h8Q;
	Sun, 30 Aug 2026 19:21:58 +0000
Date: Sun, 30 Aug 2026 21:21:07 +0200
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/staging/media/max96712/max96712.c:267:13: error:
 incompatible function pointer types initializing 'int (*)(struct v4l2_subdev
 *, const struct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct
 v4l2_subdev_format *)' with an expression o...
Message-ID: <202608302111.KSUnWF5W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-D=
ocumentation-Improve-pixel-rate-calculation-documentation/20260807-004311
head:   e0a6fe294ffbd4c2f0fae9bd3e777bc9375161dc
commit: e0a6fe294ffbd4c2f0fae9bd3e777bc9375161dc media: v4l2-subdev: Add st=
ruct v4l2_subdev_client_info pointer to pad ops
date:   3 weeks ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/202=
60830/202608302111.KSUnWF5W-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260830/202608302111.KSUnWF5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302111.KSUnWF5W-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/max96712/max96712.c:267:13: error: incompatible fu=
nction pointer types initializing 'int (*)(struct v4l2_subdev *, const stru=
ct v4l2_subdev_client_info *, struct v4l2_subdev_state *, struct v4l2_subde=
v_format *)' with an expression of type 'int (struct v4l2_subdev *, struct =
v4l2_subdev_state *, struct v4l2_subdev_format *)' [-Wincompatible-function=
-pointer-types]
     267 |         .set_fmt =3D v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/media/platform/renesas/sh_vou.c:980:8: error: too few arguments =
to function call, expected 4, have 3
     980 |         ret =3D v4l2_device_call_until_err(&vou_dev->v4l2_dev, 0=
, pad,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
     981 |                                          set_fmt, NULL, &format);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-device.h:448:2: note: expanded from macro 'v4l2_devic=
e_call_until_err'
     448 |         __v4l2_device_call_subdevs_until_err_p(v4l2_dev, __sd,  =
        \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     449 |                         (grpid) =3D=3D 0 || __sd->grp_id =3D=3D =
(grpid), o, f , \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
     450 |                         ##args);                                =
        \
         |                         ~~~~~~~
   include/media/v4l2-device.h:356:41: note: expanded from macro '__v4l2_de=
vice_call_subdevs_until_err_p'
     356 |                         __err =3D (sd)->ops->o->f((sd) , ##args)=
;         \
         |                                 ~~~~~~~~~~~~~~~              ^
   1 error generated.
--
>> drivers/media/platform/ti/cal/cal-video.c:139:8: error: incompatible poi=
nter types passing 'struct v4l2_subdev_state *' to parameter of type 'const=
 struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
     139 |         ret =3D v4l2_subdev_call_state_active(sd, pad, set_fmt, =
NULL, &sd_fmt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2010:41: note: expanded from macro 'v4l2_sub=
dev_call_state_active'
    2010 |                 __result =3D v4l2_subdev_call(sd, o, f, state, #=
#args);   \
         |                                                       ^~~~~
>> drivers/media/platform/ti/cal/cal-video.c:139:8: error: incompatible poi=
nter types passing 'struct v4l2_subdev_state *' to parameter of type 'const=
 struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
     139 |         ret =3D v4l2_subdev_call_state_active(sd, pad, set_fmt, =
NULL, &sd_fmt);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2010:41: note: expanded from macro 'v4l2_sub=
dev_call_state_active'
    2010 |                 __result =3D v4l2_subdev_call(sd, o, f, state, #=
#args);   \
         |                                                       ^~~~~
   drivers/media/platform/ti/cal/cal-video.c:284:2: error: incompatible poi=
nter types passing 'struct v4l2_subdev_state *' to parameter of type 'const=
 struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
     284 |         v4l2_subdev_call_state_active(sd, pad, set_fmt, NULL, &s=
d_fmt);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/media/v4l2-subdev.h:2010:41: note: expanded from macro 'v4l2_sub=
dev_call_state_active'
    2010 |                 __result =3D v4l2_subdev_call(sd, o, f, state, #=
#args);   \
         |                                                       ^~~~~
   drivers/media/platform/ti/cal/cal-video.c:284:2: error: incompatible poi=
nter types passing 'struct v4l2_subdev_state *' to parameter of type 'const=
 struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
     284 |         v4l2_subdev_call_state_active(sd, pad, set_fmt, NULL, &s=
d_fmt);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   include/media/v4l2-subdev.h:2010:41: note: expanded from macro 'v4l2_sub=
dev_call_state_active'
    2010 |                 __result =3D v4l2_subdev_call(sd, o, f, state, #=
#args);   \
         |                                                       ^~~~~
   4 errors generated.
--
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few argu=
ments to function call, expected 4, have 3
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:15: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2047 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1980:20: note: expanded from macro 'v4l2_sub=
dev_call'
    1979 |                         __result =3D v4l2_subdev_call_wrappers.o=
->f(      \
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1980 |                                                         __sd, ##=
args);  \
         |                                                                 =
    ^
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1066:8: error: too few argu=
ments to function call, expected 4, have 3
    1066 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, &format);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:2047:15: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2047 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1982:43: note: expanded from macro 'v4l2_sub=
dev_call'
    1982 |                         __result =3D __sd->ops->o->f(__sd, ##arg=
s);       \
         |                                    ~~~~~~~~~~~~~~~             ^
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: incompatible=
 pointer types passing 'struct v4l2_subdev_state *' to parameter of type 'c=
onst struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
    1228 |                                          &format);
         |                                          ~~~~~~~~
   include/media/v4l2-subdev.h:2047:42: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2047 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
>> drivers/media/platform/st/stm32/stm32-dcmi.c:1227:8: error: incompatible=
 pointer types passing 'struct v4l2_subdev_state *' to parameter of type 'c=
onst struct v4l2_subdev_client_info *' [-Wincompatible-pointer-types]
    1227 |         ret =3D v4l2_subdev_call_state_try(dcmi->source, pad, se=
t_fmt, NULL,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
    1228 |                                          &format);
         |                                          ~~~~~~~~
   include/media/v4l2-subdev.h:2047:42: note: expanded from macro 'v4l2_sub=
dev_call_state_try'
    2047 |                         __result =3D v4l2_subdev_call(sd, o, f, =
state, ##args); \
         |                                                               ^~=
~~~
   4 errors generated.
--
>> drivers/media/i2c/cvs/v4l2.c:365:13: error: incompatible function pointe=
r types initializing 'int (*)(struct v4l2_subdev *, const struct v4l2_subde=
v_client_info *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' =
with an expression of type 'int (struct v4l2_subdev *, struct v4l2_subdev_s=
tate *, struct v4l2_subdev_format *)' [-Wincompatible-function-pointer-type=
s]
     365 |         .set_fmt =3D cvs_csi_set_fmt,
         |                    ^~~~~~~~~~~~~~~
   1 error generated.


vim +267 drivers/staging/media/max96712/max96712.c

ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10  264 =20
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  265  static const struct v=
4l2_subdev_pad_ops max96712_pad_ops =3D {
ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10  266  	.get_fmt =3D v4l2_su=
bdev_get_fmt,
ce44dc1feab5f0 Niklas S=C3=B6derlund 2024-05-10 @267  	.set_fmt =3D v4l2_su=
bdev_get_fmt,
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  268  };
5814f32fef137e Niklas S=C3=B6derlund 2021-09-12  269 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
