Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E53BD638
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441415; cv=none; b=mx6//c0Znu6xdqnYF8ceKcWa3DCandZ5hbbrMAoDSnYtQLNZmITWegoDWVSeZsoqa119yrTafS4c0do1F5QnTXt8odkD+pzDlyi+DuMa9V5I3r29S8XS8yFzmNiwINrcluznDm+bv36e4DVnbdvYTL5AdbZ2Bi7hmvbHfOyH40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441415; c=relaxed/simple;
	bh=My+P2QffX5CPNPMsD36PcEVrt2q4JfNjhKW3UBktURY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eRI9nooIMIcrXr9JtPYUOm/AyRkCFSEpOTZgz1Fs+OVRetxGVMrqOm8DiZuoISnT1Ek8Qf8p0aQrB3+2fbudhI7VSHFHWkwZgDgU3tZOygIyr5ck4gdx+4gwJWenXjHugJ/QjhULgysQil8QrmbAlIP8AherDaS0M/icDl4/vmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LcnPCyUz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcnPCyUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779441410; x=1810977410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=My+P2QffX5CPNPMsD36PcEVrt2q4JfNjhKW3UBktURY=;
  b=LcnPCyUzl4QLrIUJIvLAEo61tphPO7CXiu5I20xKXMJ+BMgYqPh/4lgS
   5DxB9PMTa2kqIaTEl+kt2ofYvmpMeNUBGSC0ZUZotHmQgV/h3qsUD1qmO
   lNYyonUK052b+uwAJrDPQxPYu1sL08qUobs/oNu+7SlhQVAorguNjUSmh
   ECTiI275drcyUCHPS5Afhqq7dsQPTpKD7siyGA1dfQDR/qSSyCxUXAS2p
   H/rj1GhN2lRhGrT9fNeet8xHAuIycSShfbEPHxji08DSem8203s0UEe8P
   FNhndSKVDbkHWcI5id0GlXxS/kdI25ma7M8+s2ALoIv8FVJEYDRs1tJTp
   g==;
X-CSE-ConnectionGUID: 7JJj6CoSTle6zTG5sPRAtw==
X-CSE-MsgGUID: XBk6+7QMSsK/pYTtTM6TDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80270942"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80270942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:16:45 -0700
X-CSE-ConnectionGUID: 4ur6IOfuR/+7Yyza6IClXg==
X-CSE-MsgGUID: gbY0sb1eSSe1fmY/pUug+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240737979"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 May 2026 02:16:44 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQLzk-0000000026p-2olL;
	Fri, 22 May 2026 09:16:40 +0000
Date: Fri, 22 May 2026 17:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 821/1197]
 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:592:39: warning:
 format '%lx' expects argument of type 'long unsigned int', but argument 6 has
 type '__u64' {aka 'long long unsigned int'}
Message-ID: <202605221756.dJ5DYEof-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 2ce6e372240ca43055026eea7f659d9cc9e6adc9 [821/1197] cheri: Fix comp=
ile in drivers/staging/
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260522=
/202605221756.dJ5DYEof-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260522/202605221756.dJ5DYEof-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221756.dJ5DYEof-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/cdev.h:5,
                    from drivers/platform/raspberrypi/vchiq-interface/vchiq=
_dev.c:7:
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c: In function 'v=
chiq_ioctl':
>> drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:592:39: warning=
: format '%lx' expects argument of type 'long unsigned int', but argument 6=
 has type '__u64' {aka 'long long unsigned int'} [-Wformat=3D]
     592 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s,=
 arg %lx\n", instance,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dy=
namic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynam=
ic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, #=
#__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynam=
ic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:592:9: note: in=
 expansion of macro 'dev_dbg'
     592 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s,=
 arg %lx\n", instance,
         |         ^~~~~~~
   drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:592:72: note: f=
ormat string is defined here
     592 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s,=
 arg %lx\n", instance,
         |                                                                 =
     ~~^
         |                                                                 =
       |
         |                                                                 =
       long unsigned int
         |                                                                 =
     %llx


vim +592 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c

f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  582 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  583  static long
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  584  vchiq_ioctl(struct file *file, uns=
igned int cmd, unsigned long arg)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  585  {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  586  	struct vchiq_instance *instance =
=3D file->private_data;
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  587  	int status =3D 0;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  588  	struct vchiq_service *service =3D =
NULL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  589  	long ret =3D 0;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  590  	int i, rc;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  591 =20
96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Thomas Wei=C3=9Fschuh      2025-03-11 @592  	dev_dbg(instance->state->dev=
, "arm: instance %p, cmd %s, arg %lx\n", instance,
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Gaston Gonzalez       2021-09-12  593  		((_IOC_TYPE(cmd) =3D=3D VCHIQ_IO=
C_MAGIC) && (_IOC_NR(cmd) <=3D VCHIQ_IOC_MAX)) ?
2ce6e372240ca4 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c    =
  Christian A. Ehrhardt 2026-04-28  594  		ioctl_names[_IOC_NR(cmd)] : "<in=
valid>", __c_ua(arg));
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  595 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  596  	switch (cmd) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  597  	case VCHIQ_IOC_SHUTDOWN:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  598  		if (!instance->connected)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  599  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  600 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  601  		/* Remove all services */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  602  		i =3D 0;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  603  		while ((service =3D next_service=
_by_instance(instance->state,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  604  							   instance, &i))) {
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  605  			status =3D vchiq_remove_service=
(instance, service->handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  606  			vchiq_service_put(service);
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  607  			if (status)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  608  				break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  609  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  610  		service =3D NULL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  611 =20
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  612  		if (!status) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  613  			/* Wake the completion thread a=
nd ask it to exit */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  614  			instance->closing =3D 1;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  615  			complete(&instance->insert_even=
t);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  616  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  617 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  618  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  619 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  620  	case VCHIQ_IOC_CONNECT:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  621  		if (instance->connected) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  622  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  623  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  624  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  625  		rc =3D mutex_lock_killable(&inst=
ance->state->mutex);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  626  		if (rc) {
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  627  			dev_err(instance->state->dev,
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  628  				"arm: vchiq: connect: could no=
t lock mutex for state %d: %d\n",
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  629  				instance->state->id, rc);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  630  			ret =3D -EINTR;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  631  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  632  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  633  		status =3D vchiq_connect_interna=
l(instance->state, instance);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  634  		mutex_unlock(&instance->state->m=
utex);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  635 =20
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  636  		if (!status)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  637  			instance->connected =3D 1;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  638  		else
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  639  			dev_err(instance->state->dev,
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  640  				"arm: vchiq: could not connect=
: %d\n", status);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  641  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  642 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  643  	case VCHIQ_IOC_CREATE_SERVICE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  644  		struct vchiq_create_service __us=
er *argp;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  645  		struct vchiq_create_service args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  646 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  647  		argp =3D (void __user *)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  648  		if (copy_from_user(&args, argp, =
sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  649  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  650  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  651  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  652 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  653  		ret =3D vchiq_ioc_create_service=
(instance, &args);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  654  		if (ret < 0)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  655  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  656 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  657  		if (put_user(args.handle, &argp-=
>handle)) {
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  658  			vchiq_remove_service(instance, =
args.handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  659  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  660  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  661  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  662 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  663  	case VCHIQ_IOC_CLOSE_SERVICE:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  664  	case VCHIQ_IOC_REMOVE_SERVICE: {
2ce6e372240ca4 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c    =
  Christian A. Ehrhardt 2026-04-28  665  		unsigned int handle =3D __c_ua(a=
rg);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  666  		struct user_service *user_servic=
e;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  667 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  668  		service =3D find_service_for_ins=
tance(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  669  		if (!service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  670  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  671  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  672  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  673 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  674  		user_service =3D service->base.u=
serdata;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  675 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  676  		/*
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  677  		 * close_pending is false on fir=
st entry, and when the
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  678  		 * wait in vchiq_close_service h=
as been interrupted.
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  679  		 */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  680  		if (!user_service->close_pending=
) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  681  			status =3D (cmd =3D=3D VCHIQ_IO=
C_CLOSE_SERVICE) ?
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  682  				 vchiq_close_service(instance,=
 service->handle) :
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  683  				 vchiq_remove_service(instance=
, service->handle);
3414994ba84042 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  684  			if (status)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  685  				break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  686  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  687 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  688  		/*
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  689  		 * close_pending is true once th=
e underlying service
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  690  		 * has been closed until the cli=
ent library calls the
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  691  		 * CLOSE_DELIVERED ioctl, signal=
ling close_event.
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  692  		 */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  693  		if (user_service->close_pending =
&&
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Gaston Gonzalez       2021-09-12  694  		    wait_for_completion_interrup=
tible(&user_service->close_event))
82a9eb4a3561e1 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  695  			status =3D -EAGAIN;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  696  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  697  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  698 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  699  	case VCHIQ_IOC_USE_SERVICE:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  700  	case VCHIQ_IOC_RELEASE_SERVICE:	{
2ce6e372240ca4 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c    =
  Christian A. Ehrhardt 2026-04-28  701  		unsigned int handle =3D __c_ua(a=
rg);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  702 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  703  		service =3D find_service_for_ins=
tance(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  704  		if (service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  705  			ret =3D (cmd =3D=3D VCHIQ_IOC_U=
SE_SERVICE) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  706  				vchiq_use_service_internal(ser=
vice) :
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  707  				vchiq_release_service_internal=
(service);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  708  			if (ret) {
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  709  				dev_err(instance->state->dev,
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  710  					"suspend: cmd %s returned err=
or %ld for service %p4cc:%03d\n",
e70f17ed997cb7 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  711  					(cmd =3D=3D VCHIQ_IOC_USE_SER=
VICE) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  712  					"VCHIQ_IOC_USE_SERVICE" :
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  713  					"VCHIQ_IOC_RELEASE_SERVICE",
ae094de38e430e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-10-25  714  					ret, &service->base.fourcc,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  715  					service->client_id);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  716  			}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  717  		} else {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  718  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  719  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  720  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  721 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  722  	case VCHIQ_IOC_QUEUE_MESSAGE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  723  		struct vchiq_queue_message args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  724 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  725  		if (copy_from_user(&args, (const=
 void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  726  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  727  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  728  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  729  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  730 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  731  		service =3D find_service_for_ins=
tance(instance, args.handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  732 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  733  		if (service && (args.count <=3D =
MAX_ELEMENTS)) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  734  			/* Copy elements into kernel sp=
ace */
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  735  			struct vchiq_element elements[M=
AX_ELEMENTS];
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  736 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  737  			if (copy_from_user(elements, ar=
gs.elements,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  738  					   args.count * sizeof(struct=
 vchiq_element)) =3D=3D 0)
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  739  				ret =3D vchiq_ioc_queue_messag=
e(instance, args.handle, elements,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  740  							      args.count);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  741  			else
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  742  				ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  743  		} else {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  744  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  745  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  746  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  747 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  748  	case VCHIQ_IOC_QUEUE_BULK_TRANSMI=
T:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  749  	case VCHIQ_IOC_QUEUE_BULK_RECEIVE=
: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  750  		struct vchiq_queue_bulk_transfer=
 args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  751  		struct vchiq_queue_bulk_transfer=
 __user *argp;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  752 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  753  		enum vchiq_bulk_dir dir =3D
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  754  			(cmd =3D=3D VCHIQ_IOC_QUEUE_BUL=
K_TRANSMIT) ?
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  755  			VCHIQ_BULK_TRANSMIT : VCHIQ_BUL=
K_RECEIVE;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  756 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  757  		argp =3D (void __user *)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  758  		if (copy_from_user(&args, argp, =
sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  759  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  760  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  761  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  762 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  763  		ret =3D vchiq_irq_queue_bulk_tx_=
rx(instance, &args,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  764  						 dir, &argp->mode);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  765  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  766 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  767  	case VCHIQ_IOC_AWAIT_COMPLETION: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  768  		struct vchiq_await_completion ar=
gs;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  769  		struct vchiq_await_completion __=
user *argp;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  770 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  771  		argp =3D (void __user *)arg;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  772  		if (copy_from_user(&args, argp, =
sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  773  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  774  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  775  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  776 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  777  		ret =3D vchiq_ioc_await_completi=
on(instance, &args,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  778  						 &argp->msgbufcount);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  779  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  780 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  781  	case VCHIQ_IOC_DEQUEUE_MESSAGE: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  782  		struct vchiq_dequeue_message arg=
s;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  783 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  784  		if (copy_from_user(&args, (const=
 void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  785  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  786  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  787  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  788  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  789 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  790  		ret =3D vchiq_ioc_dequeue_messag=
e(instance, &args);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  791  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  792 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  793  	case VCHIQ_IOC_GET_CLIENT_ID: {
2ce6e372240ca4 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c    =
  Christian A. Ehrhardt 2026-04-28  794  		unsigned int handle =3D __c_ua(a=
rg);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  795 =20
bad44825fbf5ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  796  		ret =3D vchiq_get_client_id(inst=
ance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  797  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  798 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  799  	case VCHIQ_IOC_GET_CONFIG: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  800  		struct vchiq_get_config args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  801  		struct vchiq_config config;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  802 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  803  		if (copy_from_user(&args, (const=
 void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  804  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  805  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  806  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  807  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  808  		if (args.config_size > sizeof(co=
nfig)) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  809  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  810  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  811  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  812 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  813  		vchiq_get_config(&config);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  814  		if (copy_to_user(args.pconfig, &=
config, args.config_size)) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  815  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  816  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  817  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  818  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  819 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  820  	case VCHIQ_IOC_SET_SERVICE_OPTION=
: {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  821  		struct vchiq_set_service_option =
args;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  822 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  823  		if (copy_from_user(&args, (const=
 void __user *)arg,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  824  				   sizeof(args))) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  825  			ret =3D -EFAULT;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  826  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  827  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  828 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  829  		service =3D find_service_for_ins=
tance(instance, args.handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  830  		if (!service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  831  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  832  			break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  833  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  834 =20
14780bb174266e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Adrien Thierry        2022-05-18  835  		ret =3D vchiq_set_service_option=
(instance, args.handle, args.option,
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  836  					       args.value);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  837  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  838 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  839  	case VCHIQ_IOC_LIB_VERSION: {
2ce6e372240ca4 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c    =
  Christian A. Ehrhardt 2026-04-28  840  		unsigned int lib_version =3D __c=
_ua(arg);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  841 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  842  		if (lib_version < VCHIQ_VERSION_=
MIN)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  843  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  844  		else if (lib_version >=3D VCHIQ_=
VERSION_CLOSE_DELIVERED)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  845  			instance->use_close_delivered =
=3D 1;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  846  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  847 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  848  	case VCHIQ_IOC_CLOSE_DELIVERED: {
2ce6e372240ca4 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c    =
  Christian A. Ehrhardt 2026-04-28  849  		unsigned int handle =3D __c_ua(a=
rg);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  850 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  851  		service =3D find_closed_service_=
for_instance(instance, handle);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  852  		if (service) {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  853  			struct user_service *user_servi=
ce =3D
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  854  				(struct user_service *)service=
->base.userdata;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  855  			close_delivered(user_service);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  856  		} else {
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  857  			ret =3D -EINVAL;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  858  		}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  859  	} break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  860 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  861  	default:
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  862  		ret =3D -ENOTTY;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  863  		break;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  864  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  865 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  866  	if (service)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  867  		vchiq_service_put(service);
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  868 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  869  	if (ret =3D=3D 0) {
ab73dc85328195 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  870  		if (status =3D=3D -EINVAL)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  871  			ret =3D -EIO;
82a9eb4a3561e1 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2022-12-23  872  		else if (status =3D=3D -EAGAIN)
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  873  			ret =3D -EINTR;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  874  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  875 =20
f67af5940d6d2e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-10-24  876  	if (!status && (ret < 0) && (ret =
!=3D -EINTR) && (ret !=3D -EWOULDBLOCK)) {
55e23aa95b1073 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  877  		dev_dbg(instance->state->dev,
96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Thomas Wei=C3=9Fschuh      2025-03-11  878  			"arm: ioctl instance %p, c=
md %s -> status %d, %ld\n",
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Gaston Gonzalez       2021-09-12  879  			instance, (_IOC_NR(cmd) <=3D VC=
HIQ_IOC_MAX) ?
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Gaston Gonzalez       2021-09-12  880  			ioctl_names[_IOC_NR(cmd)] : "<i=
nvalid>", status, ret);
f67af5940d6d2e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-10-24  881  	} else {
078666d7ee6d3c drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-12-05  882  		dev_dbg(instance->state->dev,
96622d58f50b8f drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Thomas Wei=C3=9Fschuh      2025-03-11  883  			"arm: ioctl instance %p, c=
md %s -> status %d\n, %ld\n",
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Gaston Gonzalez       2021-09-12  884  			instance, (_IOC_NR(cmd) <=3D VC=
HIQ_IOC_MAX) ?
8757f705d936ad drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Gaston Gonzalez       2021-09-12  885  			ioctl_names[_IOC_NR(cmd)] : "<i=
nvalid>", status, ret);
f67af5940d6d2e drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Umang Jain            2023-10-24  886  	}
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  887 =20
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  888  	return ret;
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  889  }
f05916281fd75d drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.=
c Ojaswin Mujoo         2021-07-21  890 =20

:::::: The code at line 592 was first introduced by commit
:::::: 96622d58f50b8f364bb11d48f2d41e3348020b9e staging: vchiq_arm: Don't u=
se %pK through printk

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
