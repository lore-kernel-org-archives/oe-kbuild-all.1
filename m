Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EEE3A8C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 23:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706742863; cv=none; b=HAoJ9tUsEQ8WXoDIuMCnrLDijwsGNVFAeJ5q8aampohhib+VgXqVpTRwUiWVshGzbmwI+cgAHPjhz8efq3wYTrSy2f4k7AQOvneUB0KDbUshjFewmVtykFXXxE+qZUzbFy46AqH/Z2o8yB64yHnHxOb4j2Hf1pAz86ttTJUQ8mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706742863; c=relaxed/simple;
	bh=CkhWFq8c4kuI94dRS0/Nq/uJaMXYgj7TqOaQxDsF0Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hH5YDlBHGfFC5x38VFBsxPRjZTvjYhtJYHwSqAeMaTcEku2pDyVMbz3BCSu81uBlu2szUik4gwAlWs1i9WB6Mjfnhn3+Q2QoZ74TAC1DrG/OvMYYH2fAxK921WcjCL4bKBL4/AXAF5EZWgI92ZuyMJAeF2ZiBGNihojt1flUjKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DfH1OFHg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfH1OFHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706742861; x=1738278861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkhWFq8c4kuI94dRS0/Nq/uJaMXYgj7TqOaQxDsF0Vs=;
  b=DfH1OFHguV9Q1Q0Fjbh3WAoyScCF5I2RPnIv+0g++OXyPpSGgqSdHK+f
   CKV6iMvYzehNPJD2seUsNA58W77Ytz5UMJ5gQjlT+xmN1HDZpjU4nPxmv
   Ary622nkrSeKuq5VnJTed580x/LJVYDlaGP9pHgZZeU9rIC9rRVw+EyRH
   2hdflOQLg/xXkeCmgHM1UsiUCfffU5xVSApoO46illNMdSKaH0KwOl7VX
   O8zAl76revo5P8wvOGQh0s0Q9GncAM6bNKPfaVZA6eoTzQrGNvEdpzVRw
   eWn3jQuZ7iEcsW7QeohHMaSZ1djwt2NUxRYLgc0ZVGD4+1Gsw4ZPC9+1V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17288307"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="17288307"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 15:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911947869"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="911947869"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2024 15:14:19 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVJkp-000298-24;
	Wed, 31 Jan 2024 23:13:08 +0000
Date: Thu, 1 Feb 2024 07:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 777/2894]
 arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is
 equivalent to !A || B
Message-ID: <202402010731.xBi0q0zv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [777/2894] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r051-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010731.xBi0q0zv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010731.xBi0q0zv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is equivalent to !A || B

vim +439 arch/loongarch/kernel/legacy_boot.c

   423	
   424	static struct fwnode_handle * __init parse_isa_base(u64 *cpu_addr)
   425	{
   426		struct device_node *np;
   427		const __be32 *ranges = NULL;
   428		int len;
   429		struct device_node *node;
   430	
   431		for_each_node_by_name(np, "isa") {
   432			node = of_node_get(np);
   433	
   434			if (!node)
   435				break;
   436	
   437			ranges = of_get_property(node, "ranges", &len);
   438	
 > 439			if (!ranges || (ranges && len > 0))
   440				break;
   441		}
   442		if (ranges) {
   443			ranges += 2;
   444			*cpu_addr = of_translate_address(np, ranges);
   445			return &np->fwnode;
   446		}
   447	
   448		return NULL;
   449	}
   450	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
