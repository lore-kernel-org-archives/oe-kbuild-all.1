Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD5DF59
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 02:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625852; cv=none; b=Muhd0zX7t95xjtIhHtvyeg7l1Y9we/XjPGdOCD6lW6tcWfa5slrapdiBg6Vkv7OTUK64JRF9s63eYQe5/ivM5o1KpjrsGyRcSC2+MXkei835jZ9aMEKM7WTHWma1CsglRQ7JPUY3ntED/axZqOpmPAk3Bhd+L8P3RYZ5hoStcrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625852; c=relaxed/simple;
	bh=u1e7M3SMzHpnTwY+fFsLWe3g1ACaoenMmAwtK6FUsug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DN6omKFgojrn6t/ht9z80mTcgprm5ENE0RcRV+13hZZSQXvSDpmO8jRIPbZ3e+vLBTm1Sm9lWkh1m3HpluGnVXqDWQzoDzg1uvwyuljOc1OuewdN1kH1+8KcErOYfSgHAI5UEBedfmH6D6As7umASppwM/sWYNZ3fJG9RirF47Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKztF3XI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKztF3XI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787625850; x=1819161850;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u1e7M3SMzHpnTwY+fFsLWe3g1ACaoenMmAwtK6FUsug=;
  b=iKztF3XIaTE6s7QVOJifiFr7Nxp8RpKkXFCNxjlUUrZ1ifnZcTU8OzwK
   dZjHO1A2WkLzaQrvZC2ci5jerGpy7bavlMjFfWaHldO5C0JFllxOeKlHu
   zaPdB1OV1qYpIfGz07zyNiWtbnO+bLQTlb4ZR8wJ8R849Wfv4r/VNDjzK
   xVkk2v6JBuOmpsuN6MZv/BAVd2evzIc9S0ulMGiyo63TbDaIvycKTfZGj
   FcT0XlPLnBJRFiYqe1r4OOMX2ITqSOku5VgXIp4W7vl3DT/D/3igT1de/
   xWdv6ez9fQ4UXUunynOwmQe2AJa+vw2WTVCVBozuGpSrRroZNVnw4PgAC
   g==;
X-CSE-ConnectionGUID: SQL7MvUMQcediMIPRAxv4Q==
X-CSE-MsgGUID: a7XFJtAmQceFG7/1c5hXxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="75623844"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="75623844"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 19:44:09 -0700
X-CSE-ConnectionGUID: yI7UU0NSToS6JQdXwWSDQQ==
X-CSE-MsgGUID: qX/kU0wEQwa54mNUZf3JQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265844976"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 19:44:07 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyh8v-000000000TX-2xzy;
	Tue, 25 Aug 2026 02:44:05 +0000
Date: Tue, 25 Aug 2026 04:43:44 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./arch/arm64/include/asm/vdso.h:19:18: error:
 'vdso_offset_futex_list32_try_unlock_cs_start' undeclared; did you mean
 'vdso_offset_futex_list64_try_unlock_cs_start'?
Message-ID: <202608250412.Tkf04HJi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/arm64-v=
dso-Prepare-for-robust-futex-unlock-support/20260821-185042
head:   c24af1004f23fc7c8664fc39786d7ad617a09a9c
commit: c24af1004f23fc7c8664fc39786d7ad617a09a9c arm64: vdso32: Implement _=
_vdso_futex_robust_try_unlock()
date:   2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0825/202608250412.Tkf04HJi-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260825/202608250412.Tkf04HJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250412.Tkf04HJi-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/vdso.c:30:
   arch/arm64/kernel/vdso.c: In function 'aarch32_vdso_futex_update_ips':
>> ./arch/arm64/include/asm/vdso.h:19:18: error: 'vdso_offset_futex_list32_=
try_unlock_cs_start' undeclared (first use in this function); did you mean =
'vdso_offset_futex_list64_try_unlock_cs_start'?
      19 |         (void *)(vdso_offset_##name + (unsigned long)(base)); \
         |                  ^~~~~~~~~~~~
   arch/arm64/kernel/vdso.c:86:33: note: in expansion of macro 'VDSO_SYMBOL'
      86 |                                 VDSO_SYMBOL(vdso, futex_list32_t=
ry_unlock_cs_start),
         |                                 ^~~~~~~~~~~
   ./arch/arm64/include/asm/vdso.h:19:18: note: each undeclared identifier =
is reported only once for each function it appears in
      19 |         (void *)(vdso_offset_##name + (unsigned long)(base)); \
         |                  ^~~~~~~~~~~~
   arch/arm64/kernel/vdso.c:86:33: note: in expansion of macro 'VDSO_SYMBOL'
      86 |                                 VDSO_SYMBOL(vdso, futex_list32_t=
ry_unlock_cs_start),
         |                                 ^~~~~~~~~~~
>> ./arch/arm64/include/asm/vdso.h:19:18: error: 'vdso_offset_futex_list32_=
try_unlock_cs_end' undeclared (first use in this function); did you mean 'v=
dso_offset_futex_list64_try_unlock_cs_end'?
      19 |         (void *)(vdso_offset_##name + (unsigned long)(base)); \
         |                  ^~~~~~~~~~~~
   arch/arm64/kernel/vdso.c:87:33: note: in expansion of macro 'VDSO_SYMBOL'
      87 |                                 VDSO_SYMBOL(vdso, futex_list32_t=
ry_unlock_cs_end));
         |                                 ^~~~~~~~~~~


vim +19 ./arch/arm64/include/asm/vdso.h

9031fefde6f2ac Will Deacon      2012-03-05  16 =20
9031fefde6f2ac Will Deacon      2012-03-05  17  #define VDSO_SYMBOL(base, n=
ame)						   \
9031fefde6f2ac Will Deacon      2012-03-05  18  ({									   \
0973fed6a5e58d Thomas Wei=C3=9Fschuh 2024-10-10 @19  	(void *)(vdso_offset_=
##name + (unsigned long)(base)); \
9031fefde6f2ac Will Deacon      2012-03-05  20  })
9031fefde6f2ac Will Deacon      2012-03-05  21 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
