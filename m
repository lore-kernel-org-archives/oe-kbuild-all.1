Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C39C384CEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224539; cv=none; b=hiIuLLdI5SEGz2clUHRB7CvTDncoeM1Mu4R664fPhteMxjBPOrIg3sboFcZfpKpTdI9hgtz7EU/4luvinWm1RzKpV55PIyHQ/t3mUAR4LalmdOZy29Y+2PyT0d4xawod2mFLnQ+phwMWckPD3ilh2wpaUlOVzWjpOka0LUo7IkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224539; c=relaxed/simple;
	bh=q8u/Bvi5c3ax1KXTQlnHfkoLFpJ5Um6V15gQgZCqiyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RLGXh4EL/p73snPc/nOeFCZ3t2wjKYogG9tN464nnxaGyce4te9mYhnZ+w6eYa9M/nF8a6lgfcHA+3KaDuOaFESv27KAs0SB17FHTm5zEWwx8XV7UZPz/CD+Q/DW5sPoOfR+0CkV0qTrbbfJNmgd0FQzs4B78NqRZBuzhSTPz1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Umu+vT1x; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Umu+vT1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782224537; x=1813760537;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q8u/Bvi5c3ax1KXTQlnHfkoLFpJ5Um6V15gQgZCqiyY=;
  b=Umu+vT1xELaskN8osxaf6exSis/eA+1KY92LP4f+o+H8NfRGR6ASpNOD
   5l6/Bkag646Hm9tkd4AkofTTBLXSdY/vw+Z2SOgXqVsyyVY9j9NPCLvqJ
   is+0vX4ArJHcjxZK3FihOAmdllfSkz6v8Clm2Fkcp6sLi6JXDLLnlFfXq
   aPBDfXwfkhK+LdOaeSDZHfCZtGUuUx9xu7fUjyuAg4cfHw2oyRKlWvJ02
   edqzzZ4oNgc7DqUlRRqy1FRHaVI1t9zgTrrBILuDOkyhkYK8TZp5m2wC+
   jqh78GgDvLFc9eSTsTX93sB8xC+sH4I/bvaUzlB7/z+seTLthdFxUSJP9
   Q==;
X-CSE-ConnectionGUID: 24mqkXGIQIaRkVBzBD4Bfw==
X-CSE-MsgGUID: Kcrw2ADMQ6SSDqIZKWxK7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100395036"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100395036"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 07:22:17 -0700
X-CSE-ConnectionGUID: 8Yvu64mYTUCZiw4ekFiPsQ==
X-CSE-MsgGUID: w3kESyIMQ9yALumajgsB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249639352"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 07:22:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc20y-000000002bB-397a;
	Tue, 23 Jun 2026 14:22:12 +0000
Date: Tue, 23 Jun 2026 22:21:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 14/36]
 drivers/ptp/ptp_vmclock.c:681:31: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka
 'unsigned int'}
Message-ID: <202606232217.v0xCZUWp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git clea=
nups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: de40e94c2ee6a5610211cba9e82eb50db165e6d1 [14/36] ptp: ptp_vmclock: =
Replace get_cycles() usage
config: i386-randconfig-005 (https://download.01.org/0day-ci/archive/202606=
23/202606232217.v0xCZUWp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606232217.v0xCZUWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232217.v0xCZUWp-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'mul_u64_u64_shr_add_u64':
   drivers/ptp/ptp_vmclock.c:78:18: error: '__int128' is not supported on t=
his target
      78 |         unsigned __int128 res =3D (unsigned __int128)delta * per=
iod;
         |                  ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:78:43: error: '__int128' is not supported on t=
his target
      78 |         unsigned __int128 res =3D (unsigned __int128)delta * per=
iod;
         |                                           ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:82:23: warning: right shift count >=3D width o=
f type [-Wshift-count-overflow]
      82 |         *res_hi =3D res >> 64;
         |                       ^~
   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:15,
                    from drivers/ptp/ptp_vmclock.c:11:
   drivers/ptp/ptp_vmclock.c: In function 'vmclock_probe':
>> drivers/ptp/ptp_vmclock.c:681:31: warning: format '%llx' expects argumen=
t of type 'long long unsigned int', but argument 3 has type 'resource_size_=
t' {aka 'unsigned int'} [-Wformat=3D]
     681 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_pri=
ntk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt=
(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/ptp/ptp_vmclock.c:681:17: note: in expansion of macro 'dev_info'
     681 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                 ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:681:55: note: format string is defined here
     681 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                                                    ~~~^
         |                                                       |
         |                                                       long long =
unsigned int
         |                                                    %x


vim +681 drivers/ptp/ptp_vmclock.c

20503272422693d David Woodhouse  2024-10-06  657 =20
20503272422693d David Woodhouse  2024-10-06  658  static int vmclock_probe(=
struct platform_device *pdev)
20503272422693d David Woodhouse  2024-10-06  659  {
20503272422693d David Woodhouse  2024-10-06  660  	struct device *dev =3D &=
pdev->dev;
20503272422693d David Woodhouse  2024-10-06  661  	struct vmclock_state *st;
20503272422693d David Woodhouse  2024-10-06  662  	int ret;
20503272422693d David Woodhouse  2024-10-06  663 =20
20503272422693d David Woodhouse  2024-10-06  664  	st =3D devm_kzalloc(dev,=
 sizeof(*st), GFP_KERNEL);
20503272422693d David Woodhouse  2024-10-06  665  	if (!st)
20503272422693d David Woodhouse  2024-10-06  666  		return -ENOMEM;
20503272422693d David Woodhouse  2024-10-06  667 =20
ac1e7404924cb4a David Woodhouse  2026-01-30  668  #if IS_ENABLED(CONFIG_ACP=
I)
20503272422693d David Woodhouse  2024-10-06  669  	if (has_acpi_companion(d=
ev))
20503272422693d David Woodhouse  2024-10-06  670  		ret =3D vmclock_probe_a=
cpi(dev, st);
20503272422693d David Woodhouse  2024-10-06  671  	else
ac1e7404924cb4a David Woodhouse  2026-01-30  672  #endif
ddc867d0b5db6f6 David Woodhouse  2026-01-30  673  		ret =3D vmclock_probe_d=
t(dev, st);
20503272422693d David Woodhouse  2024-10-06  674 =20
20503272422693d David Woodhouse  2024-10-06  675  	if (ret) {
20503272422693d David Woodhouse  2024-10-06  676  		dev_info(dev, "Failed t=
o obtain physical address: %d\n", ret);
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  677  		return ret;
20503272422693d David Woodhouse  2024-10-06  678  	}
20503272422693d David Woodhouse  2024-10-06  679 =20
20503272422693d David Woodhouse  2024-10-06  680  	if (resource_size(&st->r=
es) < VMCLOCK_MIN_SIZE) {
20503272422693d David Woodhouse  2024-10-06 @681  		dev_info(dev, "Region t=
oo small (0x%llx)\n",
20503272422693d David Woodhouse  2024-10-06  682  			 resource_size(&st->re=
s));
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  683  		return -EINVAL;
20503272422693d David Woodhouse  2024-10-06  684  	}
20503272422693d David Woodhouse  2024-10-06  685  	st->clk =3D devm_memrema=
p(dev, st->res.start, resource_size(&st->res),
20503272422693d David Woodhouse  2024-10-06  686  				MEMREMAP_WB | MEMREMA=
P_DEC);
20503272422693d David Woodhouse  2024-10-06  687  	if (IS_ERR(st->clk)) {
20503272422693d David Woodhouse  2024-10-06  688  		ret =3D PTR_ERR(st->clk=
);
20503272422693d David Woodhouse  2024-10-06  689  		dev_info(dev, "failed t=
o map shared memory\n");
20503272422693d David Woodhouse  2024-10-06  690  		st->clk =3D NULL;
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  691  		return ret;
20503272422693d David Woodhouse  2024-10-06  692  	}
20503272422693d David Woodhouse  2024-10-06  693 =20
20503272422693d David Woodhouse  2024-10-06  694  	if (le32_to_cpu(st->clk-=
>magic) !=3D VMCLOCK_MAGIC ||
20503272422693d David Woodhouse  2024-10-06  695  	    le32_to_cpu(st->clk-=
>size) > resource_size(&st->res) ||
20503272422693d David Woodhouse  2024-10-06  696  	    le16_to_cpu(st->clk-=
>version) !=3D 1) {
20503272422693d David Woodhouse  2024-10-06  697  		dev_info(dev, "vmclock =
magic fields invalid\n");
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  698  		return -EINVAL;
20503272422693d David Woodhouse  2024-10-06  699  	}
20503272422693d David Woodhouse  2024-10-06  700 =20
20503272422693d David Woodhouse  2024-10-06  701  	ret =3D ida_alloc(&vmclo=
ck_ida, GFP_KERNEL);
20503272422693d David Woodhouse  2024-10-06  702  	if (ret < 0)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  703  		return ret;
20503272422693d David Woodhouse  2024-10-06  704 =20
20503272422693d David Woodhouse  2024-10-06  705  	st->index =3D ret;
20503272422693d David Woodhouse  2024-10-06  706  	ret =3D devm_add_action_=
or_reset(&pdev->dev, vmclock_put_idx, st);
20503272422693d David Woodhouse  2024-10-06  707  	if (ret)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  708  		return ret;
20503272422693d David Woodhouse  2024-10-06  709 =20
20503272422693d David Woodhouse  2024-10-06  710  	st->name =3D devm_kaspri=
ntf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  711  	if (!st->name)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  712  		return -ENOMEM;
20503272422693d David Woodhouse  2024-10-06  713 =20
39e926c3a21b25a Thomas Wei=C3=9Fschuh 2025-02-07  714  	st->miscdev.minor =
=3D MISC_DYNAMIC_MINOR;
39e926c3a21b25a Thomas Wei=C3=9Fschuh 2025-02-07  715 =20
3b1526ddb254523 Babis Chalios    2026-01-30  716  	init_waitqueue_head(&st-=
>disrupt_wait);
3b1526ddb254523 Babis Chalios    2026-01-30  717  	dev->driver_data =3D st;
3b1526ddb254523 Babis Chalios    2026-01-30  718 =20
3b1526ddb254523 Babis Chalios    2026-01-30  719  	ret =3D devm_add_action_=
or_reset(&pdev->dev, vmclock_remove, dev);
3b1526ddb254523 Babis Chalios    2026-01-30  720  	if (ret)
3b1526ddb254523 Babis Chalios    2026-01-30  721  		return ret;
3b1526ddb254523 Babis Chalios    2026-01-30  722 =20
3b1526ddb254523 Babis Chalios    2026-01-30  723  	ret =3D vmclock_setup_no=
tification(dev, st);
9a884c3800b207b Thomas Wei=C3=9Fschuh 2025-02-07  724  	if (ret)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  725  		return ret;
9a884c3800b207b Thomas Wei=C3=9Fschuh 2025-02-07  726 =20
20503272422693d David Woodhouse  2024-10-06  727  	/*
20503272422693d David Woodhouse  2024-10-06  728  	 * If the structure is b=
ig enough, it can be mapped to userspace.
20503272422693d David Woodhouse  2024-10-06  729  	 * Theoretically a guest=
 OS even using larger pages could still
20503272422693d David Woodhouse  2024-10-06  730  	 * use 4KiB PTEs to map =
smaller MMIO regions like this, but let's
20503272422693d David Woodhouse  2024-10-06  731  	 * cross that bridge if/=
when we come to it.
20503272422693d David Woodhouse  2024-10-06  732  	 */
20503272422693d David Woodhouse  2024-10-06  733  	if (le32_to_cpu(st->clk-=
>size) >=3D PAGE_SIZE) {
20503272422693d David Woodhouse  2024-10-06  734  		st->miscdev.fops =3D &v=
mclock_miscdev_fops;
20503272422693d David Woodhouse  2024-10-06  735  		st->miscdev.name =3D st=
->name;
20503272422693d David Woodhouse  2024-10-06  736 =20
20503272422693d David Woodhouse  2024-10-06  737  		ret =3D misc_register(&=
st->miscdev);
20503272422693d David Woodhouse  2024-10-06  738  		if (ret)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  739  			return ret;
20503272422693d David Woodhouse  2024-10-06  740  	}
20503272422693d David Woodhouse  2024-10-06  741 =20
20503272422693d David Woodhouse  2024-10-06  742  	/* If there is valid clo=
ck information, register a PTP clock */
20503272422693d David Woodhouse  2024-10-06  743  	if (VMCLOCK_FIELD_PRESEN=
T(st->clk, time_frac_sec)) {
20503272422693d David Woodhouse  2024-10-06  744  		/* Can return a silent =
NULL, or an error. */
20503272422693d David Woodhouse  2024-10-06  745  		st->ptp_clock =3D vmclo=
ck_ptp_register(dev, st);
20503272422693d David Woodhouse  2024-10-06  746  		if (IS_ERR(st->ptp_cloc=
k)) {
20503272422693d David Woodhouse  2024-10-06  747  			ret =3D PTR_ERR(st->pt=
p_clock);
20503272422693d David Woodhouse  2024-10-06  748  			st->ptp_clock =3D NULL;
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  749  			return ret;
20503272422693d David Woodhouse  2024-10-06  750  		}
20503272422693d David Woodhouse  2024-10-06  751  	}
20503272422693d David Woodhouse  2024-10-06  752 =20
20503272422693d David Woodhouse  2024-10-06  753  	if (!st->miscdev.minor &=
& !st->ptp_clock) {
20503272422693d David Woodhouse  2024-10-06  754  		/* Neither miscdev nor =
PTP registered */
20503272422693d David Woodhouse  2024-10-06  755  		dev_info(dev, "vmclock:=
 Neither miscdev nor PTP available; not registering\n");
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  756  		return -ENODEV;
20503272422693d David Woodhouse  2024-10-06  757  	}
20503272422693d David Woodhouse  2024-10-06  758 =20
20503272422693d David Woodhouse  2024-10-06  759  	dev_info(dev, "%s: regis=
tered %s%s%s\n", st->name,
20503272422693d David Woodhouse  2024-10-06  760  		 st->miscdev.minor ? "m=
iscdev" : "",
20503272422693d David Woodhouse  2024-10-06  761  		 (st->miscdev.minor && =
st->ptp_clock) ? ", " : "",
20503272422693d David Woodhouse  2024-10-06  762  		 st->ptp_clock ? "PTP" =
: "");
20503272422693d David Woodhouse  2024-10-06  763 =20
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  764  	return 0;
20503272422693d David Woodhouse  2024-10-06  765  }
20503272422693d David Woodhouse  2024-10-06  766 =20

:::::: The code at line 681 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AM=
ZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
