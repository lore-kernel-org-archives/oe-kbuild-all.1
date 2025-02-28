Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28A38B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740701448; cv=none; b=d0mxsuSNCgdS2ETCDaRmMb6zmh0AKJBKDfzzfSsWgb9R4/CqUR/qaOPs0LS4hS7b8W5LlRFNoew5dLxjpEiA+6fmQs6cErYZ3oaKFBtNTIcW3+JadWQzXe4JFVGrxBAsP+FCEmPWZTDIrMGkKSN2gvB8K23FZIpP2DG/UdYAq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740701448; c=relaxed/simple;
	bh=XnBvdezlNA7pZ2esYOYeXu4I3CF58TE8LpoB4Ju2BGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iTUQO7DQ+AM9wmoAfKzHeSkUaldBgqt72CtdlaexQwVnGhQY/LvhxvZWg2G5iH2XR4O8+nuifcd2ObqAJGWgqJm//IT/9sm6DhD2qcYfFVVgSrJCIDixDc9dUw6mBlZHlOAAvnDCJUMS154FxCokaL6EhXlEb5tmaNYUDOyeimo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rjb8RY+z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rjb8RY+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740701446; x=1772237446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XnBvdezlNA7pZ2esYOYeXu4I3CF58TE8LpoB4Ju2BGA=;
  b=Rjb8RY+z4Coru9iwt9nqXxK5/HKFNjnvJN5PfA+JkmZdChWIXQls6nsx
   fviNZoJPzEoQPwlvT6yOyE3ow+/DArpLEQ1W0C0YWZeIbajwlUrVVXkW2
   Y4xTRum6Ex+IKIWIWkMadwAJvt32ScsdKf40d1RIhIBgRIo+FlWqV8ERq
   IcRHPb8iTBLkBks1wOR+vRgdENd5rm0MNrJbrnDVEx/I01o2H1AAow1EF
   ORL/F4rl1lNPW9C9oUj8coAPPfFq/N+fJUQFZmS1CWX0m2yARwWfg4A8E
   Cg6QlJJiQHCTbdoegQViSoEFjZDFq3jK+tLQtv/ZnGSNZCVcumigueijf
   w==;
X-CSE-ConnectionGUID: Mc7DaR4rTqSVwrh6K++LuA==
X-CSE-MsgGUID: VR2wTj8WQdeaDRnsrvx6ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52251652"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="52251652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 16:10:43 -0800
X-CSE-ConnectionGUID: SdphHCXgTWqE3Ir7zRJWFA==
X-CSE-MsgGUID: SXxgTBduSXqYOraA/ix8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117843893"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Feb 2025 16:10:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnnxg-000EDi-0L;
	Fri, 28 Feb 2025 00:10:40 +0000
Date: Fri, 28 Feb 2025 08:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org
Subject: [arnd-asm-generic:master 1/3]
 include/linux/io-64-nonatomic-lo-hi.h:132:21: error: implicit declaration of
 function '__iowrite64be_lo_hi'; did you mean 'iowrite64be_lo_hi'?
Message-ID: <202502280814.ATzYxKLc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
head:   55d422e4e5bf7aece2038533451a9bd5e5181e95
commit: 07928da414b8c0166c9ad4d33b5470d6f7c1dd47 [1/3] asm-generic/io.h: rework split ioread64/iowrite64 helpers
config: xtensa-randconfig-002-20250228 (https://download.01.org/0day-ci/archive/20250228/202502280814.ATzYxKLc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280814.ATzYxKLc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280814.ATzYxKLc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/pci/vfio_pci_rdwr.c:19:
   drivers/vfio/pci/vfio_pci_rdwr.c: In function 'vfio_pci_core_iowrite64':
>> include/linux/io-64-nonatomic-lo-hi.h:132:21: error: implicit declaration of function '__iowrite64be_lo_hi'; did you mean 'iowrite64be_lo_hi'? [-Wimplicit-function-declaration]
     132 | #define iowrite64be __iowrite64be_lo_hi
         |                     ^~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c:32:25: note: in expansion of macro 'iowrite64be'
      32 | #define vfio_iowrite64  iowrite64be
         |                         ^~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c:53:9: note: in expansion of macro 'vfio_iowrite64'
      53 |         vfio_iowrite##size(val, io);                                    \
         |         ^~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c:65:1: note: in expansion of macro 'VFIO_IOWRITE'
      65 | VFIO_IOWRITE(64)
         | ^~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c: In function 'vfio_pci_core_ioread64':
>> include/linux/io-64-nonatomic-lo-hi.h:123:20: error: implicit declaration of function '__ioread64be_lo_hi'; did you mean 'ioread64be_lo_hi'? [-Wimplicit-function-declaration]
     123 | #define ioread64be __ioread64be_lo_hi
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c:31:25: note: in expansion of macro 'ioread64be'
      31 | #define vfio_ioread64   ioread64be
         |                         ^~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c:79:16: note: in expansion of macro 'vfio_ioread64'
      79 |         *val = vfio_ioread##size(io);                                   \
         |                ^~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_rdwr.c:91:1: note: in expansion of macro 'VFIO_IOREAD'
      91 | VFIO_IOREAD(64)
         | ^~~~~~~~~~~
--
   In file included from vfio_pci_rdwr.c:19:
   vfio_pci_rdwr.c: In function 'vfio_pci_core_iowrite64':
>> include/linux/io-64-nonatomic-lo-hi.h:132:21: error: implicit declaration of function '__iowrite64be_lo_hi'; did you mean 'iowrite64be_lo_hi'? [-Wimplicit-function-declaration]
     132 | #define iowrite64be __iowrite64be_lo_hi
         |                     ^~~~~~~~~~~~~~~~~~~
   vfio_pci_rdwr.c:32:25: note: in expansion of macro 'iowrite64be'
      32 | #define vfio_iowrite64  iowrite64be
         |                         ^~~~~~~~~~~
   vfio_pci_rdwr.c:53:9: note: in expansion of macro 'vfio_iowrite64'
      53 |         vfio_iowrite##size(val, io);                                    \
         |         ^~~~~~~~~~~~
   vfio_pci_rdwr.c:65:1: note: in expansion of macro 'VFIO_IOWRITE'
      65 | VFIO_IOWRITE(64)
         | ^~~~~~~~~~~~
   vfio_pci_rdwr.c: In function 'vfio_pci_core_ioread64':
>> include/linux/io-64-nonatomic-lo-hi.h:123:20: error: implicit declaration of function '__ioread64be_lo_hi'; did you mean 'ioread64be_lo_hi'? [-Wimplicit-function-declaration]
     123 | #define ioread64be __ioread64be_lo_hi
         |                    ^~~~~~~~~~~~~~~~~~
   vfio_pci_rdwr.c:31:25: note: in expansion of macro 'ioread64be'
      31 | #define vfio_ioread64   ioread64be
         |                         ^~~~~~~~~~
   vfio_pci_rdwr.c:79:16: note: in expansion of macro 'vfio_ioread64'
      79 |         *val = vfio_ioread##size(io);                                   \
         |                ^~~~~~~~~~~
   vfio_pci_rdwr.c:91:1: note: in expansion of macro 'VFIO_IOREAD'
      91 | VFIO_IOREAD(64)
         | ^~~~~~~~~~~


vim +132 include/linux/io-64-nonatomic-lo-hi.h

   119	
   120	#ifndef ioread64be
   121	#define ioread64be_is_nonatomic
   122	#ifdef CONFIG_GENERIC_IOREMAP
 > 123	#define ioread64be __ioread64be_lo_hi
   124	#else
   125	#define ioread64be ioread64be_lo_hi
   126	#endif
   127	#endif
   128	
   129	#ifndef iowrite64be
   130	#define iowrite64be_is_nonatomic
   131	#ifdef CONFIG_GENERIC_IOREMAP
 > 132	#define iowrite64be __iowrite64be_lo_hi
   133	#else
   134	#define iowrite64be iowrite64be_lo_hi
   135	#endif
   136	#endif
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
