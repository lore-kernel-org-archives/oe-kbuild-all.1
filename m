Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9203C1F37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761136; cv=none; b=s2sPWyuL21tClQkY8ViCrkY24yrXyDC3Ny/O+koLpHf292vESpreD41hcQnwbAp9PMXaifX8IiqVKtOHTSM6pTN5v/jdkt6kztvzqWCKZjP6dw2pZjvOVlUncClWBYDaGgVwbLA9QEr91X9j8otRcOiQ2LJN4NMElirjya4Zm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761136; c=relaxed/simple;
	bh=BTqG+qnul413thXa+vR7DJTfJc3ZLXjQ0nc6zHY7Byg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZAYvv5ZOOL/z+wtYzUdcjaCHNpuLwf6SpSYext8BTbvKNVI0IhMG/VXd9Fx8OCS7IVD7VWx1TGcdQ+BLEDyrXZ6xZjrC3U9bzX3TMUyiiJcz7oytQ2PJmFPiieYFCEhmJi4gvtVWfwBsxWLnIzjQ5zU2iCUZPEJZPLX/5ZruJk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU1D06Fv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU1D06Fv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778761133; x=1810297133;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BTqG+qnul413thXa+vR7DJTfJc3ZLXjQ0nc6zHY7Byg=;
  b=EU1D06FvWgd3Xm1kE8DuHmUjfbmRwpcQ/5Pg7yzAn2ehC94ZUZCabRh3
   bv7FqhREHmpvsnVrOMxJ9pbvM/MzW04Gx+tOD+NN5/YFWItQaGNV4yFQ8
   F59lyDB1Iq2x6PgA4jUbXyEsRupXjxABcuxaKhzQJEs5gW7lyaptIAXAw
   cNrzpWXLAoSKokMsSo077ct4CmiBXec+WC93vMe3XkUvqzj2ljD3CwVTX
   SWQPo3bdCtMpBWg0KZPR6HFiiobNf0R0RKKn5NsJtFQM4wTqecQ5ud0OR
   Pg4DOVsFgf6nBSGolbrYwJayD1BtYakdGsM2k8wdLE5V9Ln9dzm46CglN
   g==;
X-CSE-ConnectionGUID: Ww6huoWjTaaIm6WhRYvmDA==
X-CSE-MsgGUID: EE1ntBQASDm01DhktTeY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67230278"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="67230278"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:18:44 -0700
X-CSE-ConnectionGUID: M4Hxy1PtQuq0kKD2iwEREQ==
X-CSE-MsgGUID: xpDwPB5YTIaGjWaQyTZ08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="243341721"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2026 05:18:42 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNV1U-000000006Wg-2GY4;
	Thu, 14 May 2026 12:18:40 +0000
Date: Thu, 14 May 2026 20:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 0/1]
 kernel/kstack_erase.c:34:56: sparse: sparse: incorrect type in argument 3
 (different address spaces)
Message-ID: <202605142057.GTnVsZ74-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Kees,

First bad commit (maybe !=3D root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   e99aab26ecd1f3967045b8c07aa8e13e301ed770
commit: 57fbad15c2eee77276a541c616589b32976d2b8e [0/1] stackleak: Rename ST=
ACKLEAK to KSTACK_ERASE
config: x86_64-randconfig-121-20260514 (https://download.01.org/0day-ci/arc=
hive/20260514/202605142057.GTnVsZ74-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260514/202605142057.GTnVsZ74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142057.GTnVsZ74-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/kstack_erase.c:34:56: sparse: sparse: incorrect type in argument =
3 (different address spaces) @@     expected void * @@     got void [nodere=
f] __user *buffer @@
   kernel/kstack_erase.c:34:56: sparse:     expected void *
   kernel/kstack_erase.c:34:56: sparse:     got void [noderef] __user *buff=
er
>> kernel/kstack_erase.c:54:35: sparse: sparse: incorrect type in initializ=
er (incompatible argument 3 (different address spaces)) @@     expected int=
 ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/kstack_erase.c:54:35: sparse:     expected int ( [usertype] *proc=
_handler )( ... )
   kernel/kstack_erase.c:54:35: sparse:     got int ( * )( ... )

vim +34 kernel/kstack_erase.c

964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  23 =20
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  24  #ifdef =
CONFIG_SYSCTL
78eb4ea25cd5fdb kernel/stackleak.c Joel Granados    2024-07-24  25  static =
int stack_erasing_sysctl(const struct ctl_table *table, int write,
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  26  			void=
 __user *buffer, size_t *lenp, loff_t *ppos)
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  27  {
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  28  	int re=
t =3D 0;
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  29  	int st=
ate =3D !static_branch_unlikely(&stack_erasing_bypass);
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  30  	int pr=
ev_state =3D state;
0e148d3cca0dc1a kernel/stackleak.c Thomas Wei=C3=9Fschuh 2024-05-03  31  	s=
truct ctl_table table_copy =3D *table;
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  32 =20
0e148d3cca0dc1a kernel/stackleak.c Thomas Wei=C3=9Fschuh 2024-05-03  33  	t=
able_copy.data =3D &state;
0e148d3cca0dc1a kernel/stackleak.c Thomas Wei=C3=9Fschuh 2024-05-03 @34  	r=
et =3D proc_dointvec_minmax(&table_copy, write, buffer, lenp, ppos);
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  35  	state =
=3D !!state;
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  36  	if (re=
t || !write || state =3D=3D prev_state)
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  37  		retur=
n ret;
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  38 =20
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  39  	if (st=
ate)
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  40  		stati=
c_branch_disable(&stack_erasing_bypass);
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  41  	else
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  42  		stati=
c_branch_enable(&stack_erasing_bypass);
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  43 =20
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  44  	pr_war=
n("stackleak: kernel stack erasing is %s\n",
62e9c1e8ecee87a kernel/stackleak.c Thorsten Blum    2024-12-22  45  					st=
r_enabled_disabled(state));
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  46  	return=
 ret;
964c9dff0091893 kernel/stackleak.c Alexander Popov  2018-08-17  47  }
1751f872cc97f99 kernel/stackleak.c Joel Granados    2025-01-28  48  static =
const struct ctl_table stackleak_sysctls[] =3D {
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  49  	{
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  50  		.proc=
name	=3D "stack_erasing",
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  51  		.data=
		=3D NULL,
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  52  		.maxl=
en		=3D sizeof(int),
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  53  		.mode=
		=3D 0600,
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21 @54  		.proc=
_handler	=3D stack_erasing_sysctl,
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  55  		.extr=
a1		=3D SYSCTL_ZERO,
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  56  		.extr=
a2		=3D SYSCTL_ONE,
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  57  	},
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  58  };
0df8bdd5e3b3e55 kernel/stackleak.c Xiaoming Ni      2022-01-21  59 =20

:::::: The code at line 34 was first introduced by commit
:::::: 0e148d3cca0dc1a7c6063939f6cb9ba4866c39a7 stackleak: Use a copy of th=
e ctl_table argument

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
