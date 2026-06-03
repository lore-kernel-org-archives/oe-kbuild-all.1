Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75E2383C65
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498414; cv=none; b=kTlCybtP33+vhlo3LkMbZdSa4WO3Gf/RvvCgU+PtCQ1PHx66NPbIBeVfc8Bt8Fhu6hg9kQ+IrJQPeX520awrQEKcMXcu/jwhGaUaVYKxgIhiBIIkvd3uCFdgH6d81vjfbUm2ancoLeJENdYLoWSW8ilYhbZoMb721JbFee7QyCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498414; c=relaxed/simple;
	bh=NAQyyqDLWB/DYAdZzZgG1em95oLBKDGd5SrDTm54glw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l/4JU025Sf352xZvs2KDVh6bKAMd4awl14xLc1a532nTbcxe3/rTjeYI9Ha2gBdqx2IKyrVsNdv2BMwDEAJbwC8PqoNSeX8e+ysMHENF7RerpkgSlcjccRXCCv36p6M/zaZ3K0kq6SUeQBFUVZ1Ace0Xxj5oTsXBTuar7U9l7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B80wBJ+F; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B80wBJ+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780498413; x=1812034413;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NAQyyqDLWB/DYAdZzZgG1em95oLBKDGd5SrDTm54glw=;
  b=B80wBJ+FlglQopZUWwpVNoBjH/PFDKXNTIjIHWx5tIsulktoA4brOw8r
   wz+0LTSaGoldH6jBwmjr8QCrN5tGZgVbBO8rRYB7PAeCCe8qyXCAXD+u8
   A1hUt79mJyZsWOrdw1NuyiEB8KFGbqKZ8RgatIFQ5aYDQpPNXbH1g03Ec
   Iod7e/5AtEsSIBvw0GCFIDgo0E0aMwurJVcvE62XJrGsoteeQnDdnBJE0
   BXM3fhHCqn/mDMn36FIkWBckq15LjyXGqCztxYoPbTdCp4bZ6aswMIAef
   dxgUSSiKieSIZHmwGOo19haUWAG47jIMmZIokGLXkKxf/jA27gyeAXehK
   Q==;
X-CSE-ConnectionGUID: daJPo7qzTCGNBTNngJFECQ==
X-CSE-MsgGUID: iJfQw5AsTCaBK9EHpINX3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85200328"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="85200328"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 07:53:32 -0700
X-CSE-ConnectionGUID: xQK2MlJbQeSB9voAf/xmoQ==
X-CSE-MsgGUID: yEb9mTCNSUmzkmvAQvhGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="237916565"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2026 07:53:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUmyG-00000000DY0-0TfG;
	Wed, 03 Jun 2026 14:53:28 +0000
Date: Wed, 03 Jun 2026 22:52:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:irq/constify 8/8]
 arch/powerpc/sysdev/xive/common.c:1350:26: warning: passing argument 1 of
 'is_xive_irq' discards 'const' qualifier from pointer target type
Message-ID: <202606032249.P3LdHXZd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/=
constify
head:   2e8b4859e87ef8229ab12228b5e484171084a127
commit: 2e8b4859e87ef8229ab12228b5e484171084a127 [8/8] genirq/chip: Constif=
y the 'chip' field in irq_data
config: powerpc64-randconfig-r073-20260603 (https://download.01.org/0day-ci=
/archive/20260603/202606032249.P3LdHXZd-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260603/202606032249.P3LdHXZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606032249.P3LdHXZd-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from arch/powerpc/sysdev/xive/common.c:10:
   arch/powerpc/sysdev/xive/common.c: In function 'xive_irq_domain_debug_sh=
ow':
>> arch/powerpc/sysdev/xive/common.c:1350:26: warning: passing argument 1 o=
f 'is_xive_irq' discards 'const' qualifier from pointer target type [-Wdisc=
arded-qualifiers]
    1350 |         if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if=
_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond=
) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/powerpc/sysdev/xive/common.c:1350:9: note: in expansion of macro 'i=
f'
    1350 |         if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
         |         ^~
   arch/powerpc/sysdev/xive/common.c:972:35: note: expected 'struct irq_chi=
p *' but argument is of type 'const struct irq_chip *'
     972 | bool is_xive_irq(struct irq_chip *chip)
         |                  ~~~~~~~~~~~~~~~~~^~~~
>> arch/powerpc/sysdev/xive/common.c:1350:26: warning: passing argument 1 o=
f 'is_xive_irq' discards 'const' qualifier from pointer target type [-Wdisc=
arded-qualifiers]
    1350 |         if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if=
_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond=
) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/powerpc/sysdev/xive/common.c:1350:9: note: in expansion of macro 'i=
f'
    1350 |         if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
         |         ^~
   arch/powerpc/sysdev/xive/common.c:972:35: note: expected 'struct irq_chi=
p *' but argument is of type 'const struct irq_chip *'
     972 | bool is_xive_irq(struct irq_chip *chip)
         |                  ~~~~~~~~~~~~~~~~~^~~~
>> arch/powerpc/sysdev/xive/common.c:1350:26: warning: passing argument 1 o=
f 'is_xive_irq' discards 'const' qualifier from pointer target type [-Wdisc=
arded-qualifiers]
    1350 |         if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if=
_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_=
var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARG=
S__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/powerpc/sysdev/xive/common.c:1350:9: note: in expansion of macro 'i=
f'
    1350 |         if (!is_xive_irq(irq_data_get_irq_chip(irqd)))
         |         ^~
   arch/powerpc/sysdev/xive/common.c:972:35: note: expected 'struct irq_chi=
p *' but argument is of type 'const struct irq_chip *'
     972 | bool is_xive_irq(struct irq_chip *chip)
         |                  ~~~~~~~~~~~~~~~~~^~~~


vim +1350 arch/powerpc/sysdev/xive/common.c

a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1338 =20
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1339  static void xive_irq=
_domain_debug_show(struct seq_file *m, struct irq_domain *d,
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1340  				       struct ir=
q_data *irqd, int ind)
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1341  {
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1342  	struct xive_irq_dat=
a *xd;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1343  	u64 val;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1344  	int i;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1345 =20
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1346  	/* No IRQ domain le=
vel information. To be done */
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1347  	if (!irqd)
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1348  		return;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1349 =20
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10 @1350  	if (!is_xive_irq(ir=
q_data_get_irq_chip(irqd)))
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1351  		return;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1352 =20
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1353  	seq_printf(m, "%*sX=
IVE:\n", ind, "");
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1354  	ind++;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1355 =20
cc0cc23babc979 Nam Cao          2025-08-11  1356  	xd =3D irq_data_get_irq_=
chip_data(irqd);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1357  	if (!xd) {
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1358  		seq_printf(m, "%*s=
not assigned\n", ind, "");
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1359  		return;
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1360  	}
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1361 =20
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1362  	val =3D xive_esb_re=
ad(xd, XIVE_ESB_GET);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1363  	seq_printf(m, "%*sE=
SB:      %s\n", ind, "", esb_names[val & 0x3]);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1364  	seq_printf(m, "%*sP=
state:   %s %s\n", ind, "", xd->stale_p ? "stale" : "",
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1365  		   xd->saved_p ? "=
saved" : "");
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1366  	seq_printf(m, "%*sT=
arget:   %d\n", ind, "", xd->target);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1367  	seq_printf(m, "%*sC=
hip:     %d\n", ind, "", xd->src_chip);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1368  	seq_printf(m, "%*sT=
rigger:  0x%016llx\n", ind, "", xd->trig_page);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1369  	seq_printf(m, "%*sE=
OI:      0x%016llx\n", ind, "", xd->eoi_page);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1370  	seq_printf(m, "%*sF=
lags:    0x%llx\n", ind, "", xd->flags);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1371  	for (i =3D 0; i < A=
RRAY_SIZE(xive_irq_flags); i++) {
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1372  		if (xd->flags & xi=
ve_irq_flags[i].mask)
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1373  			seq_printf(m, "%*=
s%s\n", ind + 12, "", xive_irq_flags[i].name);
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1374  	}
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1375  }
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1376  #endif
a5021abc48a0f4 C=C3=A9dric Le Goater 2020-12-10  1377 =20

:::::: The code at line 1350 was first introduced by commit
:::::: a5021abc48a0f44083a15a37b3e61378519cb00d powerpc/xive: Add a debug_s=
how handler to the XIVE irq_domain

:::::: TO: C=C3=A9dric Le Goater <clg@kaod.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
