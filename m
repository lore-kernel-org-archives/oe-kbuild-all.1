Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690224120B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712125457; cv=none; b=fOyZCGuHAUYfo9LpzVC/abCcRObP6KdocHRdKRSobxbj1zQVrtetFNnH+pwV2ey50kg4X09B20Lam85Hy4MYKz4fj1QZoh7Ky2ZENNqFpIsB4p3VyKPdQx/PufFHLd49hM0uGbTzvYN+SR1ykrul64rWjsT54Wu+RkgU8NXmTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712125457; c=relaxed/simple;
	bh=BPLy3irZqqO7YRCxA2R8Mg+HsLvu2WuFRxTxdmJ74tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agF+jfHIES20Ar/3T21rSFqdvpCUp7P4ZTCOYJh8IZZFczREHSfPisI5rjJEgZno/Lht+PJygbFNWH3kGESy/eVvoMaPC1PSafsyj6Doc5knqOBybiv+Ydgv3uFv1FtsmsmgVC0eHrRzlw8kuW0KC6Rz/Mt4ljb2nYVhm28vdI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAjI7RhH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAjI7RhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712125455; x=1743661455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPLy3irZqqO7YRCxA2R8Mg+HsLvu2WuFRxTxdmJ74tA=;
  b=bAjI7RhHL63Qhk2UbB0g38jjYmsF5xPmrZI9ydCsQgR/7ONi4fMpfgGY
   CG/9VPO+2tNDRMjRkFCqPuQdAXgLEHinL7Op+MwqFDEUiPdrG9r5g5CEW
   /dKiw+juV7ajKOicu8C2hvwtzdhgEc1lQAZiU+X0GMCU4AqI4DCDdPfk/
   pIwp2GCP/oat+JjNGdvYl3kBk1j1UGdQPTxMqMHHuLlhSTFoky3KnjV6z
   X1vqX1Lf1fwrcbT/6JPuJamfGQzcDAfx6/D/eARtnvSn9o35OkIMq0YES
   incvPP3WiGTMvJnkwA+AnWPLfIYVeSnbYT1D/IFtORJHTHNmOkUe1JC9g
   g==;
X-CSE-ConnectionGUID: k7zsR4liSl64Z47qcrd/OA==
X-CSE-MsgGUID: n/E+A2iDSLK4fmvC1XbVBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7493066"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7493066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 23:24:14 -0700
X-CSE-ConnectionGUID: BA4bRwosQzKUztKZnnDUhA==
X-CSE-MsgGUID: oDXwinwDR+iSqgHbJGh8Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18748632"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Apr 2024 23:24:14 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rru2d-0001vc-27;
	Wed, 03 Apr 2024 06:24:11 +0000
Date: Wed, 3 Apr 2024 14:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 45/51] arch/powerpc/kernel/pci-common.c:110:11:
 error: call to undeclared function 'find_and_set_bit_wrap'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202404031454.Kxivd129-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: 5e675d809976b6cb445c342444bfb97c1a334469 [45/51] arch/powerpc/kernel/pci-common.c
config: powerpc-canyonlands_defconfig (https://download.01.org/0day-ci/archive/20240403/202404031454.Kxivd129-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031454.Kxivd129-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031454.Kxivd129-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/pci-common.c:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/powerpc/kernel/pci-common.c:110:11: error: call to undeclared function 'find_and_set_bit_wrap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |         phb_id = find_and_set_bit_wrap(phb_bitmap, MAX_PHBS, phb_id);
         |                  ^
   arch/powerpc/kernel/pci-common.c:110:11: note: did you mean 'find_next_bit_wrap'?
   include/linux/find.h:425:15: note: 'find_next_bit_wrap' declared here
     425 | unsigned long find_next_bit_wrap(const unsigned long *addr,
         |               ^
   1 warning and 1 error generated.


vim +/find_and_set_bit_wrap +110 arch/powerpc/kernel/pci-common.c

    70	
    71	static int get_phb_number(struct device_node *dn)
    72	{
    73		int ret, phb_id = 0;
    74		u64 prop;
    75	
    76		/*
    77		 * Try fixed PHB numbering first, by checking archs and reading
    78		 * the respective device-tree properties. Firstly, try reading
    79		 * standard "linux,pci-domain", then try reading "ibm,opal-phbid"
    80		 * (only present in powernv OPAL environment), then try device-tree
    81		 * alias and as the last try to use lower bits of "reg" property.
    82		 */
    83		ret = of_get_pci_domain_nr(dn);
    84		if (ret >= 0) {
    85			prop = ret;
    86			ret = 0;
    87		}
    88		if (ret)
    89			ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
    90	
    91		if (ret) {
    92			ret = of_alias_get_id(dn, "pci");
    93			if (ret >= 0) {
    94				prop = ret;
    95				ret = 0;
    96			}
    97		}
    98		if (ret) {
    99			u32 prop_32;
   100			ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
   101			prop = prop_32;
   102		} else {
   103			phb_id = (int)(prop & (MAX_PHBS - 1));
   104		}
   105	
   106		/*
   107		 * We need to be sure to not use the same PHB number twice.
   108		 * If that happens then fallback to dynamic PHB numbering.
   109		 */
 > 110		phb_id = find_and_set_bit_wrap(phb_bitmap, MAX_PHBS, phb_id);
   111	
   112		BUG_ON(phb_id >= MAX_PHBS);
   113		return phb_id;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
