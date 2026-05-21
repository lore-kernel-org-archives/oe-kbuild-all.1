Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA543C3782
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 11:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363190; cv=none; b=PgX8OVaboHrqOspuC0czs7bRfVRChFP5AHhtgGzTAy+GKSwHsgYmXwXxloMCtFHx/0e6Wn8oIlnmYYldjfAJhkV62ISOmXdC5CJqGUX6k2Gj+MIGSYbg5H7c+fPKCU55k3nxjdaIeU13MSxbnm3rW/6UztNZct92+Xe30xqeuRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363190; c=relaxed/simple;
	bh=e/IDGEMfOAxbOZSCzWe/pJOR6wPNjq15zZHFXbLmpPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kePxHv9634l+BNMF8fRdnNW2Ce68d0tSGQ7R6Vgb0D4+8I9Ub3GgCIiLqzhQKKnOYaNxqaLOD2KNDaOyXXK5NMow4rEXehIbd0ePrvHtS2lgrHzGk9p2MiXZeDg2PPJe+d7NIcSXbLzbEzN+L+QTAmXBOazLei1wogcwt5gmxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llyvLgVC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llyvLgVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779363188; x=1810899188;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e/IDGEMfOAxbOZSCzWe/pJOR6wPNjq15zZHFXbLmpPI=;
  b=llyvLgVCErB+iF3ZrhJ7JU7jvNGuGeG307WlE8jchMbboy9GinBAdQ5T
   tTX04Dfy2x/6bmN8czQvTbDjdN+q/qXhih58qU7ZImXCpRHbOBuvTC11G
   oLFeo0yROeIJa4rS1Jla2nFb5oLquAGdSZKS1HW8uGBk/ZKB70mLNm4nz
   Kg5Wqbp2KD6Jjk2Rb9P/l9L9A23c4bCI2ks3gYY6469r5DWRVQ1ciVlZg
   j/tUf0Mgs9BcP/oQ6VxSRpb9oravcXBZjViZGcExeKsiPRVW/nX9qzOKS
   S3wDyBH2LrTCXUI147pDvjfjF46sR4rW5AbR/dZSMMnOL/QbxDKwlKJwt
   g==;
X-CSE-ConnectionGUID: KNlLbGLKS2Cq7OmDHpl6iw==
X-CSE-MsgGUID: GqJJjrgARZGrQy4DfT77wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90576141"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90576141"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:33:06 -0700
X-CSE-ConnectionGUID: p7YbEjx4RAS3Ac6q72jRTA==
X-CSE-MsgGUID: n50BTZV0TsS4fwoxRq4P1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236250098"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 04:33:04 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1e9-000000000Cz-2Om1;
	Thu, 21 May 2026 11:33:01 +0000
Date: Thu, 21 May 2026 19:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 838/1130]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:591:39:
 warning: format '%lx' expects argument of type 'long unsigned int', but
 argument 6 has type '__u64' {aka 'long long unsigned int'}
Message-ID: <202605211948.PmFOlOpI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: cdcf6ff6318b2326ba8aa0fe00fe5f83ab359747 [838/1130] cheri: Fix comp=
ile in drivers/staging/
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/2026052=
1/202605211948.PmFOlOpI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260521/202605211948.PmFOlOpI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211948.PmFOlOpI-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:622,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/cdev.h:5,
                    from drivers/staging/vc04_services/interface/vchiq_arm/=
vchiq_dev.c:7:
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c: In functi=
on 'vchiq_ioctl':
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:591:39: wa=
rning: format '%lx' expects argument of type 'long unsigned int', but argum=
ent 6 has type '__u64' {aka 'long long unsigned int'} [-Wformat=3D]
     591 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s,=
 arg %lx\n", instance,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dy=
namic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynam=
ic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, #=
#__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynam=
ic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_d=
ev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:591:9: not=
e: in expansion of macro 'dev_dbg'
     591 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s,=
 arg %lx\n", instance,
         |         ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:591:72: no=
te: format string is defined here
     591 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s,=
 arg %lx\n", instance,
         |                                                                 =
     ~~^
         |                                                                 =
       |
         |                                                                 =
       long unsigned int
         |                                                                 =
     %llx


vim +591 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c

f05916281fd75d Ojaswin Mujoo      2021-07-21  581 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  582  static long
f05916281fd75d Ojaswin Mujoo      2021-07-21  583  vchiq_ioctl(struct file =
*file, unsigned int cmd, unsigned long arg)
f05916281fd75d Ojaswin Mujoo      2021-07-21  584  {
f05916281fd75d Ojaswin Mujoo      2021-07-21  585  	struct vchiq_instance *=
instance =3D file->private_data;
3414994ba84042 Umang Jain         2022-12-23  586  	int status =3D 0;
f05916281fd75d Ojaswin Mujoo      2021-07-21  587  	struct vchiq_service *s=
ervice =3D NULL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  588  	long ret =3D 0;
f05916281fd75d Ojaswin Mujoo      2021-07-21  589  	int i, rc;
f05916281fd75d Ojaswin Mujoo      2021-07-21  590 =20
96622d58f50b8f Thomas Wei=C3=9Fschuh   2025-03-11 @591  	dev_dbg(instance->=
state->dev, "arm: instance %p, cmd %s, arg %lx\n", instance,
8757f705d936ad Gaston Gonzalez    2021-09-12  592  		((_IOC_TYPE(cmd) =3D=
=3D VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <=3D VCHIQ_IOC_MAX)) ?
cdcf6ff6318b23 Christian Ehrhardt 2025-03-27  593  		ioctl_names[_IOC_NR(cm=
d)] : "<invalid>", __c_ua(arg));
f05916281fd75d Ojaswin Mujoo      2021-07-21  594 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  595  	switch (cmd) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  596  	case VCHIQ_IOC_SHUTDOWN:
f05916281fd75d Ojaswin Mujoo      2021-07-21  597  		if (!instance->connect=
ed)
f05916281fd75d Ojaswin Mujoo      2021-07-21  598  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  599 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  600  		/* Remove all services=
 */
f05916281fd75d Ojaswin Mujoo      2021-07-21  601  		i =3D 0;
f05916281fd75d Ojaswin Mujoo      2021-07-21  602  		while ((service =3D ne=
xt_service_by_instance(instance->state,
f05916281fd75d Ojaswin Mujoo      2021-07-21  603  							   instance, &i))=
) {
14780bb174266e Adrien Thierry     2022-05-18  604  			status =3D vchiq_remo=
ve_service(instance, service->handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  605  			vchiq_service_put(ser=
vice);
3414994ba84042 Umang Jain         2022-12-23  606  			if (status)
f05916281fd75d Ojaswin Mujoo      2021-07-21  607  				break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  608  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  609  		service =3D NULL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  610 =20
3414994ba84042 Umang Jain         2022-12-23  611  		if (!status) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  612  			/* Wake the completio=
n thread and ask it to exit */
f05916281fd75d Ojaswin Mujoo      2021-07-21  613  			instance->closing =3D =
1;
f05916281fd75d Ojaswin Mujoo      2021-07-21  614  			complete(&instance->i=
nsert_event);
f05916281fd75d Ojaswin Mujoo      2021-07-21  615  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  616 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  617  		break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  618 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  619  	case VCHIQ_IOC_CONNECT:
f05916281fd75d Ojaswin Mujoo      2021-07-21  620  		if (instance->connecte=
d) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  621  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  622  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  623  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  624  		rc =3D mutex_lock_kill=
able(&instance->state->mutex);
f05916281fd75d Ojaswin Mujoo      2021-07-21  625  		if (rc) {
e70f17ed997cb7 Umang Jain         2023-12-05  626  			dev_err(instance->sta=
te->dev,
e70f17ed997cb7 Umang Jain         2023-12-05  627  				"arm: vchiq: connect=
: could not lock mutex for state %d: %d\n",
f05916281fd75d Ojaswin Mujoo      2021-07-21  628  				instance->state->id,=
 rc);
f05916281fd75d Ojaswin Mujoo      2021-07-21  629  			ret =3D -EINTR;
f05916281fd75d Ojaswin Mujoo      2021-07-21  630  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  631  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  632  		status =3D vchiq_conne=
ct_internal(instance->state, instance);
f05916281fd75d Ojaswin Mujoo      2021-07-21  633  		mutex_unlock(&instance=
->state->mutex);
f05916281fd75d Ojaswin Mujoo      2021-07-21  634 =20
3414994ba84042 Umang Jain         2022-12-23  635  		if (!status)
f05916281fd75d Ojaswin Mujoo      2021-07-21  636  			instance->connected =
=3D 1;
f05916281fd75d Ojaswin Mujoo      2021-07-21  637  		else
e70f17ed997cb7 Umang Jain         2023-12-05  638  			dev_err(instance->sta=
te->dev,
e70f17ed997cb7 Umang Jain         2023-12-05  639  				"arm: vchiq: could n=
ot connect: %d\n", status);
f05916281fd75d Ojaswin Mujoo      2021-07-21  640  		break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  641 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  642  	case VCHIQ_IOC_CREATE_S=
ERVICE: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  643  		struct vchiq_create_se=
rvice __user *argp;
f05916281fd75d Ojaswin Mujoo      2021-07-21  644  		struct vchiq_create_se=
rvice args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  645 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  646  		argp =3D (void __user =
*)arg;
f05916281fd75d Ojaswin Mujoo      2021-07-21  647  		if (copy_from_user(&ar=
gs, argp, sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  648  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  649  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  650  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  651 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  652  		ret =3D vchiq_ioc_crea=
te_service(instance, &args);
f05916281fd75d Ojaswin Mujoo      2021-07-21  653  		if (ret < 0)
f05916281fd75d Ojaswin Mujoo      2021-07-21  654  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  655 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  656  		if (put_user(args.hand=
le, &argp->handle)) {
14780bb174266e Adrien Thierry     2022-05-18  657  			vchiq_remove_service(=
instance, args.handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  658  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  659  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  660  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  661 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  662  	case VCHIQ_IOC_CLOSE_SE=
RVICE:
f05916281fd75d Ojaswin Mujoo      2021-07-21  663  	case VCHIQ_IOC_REMOVE_S=
ERVICE: {
cdcf6ff6318b23 Christian Ehrhardt 2025-03-27  664  		unsigned int handle =
=3D __c_ua(arg);
f05916281fd75d Ojaswin Mujoo      2021-07-21  665  		struct user_service *u=
ser_service;
f05916281fd75d Ojaswin Mujoo      2021-07-21  666 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  667  		service =3D find_servi=
ce_for_instance(instance, handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  668  		if (!service) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  669  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  670  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  671  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  672 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  673  		user_service =3D servi=
ce->base.userdata;
f05916281fd75d Ojaswin Mujoo      2021-07-21  674 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  675  		/*
f05916281fd75d Ojaswin Mujoo      2021-07-21  676  		 * close_pending is fa=
lse on first entry, and when the
f05916281fd75d Ojaswin Mujoo      2021-07-21  677  		 * wait in vchiq_close=
_service has been interrupted.
f05916281fd75d Ojaswin Mujoo      2021-07-21  678  		 */
f05916281fd75d Ojaswin Mujoo      2021-07-21  679  		if (!user_service->clo=
se_pending) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  680  			status =3D (cmd =3D=
=3D VCHIQ_IOC_CLOSE_SERVICE) ?
14780bb174266e Adrien Thierry     2022-05-18  681  				 vchiq_close_service=
(instance, service->handle) :
14780bb174266e Adrien Thierry     2022-05-18  682  				 vchiq_remove_servic=
e(instance, service->handle);
3414994ba84042 Umang Jain         2022-12-23  683  			if (status)
f05916281fd75d Ojaswin Mujoo      2021-07-21  684  				break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  685  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  686 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  687  		/*
f05916281fd75d Ojaswin Mujoo      2021-07-21  688  		 * close_pending is tr=
ue once the underlying service
f05916281fd75d Ojaswin Mujoo      2021-07-21  689  		 * has been closed unt=
il the client library calls the
f05916281fd75d Ojaswin Mujoo      2021-07-21  690  		 * CLOSE_DELIVERED ioc=
tl, signalling close_event.
f05916281fd75d Ojaswin Mujoo      2021-07-21  691  		 */
f05916281fd75d Ojaswin Mujoo      2021-07-21  692  		if (user_service->clos=
e_pending &&
8757f705d936ad Gaston Gonzalez    2021-09-12  693  		    wait_for_completio=
n_interruptible(&user_service->close_event))
82a9eb4a3561e1 Umang Jain         2022-12-23  694  			status =3D -EAGAIN;
f05916281fd75d Ojaswin Mujoo      2021-07-21  695  		break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  696  	}
f05916281fd75d Ojaswin Mujoo      2021-07-21  697 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  698  	case VCHIQ_IOC_USE_SERV=
ICE:
f05916281fd75d Ojaswin Mujoo      2021-07-21  699  	case VCHIQ_IOC_RELEASE_=
SERVICE:	{
cdcf6ff6318b23 Christian Ehrhardt 2025-03-27  700  		unsigned int handle =
=3D __c_ua(arg);
f05916281fd75d Ojaswin Mujoo      2021-07-21  701 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  702  		service =3D find_servi=
ce_for_instance(instance, handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  703  		if (service) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  704  			ret =3D (cmd =3D=3D V=
CHIQ_IOC_USE_SERVICE) ?
f05916281fd75d Ojaswin Mujoo      2021-07-21  705  				vchiq_use_service_in=
ternal(service) :
f05916281fd75d Ojaswin Mujoo      2021-07-21  706  				vchiq_release_servic=
e_internal(service);
f05916281fd75d Ojaswin Mujoo      2021-07-21  707  			if (ret) {
e70f17ed997cb7 Umang Jain         2023-12-05  708  				dev_err(instance->st=
ate->dev,
e70f17ed997cb7 Umang Jain         2023-12-05  709  					"suspend: cmd %s re=
turned error %ld for service %p4cc:%03d\n",
e70f17ed997cb7 Umang Jain         2023-12-05  710  					(cmd =3D=3D VCHIQ_I=
OC_USE_SERVICE) ?
f05916281fd75d Ojaswin Mujoo      2021-07-21  711  					"VCHIQ_IOC_USE_SERV=
ICE" :
f05916281fd75d Ojaswin Mujoo      2021-07-21  712  					"VCHIQ_IOC_RELEASE_=
SERVICE",
ae094de38e430e Umang Jain         2023-10-25  713  					ret, &service->base=
.fourcc,
f05916281fd75d Ojaswin Mujoo      2021-07-21  714  					service->client_id);
f05916281fd75d Ojaswin Mujoo      2021-07-21  715  			}
f05916281fd75d Ojaswin Mujoo      2021-07-21  716  		} else {
f05916281fd75d Ojaswin Mujoo      2021-07-21  717  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  718  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  719  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  720 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  721  	case VCHIQ_IOC_QUEUE_ME=
SSAGE: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  722  		struct vchiq_queue_mes=
sage args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  723 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  724  		if (copy_from_user(&ar=
gs, (const void __user *)arg,
f05916281fd75d Ojaswin Mujoo      2021-07-21  725  				   sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  726  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  727  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  728  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  729 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  730  		service =3D find_servi=
ce_for_instance(instance, args.handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  731 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  732  		if (service && (args.c=
ount <=3D MAX_ELEMENTS)) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  733  			/* Copy elements into=
 kernel space */
f05916281fd75d Ojaswin Mujoo      2021-07-21  734  			struct vchiq_element =
elements[MAX_ELEMENTS];
f05916281fd75d Ojaswin Mujoo      2021-07-21  735 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  736  			if (copy_from_user(el=
ements, args.elements,
f05916281fd75d Ojaswin Mujoo      2021-07-21  737  					   args.count * siz=
eof(struct vchiq_element)) =3D=3D 0)
14780bb174266e Adrien Thierry     2022-05-18  738  				ret =3D vchiq_ioc_qu=
eue_message(instance, args.handle, elements,
f05916281fd75d Ojaswin Mujoo      2021-07-21  739  							      args.count);
f05916281fd75d Ojaswin Mujoo      2021-07-21  740  			else
f05916281fd75d Ojaswin Mujoo      2021-07-21  741  				ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  742  		} else {
f05916281fd75d Ojaswin Mujoo      2021-07-21  743  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  744  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  745  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  746 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  747  	case VCHIQ_IOC_QUEUE_BU=
LK_TRANSMIT:
f05916281fd75d Ojaswin Mujoo      2021-07-21  748  	case VCHIQ_IOC_QUEUE_BU=
LK_RECEIVE: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  749  		struct vchiq_queue_bul=
k_transfer args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  750  		struct vchiq_queue_bul=
k_transfer __user *argp;
f05916281fd75d Ojaswin Mujoo      2021-07-21  751 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  752  		enum vchiq_bulk_dir di=
r =3D
f05916281fd75d Ojaswin Mujoo      2021-07-21  753  			(cmd =3D=3D VCHIQ_IOC=
_QUEUE_BULK_TRANSMIT) ?
f05916281fd75d Ojaswin Mujoo      2021-07-21  754  			VCHIQ_BULK_TRANSMIT :=
 VCHIQ_BULK_RECEIVE;
f05916281fd75d Ojaswin Mujoo      2021-07-21  755 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  756  		argp =3D (void __user =
*)arg;
f05916281fd75d Ojaswin Mujoo      2021-07-21  757  		if (copy_from_user(&ar=
gs, argp, sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  758  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  759  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  760  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  761 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  762  		ret =3D vchiq_irq_queu=
e_bulk_tx_rx(instance, &args,
f05916281fd75d Ojaswin Mujoo      2021-07-21  763  						 dir, &argp->mode);
f05916281fd75d Ojaswin Mujoo      2021-07-21  764  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  765 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  766  	case VCHIQ_IOC_AWAIT_CO=
MPLETION: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  767  		struct vchiq_await_com=
pletion args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  768  		struct vchiq_await_com=
pletion __user *argp;
f05916281fd75d Ojaswin Mujoo      2021-07-21  769 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  770  		argp =3D (void __user =
*)arg;
f05916281fd75d Ojaswin Mujoo      2021-07-21  771  		if (copy_from_user(&ar=
gs, argp, sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  772  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  773  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  774  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  775 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  776  		ret =3D vchiq_ioc_awai=
t_completion(instance, &args,
f05916281fd75d Ojaswin Mujoo      2021-07-21  777  						 &argp->msgbufcoun=
t);
f05916281fd75d Ojaswin Mujoo      2021-07-21  778  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  779 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  780  	case VCHIQ_IOC_DEQUEUE_=
MESSAGE: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  781  		struct vchiq_dequeue_m=
essage args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  782 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  783  		if (copy_from_user(&ar=
gs, (const void __user *)arg,
f05916281fd75d Ojaswin Mujoo      2021-07-21  784  				   sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  785  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  786  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  787  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  788 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  789  		ret =3D vchiq_ioc_dequ=
eue_message(instance, &args);
f05916281fd75d Ojaswin Mujoo      2021-07-21  790  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  791 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  792  	case VCHIQ_IOC_GET_CLIE=
NT_ID: {
cdcf6ff6318b23 Christian Ehrhardt 2025-03-27  793  		unsigned int handle =
=3D __c_ua(arg);
f05916281fd75d Ojaswin Mujoo      2021-07-21  794 =20
bad44825fbf5ad Adrien Thierry     2022-05-18  795  		ret =3D vchiq_get_clie=
nt_id(instance, handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  796  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  797 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  798  	case VCHIQ_IOC_GET_CONF=
IG: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  799  		struct vchiq_get_confi=
g args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  800  		struct vchiq_config co=
nfig;
f05916281fd75d Ojaswin Mujoo      2021-07-21  801 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  802  		if (copy_from_user(&ar=
gs, (const void __user *)arg,
f05916281fd75d Ojaswin Mujoo      2021-07-21  803  				   sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  804  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  805  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  806  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  807  		if (args.config_size >=
 sizeof(config)) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  808  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  809  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  810  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  811 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  812  		vchiq_get_config(&conf=
ig);
f05916281fd75d Ojaswin Mujoo      2021-07-21  813  		if (copy_to_user(args.=
pconfig, &config, args.config_size)) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  814  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  815  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  816  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  817  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  818 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  819  	case VCHIQ_IOC_SET_SERV=
ICE_OPTION: {
f05916281fd75d Ojaswin Mujoo      2021-07-21  820  		struct vchiq_set_servi=
ce_option args;
f05916281fd75d Ojaswin Mujoo      2021-07-21  821 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  822  		if (copy_from_user(&ar=
gs, (const void __user *)arg,
f05916281fd75d Ojaswin Mujoo      2021-07-21  823  				   sizeof(args))) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  824  			ret =3D -EFAULT;
f05916281fd75d Ojaswin Mujoo      2021-07-21  825  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  826  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  827 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  828  		service =3D find_servi=
ce_for_instance(instance, args.handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  829  		if (!service) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  830  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  831  			break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  832  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  833 =20
14780bb174266e Adrien Thierry     2022-05-18  834  		ret =3D vchiq_set_serv=
ice_option(instance, args.handle, args.option,
f05916281fd75d Ojaswin Mujoo      2021-07-21  835  					       args.value);
f05916281fd75d Ojaswin Mujoo      2021-07-21  836  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  837 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  838  	case VCHIQ_IOC_LIB_VERS=
ION: {
cdcf6ff6318b23 Christian Ehrhardt 2025-03-27  839  		unsigned int lib_versi=
on =3D __c_ua(arg);
f05916281fd75d Ojaswin Mujoo      2021-07-21  840 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  841  		if (lib_version < VCHI=
Q_VERSION_MIN)
f05916281fd75d Ojaswin Mujoo      2021-07-21  842  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  843  		else if (lib_version >=
=3D VCHIQ_VERSION_CLOSE_DELIVERED)
f05916281fd75d Ojaswin Mujoo      2021-07-21  844  			instance->use_close_d=
elivered =3D 1;
f05916281fd75d Ojaswin Mujoo      2021-07-21  845  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  846 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  847  	case VCHIQ_IOC_CLOSE_DE=
LIVERED: {
cdcf6ff6318b23 Christian Ehrhardt 2025-03-27  848  		unsigned int handle =
=3D __c_ua(arg);
f05916281fd75d Ojaswin Mujoo      2021-07-21  849 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  850  		service =3D find_close=
d_service_for_instance(instance, handle);
f05916281fd75d Ojaswin Mujoo      2021-07-21  851  		if (service) {
f05916281fd75d Ojaswin Mujoo      2021-07-21  852  			struct user_service *=
user_service =3D
f05916281fd75d Ojaswin Mujoo      2021-07-21  853  				(struct user_service=
 *)service->base.userdata;
f05916281fd75d Ojaswin Mujoo      2021-07-21  854  			close_delivered(user_=
service);
f05916281fd75d Ojaswin Mujoo      2021-07-21  855  		} else {
f05916281fd75d Ojaswin Mujoo      2021-07-21  856  			ret =3D -EINVAL;
f05916281fd75d Ojaswin Mujoo      2021-07-21  857  		}
f05916281fd75d Ojaswin Mujoo      2021-07-21  858  	} break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  859 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  860  	default:
f05916281fd75d Ojaswin Mujoo      2021-07-21  861  		ret =3D -ENOTTY;
f05916281fd75d Ojaswin Mujoo      2021-07-21  862  		break;
f05916281fd75d Ojaswin Mujoo      2021-07-21  863  	}
f05916281fd75d Ojaswin Mujoo      2021-07-21  864 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  865  	if (service)
f05916281fd75d Ojaswin Mujoo      2021-07-21  866  		vchiq_service_put(serv=
ice);
f05916281fd75d Ojaswin Mujoo      2021-07-21  867 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  868  	if (ret =3D=3D 0) {
ab73dc85328195 Umang Jain         2022-12-23  869  		if (status =3D=3D -EIN=
VAL)
f05916281fd75d Ojaswin Mujoo      2021-07-21  870  			ret =3D -EIO;
82a9eb4a3561e1 Umang Jain         2022-12-23  871  		else if (status =3D=3D =
-EAGAIN)
f05916281fd75d Ojaswin Mujoo      2021-07-21  872  			ret =3D -EINTR;
f05916281fd75d Ojaswin Mujoo      2021-07-21  873  	}
f05916281fd75d Ojaswin Mujoo      2021-07-21  874 =20
f67af5940d6d2e Umang Jain         2023-10-24  875  	if (!status && (ret < 0=
) && (ret !=3D -EINTR) && (ret !=3D -EWOULDBLOCK)) {
55e23aa95b1073 Umang Jain         2023-12-05  876  		dev_dbg(instance->stat=
e->dev,
96622d58f50b8f Thomas Wei=C3=9Fschuh   2025-03-11  877  			"arm: ioctl inst=
ance %p, cmd %s -> status %d, %ld\n",
8757f705d936ad Gaston Gonzalez    2021-09-12  878  			instance, (_IOC_NR(cm=
d) <=3D VCHIQ_IOC_MAX) ?
8757f705d936ad Gaston Gonzalez    2021-09-12  879  			ioctl_names[_IOC_NR(c=
md)] : "<invalid>", status, ret);
f67af5940d6d2e Umang Jain         2023-10-24  880  	} else {
078666d7ee6d3c Umang Jain         2023-12-05  881  		dev_dbg(instance->stat=
e->dev,
96622d58f50b8f Thomas Wei=C3=9Fschuh   2025-03-11  882  			"arm: ioctl inst=
ance %p, cmd %s -> status %d\n, %ld\n",
8757f705d936ad Gaston Gonzalez    2021-09-12  883  			instance, (_IOC_NR(cm=
d) <=3D VCHIQ_IOC_MAX) ?
8757f705d936ad Gaston Gonzalez    2021-09-12  884  			ioctl_names[_IOC_NR(c=
md)] : "<invalid>", status, ret);
f67af5940d6d2e Umang Jain         2023-10-24  885  	}
f05916281fd75d Ojaswin Mujoo      2021-07-21  886 =20
f05916281fd75d Ojaswin Mujoo      2021-07-21  887  	return ret;
f05916281fd75d Ojaswin Mujoo      2021-07-21  888  }
f05916281fd75d Ojaswin Mujoo      2021-07-21  889 =20

:::::: The code at line 591 was first introduced by commit
:::::: 96622d58f50b8f364bb11d48f2d41e3348020b9e staging: vchiq_arm: Don't u=
se %pK through printk

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
