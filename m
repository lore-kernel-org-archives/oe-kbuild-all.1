Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68C13F43A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728494233; cv=none; b=FIyLL0Bj6rdRuOTEH7nqhMj9ZyEp9zeIxoZS3FphzVPLOCWYYIb8iQ3GcxB2qZDBS95aak2qbX2FBDwwtsMa5EiAkcn1nIJIjr6xl0HpGCTCzsadpPCbCbzuSl+1NMQG8Vx01kYgZrONjt7gBFrjLvq+tsZWUVp+en5j0ZEHWek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728494233; c=relaxed/simple;
	bh=KOce7ck5T3NHtA/qac2TqX6LPEC5ZXKJIPZiwR1Sreg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVLp5U+zbuWP1Zc9GJTaKs0gxKHHJ62Qd9O2RACvRVqPpD6624xHiN0H2exP6rJ/hsIFTXR87buVnRWutE9bT6mGSBqttziZTNJonp7N4FiEu6z3QPE7yPjMTmMLZBY+4l/3EYg1tm4Qjj84OhNjMoRKIE6dczZ93OXykb+UA7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsBg6FIS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsBg6FIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728494231; x=1760030231;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KOce7ck5T3NHtA/qac2TqX6LPEC5ZXKJIPZiwR1Sreg=;
  b=AsBg6FISwlgMZP3+0IHgFJrMfEK+GZR27/R1BqXG1gH/CiXgaTZAeUEn
   G3OUobppvGqdg5z0SsGHBcqAj/+mMmJqaWcNurJIp4C1ag6RCSsI0Wc5g
   kHYKTPZb1NznrueZTi4PS4Xlj6TzWuZl9luoRN5mVAXrZC7McCRpLBouy
   F+KpRLh4WcAgt4w4NYzVKQKyjmjMzU7Y8/iImKBgT8/jm0/Nj36O/MWUL
   S1exwCsw2W/53zVWazn28plULgrAPrWqxFJkNEKBC6/e3VYZ1jky4cMDy
   w77HvNy63ZAqhKo/MGc+OIVqOAa287TMtI0R7uIDbnnIWWqG3VbQKPKZs
   Q==;
X-CSE-ConnectionGUID: A5tYsb+AQf6OnPoCyjCkkA==
X-CSE-MsgGUID: WeZpwR26SfWbwDTOtUsZOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="15430651"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="15430651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 10:17:11 -0700
X-CSE-ConnectionGUID: hVa1trU3QyeRSOkXNu9WuA==
X-CSE-MsgGUID: ywFl+FTmS/2MSblgJQTh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; 
   d="scan'208";a="99650494"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2024 10:17:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syaJ9-0009Xy-1j;
	Wed, 09 Oct 2024 17:17:07 +0000
Date: Thu, 10 Oct 2024 01:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/const 1/7] drivers/of/address.c:244:46: sparse: sparse:
 incorrect type in argument 1 (different modifiers)
Message-ID: <202410100144.ew576shS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/const
head:   0c30153b6de7566ccbcf7c5c8857d33bc7fd3f29
commit: e54d6b14c85698083dc77dabcd7eb82cd5e30303 [1/7] of: Constify struct device_node
config: arc-randconfig-r131-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100144.ew576shS-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241010/202410100144.ew576shS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100144.ew576shS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/of/address.c:244:46: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct fwnode_handle *fwnode @@     got struct fwnode_handle const * @@
   drivers/of/address.c:244:46: sparse:     expected struct fwnode_handle *fwnode
   drivers/of/address.c:244:46: sparse:     got struct fwnode_handle const *

vim +244 drivers/of/address.c

1a52a094c2f082 Thomas Weißschuh     2024-09-06  217  
0b0b0893d49b34 Liviu Dudau          2014-09-29  218  /*
0b0b0893d49b34 Liviu Dudau          2014-09-29  219   * of_pci_range_to_resource - Create a resource from an of_pci_range
0b0b0893d49b34 Liviu Dudau          2014-09-29  220   * @range:	the PCI range that describes the resource
0b0b0893d49b34 Liviu Dudau          2014-09-29  221   * @np:		device node where the range belongs to
0b0b0893d49b34 Liviu Dudau          2014-09-29  222   * @res:	pointer to a valid resource that will be updated to
0b0b0893d49b34 Liviu Dudau          2014-09-29  223   *              reflect the values contained in the range.
0b0b0893d49b34 Liviu Dudau          2014-09-29  224   *
65b6b046e2b4ce Geert Uytterhoeven   2023-03-31  225   * Returns -EINVAL if the range cannot be converted to resource.
0b0b0893d49b34 Liviu Dudau          2014-09-29  226   *
0b0b0893d49b34 Liviu Dudau          2014-09-29  227   * Note that if the range is an IO range, the resource will be converted
0b0b0893d49b34 Liviu Dudau          2014-09-29  228   * using pci_address_to_pio() which can fail if it is called too early or
0b0b0893d49b34 Liviu Dudau          2014-09-29  229   * if the range cannot be matched to any host bridge IO space (our case here).
0b0b0893d49b34 Liviu Dudau          2014-09-29  230   * To guard against that we try to register the IO range first.
0b0b0893d49b34 Liviu Dudau          2014-09-29  231   * If that fails we know that pci_address_to_pio() will do too.
0b0b0893d49b34 Liviu Dudau          2014-09-29  232   */
e54d6b14c85698 Rob Herring (Arm     2024-05-31  233) int of_pci_range_to_resource(const struct of_pci_range *range,
e54d6b14c85698 Rob Herring (Arm     2024-05-31  234) 			     const struct device_node *np, struct resource *res)
83bbde1cc0ec9d Liviu Dudau          2014-09-29  235  {
1a52a094c2f082 Thomas Weißschuh     2024-09-06  236  	u64 start;
0b0b0893d49b34 Liviu Dudau          2014-09-29  237  	int err;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  238  	res->flags = range->flags;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  239  	res->parent = res->child = res->sibling = NULL;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  240  	res->name = np->full_name;
0b0b0893d49b34 Liviu Dudau          2014-09-29  241  
0b0b0893d49b34 Liviu Dudau          2014-09-29  242  	if (res->flags & IORESOURCE_IO) {
0b0b0893d49b34 Liviu Dudau          2014-09-29  243  		unsigned long port;
fcfaab30933bd1 Gabriele Paoloni     2018-03-15 @244  		err = pci_register_io_range(&np->fwnode, range->cpu_addr,
fcfaab30933bd1 Gabriele Paoloni     2018-03-15  245  				range->size);
0b0b0893d49b34 Liviu Dudau          2014-09-29  246  		if (err)
0b0b0893d49b34 Liviu Dudau          2014-09-29  247  			goto invalid_range;
0b0b0893d49b34 Liviu Dudau          2014-09-29  248  		port = pci_address_to_pio(range->cpu_addr);
0b0b0893d49b34 Liviu Dudau          2014-09-29  249  		if (port == (unsigned long)-1) {
0b0b0893d49b34 Liviu Dudau          2014-09-29  250  			err = -EINVAL;
0b0b0893d49b34 Liviu Dudau          2014-09-29  251  			goto invalid_range;
0b0b0893d49b34 Liviu Dudau          2014-09-29  252  		}
1a52a094c2f082 Thomas Weißschuh     2024-09-06  253  		start = port;
0b0b0893d49b34 Liviu Dudau          2014-09-29  254  	} else {
1a52a094c2f082 Thomas Weißschuh     2024-09-06  255  		start = range->cpu_addr;
4af971064977b0 Pavel Fedin          2015-10-08  256  	}
1a52a094c2f082 Thomas Weißschuh     2024-09-06  257  	return __of_address_resource_bounds(res, start, range->size);
0b0b0893d49b34 Liviu Dudau          2014-09-29  258  
0b0b0893d49b34 Liviu Dudau          2014-09-29  259  invalid_range:
0b0b0893d49b34 Liviu Dudau          2014-09-29  260  	res->start = (resource_size_t)OF_BAD_ADDR;
0b0b0893d49b34 Liviu Dudau          2014-09-29  261  	res->end = (resource_size_t)OF_BAD_ADDR;
0b0b0893d49b34 Liviu Dudau          2014-09-29  262  	return err;
83bbde1cc0ec9d Liviu Dudau          2014-09-29  263  }
bf6681ea533538 Manikanta Maddireddy 2018-01-11  264  EXPORT_SYMBOL(of_pci_range_to_resource);
dbbdee94734bf6 Grant Likely         2010-06-08  265  

:::::: The code at line 244 was first introduced by commit
:::::: fcfaab30933bd151bd8cb4dd07b3f11d885bb611 PCI: Add fwnode handler as input param of pci_register_io_range()

:::::: TO: Gabriele Paoloni <gabriele.paoloni@huawei.com>
:::::: CC: Bjorn Helgaas <helgaas@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
