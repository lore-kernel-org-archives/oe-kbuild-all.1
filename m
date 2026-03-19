Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89092D640D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900183; cv=none; b=AsJ/j3biapUHHtVTN7tSttBCxeW6crDY1nuQ76+80dbVIb2PP5wAi/wqAaMxjQTtUOvzSpmRP6518F1lJT55jAs5CYNoskB73/UYhcFKWw/kAinEL5zhIqA+/ZfhXtkXVCTV+pR9vLCuwgbt6C3EWf774fRmqOKLedGcrltQoOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900183; c=relaxed/simple;
	bh=bFG3NU90QQwAJmgWdG1g/gp1oQYLSkeWIZvzGPrNJ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XOQ7hzXp0ZWzK1meaVOEqAPnDqnOzWIedQkOMME+Z+Jz8fGTdfI0opukiVbJupdxjkcBQqmuVCpV2U+jfeRj/FfKhql8Hgm5qC+6vxwHtEUiLQ88hVbNHgjgb69t343R+XRb9mJzTpKyeiVLfJcg6ekTSwKhLKRsgPhI/AfyYZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoETG/zu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoETG/zu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773900182; x=1805436182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bFG3NU90QQwAJmgWdG1g/gp1oQYLSkeWIZvzGPrNJ6c=;
  b=KoETG/zu2vIXINLXpm8y4OCwXlJ44Ls9zrxzOfb5Hi2OWvcXQsljZARl
   0+jJxlwGlKyxUDf6AmvU8AfSoLuiOqOV1vNJEhm32tEf9f+2RwUM3w3Tx
   mQefQwc6qcmkABc8XaE3VixDZmnt3/nF93l2yqno3VSUyR6dou0fi/itY
   ynZA1LB+VAwzDEtHIrBfL2kMJuRNUuhe6mUtExjmqm2tncawBxMbQgaXU
   wJAYhPxsHvMamywLeMx42oTBzpS6F/9Gc+i5ikorVFv/g+iiMCmDVoYNe
   996cBqWYg+dNe88VtynXgYxnVOj+p5t1UphoRpZLK/oenhU4iWm2/TCF3
   w==;
X-CSE-ConnectionGUID: dek8A+9qSBu6IkuFvsf7pQ==
X-CSE-MsgGUID: vh8foLAsQs+qtMHVLPBJBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92349243"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92349243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 23:03:01 -0700
X-CSE-ConnectionGUID: IM4rAFdPQquz5JaO+vEqNw==
X-CSE-MsgGUID: 42Xmhi6tS3Wa556u8zNiFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="253353695"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Mar 2026 23:03:00 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w36Su-000000000OV-3SQB;
	Thu, 19 Mar 2026 06:02:44 +0000
Date: Thu, 19 Mar 2026 14:00:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6496/7246]
 drivers/block/drbd/drbd_transport_rdma.c:3138:14: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202603191326.cwD2cebx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 7d6deec50773e43a5840f798ea0a730f20f74700 [6496/7246] drbd: remove B=
ROKEN for DRBD
config: powerpc-randconfig-r121-20260319 (https://download.01.org/0day-ci/a=
rchive/20260319/202603191326.cwD2cebx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4ab=
b927bacf37f18f6359a41639a6d1b3bffffb5)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260319/202603191326.cwD2cebx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191326.cwD2cebx-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/block/drbd/drbd_transport_rdma.c:3138:14: sparse: sparse: incomp=
atible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_transport_rdma.c:3138:14: sparse:    struct dtr_=
cm [noderef] __rcu *
   drivers/block/drbd/drbd_transport_rdma.c:3138:14: sparse:    struct dtr_=
cm *
>> drivers/block/drbd/drbd_transport_rdma.c:1460:19: sparse: sparse: incorr=
ect type in assignment (different base types) @@     expected unsigned int =
[usertype] magic @@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_rdma.c:1460:19: sparse:     expected u=
nsigned int [usertype] magic
   drivers/block/drbd/drbd_transport_rdma.c:1460:19: sparse:     got restri=
cted __be32 [usertype]
>> drivers/block/drbd/drbd_transport_rdma.c:1475:37: sparse: sparse: incorr=
ect type in assignment (different base types) @@     expected unsigned int =
@@     got restricted __be32 [usertype] @@
   drivers/block/drbd/drbd_transport_rdma.c:1475:37: sparse:     expected u=
nsigned int
   drivers/block/drbd/drbd_transport_rdma.c:1475:37: sparse:     got restri=
cted __be32 [usertype]
>> drivers/block/drbd/drbd_transport_rdma.c:1497:40: sparse: sparse: incorr=
ect type in assignment (different base types) @@     expected unsigned int =
[addressable] [usertype] rx_desc_stolen_from_stream @@     got restricted _=
_be32 [usertype] @@
   drivers/block/drbd/drbd_transport_rdma.c:1497:40: sparse:     expected u=
nsigned int [addressable] [usertype] rx_desc_stolen_from_stream
   drivers/block/drbd/drbd_transport_rdma.c:1497:40: sparse:     got restri=
cted __be32 [usertype]
   drivers/block/drbd/drbd_transport_rdma.c:835:14: sparse: sparse: incompa=
tible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_transport_rdma.c:835:14: sparse:    struct dtr_c=
m [noderef] __rcu *
   drivers/block/drbd/drbd_transport_rdma.c:835:14: sparse:    struct dtr_c=
m *
>> drivers/block/drbd/drbd_transport_rdma.c:1529:41: sparse: sparse: cast t=
o restricted __be32
   drivers/block/drbd/drbd_transport_rdma.c:1543:16: sparse: sparse: cast t=
o restricted __be32
   drivers/block/drbd/drbd_transport_rdma.c:2297:22: sparse: sparse: incomp=
atible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_transport_rdma.c:2297:22: sparse:    struct dtr_=
cm [noderef] __rcu *
   drivers/block/drbd/drbd_transport_rdma.c:2297:22: sparse:    struct dtr_=
cm *
   drivers/block/drbd/drbd_transport_rdma.c:3434:14: sparse: sparse: incomp=
atible types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_transport_rdma.c:3434:14: sparse:    struct dtr_=
cm [noderef] __rcu *
   drivers/block/drbd/drbd_transport_rdma.c:3434:14: sparse:    struct dtr_=
cm *

vim +3138 drivers/block/drbd/drbd_transport_rdma.c

26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3131 =20
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3132  static bool dtr_=
path_ok(struct dtr_path *path)
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3133  {
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3134  	bool r =3D fals=
e;
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3135  	struct dtr_cm *=
cm =3D path->cm;
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3136 =20
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3137  	rcu_read_lock();
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16 @3138  	cm =3D rcu_dere=
ference(path->cm);
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3139  	if (cm) {
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3140  		r =3D cm->id &=
& cm->state =3D=3D DSM_CONNECTED;
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3141  	}
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3142  	rcu_read_unlock=
();
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3143 =20
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3144  	return r;
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3145  }
26623d4a2a2161 Christoph B=C3=B6hmwalder 2025-12-16  3146 =20

:::::: The code at line 3138 was first introduced by commit
:::::: 26623d4a2a216146b4e7be566071f6d95b19ffad drbd: add RDMA transport im=
plementation

:::::: TO: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
:::::: CC: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
