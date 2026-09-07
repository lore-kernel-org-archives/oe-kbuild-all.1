Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D19503BD7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794935; cv=none; b=n8volTdvVYM+oXOFxJbKXmxobCcpRyf6MCdhNS54BsNWFRLJM41zyjTyHL4PPTlaF1L/3ZrxY7B+v26Z7QFEt4v9aU+ASUfOK9OEa+YGQco8gy+1zLYWAITuvF4uL5qC3H2c0qylLK6A87dB61gSEjtd4Dd2ejXcCYLaZ44o1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794935; c=relaxed/simple;
	bh=PriUNwB8Hnlvjo6cBhIF2HL7MvJBmrrC6dNUZu6HP3A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aUZUkJkJtnq36IowQ2cGUobagObQ7n1wy66vQAsSc/Cwa9SUmVP4tsLFGFzQVVbkYrM/CiO5MOCePfSvC/88eUzUTu0sRem0fwyHJE0ZQRqA2/rOReyIEpoUsR8uSGqriA99S8PZ+S2THnAMNI/ts7fzoVf+p/lgI/6waaxZfU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJJEobtq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJJEobtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788794932; x=1820330932;
  h=date:from:to:cc:subject:message-id;
  bh=PriUNwB8Hnlvjo6cBhIF2HL7MvJBmrrC6dNUZu6HP3A=;
  b=fJJEobtqRW2RvsXzdE1+HR/cUaO9Qx/v6B1oTa7ty/m5OurnxGLofFbw
   XlfYLaF7osOV+ld6i5vldFzmfTAzAYgk3FgXpnc4uNdb71ErjJWdYo5Jf
   cQVTejzGteAB1dE/QJq+Ynr61F52bPrGrXc+8s6GTCD0nlIVD4ISXDltQ
   8XoHPbRAgoDSDnjeqXS6MVwn6aXP4eL5Wy6RTNMLgfP6rRMBT6xIB8ZqH
   NfmAf6KsSCRN2CS3NdhUP2Y3KCfhaal6CrfOu0QKPrbA8q3wyMOgeFwTb
   JsBfODgLM+DmM9igqaRCDCgEIbUOxAy27dfHg/HijiG1hxvFlmSVEVOGv
   Q==;
X-CSE-ConnectionGUID: iGzQwR1fSneOBBJL3SJoTA==
X-CSE-MsgGUID: cmw4j8kdQViLyweNlCoeTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88134105"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88134105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 08:28:51 -0700
X-CSE-ConnectionGUID: 7LpRqwlIQ8e6h7i/wnsYhw==
X-CSE-MsgGUID: AQQ0CC5vSZqYDDVAlq00Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="269021959"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2026 08:28:50 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3bH5-0000000010F-25y3;
	Mon, 07 Sep 2026 15:28:47 +0000
Date: Mon, 07 Sep 2026 23:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/acpi-static-table-gsi-deferral 4/6]
 drivers/acpi/property.c:1798:undefined reference to `acpi_get_gsi_dispatcher'
Message-ID: <202609072304.S6LYbARW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/acpi-static-table-gsi-deferral
head:   1d08fa15e38840796959db081e78ac188d2c882c
commit: 34e97e764f2788632c0b67499f639855e19d82d2 [4/6] acpi static fwnode irq_get/add_links
config: x86_64-randconfig-122-20260907 (https://download.01.org/0day-ci/archive/20260907/202609072304.S6LYbARW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609072304.S6LYbARW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072304.S6LYbARW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `acpi_static_fwnode_add_irq_links':
>> drivers/acpi/property.c:1798:(.text+0xf4fc67): undefined reference to `acpi_get_gsi_dispatcher'


vim +1798 drivers/acpi/property.c

  1795	
  1796	static int acpi_static_fwnode_add_irq_links(struct fwnode_handle *fwnode)
  1797	{
> 1798		acpi_gsi_domain_disp_fn dispatch = acpi_get_gsi_dispatcher();
  1799		int ret, count;
  1800		u32 gsi;
  1801	
  1802		if (!fwnode->secondary || !dispatch)
  1803			return -ENODEV;
  1804	
  1805		fwnode = fwnode->secondary;
  1806	
  1807		count = fwnode_property_count_u32(fwnode, ACPI_IRQ_PROP_GSI);
  1808		if (count <= 0)
  1809			return -ENODEV;
  1810	
  1811		for (unsigned int i = 0; i < count; i++) {
  1812			struct fwnode_handle *supplier;
  1813	
  1814			ret = software_node_read_u32_prop_index(fwnode,
  1815								ACPI_IRQ_PROP_GSI,
  1816								i, &gsi);
  1817			if (ret)
  1818				continue;
  1819	
  1820			supplier = dispatch(gsi);
  1821			if (!is_acpi_device_node(supplier) || supplier == fwnode)
  1822				continue;
  1823	
  1824			fwnode_link_add(fwnode, supplier, 0);
  1825		}
  1826	
  1827		return 0;
  1828	}
  1829	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
