Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8722D876F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774172373; cv=none; b=I4/0xshKSiqx/YZi2+G6yTEO6KvgVHg1ji/166TPNRIkAdcP+TQ5jAuVN/48CgyNGJwd9ItsGtkzLwyuyvSfviGtRbHlxdQOSk8bFknpsY450S+x/gpKRvWYHJozHGtGg89We7mPUwgPiAOBYjKIr4gknP0xYWS36+gUWXUiqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774172373; c=relaxed/simple;
	bh=EduUzvFTbh1kuh39yJ7EZF6XYgFw0DtipOITRQazxSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JMy7fj0wh3rb5y7Js8i+q0CAWCuw9TxZjr/PYDqR0WZU+wEPyhcgLehTwJZKRjlF43paHOpDWGD9F7FOm40aJFdqXoHp2Fstj8A5g7x8o96ACC9acuvF/rX+BQTy9jSWlSRJ4CtvVh5L5zdb4Ikps4G0t54dczrIqjx5W97ZtM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0VP1tWO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0VP1tWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774172373; x=1805708373;
  h=date:from:to:cc:subject:message-id;
  bh=EduUzvFTbh1kuh39yJ7EZF6XYgFw0DtipOITRQazxSE=;
  b=B0VP1tWOohnMUcNM2y/mH8wCkhd2/1oGrUg/bfYPkadDQlbOISV9qrlD
   p0XXj/Ql+Onc0PqTpNVEcgHPLE2Rl6KfVgw4VoW3pwfLk/krGPpq7p7Sq
   sQdn/etG7FWN+CIpgvCq7hOTLK5/p6v+kvlc2ZzPat8hGyE8qmfDXJoPD
   lAgkDNFtsdpNvaMCNuDmsN28Ok2pxNuzQvdL8cjIEAzQeR/Hqch+LuuNG
   DynR8huRoOlMJRsWwi9Fqzf+69j89+OxOB0bQBRqVqMS6pdExJeKZkwgg
   ie0e6NsEfH4Yh+euEnzwi3adEsim++V6RckWw3jhhJvqBlKwpbJqxVF5Q
   Q==;
X-CSE-ConnectionGUID: bnWzE/26TLaoME4HqO5hzQ==
X-CSE-MsgGUID: jTfqFvicQZuCFu4F8y3rgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="85826458"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="85826458"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 02:39:32 -0700
X-CSE-ConnectionGUID: 0t34MI1OS/G0vcHSz/p7oQ==
X-CSE-MsgGUID: sEDM64U+QKeJzbxH5pSOLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="246764264"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2026 02:39:30 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4FHL-000000001xF-3lhI;
	Sun, 22 Mar 2026 09:39:27 +0000
Date: Sun, 22 Mar 2026 17:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dakr:driver_override 6/7]
 drivers/xen/xen-pciback/pci_stub.c:613:43: error: 'xen_pcibk_pci_driver'
 undeclared
Message-ID: <202603221746.EoLj0OLb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git driver_override
head:   70493c3cad283a8341ce791812cd203db3b472ce
commit: 7144511c6614967b4c16b716a9674b12c4e7f2b9 [6/7] WIP: treewide: make callsites use generic driver_override
config: x86_64-randconfig-011-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221746.EoLj0OLb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221746.EoLj0OLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221746.EoLj0OLb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/xen/xen-pciback/pci_stub.c: In function 'pcistub_probe':
>> drivers/xen/xen-pciback/pci_stub.c:613:43: error: 'xen_pcibk_pci_driver' undeclared (first use in this function)
     613 |                                          &xen_pcibk_pci_driver.driver) > 0 ||
         |                                           ^~~~~~~~~~~~~~~~~~~~
   drivers/xen/xen-pciback/pci_stub.c:613:43: note: each undeclared identifier is reported only once for each function it appears in


vim +/xen_pcibk_pci_driver +613 drivers/xen/xen-pciback/pci_stub.c

   600	
   601	/* Called when 'bind'. This means we must _NOT_ call pci_reset_function or
   602	 * other functions that take the sysfs lock. */
   603	static int pcistub_probe(struct pci_dev *dev, const struct pci_device_id *id)
   604	{
   605		int err = 0, match;
   606		struct pcistub_device_id *pci_dev_id = NULL;
   607	
   608		dev_dbg(&dev->dev, "probing...\n");
   609	
   610		match = pcistub_match(dev);
   611	
   612		if (device_match_driver_override(&dev->dev,
 > 613						 &xen_pcibk_pci_driver.driver) > 0 ||
   614		    match) {
   615	
   616			if (dev->hdr_type != PCI_HEADER_TYPE_NORMAL
   617			    && dev->hdr_type != PCI_HEADER_TYPE_BRIDGE) {
   618				dev_err(&dev->dev, "can't export pci devices that "
   619					"don't have a normal (0) or bridge (1) "
   620					"header type!\n");
   621				err = -ENODEV;
   622				goto out;
   623			}
   624	
   625			if (!match) {
   626				pci_dev_id = kmalloc_obj(*pci_dev_id);
   627				if (!pci_dev_id) {
   628					err = -ENOMEM;
   629					goto out;
   630				}
   631			}
   632	
   633			dev_info(&dev->dev, "seizing device\n");
   634			err = pcistub_seize(dev, pci_dev_id);
   635		} else
   636			/* Didn't find the device */
   637			err = -ENODEV;
   638	
   639	out:
   640		return err;
   641	}
   642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
