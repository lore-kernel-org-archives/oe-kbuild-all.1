Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029AF211A28
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775874418; cv=none; b=CEoK5M1ogysmjDS583h8omAXgsnCu0Th1W9G31s05U3NVTTjH+D+h14yaNgGdjQZHBhijB3HpUAoNWLFF6MjbMlsZvBuJfJahhmQw6AV3noAXMQEck5hbdheX8ZCARfL0feo+nqKtuc0SUwvhDgVi7OY5YinrbudI3HovXSdPxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775874418; c=relaxed/simple;
	bh=oMYMIFDzxiyoamr9kkOWiKpXetxz4HJuJhh1KHosLos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kNZLshtX/Cl/EdQ1QX3ALua6pnYWHRgWzphbhMfQ4QcfNnkkU/e3fsCOaY/UmateC0nPXxyqcJwQfWlv/RS/W9mh1Xih2PCSNZtWhVhySD/gG0bqIkbla8Ij/1mJCJ1yas7pSb8Knw4AgxqKFFg0IrisHuNuIk3wHmsuzeKY1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBopKFeV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBopKFeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775874416; x=1807410416;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oMYMIFDzxiyoamr9kkOWiKpXetxz4HJuJhh1KHosLos=;
  b=LBopKFeVnhLB8RTTVKMbtEZGQWzkOmwgl4iqfMJR8ENnndR7Ab0AaMwj
   HGd3L/CyshZjisE3upc7gJqnfgQVcQpueEizc+PwXpnWDq6ppbmu2YfTa
   jSgCQwiwbcb7uH5PF4lgnAdt85YDP3rua+nXq8SPLuOL9mb+clei+c1XH
   utYgnJC/MmcNRgIBKkj98zLCXh0yzXFRJ/yeDScRt6vIQG0Zu9CSoMEj/
   eOYg556NuzHyql0kFpTo3/A9Q0SHBRx5H4Plo2EGtCtp45CTbRXBrjrYa
   eEmfOCnkwsn9x2TcMrraj+V6l7Fwq2fW4GklrIA/oqe19YLaC15E1v2ew
   A==;
X-CSE-ConnectionGUID: iHj0AxpnRKOcu+OpsIxcAg==
X-CSE-MsgGUID: vuNYpOuwRbCsVsgOgCVZPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102354508"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="102354508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:26:55 -0700
X-CSE-ConnectionGUID: a8gndIEyStSzmncmNponXQ==
X-CSE-MsgGUID: ffLqPeP8RkyWml0DXWIaFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="228228198"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Apr 2026 19:26:54 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBO3f-000000000dv-1bNP;
	Sat, 11 Apr 2026 02:26:51 +0000
Date: Sat, 11 Apr 2026 10:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 15/38]
 drivers/ptp/ptp_vmclock.c:686:31: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka
 'unsigned int'}
Message-ID: <202604111048.g4mwZLIH-lkp@intel.com>
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
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: 7fb0a26394a1f8378dcf335ea5ad47d32621e080 [15/38] ptp: ptp_vmclock: =
Replace get_cycles() usage
config: i386-randconfig-017-20260411 (https://download.01.org/0day-ci/archi=
ve/20260411/202604111048.g4mwZLIH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604111048.g4mwZLIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111048.g4mwZLIH-lkp@i=
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
>> drivers/ptp/ptp_vmclock.c:686:31: warning: format '%llx' expects argumen=
t of type 'long long unsigned int', but argument 3 has type 'resource_size_=
t' {aka 'unsigned int'} [-Wformat=3D]
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
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
   drivers/ptp/ptp_vmclock.c:686:17: note: in expansion of macro 'dev_info'
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                 ^~~~~~~~
   drivers/ptp/ptp_vmclock.c:686:55: note: format string is defined here
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                                                    ~~~^
         |                                                       |
         |                                                       long long =
unsigned int
         |                                                    %x


vim +686 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse  2024-10-06  662 =20
20503272422693 David Woodhouse  2024-10-06  663  static int vmclock_probe(s=
truct platform_device *pdev)
20503272422693 David Woodhouse  2024-10-06  664  {
20503272422693 David Woodhouse  2024-10-06  665  	struct device *dev =3D &p=
dev->dev;
20503272422693 David Woodhouse  2024-10-06  666  	struct vmclock_state *st;
20503272422693 David Woodhouse  2024-10-06  667  	int ret;
20503272422693 David Woodhouse  2024-10-06  668 =20
20503272422693 David Woodhouse  2024-10-06  669  	st =3D devm_kzalloc(dev, =
sizeof(*st), GFP_KERNEL);
20503272422693 David Woodhouse  2024-10-06  670  	if (!st)
20503272422693 David Woodhouse  2024-10-06  671  		return -ENOMEM;
20503272422693 David Woodhouse  2024-10-06  672 =20
ac1e7404924cb4 David Woodhouse  2026-01-30  673  #if IS_ENABLED(CONFIG_ACPI)
20503272422693 David Woodhouse  2024-10-06  674  	if (has_acpi_companion(de=
v))
20503272422693 David Woodhouse  2024-10-06  675  		ret =3D vmclock_probe_ac=
pi(dev, st);
20503272422693 David Woodhouse  2024-10-06  676  	else
ac1e7404924cb4 David Woodhouse  2026-01-30  677  #endif
ddc867d0b5db6f David Woodhouse  2026-01-30  678  		ret =3D vmclock_probe_dt=
(dev, st);
20503272422693 David Woodhouse  2024-10-06  679 =20
20503272422693 David Woodhouse  2024-10-06  680  	if (ret) {
20503272422693 David Woodhouse  2024-10-06  681  		dev_info(dev, "Failed to=
 obtain physical address: %d\n", ret);
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  682  		return ret;
20503272422693 David Woodhouse  2024-10-06  683  	}
20503272422693 David Woodhouse  2024-10-06  684 =20
20503272422693 David Woodhouse  2024-10-06  685  	if (resource_size(&st->re=
s) < VMCLOCK_MIN_SIZE) {
20503272422693 David Woodhouse  2024-10-06 @686  		dev_info(dev, "Region to=
o small (0x%llx)\n",
20503272422693 David Woodhouse  2024-10-06  687  			 resource_size(&st->res=
));
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  688  		return -EINVAL;
20503272422693 David Woodhouse  2024-10-06  689  	}
20503272422693 David Woodhouse  2024-10-06  690  	st->clk =3D devm_memremap=
(dev, st->res.start, resource_size(&st->res),
20503272422693 David Woodhouse  2024-10-06  691  				MEMREMAP_WB | MEMREMAP=
_DEC);
20503272422693 David Woodhouse  2024-10-06  692  	if (IS_ERR(st->clk)) {
20503272422693 David Woodhouse  2024-10-06  693  		ret =3D PTR_ERR(st->clk);
20503272422693 David Woodhouse  2024-10-06  694  		dev_info(dev, "failed to=
 map shared memory\n");
20503272422693 David Woodhouse  2024-10-06  695  		st->clk =3D NULL;
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  696  		return ret;
20503272422693 David Woodhouse  2024-10-06  697  	}
20503272422693 David Woodhouse  2024-10-06  698 =20
20503272422693 David Woodhouse  2024-10-06  699  	if (le32_to_cpu(st->clk->=
magic) !=3D VMCLOCK_MAGIC ||
20503272422693 David Woodhouse  2024-10-06  700  	    le32_to_cpu(st->clk->=
size) > resource_size(&st->res) ||
20503272422693 David Woodhouse  2024-10-06  701  	    le16_to_cpu(st->clk->=
version) !=3D 1) {
20503272422693 David Woodhouse  2024-10-06  702  		dev_info(dev, "vmclock m=
agic fields invalid\n");
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  703  		return -EINVAL;
20503272422693 David Woodhouse  2024-10-06  704  	}
20503272422693 David Woodhouse  2024-10-06  705 =20
20503272422693 David Woodhouse  2024-10-06  706  	ret =3D ida_alloc(&vmcloc=
k_ida, GFP_KERNEL);
20503272422693 David Woodhouse  2024-10-06  707  	if (ret < 0)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  708  		return ret;
20503272422693 David Woodhouse  2024-10-06  709 =20
20503272422693 David Woodhouse  2024-10-06  710  	st->index =3D ret;
20503272422693 David Woodhouse  2024-10-06  711  	ret =3D devm_add_action_o=
r_reset(&pdev->dev, vmclock_put_idx, st);
20503272422693 David Woodhouse  2024-10-06  712  	if (ret)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  713  		return ret;
20503272422693 David Woodhouse  2024-10-06  714 =20
20503272422693 David Woodhouse  2024-10-06  715  	st->name =3D devm_kasprin=
tf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  716  	if (!st->name)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  717  		return -ENOMEM;
20503272422693 David Woodhouse  2024-10-06  718 =20
39e926c3a21b25 Thomas Wei=C3=9Fschuh 2025-02-07  719  	st->miscdev.minor =
=3D MISC_DYNAMIC_MINOR;
39e926c3a21b25 Thomas Wei=C3=9Fschuh 2025-02-07  720 =20
3b1526ddb25452 Babis Chalios    2026-01-30  721  	init_waitqueue_head(&st->=
disrupt_wait);
3b1526ddb25452 Babis Chalios    2026-01-30  722  	dev->driver_data =3D st;
3b1526ddb25452 Babis Chalios    2026-01-30  723 =20
3b1526ddb25452 Babis Chalios    2026-01-30  724  	ret =3D devm_add_action_o=
r_reset(&pdev->dev, vmclock_remove, dev);
3b1526ddb25452 Babis Chalios    2026-01-30  725  	if (ret)
3b1526ddb25452 Babis Chalios    2026-01-30  726  		return ret;
3b1526ddb25452 Babis Chalios    2026-01-30  727 =20
3b1526ddb25452 Babis Chalios    2026-01-30  728  	ret =3D vmclock_setup_not=
ification(dev, st);
9a884c3800b207 Thomas Wei=C3=9Fschuh 2025-02-07  729  	if (ret)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  730  		return ret;
9a884c3800b207 Thomas Wei=C3=9Fschuh 2025-02-07  731 =20
20503272422693 David Woodhouse  2024-10-06  732  	/*
20503272422693 David Woodhouse  2024-10-06  733  	 * If the structure is bi=
g enough, it can be mapped to userspace.
20503272422693 David Woodhouse  2024-10-06  734  	 * Theoretically a guest =
OS even using larger pages could still
20503272422693 David Woodhouse  2024-10-06  735  	 * use 4KiB PTEs to map s=
maller MMIO regions like this, but let's
20503272422693 David Woodhouse  2024-10-06  736  	 * cross that bridge if/w=
hen we come to it.
20503272422693 David Woodhouse  2024-10-06  737  	 */
20503272422693 David Woodhouse  2024-10-06  738  	if (le32_to_cpu(st->clk->=
size) >=3D PAGE_SIZE) {
20503272422693 David Woodhouse  2024-10-06  739  		st->miscdev.fops =3D &vm=
clock_miscdev_fops;
20503272422693 David Woodhouse  2024-10-06  740  		st->miscdev.name =3D st-=
>name;
20503272422693 David Woodhouse  2024-10-06  741 =20
20503272422693 David Woodhouse  2024-10-06  742  		ret =3D misc_register(&s=
t->miscdev);
20503272422693 David Woodhouse  2024-10-06  743  		if (ret)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  744  			return ret;
20503272422693 David Woodhouse  2024-10-06  745  	}
20503272422693 David Woodhouse  2024-10-06  746 =20
20503272422693 David Woodhouse  2024-10-06  747  	/* If there is valid cloc=
k information, register a PTP clock */
20503272422693 David Woodhouse  2024-10-06  748  	if (VMCLOCK_FIELD_PRESENT=
(st->clk, time_frac_sec)) {
20503272422693 David Woodhouse  2024-10-06  749  		/* Can return a silent N=
ULL, or an error. */
20503272422693 David Woodhouse  2024-10-06  750  		st->ptp_clock =3D vmcloc=
k_ptp_register(dev, st);
20503272422693 David Woodhouse  2024-10-06  751  		if (IS_ERR(st->ptp_clock=
)) {
20503272422693 David Woodhouse  2024-10-06  752  			ret =3D PTR_ERR(st->ptp=
_clock);
20503272422693 David Woodhouse  2024-10-06  753  			st->ptp_clock =3D NULL;
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  754  			return ret;
20503272422693 David Woodhouse  2024-10-06  755  		}
20503272422693 David Woodhouse  2024-10-06  756  	}
20503272422693 David Woodhouse  2024-10-06  757 =20
20503272422693 David Woodhouse  2024-10-06  758  	if (!st->miscdev.minor &&=
 !st->ptp_clock) {
20503272422693 David Woodhouse  2024-10-06  759  		/* Neither miscdev nor P=
TP registered */
20503272422693 David Woodhouse  2024-10-06  760  		dev_info(dev, "vmclock: =
Neither miscdev nor PTP available; not registering\n");
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  761  		return -ENODEV;
20503272422693 David Woodhouse  2024-10-06  762  	}
20503272422693 David Woodhouse  2024-10-06  763 =20
20503272422693 David Woodhouse  2024-10-06  764  	dev_info(dev, "%s: regist=
ered %s%s%s\n", st->name,
20503272422693 David Woodhouse  2024-10-06  765  		 st->miscdev.minor ? "mi=
scdev" : "",
20503272422693 David Woodhouse  2024-10-06  766  		 (st->miscdev.minor && s=
t->ptp_clock) ? ", " : "",
20503272422693 David Woodhouse  2024-10-06  767  		 st->ptp_clock ? "PTP" :=
 "");
20503272422693 David Woodhouse  2024-10-06  768 =20
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  769  	return 0;
20503272422693 David Woodhouse  2024-10-06  770  }
20503272422693 David Woodhouse  2024-10-06  771 =20

:::::: The code at line 686 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AM=
ZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
