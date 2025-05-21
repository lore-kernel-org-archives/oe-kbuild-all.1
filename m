Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63E3FC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789978; cv=none; b=IPjT5oBor5Av126CQp82wPb01QTdcO0PGHSkH+eQJ30CQJbD4zi4SgbCh6gq8bovQGGYcWowMWuh7Gx7ATOnmf4rpDfeANXQra93jVvTkyDcW4M1FxzlyIdfGoR/M+3G+REsIGKqGSshxE7I2cuVb3XwaLRABqXB9+JjcSe39Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789978; c=relaxed/simple;
	bh=e82ZTFuwLHbS/Iw2WVFVXolklpAYKUZ7rThm3MZzdgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJ+qyk5OLk7k6B6XOnmlScTx8/VIL0X5e2iIJSbw6PSZeeiXATq5wzivb7vmmpKZMQNbmkLZhjUxe9gb7uHOzbYlF5QeTTx80IWOvKuAAte1HmvWT5zZK1uqNH78QTeaTGl418ZXO0p2W79WvXh4FULxyu3GCB3CMKbSzWtm8pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXxiYZeM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXxiYZeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747789977; x=1779325977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e82ZTFuwLHbS/Iw2WVFVXolklpAYKUZ7rThm3MZzdgw=;
  b=nXxiYZeMRfASY5dfCjVf3eKiFD+NlNRG9AiLA5yQuqkQ2RxOY0Tw3Cof
   SxAVkYv3O2XUFM5ZVyBQ6uX5GyEHePamgiw+Syi4XT9vSO2UlQ95F+sDu
   RVWxmkkRLDKT+XQY0XGr7IWZusQ7j1ngfGhKmty7xMcKhS2cZZcfKNvKx
   VEUT3GZf1ISjt2bvqwjBBesAdau38zoZ/+kAfyzeAj4CDCGnOM6J+6VdF
   qngUIlL1I7AqPMDC8lndauKUynYROlLmPw/TzglO9B2SuugnX58EbOMp9
   I5RcWQIItDlY69fsBAbbgz1/hirtxaEMZ0SJJuSmXJtL86+qKzfJdRE/E
   w==;
X-CSE-ConnectionGUID: K2zUVOGSRtOxaaiwiYOgsg==
X-CSE-MsgGUID: uOwiv8o6TYm+pXMUAmPc3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49006331"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49006331"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 18:12:56 -0700
X-CSE-ConnectionGUID: HBTo7Ie5S7K3ijB1nnQLKw==
X-CSE-MsgGUID: Pz42R7DeQO66Mgme1w9SIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144828998"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2025 18:12:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHY0r-000Njo-0Z;
	Wed, 21 May 2025 01:12:53 +0000
Date: Wed, 21 May 2025 09:12:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/defer_dport_enumeration 9/10]
 drivers/cxl/core/port.c:1056: warning: expecting prototype for
 devm_cxl_register_uport_dev_root_port(). Prototype was for
 devm_cxl_register_hb_uport_root_port() instead
Message-ID: <202505211102.YYSHO5r5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/defer_dport_enumeration
head:   b347f1792e2813e0d5eac573cddcbc91532b8005
commit: 697f7acb13ba43a5f5d9c2045b4564862f4e9130 [9/10] cxl: Create an xarray to tie a host bridge to the cxl_root
config: x86_64-buildonly-randconfig-003-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211102.YYSHO5r5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211102.YYSHO5r5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211102.YYSHO5r5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/port.c:1056: warning: expecting prototype for devm_cxl_register_uport_dev_root_port(). Prototype was for devm_cxl_register_hb_uport_root_port() instead


vim +1056 drivers/cxl/core/port.c

  1044	
  1045	/**
  1046	 * devm_cxl_register_uport_dev_root_port - Tie a hostbridge device to a root port
  1047	 * @host: device that hosts the memory for the xarray entries
  1048	 * @hb_uport_dev: host bridge device that serves as the xarray index
  1049	 * @root: cxl_root that serves as the xarray entry data
  1050	 *
  1051	 * Return 0 on success or -errno on failure.
  1052	 */
  1053	int devm_cxl_register_hb_uport_root_port(struct device *host,
  1054						 struct device *hb_uport_dev,
  1055						 struct cxl_root *root)
> 1056	{
  1057		int rc;
  1058	
  1059		rc = xa_insert(&cxl_root_ports, (unsigned long)hb_uport_dev, root,
  1060			       GFP_KERNEL);
  1061		if (rc)
  1062			return rc;
  1063	
  1064		return devm_add_action_or_reset(host, unregister_hb_uport_root_ports,
  1065						hb_uport_dev);
  1066	}
  1067	EXPORT_SYMBOL_NS_GPL(devm_cxl_register_hb_uport_root_port, "CXL");
  1068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
