Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E21C433D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 02:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736822067; cv=none; b=tQGijdimZ24/n28rCdBnE/UJ2ssphm+HlT0LU9kqDO6wwa0QlWUUH7Qemt1Z8UfzpS3kwoTDOo0WiTvKMWcKX5z7YRxCSOFJHl42aSHvPPMiIJmyD7eEnbNJMop/8zoaz35m9C1k3fNBjv5QocEhIw5OnN9gobQoqfEoxHeMCfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736822067; c=relaxed/simple;
	bh=UTbjY7vrKSjBapuFiQt2CG3ixmcxkptFPiqsEi/rKPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Opt6UpyPII+XrQddbQ/avBiwM6iftHbYckCEOHBFwpxHf9RLG1X90GlLfE4252/5sf9cnF5zZYH8Wn0d+Zkw8yyP6lyuZiA3Ef9/hKoU1rK47IklIZLpRXmZQLLtgn7MjnCw3VaxgkBSbjy84K6qalG9xxQ4wXcCijKITdZ1eVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvZ0fbo6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvZ0fbo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736822066; x=1768358066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTbjY7vrKSjBapuFiQt2CG3ixmcxkptFPiqsEi/rKPA=;
  b=cvZ0fbo6aGqyX4/9QNsDgP6CLxv4IJBREFhGsLfTcbb52Pa2fxKIg5A2
   4eBC8r0Asbagry7j6lGMtQ+QXWXi/DHL5kAx7BFMYWUVFonIwdy8N7AWP
   iMF1+OV62Gxau6VwcJiUv+aWHNEainQ6TMMngf7jJ0j6TfWmQisMMnX06
   /eeOeNRffMij9x9TF3Ullo7lL8MZiiPW5rEVEZg6VbA0EeMcfFVx78dpW
   KVvcv8eSd8TscjtuIluHS5ciQ49DTHzM2y8xOEWvn5C6KlQRQqXwgu0p3
   vRV7kUnNbW5qma3tj1ZjtNbqN1BEY+rt9DV3opCQU6DCjic0L8e4ufbvH
   g==;
X-CSE-ConnectionGUID: Z/LxZC6TSv+n1wlsVsbkUw==
X-CSE-MsgGUID: jmb4lZ+bSWysYb9ght13uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48107327"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="48107327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 18:34:25 -0800
X-CSE-ConnectionGUID: IXNWzv6nTaWrloAotlVsMA==
X-CSE-MsgGUID: croPIocgT+ChIY4+APejug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108723550"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2025 18:34:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXWks-000Nzb-1I;
	Tue, 14 Jan 2025 02:34:10 +0000
Date: Tue, 14 Jan 2025 10:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:spi-6.14 4/24] drivers/spi/spi-amd.o: warning: objtool:
 amd_set_spi_freq+0x85: stack state mismatch: cfa1=4+8 cfa2=5+16
Message-ID: <202501141032.d3kNAlJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-6.14
head:   066855cfda50638616fcdcf4068948dc87c2f7a8
commit: e6204f39fe3a7b4538815a2d778b601bd543649e [4/24] spi: amd: Drop redundant check
config: x86_64-randconfig-103-20250113 (https://download.01.org/0day-ci/archive/20250114/202501141032.d3kNAlJ8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501141032.d3kNAlJ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501141032.d3kNAlJ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-amd.c:11:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-amd.c:695:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     695 |         return ret;
         |                ^~~
   drivers/spi/spi-amd.c:673:9: note: initialize the variable 'ret' to silence this warning
     673 |         int ret;
         |                ^
         |                 = 0
   4 warnings generated.
>> drivers/spi/spi-amd.o: warning: objtool: amd_set_spi_freq+0x85: stack state mismatch: cfa1=4+8 cfa2=5+16

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
