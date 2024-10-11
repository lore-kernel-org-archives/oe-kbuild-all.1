Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E41CDA19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631626; cv=none; b=hJuYL+rQlEteA7Pzmx2Py7ve55QoCiX4n0rYzKxdDenbsw0qG3wfA5XIvibiti8qh+whnkniXgZQlVBX1K4vEryYsvSJzelacr1gRwlf2JUdGtkPpM+jNsMTFB1pq9+tbhiC7xemOcEasGoFecwSyVrblH859T8WDNQ1VaOR05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631626; c=relaxed/simple;
	bh=5ekHiaGRSCUKPgAMPLVD4/JBCdQNPRCeh646qLYPFI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pU6FDobVmZK+KBdBJtwkCoJPDr6W025eLIo5HxrXsF7XiVzwvg5X+FvwjEWlY1wuBkiczoaZPtzt44Qgb2/rO/sQjwv6fpAns4uN2SEquMvUPFz4kKFLMhqBtdWALyS4eUiSZWCOFnhGS5MG1MvRVLBpgtXuqDWb3SMjj/NOf7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzI0UAUs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzI0UAUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728631624; x=1760167624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ekHiaGRSCUKPgAMPLVD4/JBCdQNPRCeh646qLYPFI8=;
  b=PzI0UAUsosvgLUHrZ6ZWWKEGNuoP2vfW6VVUjWrNhQwLG3CkfYOtcsK5
   mShJDQw5A2w3es4oBrNAwEbORdyiHWJIOnsUGfU61ASSevUvdYqnPUXYg
   dJk3aBYiBRqWDieMuv/QhLQa4UyA1+z7sCrJvSlg+mWI5ZGt09oVwIgDU
   D/q8U4Q6JGFNnQf+kyZa7VmDpjqZQfQ3sMIK+BXYB81qUkdoeyYCIYvcf
   BmBDoJFBrL/6yIPJGyZBnCg11h/4mmpf2vTpoOHm055WGNA43UqJEjSrL
   mZViq2G4mwdtJdELh2wwsA7ypQPhVcEG5UN0Gw596HbJ0V95eYUrVNMKz
   Q==;
X-CSE-ConnectionGUID: QglQEj0FTXOfuz2hYjoudA==
X-CSE-MsgGUID: dgMhQKiGQ1C3G13jaQ8MEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="38670683"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="38670683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 00:27:03 -0700
X-CSE-ConnectionGUID: WC6lATgbQmKF4rxPe8UWyA==
X-CSE-MsgGUID: mAkAlc2SRqSZ+Bc3ToQSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="76480498"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2024 00:27:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szA3A-000Bzl-1C;
	Fri, 11 Oct 2024 07:27:00 +0000
Date: Fri, 11 Oct 2024 15:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 777/14350]
 arch/loongarch/kernel/legacy_boot.c:439:25-27: WARNING !A || A && B is
 equivalent to !A || B
Message-ID: <202410111529.bqXXUCAv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f7c1291d7c3f15bc448cd93e29fa539386fe85fe
commit: db5bb24abc8dd120fd81b7ce21819e96578d011e [777/14350] LoongArch: Old BPI compatibility
config: loongarch-randconfig-r062-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111529.bqXXUCAv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111529.bqXXUCAv-lkp@intel.com/

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
