Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563FA253F05
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233561; cv=none; b=rPUdpfnABpbOYjIqNOZRoqRjTFPLiNmrMqOeyvq8Yrgt+o9chhOPksgqMtVbNT3GN5ei8yJB2XDhB6592vRmSOifLkjn8ABPTqRSC1gBlbOt/X+4uJA12nLjJPuCoV9IAVQCiruODREURTQT8YeSimwETn7xShNsvg+q0wUGgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233561; c=relaxed/simple;
	bh=sjXMwhtujX01U0MlCzj+yb7iUMPV42dAzK0snLhmpnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Tsb333lsuARYCq3mPJkLNMsm1H35Gf2jn07y8eyKfnlo4UaBuXzO6rZbrIAIaxKpqH8A+q6BJh7/hpbfB7e58CcuJfs/cEfFhtJczBr2nCO48oWtFw8Sofj4cEGn6zIxnRIKROl+QZ5anc3qvdrp2+PiP2KHMn3GldmkaS4oXZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMo3EEKs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMo3EEKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773233560; x=1804769560;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sjXMwhtujX01U0MlCzj+yb7iUMPV42dAzK0snLhmpnw=;
  b=FMo3EEKsBecljQFXXXDH2l6AnSoHE3m9rV+nMKl7idNkzlIKcV+Eu6Du
   0WBavybEpvqXsgWHZg0V0+CPVTtXvlXmijctlErcPQr0vvPxidixbX3Rh
   8R4gWyyg9gukMuaP0XQHcrqz8qEkb/Rp/ckgp46nqm3Izc0b2tHz/xAQH
   AluMLcjVYUYE8eHC1P41D6+n7Gq1FfWME0aCSalQILTsALxq/d1MDDLlO
   wSszIT9tJuOfj8apeI/EGpJtNTWw1ExlqVI3omzRr6iauTl6qzZLXnGrR
   Ik0o/3b3k6jquAvIahdFuUurAAzpViTP3ZiRCEC0hATpsl2b5DnYqfAbm
   Q==;
X-CSE-ConnectionGUID: IUfTq3mDQmCPKFIvZfmyBw==
X-CSE-MsgGUID: z5Qz/ArARD6qdEyHfz2TzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84930073"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84930073"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 05:52:39 -0700
X-CSE-ConnectionGUID: E4zSi1+NQeKQNv9k2Ko4Zg==
X-CSE-MsgGUID: /l8ruS8jTBiexg5dal6QIw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 05:52:37 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0J3C-00000000197-1pjF;
	Wed, 11 Mar 2026 12:52:34 +0000
Date: Wed, 11 Mar 2026 20:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 37/45] include/vdso/helpers.h:13:64: error:
 'VDSO_CLOCKMODE_TIMENS' undeclared
Message-ID: <202603112006.tqQzVMDI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/=
vdso
head:   f7178f159b2a36d070fd43b0d751e4e4415ec39e
commit: 912632a7fd4cc1eac2778828d92e8fe46939d6bd [37/45] vdso/datapage: Tri=
m down unnecessary includes
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260311/=
202603112006.tqQzVMDI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260311/202603112006.tqQzVMDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112006.tqQzVMDI-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/vgtod.h:13,
                    from arch/x86/kernel/sys_ia32.c:49:
   include/vdso/helpers.h: In function 'vdso_is_timens_clock':
>> include/vdso/helpers.h:13:64: error: 'VDSO_CLOCKMODE_TIMENS' undeclared =
(first use in this function)
      13 |         return IS_ENABLED(CONFIG_TIME_NS) && vc->clock_mode =3D=
=3D VDSO_CLOCKMODE_TIMENS;
         |                                                                ^=
~~~~~~~~~~~~~~~~~~~~
   include/vdso/helpers.h:13:64: note: each undeclared identifier is report=
ed only once for each function it appears in


vim +/VDSO_CLOCKMODE_TIMENS +13 include/vdso/helpers.h

00b26474c2f161 Vincenzo Frascino 2019-06-21  10 =20
daa2b92d33a403 Thomas Wei=C3=9Fschuh  2026-02-27  11  static __always_inlin=
e bool vdso_is_timens_clock(const struct vdso_clock *vc)
daa2b92d33a403 Thomas Wei=C3=9Fschuh  2026-02-27  12  {
daa2b92d33a403 Thomas Wei=C3=9Fschuh  2026-02-27 @13  	return IS_ENABLED(CO=
NFIG_TIME_NS) && vc->clock_mode =3D=3D VDSO_CLOCKMODE_TIMENS;
daa2b92d33a403 Thomas Wei=C3=9Fschuh  2026-02-27  14  }
daa2b92d33a403 Thomas Wei=C3=9Fschuh  2026-02-27  15 =20

:::::: The code at line 13 was first introduced by commit
:::::: daa2b92d33a4038123598aff55240ae3c54f870c vdso/gettimeofday: Add a he=
lper to test if a clock is namespaced

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
