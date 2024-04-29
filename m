Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681F83CB0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714408070; cv=none; b=Ndr0m5tK7AAk3lExB7xqBo90e1Pydw4bxxS7x7ol2LyxBuZjKfiglgYtpj7jVrpLpcfM5RHKH3Gsh2GumCrJsiGpAdeLtmyE3Y4E3HjscnGUPssy2orEuvj6rRGgiLcQUrD3S26vxb4/xcjpT0Wd6F9V/saDeWdhA6Sb0mbCwI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714408070; c=relaxed/simple;
	bh=AHDP1USbHZSXo0J8r7QxOjUfp96xwhrv4lYjuIR/wEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icakiDMgbHvwO0zqOZdjeYWG4ZAl2f7WQzgw84atUb7KcA/hMOLTiysVpwUOEqeOkGwistO6SZIU12hUQ4X1YJJ8WS7ZrxTzVpL2TRX4aRP2n+5ixueCgWSgY1EGhqoJGjDe5OC7uKj0MpkgwUG0tDViaCuEi7olaQ+xWGVV8xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=njGLx6In; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="njGLx6In"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714408069; x=1745944069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHDP1USbHZSXo0J8r7QxOjUfp96xwhrv4lYjuIR/wEU=;
  b=njGLx6InvbE2Dx8cyCAMyJ74Jq7Ft0nsqmbxan4rSt769tqaFMTQctkL
   gkzdVDzg50USKEIAHyWE4S8onoJfrdVVmUFzyoEGrFMnhPJEocHMG1sLJ
   js0F1RhBtlNKvEOsgtmCuJ8EltvGxtVeipxNh1YvKyYPpXzXOJWjjiDCD
   cC+XAv8R/Fm9T3Xi6CQuYndfkY5UNzcN6Kp5MGTXcerrhlJxZDouXZ+cc
   5+n/HIMJtPNdOm5GJTxjVpZxqaTbt7h2KvTWnToIGkBHgzSnt3YY5jus0
   xAMn+g2d2pvU5Mdj6gSiK6FZTw8PZQvowDQaM5jjJ+I6p/DtnmUzJQN6h
   g==;
X-CSE-ConnectionGUID: hBZB7aFxSQakRclpqHwttw==
X-CSE-MsgGUID: rSENBxHpR0SupCPrOIy7Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20694803"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20694803"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 09:27:48 -0700
X-CSE-ConnectionGUID: mHVUqSyCSaiPo6LmaGfa/w==
X-CSE-MsgGUID: er8epJL3SlWLE+1+oR7vyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30604124"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2024 09:27:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Tqy-0007Iu-2O;
	Mon, 29 Apr 2024 16:27:44 +0000
Date: Tue, 30 Apr 2024 00:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3946/11728]
 drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for
 function 'caam_sm_example_shutdown'
Message-ID: <202404300037.iHLnuiqB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 7cab0da0e45916b37265ebeca4d2a393e044fb2b [3946/11728] MLKU-25-3 crypto: caam - add Secure Memory support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404300037.iHLnuiqB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300037.iHLnuiqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300037.iHLnuiqB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/caam/sm_test.c:26:
   In file included from drivers/crypto/caam/compat.h:18:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for function 'caam_sm_example_shutdown' [-Wmissing-prototypes]
     505 | void caam_sm_example_shutdown(void)
         |      ^
   drivers/crypto/caam/sm_test.c:505:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     505 | void caam_sm_example_shutdown(void)
         | ^
         | static 
   6 warnings generated.


vim +/caam_sm_example_shutdown +505 drivers/crypto/caam/sm_test.c

   504	
 > 505	void caam_sm_example_shutdown(void)
   506	{
   507		/* unused in present version */
   508		struct device_node *dev_node;
   509		struct platform_device *pdev;
   510	
   511		/*
   512		 * Do of_find_compatible_node() then of_find_device_by_node()
   513		 * once a functional device tree is available
   514		 */
   515		dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec-v4.0");
   516		if (!dev_node) {
   517			dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec4.0");
   518			if (!dev_node)
   519				return;
   520		}
   521	
   522		pdev = of_find_device_by_node(dev_node);
   523		if (!pdev)
   524			return;
   525	
   526		of_node_get(dev_node);
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
