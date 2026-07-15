Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4E442FA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 18:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784140485; cv=none; b=V5NEAes+l6hJi8K8PyXXLZ54vk0tuYahbFYVAyhPvXJQZxbt1WZrwIw0UEKM7vMfbU7iKE48Ypp1CwFiw8alig4ApNYOdpq6/i9+H5Yf+x9RlMey/TL5r6n0YgmCaj7oA561lMBiEOSpb2pRa9D2Hl4z0+ElSZGSkoDVJV2KmXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784140485; c=relaxed/simple;
	bh=i0Pm9cb9BH7pmpmpUqiyOSyQJ8Rpf/DvetyaBtToo4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sc3xV4YH4WNJTvAyMYPuOxsACD7j+mqHctKtqgTvuBB3MEoeWl9IS6qo+nic2xySS10EPoOSsHmB0d25KNrWLHB67xnHfxZopaka2TWy5R8cV7YT70+t7Ko37MZ2wYl+6IU8/oR84ksnA5jsSuvMMQGbCNvc6iOuW0wAIsubTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8G790lo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8G790lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784140479; x=1815676479;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i0Pm9cb9BH7pmpmpUqiyOSyQJ8Rpf/DvetyaBtToo4U=;
  b=S8G790loYRFJSRBStiAt4yVi9PcqC4frpQtMZmkS9wZ42/Sh6K2as188
   OWzyeDzXmidR6/hs2BhKbEkkno1kyT/QPVsF5aygV0abcinwkIeLpItaI
   thxoSRdcGON4tUNQDJ6wTzjCM6ZqAyJHE9eqmfpavD6PGHHSdkBl4ifhM
   9rJ2nN25boYNsIxC52L9wMzpW3feT9CyKVFcf1cSwvg3g1FTAx9CkBUpc
   0FJEFhv8i2QaVkLWadCQ1WC2DbqDKrtcVkh72OJTxkxZ6uPJlbVtG1Kwz
   OvfaL1YLS5KcLpe8Emp3WjdS9bDl9u2JdA1XOTwa+awazXmMGY0MxPTG9
   w==;
X-CSE-ConnectionGUID: 2j0M5UbkS2+sB6Gc/F0glA==
X-CSE-MsgGUID: aeIwGadASvacBxpAA0NBvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84819846"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84819846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 11:34:36 -0700
X-CSE-ConnectionGUID: JeD1ENE4SPaUP1wtmY+01Q==
X-CSE-MsgGUID: U6Y4CRAcRk+Q+FUUJgZMGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="260076347"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2026 11:34:35 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk4RE-000000004Jd-3hEI;
	Wed, 15 Jul 2026 18:34:32 +0000
Date: Wed, 15 Jul 2026 20:33:33 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 79/96]
 kernel/time/hrtimer.c:2247:undefined reference to `HRTIMER_BASE_AUX0'
Message-ID: <202607152003.P1bFkNGl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/auxclock-nanosleep
head:   aae9c6fcfe1b60e4a63da0fe64f8ffe470b0fa29
commit: 69bfefa1c9bf52492df144e6ad0daf86f82a3727 [79/96] DELETEME
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/202607=
15/202607152003.P1bFkNGl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260715/202607152003.P1bFkNGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607152003.P1bFkNGl-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hrtimers_disable_clock':
>> kernel/time/hrtimer.c:2247:(.text+0x30fb3a): undefined reference to `HRT=
IMER_BASE_AUX0'
>> ld: kernel/time/hrtimer.c:2247:(.text+0x30fb4c): undefined reference to =
`HRTIMER_BASE_AUX0'


vim +2247 kernel/time/hrtimer.c

21d6d52a1b7028 Thomas Gleixner  2015-04-14  2241 =20
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2242  #ifdef CONFIG_HRTIME=
R_ABORT
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2243  void hrtimers_disabl=
e_clock(clockid_t clock)
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2244  {
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2245  	lockdep_assert(cloc=
kid_aux_valid(clock));
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2246 =20
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15 @2247  	unsigned int base_i=
ndex =3D BIT(HRTIMER_BASE_AUX0 + clock - CLOCK_AUX);
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2248  	unsigned int base_i=
ndex_soft =3D base_index << HRTIMER_BASE_MONOTONIC_SOFT;
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2249  	unsigned long flags;
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2250  	int cpu;
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2251 =20
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2252  	guard(cpus_read_loc=
k)();
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2253 =20
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2254  	for_each_online_cpu=
(cpu) {
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2255  		struct hrtimer_cpu=
_base *cpu_base =3D &per_cpu(hrtimer_bases, cpu);
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2256  		ktime_t now;
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2257 =20
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2258  		raw_spin_lock_irqs=
ave(&cpu_base->lock, flags);
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2259  		now =3D hrtimer_up=
date_base(cpu_base);
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2260  		__hrtimer_run_queu=
es(cpu_base, now, flags, base_index | base_index_soft);
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2261  		raw_spin_unlock_ir=
qrestore(&cpu_base->lock, flags);
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2262  	}
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2263  }
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2264  #endif
10fa80a2a4c8ad Thomas Wei=C3=9Fschuh 2026-07-15  2265 =20

:::::: The code at line 2247 was first introduced by commit
:::::: 10fa80a2a4c8adf160a971f21e99fb6525581374 CONFIG_HRTIMER_ABORT

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
