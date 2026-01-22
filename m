Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D43093B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069089; cv=none; b=OvpYJTPa+M097ZJG1oJUpoaqTV+1jQQL5GCxqFohNyxW4w369U0jkf0s9K4jdKb+EKPmzAdZbWdsmzKbRFbEYbxm+s6bZnfrdluq09KC437yaJec/s8YrTz1RJdint1pSRbauuuivWS91873DB0DAhaZMCAWH2AoP0Op/z8nh9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069089; c=relaxed/simple;
	bh=4aYE/nmvfCaDScPZcZ3/yTVDzKRmjwUiEeUAkvLiWm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c1rX9HLo+aqIQhHbdPZIEBGDkeL7Z1pfJoFb+K/3NwJjamQN7He5R7L39H0vDoJTBGRdHvHndwHnOU82jrjjj5YeIF7lLSvT0QgxA3QUy0ihC84p4MuL7/MowzgBzI3ew0aCKTYrU5TMKReNZblY0INJLcZQBfD4gIVajnwVy0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UowV3C9E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UowV3C9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769069087; x=1800605087;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4aYE/nmvfCaDScPZcZ3/yTVDzKRmjwUiEeUAkvLiWm4=;
  b=UowV3C9E4x0mgB9/QFvE97L6omCQFP3IHoNQIwO89BypC1IF1SwZb9GA
   XkFvbi+5A9BzVtnBn01QVRPoKRt/CdoChMmtongHk1WfOqLh66gBlQD/E
   akP8cUPNRpdMcPSKqaZgBSSMiu/d2wg4n5UA1hRwsENYyk05BbQ+u6HUD
   myuyuKC5M9a3IYXr8fussOBPvQr06mKuJsYk5f0DT9iXEglYu/iEqV0qn
   5QFNL1ZwfVYKTJbHlgDtmgV2uwyZqyCL8N7+OY+9bdxKKeb7uNI/QhNmQ
   kJbt8V5GB+ZLlh4tWem6cCCZOHFcjqHDgz+e82xpWlfETN4ewpNjcHV/L
   g==;
X-CSE-ConnectionGUID: smOg3IkhR1ieptpOUclW4A==
X-CSE-MsgGUID: +fKsX4CPRB6DwsfhQad2iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87720634"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="87720634"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 00:04:46 -0800
X-CSE-ConnectionGUID: HyHbB4AoS8mkRA/w1uswdA==
X-CSE-MsgGUID: Krbcc6qwQFCc+BBxCl4eKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206484167"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Jan 2026 00:04:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vipgH-00000000SaN-3v4h;
	Thu, 22 Jan 2026 08:04:41 +0000
Date: Thu, 22 Jan 2026 16:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Stuart Summers <stuart.summers@intel.com>
Subject: [linux-next:master 6782/8780]
 drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect goto
 statement to one of its possible targets
Message-ID: <202601221502.EmvD4t1E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
commit: a3866ce7b1221353b795603bb8d0c81d81e60e65 [6782/8780] drm/xe: Add vm=
 to exec queues association
config: i386-randconfig-051-20260122 (https://download.01.org/0day-ci/archi=
ve/20260122/202601221502.EmvD4t1E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260122/202601221502.EmvD4t1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221502.EmvD4t1E-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect=
 goto statement to one of its possible targets
    1586 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_=
on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_vm.c:1542:3: note: possible target of indirect got=
o statement
    1542 |                 might_lock(&vm->exec_queues.lock);
         |                 ^
   include/linux/lockdep.h:552:51: note: expanded from macro 'might_lock'
     552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_I=
P_);    \
         |                                                          ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable wi=
th __attribute__((cleanup))
    1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_va=
l_flags) {.interruptible =3D true},
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_=
validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &=
_ret) \
         |         ^
   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guar=
d'
     433 |         for (CLASS(_name, scope)(args);                         =
        \
         |                           ^
   drivers/gpu/drm/xe/xe_vm.c:1542:3: note: jump enters a statement express=
ion
    1542 |                 might_lock(&vm->exec_queues.lock);
         |                 ^
   include/linux/lockdep.h:552:51: note: expanded from macro 'might_lock'
     552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_I=
P_);    \
         |                                                          ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                    ^
>> drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect=
 goto statement to one of its possible targets
    1586 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_=
on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_vm.c:1546:3: note: possible target of indirect got=
o statement
    1546 |                 might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
         |                 ^
   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);              =
        \
         |                                        ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable wi=
th __attribute__((cleanup))
    1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_va=
l_flags) {.interruptible =3D true},
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_=
validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &=
_ret) \
         |         ^
   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guar=
d'
     433 |         for (CLASS(_name, scope)(args);                         =
        \
         |                           ^
   drivers/gpu/drm/xe/xe_vm.c:1546:3: note: jump enters a statement express=
ion
    1546 |                 might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
         |                 ^
   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);              =
        \
         |                                        ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                    ^
>> drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect=
 goto statement to one of its possible targets
    1586 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_=
on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_vm.c:1542:3: note: possible target of indirect got=
o statement
    1542 |                 might_lock(&vm->exec_queues.lock);
         |                 ^
   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);              =
        \
         |                                        ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable wi=
th __attribute__((cleanup))
    1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_va=
l_flags) {.interruptible =3D true},
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_=
validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &=
_ret) \
         |         ^
   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guar=
d'
     433 |         for (CLASS(_name, scope)(args);                         =
        \
         |                           ^
   drivers/gpu/drm/xe/xe_vm.c:1542:3: note: jump enters a statement express=
ion
    1542 |                 might_lock(&vm->exec_queues.lock);
         |                 ^
   include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
     553 |         lock_release(&(lock)->dep_map, _THIS_IP_);              =
        \
         |                                        ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                    ^
>> drivers/gpu/drm/xe/xe_vm.c:1586:3: error: cannot jump from this indirect=
 goto statement to one of its possible targets
    1586 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_=
on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_vm.c:1546:3: note: possible target of indirect got=
o statement
    1546 |                 might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
         |                 ^
   include/linux/lockdep.h:552:51: note: expanded from macro 'might_lock'
     552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_I=
P_);    \
         |                                                          ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_vm.c:1583:2: note: jump exits scope of variable wi=
th __attribute__((cleanup))
    1583 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_va=
l_flags) {.interruptible =3D true},
         |         ^
   drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_=
validation_guard'
     189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &=
_ret) \
         |         ^
   include/linux/cleanup.h:442:2: note: expanded from macro 'scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^
   include/linux/cleanup.h:433:20: note: expanded from macro '__scoped_guar=
d'
     433 |         for (CLASS(_name, scope)(args);                         =
        \
         |                           ^
   drivers/gpu/drm/xe/xe_vm.c:1546:3: note: jump enters a statement express=
ion
    1546 |                 might_lock(&xe_root_mmio_gt(xe)->uc.guc.ct.lock);
         |                 ^
   include/linux/lockdep.h:552:51: note: expanded from macro 'might_lock'
     552 |         lock_acquire(&(lock)->dep_map, 0, 0, 0, 1, NULL, _THIS_I=
P_);    \
         |                                                          ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_T=
HIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&=
&__here; })
         |                    ^
   4 errors generated.


vim +1586 drivers/gpu/drm/xe/xe_vm.c

59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1476 =20
9337166fa1d80f7 Piotr Pi=C3=B3rkowski       2025-08-11  1477  struct xe_vm =
*xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1478  {
b06d47be7c83165 Matthew Brost          2023-07-07  1479  	struct drm_gem_ob=
ject *vm_resv_obj;
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1480  	struct xe_va=
lidation_ctx ctx;
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1481  	struct drm_e=
xec exec;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1482  	struct xe_vm *vm;
424e2cce078255c Gwan-gyeong Mun        2025-11-05  1483  	int err;
876611c2b75689c Matt Roper             2023-06-01  1484  	struct xe_tile *t=
ile;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1485  	u8 id;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1486 =20
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1487  	/*
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1488  	 * Since the GSCC=
S is not user-accessible, we don't expect a GSC VM to
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1489  	 * ever be in fau=
lting mode.
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1490  	 */
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1491  	xe_assert(xe, !((=
flags & XE_VM_FLAG_GSC) && (flags & XE_VM_FLAG_FAULT_MODE)));
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1492 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1493  	vm =3D kzalloc(si=
zeof(*vm), GFP_KERNEL);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1494  	if (!vm)
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1495  		return ERR_PTR(-=
ENOMEM);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1496 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1497  	vm->xe =3D xe;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1498 =20
e9bb0891e69055c Matt Roper             2023-08-11  1499  	vm->size =3D 1ull=
 << xe->info.va_bits;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1500  	vm->flags =3D fla=
gs;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1501 =20
9337166fa1d80f7 Piotr Pi=C3=B3rkowski       2025-08-11  1502  	if (xef)
9337166fa1d80f7 Piotr Pi=C3=B3rkowski       2025-08-11  1503  		vm->xef =3D =
xe_file_get(xef);
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1504  	/**
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1505  	 * GSC VMs are ke=
rnel-owned, only used for PXP ops and can sometimes be
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1506  	 * manipulated un=
der the PXP mutex. However, the PXP mutex can be taken
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1507  	 * under a user-V=
M lock when the PXP session is started at exec_queue
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1508  	 * creation time.=
 Those are different VMs and therefore there is no risk
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1509  	 * of deadlock, b=
ut we need to tell lockdep that this is the case or it
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1510  	 * will print a w=
arning.
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1511  	 */
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1512  	if (flags & XE_VM=
_FLAG_GSC) {
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1513  		static struct lo=
ck_class_key gsc_vm_key;
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1514 =20
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1515  		__init_rwsem(&vm=
->lock, "gsc_vm", &gsc_vm_key);
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1516  	} else {
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1517  		init_rwsem(&vm->=
lock);
dcdd6b84d9acaa0 Daniele Ceraolo Spurio 2025-01-29  1518  	}
0cd99046ca0522d Maarten Lankhorst      2024-02-21  1519  	mutex_init(&vm->s=
nap_mutex);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1520 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1521  	INIT_LIST_HEAD(&v=
m->rebind_list);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1522 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1523  	INIT_LIST_HEAD(&v=
m->userptr.repin_list);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1524  	INIT_LIST_HEAD(&v=
m->userptr.invalidated);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1525  	spin_lock_init(&v=
m->userptr.invalidated_lock);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1526 =20
4c44f89c5daee95 Thomas Hellstr=C3=B6m       2024-07-05  1527  	ttm_lru_bulk=
_move_init(&vm->lru_bulk_move);
4c44f89c5daee95 Thomas Hellstr=C3=B6m       2024-07-05  1528 =20
6e78e0719d0ed5e Matthew Auld           2024-04-23  1529  	INIT_WORK(&vm->de=
stroy_work, vm_destroy_work_func);
6e78e0719d0ed5e Matthew Auld           2024-04-23  1530 =20
9b9529ce379a08e Francois Dugast        2023-07-31  1531  	INIT_LIST_HEAD(&v=
m->preempt.exec_queues);
a3866ce7b122135 Matthew Brost          2026-01-16  1532  	for (id =3D 0; id=
 < XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE; ++id)
a3866ce7b122135 Matthew Brost          2026-01-16  1533  		INIT_LIST_HEAD(&=
vm->exec_queues.list[id]);
33a5abd9a68394a Matthew Brost          2025-12-12  1534  	if (flags & XE_VM=
_FLAG_FAULT_MODE)
6e608bff259fd1e Matthew Brost          2025-12-12  1535  		vm->preempt.min_=
run_period_ms =3D xe->min_run_period_pf_ms;
33a5abd9a68394a Matthew Brost          2025-12-12  1536  	else
6e608bff259fd1e Matthew Brost          2025-12-12  1537  		vm->preempt.min_=
run_period_ms =3D xe->min_run_period_lr_ms;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1538 =20
a3866ce7b122135 Matthew Brost          2026-01-16  1539  	init_rwsem(&vm->e=
xec_queues.lock);
a3866ce7b122135 Matthew Brost          2026-01-16  1540  	if (IS_ENABLED(CO=
NFIG_PROVE_LOCKING)) {
a3866ce7b122135 Matthew Brost          2026-01-16  1541  		fs_reclaim_acqui=
re(GFP_KERNEL);
a3866ce7b122135 Matthew Brost          2026-01-16  1542  		might_lock(&vm->=
exec_queues.lock);
a3866ce7b122135 Matthew Brost          2026-01-16  1543  		fs_reclaim_relea=
se(GFP_KERNEL);
a3866ce7b122135 Matthew Brost          2026-01-16  1544 =20
a3866ce7b122135 Matthew Brost          2026-01-16  1545  		down_read(&vm->e=
xec_queues.lock);
a3866ce7b122135 Matthew Brost          2026-01-16  1546  		might_lock(&xe_r=
oot_mmio_gt(xe)->uc.guc.ct.lock);
a3866ce7b122135 Matthew Brost          2026-01-16  1547  		up_read(&vm->exe=
c_queues.lock);
a3866ce7b122135 Matthew Brost          2026-01-16  1548  	}
a3866ce7b122135 Matthew Brost          2026-01-16  1549 =20
fd84041d094ce8f Matthew Brost          2023-07-19  1550  	for_each_tile(til=
e, xe, id)
fd84041d094ce8f Matthew Brost          2023-07-19  1551  		xe_range_fence_t=
ree_init(&vm->rftree[id]);
fd84041d094ce8f Matthew Brost          2023-07-19  1552 =20
0e5e77bd9704edf Lucas De Marchi        2023-09-27  1553  	vm->pt_ops =3D &x=
elp_pt_ops;
0e5e77bd9704edf Lucas De Marchi        2023-09-27  1554 =20
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1555  	/*
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1556  	 * Long-running w=
orkloads are not protected by the scheduler references.
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1557  	 * By design, run=
_job for long-running workloads returns NULL and the
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1558  	 * scheduler drop=
s all the references of it, hence protecting the VM
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1559  	 * for this case =
is necessary.
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1560  	 */
96af397aa1a2d10 Matthew Auld           2025-05-14  1561  	if (flags & XE_VM=
_FLAG_LR_MODE) {
96af397aa1a2d10 Matthew Auld           2025-05-14  1562  		INIT_WORK(&vm->p=
reempt.rebind_work, preempt_rebind_work_func);
783d6cdc8231f62 Rodrigo Vivi           2024-04-18  1563  		xe_pm_runtime_ge=
t_noresume(xe);
599334572a5a991 Thomas Hellstr=C3=B6m       2025-09-04  1564  		INIT_LIST_H=
EAD(&vm->preempt.pm_activate_link);
96af397aa1a2d10 Matthew Auld           2025-05-14  1565  	}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1566 =20
4f296d77cf49fcb Matthew Auld           2025-05-14  1567  	err =3D xe_svm_in=
it(vm);
4f296d77cf49fcb Matthew Auld           2025-05-14  1568  	if (err)
4f296d77cf49fcb Matthew Auld           2025-05-14  1569  		goto err_no_resv;
4f296d77cf49fcb Matthew Auld           2025-05-14  1570 =20
b06d47be7c83165 Matthew Brost          2023-07-07  1571  	vm_resv_obj =3D d=
rm_gpuvm_resv_object_alloc(&xe->drm);
b06d47be7c83165 Matthew Brost          2023-07-07  1572  	if (!vm_resv_obj)=
 {
b06d47be7c83165 Matthew Brost          2023-07-07  1573  		err =3D -ENOMEM;
4f296d77cf49fcb Matthew Auld           2025-05-14  1574  		goto err_svm_fin=
i;
b06d47be7c83165 Matthew Brost          2023-07-07  1575  	}
b06d47be7c83165 Matthew Brost          2023-07-07  1576 =20
35705e32b13cf80 Thomas Hellstr=C3=B6m       2023-12-12  1577  	drm_gpuvm_in=
it(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
35705e32b13cf80 Thomas Hellstr=C3=B6m       2023-12-12  1578  		       vm_r=
esv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
b06d47be7c83165 Matthew Brost          2023-07-07  1579 =20
b06d47be7c83165 Matthew Brost          2023-07-07  1580  	drm_gem_object_pu=
t(vm_resv_obj);
b06d47be7c83165 Matthew Brost          2023-07-07  1581 =20
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1582  	err =3D 0;
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1583  	xe_validatio=
n_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible =3D tr=
ue},
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1584  			    err) {
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1585  		err =3D xe_=
vm_drm_exec_lock(vm, &exec);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08 @1586  		drm_exec_re=
try_on_contention(&exec);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1587 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1588  		if (IS_DGFX(xe) =
&& xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
0d39b6daa545535 Lucas De Marchi        2023-07-18  1589  			vm->flags |=3D =
XE_VM_FLAG_64K;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1590 =20
876611c2b75689c Matt Roper             2023-06-01  1591  		for_each_tile(ti=
le, xe, id) {
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1592  			if (flags & XE_=
VM_FLAG_MIGRATION &&
0d39b6daa545535 Lucas De Marchi        2023-07-18  1593  			    tile->id !=
=3D XE_VM_FLAG_TILE_ID(flags))
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1594  				continue;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1595 =20
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1596  			vm->pt_roo=
t[id] =3D xe_pt_create(vm, tile, xe->info.vm_max_level,
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1597  						       =
&exec);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1598  			if (IS_ERR(vm->=
pt_root[id])) {
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1599  				err =3D PTR_ER=
R(vm->pt_root[id]);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1600  				vm->pt_root[id=
] =3D NULL;
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1601  				xe_vm_pt_=
destroy(vm);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1602  				drm_exec_=
retry_on_contention(&exec);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1603  				xe_valida=
tion_retry_on_oom(&ctx, &err);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1604  				break;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1605  			}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1606  		}
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1607  		if (err)
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1608  			break;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1609 =20
06951c2ee72df2f Thomas Hellstr=C3=B6m       2023-12-09  1610  		if (xe_vm_h=
as_scratch(vm)) {
876611c2b75689c Matt Roper             2023-06-01  1611  			for_each_tile(t=
ile, xe, id) {
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1612  				if (!vm->pt_ro=
ot[id])
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1613  					continue;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1614 =20
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1615  				err =3D x=
e_vm_create_scratch(xe, tile, vm, &exec);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1616  				if (err) {
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1617  					xe_vm_fr=
ee_scratch(vm);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1618  					xe_vm_pt=
_destroy(vm);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1619  					drm_exec=
_retry_on_contention(&exec);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1620  					xe_valid=
ation_retry_on_oom(&ctx, &err);
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1621  					break;
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1622  				}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1623  			}
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1624  			if (err)
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1625  				break;
85dbfe47d07cdde Thomas Hellstr=C3=B6m       2023-06-05  1626  			vm->batch_=
invalidate_tlb =3D true;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1627  		}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1628 =20
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1629  		if (vm->fla=
gs & XE_VM_FLAG_LR_MODE) {
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1630  			INIT_WORK(=
&vm->preempt.rebind_work, preempt_rebind_work_func);
85dbfe47d07cdde Thomas Hellstr=C3=B6m       2023-06-05  1631  			vm->batch_=
invalidate_tlb =3D false;
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1632  		}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1633 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1634  		/* Fill pt_root =
after allocating scratch tables */
876611c2b75689c Matt Roper             2023-06-01  1635  		for_each_tile(ti=
le, xe, id) {
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1636  			if (!vm->pt_roo=
t[id])
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1637  				continue;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1638 =20
876611c2b75689c Matt Roper             2023-06-01  1639  			xe_pt_populate_=
empty(tile, vm, vm->pt_root[id]);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1640  		}
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1641  	}
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1642  	if (err)
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1643  		goto err_cl=
ose;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1644 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1645  	/* Kernel migrati=
on VM shouldn't have a circular loop.. */
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1646  	if (!(flags & XE_=
VM_FLAG_MIGRATION)) {
876611c2b75689c Matt Roper             2023-06-01  1647  		for_each_tile(ti=
le, xe, id) {
9b9529ce379a08e Francois Dugast        2023-07-31  1648  			struct xe_exec_=
queue *q;
d3d767396a02fa2 Matthew Brost          2023-12-15  1649  			u32 create_flag=
s =3D EXEC_QUEUE_FLAG_VM;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1650 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1651  			if (!vm->pt_roo=
t[id])
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1652  				continue;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1653 =20
852856e3b6f679c Matthew Brost          2024-08-15  1654  			q =3D xe_exec_q=
ueue_create_bind(xe, tile, create_flags, 0);
9b9529ce379a08e Francois Dugast        2023-07-31  1655  			if (IS_ERR(q)) {
9b9529ce379a08e Francois Dugast        2023-07-31  1656  				err =3D PTR_ER=
R(q);
b06d47be7c83165 Matthew Brost          2023-07-07  1657  				goto err_close;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1658  			}
9b9529ce379a08e Francois Dugast        2023-07-31  1659  			vm->q[id] =3D q;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1660  		}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1661  	}
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1662 =20
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1663  	if (xef && x=
e->info.has_asid) {
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1664  		u32 asid;
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1665 =20
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1666  		down_write(=
&xe->usm.lock);
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1667  		err =3D xa_=
alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1668  				      XA_=
LIMIT(1, XE_MAX_ASID - 1),
444d78578e8a795 Matthew Brost          2026-01-16  1669  				      &xe->usm=
.next_asid, GFP_NOWAIT);
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1670  		up_write(&x=
e->usm.lock);
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1671  		if (err < 0)
59eabff2a3524d7 Thomas Hellstr=C3=B6m       2025-09-08  1672  			goto err_c=
lose;
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1673 =20
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1674  		vm->usm.asi=
d =3D asid;
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1675  	}
30e0c3f43a41461 Piotr Pi=C3=B3rkowski       2025-08-11  1676 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1677  	trace_xe_vm_creat=
e(vm);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1678 =20
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1679  	return vm;
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1680 =20
b06d47be7c83165 Matthew Brost          2023-07-07  1681  err_close:
b06d47be7c83165 Matthew Brost          2023-07-07  1682  	xe_vm_close_and_p=
ut(vm);
b06d47be7c83165 Matthew Brost          2023-07-07  1683  	return ERR_PTR(er=
r);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1684 =20
4f296d77cf49fcb Matthew Auld           2025-05-14  1685  err_svm_fini:
4f296d77cf49fcb Matthew Auld           2025-05-14  1686  	if (flags & XE_VM=
_FLAG_FAULT_MODE) {
4f296d77cf49fcb Matthew Auld           2025-05-14  1687  		vm->size =3D 0; =
/* close the vm */
4f296d77cf49fcb Matthew Auld           2025-05-14  1688  		xe_svm_fini(vm);
4f296d77cf49fcb Matthew Auld           2025-05-14  1689  	}
b06d47be7c83165 Matthew Brost          2023-07-07  1690  err_no_resv:
0cd99046ca0522d Maarten Lankhorst      2024-02-21  1691  	mutex_destroy(&vm=
->snap_mutex);
fd84041d094ce8f Matthew Brost          2023-07-19  1692  	for_each_tile(til=
e, xe, id)
fd84041d094ce8f Matthew Brost          2023-07-19  1693  		xe_range_fence_t=
ree_fini(&vm->rftree[id]);
4c44f89c5daee95 Thomas Hellstr=C3=B6m       2024-07-05  1694  	ttm_lru_bulk=
_move_fini(&xe->ttm, &vm->lru_bulk_move);
9337166fa1d80f7 Piotr Pi=C3=B3rkowski       2025-08-11  1695  	if (vm->xef)
9337166fa1d80f7 Piotr Pi=C3=B3rkowski       2025-08-11  1696  		xe_file_put=
(vm->xef);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1697  	kfree(vm);
73ba282e7faf625 Rodrigo Vivi           2024-05-22  1698  	if (flags & XE_VM=
_FLAG_LR_MODE)
783d6cdc8231f62 Rodrigo Vivi           2024-04-18  1699  		xe_pm_runtime_pu=
t(xe);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1700  	return ERR_PTR(er=
r);
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1701  }
dd08ebf6c3525a7 Matthew Brost          2023-03-30  1702 =20

:::::: The code at line 1586 was first introduced by commit
:::::: 59eabff2a3524d7f3bf6c24890cd197c4c116fcb drm/xe: Convert xe_bo_creat=
e_pin_map() for exhaustive eviction

:::::: TO: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
:::::: CC: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
