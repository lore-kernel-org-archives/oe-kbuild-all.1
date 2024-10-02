Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D41E1301
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862191; cv=none; b=NS2IwwKHiD83vgk6AvpSBOWXemsAPjgW91cumnZCeYfN952kwsQqp03sx1vM7skOkJKvLDXcQ7AMBrCx2C0MyPgLjzMF0c6oeb7XEAeaSkbi3adgfnWwMPoL/HLtwvOWGqAa+f6pnfcXiHNT3gHCVpALmHpe/aVWuWv0IiFfK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862191; c=relaxed/simple;
	bh=4JjPZP+DRURqIHQRvYFa8qNsE2SWskO2561o3NNlnZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3dcznzcY9CKpCAD/vuxDTGjoKwO+hUpJk+QgS4LkQyEaLCFrMfuok9ZzmKWxXvTPgQKq3ebiBYa3BlNNxs+RLkJAEA9K9dnDFvjPKNQa0bFgbYHPMWFqSNGq/BpZ89RzbIvO6wsvcf0iir6h3iBWrXKvwXB/S927gBJYe16fHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4lM5mGn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4lM5mGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727862189; x=1759398189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4JjPZP+DRURqIHQRvYFa8qNsE2SWskO2561o3NNlnZU=;
  b=m4lM5mGnu7kvQCNOd49ML4SFoetapegdFeRtmutUt5g9hWDvCy+Tx5KL
   vg+IJzN0PZwcnhE7CCLRXSuWj+CvLh6LERurqqChXtp8eKj5iZ+uH1UU8
   DPa/prHrnYMK2xR4H+LQollOVV6ioTv8dK4gvWygjZa8kQAShGs0wGl7+
   uS9DmoCVfOn6EjIUv5HLPmjIZVrDB7v2WUPcZGbzCGLU00sBsyDeRIYNf
   c5nweFg9VpjH45c/yFSg52ebJMbCGpkG+7Lm0UhOvamZW7Zmt4PUee3Lp
   7G8WC3nvWnGYV7rYXe2wQAjX+0WSUTE90IvWGwvRK0pjTGK6Yg6pr9WGr
   w==;
X-CSE-ConnectionGUID: G2BU6LblQuKWMKJUWThi5A==
X-CSE-MsgGUID: 4QpPkhyBTxmRe03XFsE0/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38379135"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="38379135"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 02:43:09 -0700
X-CSE-ConnectionGUID: 2taZawb+SHq2HMFIGQfV4Q==
X-CSE-MsgGUID: FI4rDA4XQaCtzcLobZQoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="73548822"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 02:43:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svvsv-000RsS-25;
	Wed, 02 Oct 2024 09:43:05 +0000
Date: Wed, 2 Oct 2024 17:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4740/16788]
 drivers/soc/fsl/dpio/dpio-driver.c:29:34: error: 'PTE_TYPE_PAGE' undeclared;
 did you mean 'PAGE_TYPE_BASE'?
Message-ID: <202410021705.MolUGJHr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: ad2e04b9ae1c08fdba0019998693787013cd6c02 [4740/16788] soc: fsl: dpio: change CENA regs to be cacheable
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410021705.MolUGJHr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021705.MolUGJHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021705.MolUGJHr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/dpio-driver.c: In function 'dpaa2_dpio_probe':
>> drivers/soc/fsl/dpio/dpio-driver.c:29:34: error: 'PTE_TYPE_PAGE' undeclared (first use in this function); did you mean 'PAGE_TYPE_BASE'?
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:29:34: note: each undeclared identifier is reported only once for each function it appears in
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                  ^~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:50: error: 'PTE_AF' undeclared (first use in this function); did you mean 'PTR_IF'?
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                  ^~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:59: error: 'PTE_PXN' undeclared (first use in this function)
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                           ^~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:69: error: 'PTE_UXN' undeclared (first use in this function)
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                     ^~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:79: error: 'PTE_DIRTY' undeclared (first use in this function); did you mean 'I_DIRTY'?
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                               ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:91: error: 'PTE_WRITE' undeclared (first use in this function); did you mean 'VM_WRITE'?
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                           ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:103: error: implicit declaration of function 'PTE_ATTRINDX' [-Werror=implicit-function-declaration]
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                       ^~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/dpio-driver.c:29:116: error: 'MT_NORMAL' undeclared (first use in this function); did you mean 'ZONE_NORMAL'?
      29 | #define PROT_NORMAL_NS          (PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
         |                                                                                                                    ^~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:31:70: note: in expansion of macro 'PROT_NORMAL_NS'
      31 | #define ioremap_cache_ns(addr, size)    ioremap_prot((addr), (size), PROT_NORMAL_NS)
         |                                                                      ^~~~~~~~~~~~~~
   drivers/soc/fsl/dpio/dpio-driver.c:208:34: note: in expansion of macro 'ioremap_cache_ns'
     208 |                 desc.regs_cena = ioremap_cache_ns(dpio_dev->regions[0].start,
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +29 drivers/soc/fsl/dpio/dpio-driver.c

    28	
  > 29	#define PROT_NORMAL_NS		(PTE_TYPE_PAGE | PTE_AF | PTE_PXN | PTE_UXN | PTE_DIRTY | PTE_WRITE | PTE_ATTRINDX(MT_NORMAL))
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
