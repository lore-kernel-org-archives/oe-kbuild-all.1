Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AD11F92F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718167530; cv=none; b=fpWGrIj0YiGxCMYPt24kdzzrTUQwe7KkyRsAWCZXv9/nkFK1qS+isWNlNXzoO5Q1+52Jiv8Irb9CIdcv8K1/Do9PlVL/15+OhArRONKRmuZhoa+GJpxwszkUubKHF5YyBOyF7Bzs/iubjQqCBoP7u1q79t3nj6Da0P3Enoj5Tt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718167530; c=relaxed/simple;
	bh=fIWkR2ZmOwjgFtVbgxOZ55/HMFYP0TNxWp/nT0reirc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xo2g9vTUGew/UnqevDF8koVITGM+W3iW1+Xu/hDsxgHobcvCR0Bn79w7NnJ57dpz86GV7Xo58DYJK5Afml+Lg9f9msMu9eMOs43OcyexMYh3IpWOXl6ccmgzSQFJWDR3eRD+QSAw6cG7f/KW3mkki9oAOMHq4ps07OnPzCpUmSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IY7GWdzv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IY7GWdzv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718167529; x=1749703529;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fIWkR2ZmOwjgFtVbgxOZ55/HMFYP0TNxWp/nT0reirc=;
  b=IY7GWdzvqvDbBB73TlKw/cdaA35MT/myoJPU6uJTcxiJxlqrFNWMWHEw
   kfgx++O0Q4FoMyKkNcZCP3LX+rLu/MJt0n2nF0NgwdFKofAgN8eyIaUWS
   v8UBNdmPB7QvqdU5omnquAchX0HTSDwYswIPtFsWh8XM+VCKl1paTXnHl
   sJLOeiXiAYCWG+Y5p4DwuMpi83UMgsPUMEdkVT7QRp9QCm1+g5dlvNfLe
   5hT2eghbIK6rpinZ90pu0IVFlvfTIyG0MRRKpzbhYrizBnOtJ4A+xQd/h
   pYK4U7lIUKiAlWa6WWtJrldWV74R+HLnGkEWI/9w08FZY3/iy5JHAGrFz
   w==;
X-CSE-ConnectionGUID: zWeI8T5aQB+5YYnNCc6JJw==
X-CSE-MsgGUID: LklM+d7EQkacgc5MPGFi9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15038589"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="15038589"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 21:45:29 -0700
X-CSE-ConnectionGUID: 9wvbv4A0QeKE1VUY7yQAaw==
X-CSE-MsgGUID: omnZzJRWQp+WZUn03SRYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="39767223"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2024 21:45:27 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHFrR-0001DB-0P;
	Wed, 12 Jun 2024 04:45:25 +0000
Date: Wed, 12 Jun 2024 12:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 4394/4860]
 drivers/pinctrl/pinctrl-keembay.c:1630:35: error: 'struct function_desc' has
 no member named 'name'
Message-ID: <202406121201.YnEA7WOO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a957267fa7e9159d3d2ee1421359ebf228570c68
commit: 15d34374182a52bcd72c5f4ba7105aed1b0b4558 [4394/4860] pinctrl: pinmux: Remove unused members from struct function_desc
config: arm64-randconfig-001-20240612 (https://download.01.org/0day-ci/archive/20240612/202406121201.YnEA7WOO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121201.YnEA7WOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121201.YnEA7WOO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinctrl-keembay.c: In function 'keembay_build_functions':
>> drivers/pinctrl/pinctrl-keembay.c:1630:35: error: 'struct function_desc' has no member named 'name'
    1630 |                         if (!fdesc->name) {
         |                                   ^~


vim +1630 drivers/pinctrl/pinctrl-keembay.c

ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1598  
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1599  static int keembay_build_functions(struct keembay_pinctrl *kpc)
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1600  {
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1601  	struct function_desc *keembay_funcs, *new_funcs;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1602  	int i;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1603  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1604  	/*
5d0674999cc5ca Rafał Miłecki      2021-12-16  1605  	 * Allocate maximum possible number of functions. Assume every pin
5d0674999cc5ca Rafał Miłecki      2021-12-16  1606  	 * being part of 8 (hw maximum) globally unique muxes.
5d0674999cc5ca Rafał Miłecki      2021-12-16  1607  	 */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1608  	kpc->nfuncs = 0;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1609  	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1610  	if (!keembay_funcs)
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1611  		return -ENOMEM;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1612  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1613  	/* Setup 1 function for each unique mux */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1614  	for (i = 0; i < kpc->npins; i++) {
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1615  		const struct pinctrl_pin_desc *pdesc = keembay_pins + i;
5d0674999cc5ca Rafał Miłecki      2021-12-16  1616  		struct keembay_mux_desc *mux;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1617  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1618  		for (mux = pdesc->drv_data; mux->name; mux++) {
5d0674999cc5ca Rafał Miłecki      2021-12-16  1619  			struct function_desc *fdesc;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1620  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1621  			/* Check if we already have function for this mux */
73ee52205e5a06 Andy Shevchenko    2024-05-30  1622  			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
73ee52205e5a06 Andy Shevchenko    2024-05-30  1623  				if (!strcmp(mux->name, fdesc->func.name)) {
73ee52205e5a06 Andy Shevchenko    2024-05-30  1624  					fdesc->func.ngroups++;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1625  					break;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1626  				}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1627  			}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1628  
5d0674999cc5ca Rafał Miłecki      2021-12-16  1629  			/* Setup new function for this mux we didn't see before */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06 @1630  			if (!fdesc->name) {
73ee52205e5a06 Andy Shevchenko    2024-05-30  1631  				fdesc->func.name = mux->name;
73ee52205e5a06 Andy Shevchenko    2024-05-30  1632  				fdesc->func.ngroups = 1;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1633  				fdesc->data = &mux->mode;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1634  				kpc->nfuncs++;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1635  			}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1636  		}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1637  	}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1638  
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1639  	/* Reallocate memory based on actual number of functions */
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1640  	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1641  	if (!new_funcs) {
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1642  		kfree(keembay_funcs);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1643  		return -ENOMEM;
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1644  	}
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1645  
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1646  	return keembay_add_functions(kpc, new_funcs);
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1647  }
ffd4e739358be0 Lakshmi Sowjanya D 2021-08-06  1648  

:::::: The code at line 1630 was first introduced by commit
:::::: ffd4e739358be036377563a0c6c33702c700e3ee pinctrl: Add Intel Keem Bay pinctrl driver

:::::: TO: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
