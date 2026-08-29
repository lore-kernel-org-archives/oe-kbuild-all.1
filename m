Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9762299929
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Aug 2026 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036037; cv=none; b=rgyr3Ot+oLD4/7CbXTB+1nDmil3jn2dHoP+7pcmxYMmaRplzuH3dwe3mCfRj2rjymfViQg23QvEdE7sgB0i5S6s87sEMy7ZhSC0wiCqEyTatm+9a4UFyjWShIaRcPP5N6sOE8fSgv9S0WMAGqVZBFcQWucq1HdzNtZPOoKCjaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036037; c=relaxed/simple;
	bh=i8EhaFeR5ose7qs7XYaI53TUgFw6kfvcFkQt561sztY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=guwtu+8eNcObZHM+sezUCNiigfANnKqodVz2eACBYYgAN89asU7/3m9Jxlt8d6cEMNuR93FIp2PPpnMHrVzdovXJ6hvSMdJK3mZqMbu10ohB5vTM19r5/lUmiIvt0LzMJL5APg//Ok3FuhvGWRpv48z4nGmxtLxKfkIyHmuxBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fS+9qLBa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fS+9qLBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788036034; x=1819572034;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i8EhaFeR5ose7qs7XYaI53TUgFw6kfvcFkQt561sztY=;
  b=fS+9qLBalTd4eyxgaSuDKlmNkAgKHWADnWS7jnX8dRS78syvjrxelgJg
   dSrulPYQ/CY2WVjTI9/V/tUSRPDA132v/fyynwmh+a2xvVVD4m2dUMKtH
   LPM14HWwGG6hD65HGnmv8rbYokRpWcqh8eHxnABvguDSTYRFf7aW41gaT
   Kai8xVQ6URMym47SqxvhAT7HxLJTWR21uV9v5nZ7UN+0ArFHoKntbSNkz
   hwHH4tc2K0bhVskCyR0gmD0omA9qBeFhpgURSuJPSE476YCQdpUTQAfHg
   JgRQBFXDl7wxXoi++y10gWtG5kbgOUTV+DmES3gAVerg5km3m3OFiCiQs
   w==;
X-CSE-ConnectionGUID: 9kPb/wxlShCxvwJhGFyZaw==
X-CSE-MsgGUID: g5yMEhqzTcCSyRdCzaHFLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="106029602"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="106029602"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 13:40:32 -0700
X-CSE-ConnectionGUID: yRryRm3KS02g5TJ2FYxsNw==
X-CSE-MsgGUID: ySw6cDUaSJKXXEsj5Li40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="268488118"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Aug 2026 13:40:31 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0Pqm-00000000DHU-37E2;
	Sat, 29 Aug 2026 20:40:28 +0000
Date: Sun, 30 Aug 2026 04:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/zen-sauce 2/26] include/asm-generic/io.h:1209:55:
 error: performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202608300423.ofw9k7oB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 7.2/zen-sauce
head:   299e73098bef8870b60c6ce830084457d222b0f5
commit: 429980f9a64cd983a4ad0c636518e1a4217c7303 [2/26] ZEN: Add VHBA driver
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260830/2=
02608300423.ofw9k7oB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260830/202608300423.ofw9k7oB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608300423.ofw9k7oB-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1209:55: error: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not use=
d [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   2 errors generated.
--
   In file included from vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
>> include/asm-generic/io.h:1209:55: error: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunuse=
d-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   2 errors generated.


vim +1209 include/asm-generic/io.h

7c566bb5e4d5fb0 Hector Martin    2021-02-11  1201 =20
ce816fa88cca083 Uwe Kleine-K=C3=B6nig 2014-04-07  1202  #ifdef CONFIG_HAS_I=
OPORT_MAP
3f7e212df82ca04 Arnd Bergmann    2009-05-13  1203  #ifndef CONFIG_GENERIC_I=
OMAP
9216efafc52ff99 Thierry Reding   2014-10-01  1204  #ifndef ioport_map
9216efafc52ff99 Thierry Reding   2014-10-01  1205  #define ioport_map iopor=
t_map
3f7e212df82ca04 Arnd Bergmann    2009-05-13  1206  static inline void __iom=
em *ioport_map(unsigned long port, unsigned int nr)
3f7e212df82ca04 Arnd Bergmann    2009-05-13  1207  {
500dd232449e7c0 Andrew Murray    2018-09-13  1208  	port &=3D IO_SPACE_LIMI=
T;
500dd232449e7c0 Andrew Murray    2018-09-13 @1209  	return (port > MMIO_UPP=
ER_LIMIT) ? NULL : PCI_IOBASE + port;
3f7e212df82ca04 Arnd Bergmann    2009-05-13  1210  }
316e8d79a0959c3 Linus Torvalds   2021-09-19  1211  #define ARCH_HAS_GENERIC=
_IOPORT_MAP
9216efafc52ff99 Thierry Reding   2014-10-01  1212  #endif
3f7e212df82ca04 Arnd Bergmann    2009-05-13  1213 =20

:::::: The code at line 1209 was first introduced by commit
:::::: 500dd232449e7c07500e713dc6970aa713f8e4f1 asm-generic: io: Fix ioport=
_map() for !CONFIG_GENERIC_IOMAP && CONFIG_INDIRECT_PIO

:::::: TO: Andrew Murray <andrew.murray@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
