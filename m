Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3BA139CE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726309738; cv=none; b=UuNbW5iSQJzv4gjtFSU8NVxT1iSDQgI42dQ6khTx/7D1nR+VIUxX5mcGZWNiW++sbV3j51qzYn/fOE9/o2fDBWPzF59PUCsILxzwJIdBdAW3VogQFw+fYjoCymbNk/tKp9O8SF5Jxpmwrt/eNBGmYBz0is5sRc19yWh/068SluI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726309738; c=relaxed/simple;
	bh=ObZQfVzybLMYPd/bONZS6VmRwMh5FncZEahWDsgEq7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FH1/2ikC3bM+G3stffn9tfx3ng55CV6Ltw6skUb3ALaVqXeOU6m3ABjBNW0+ap7Mc59P1hGCBt4PtXlMQqTe70anexmRswt/uBSxSrWqpeKNn13VYG3oFkKUdgHQO/LKIbTmiWzmCK6gwW4M8APzT9VXR77qC7j0copPievkc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwtCIvUI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwtCIvUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726309736; x=1757845736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ObZQfVzybLMYPd/bONZS6VmRwMh5FncZEahWDsgEq7A=;
  b=NwtCIvUIYD5tFA45r18xlZEYNb6FHyWwYbnBGxuK3A1k8yv/B5SqKnL2
   QrW8CCIAYRitJyYf0Jg/AjND+/CF2MpM9TlMPdehwvpWeRJN829apZWKH
   NefjWdO+A981/2SpVpc8DujI6THy5xl/An4TlxbpBkFcW4Cw660bi2Zmk
   L6kSJCbMvRopUJDA3e91YM9IrgJ+gB4VIclFiEyybUQcpRgqZRsCBng3d
   4H0k913i+rXvN9a8tsu8xIUNuvjP1LBAMMGGfoc/spvcbx7anxatzfuzA
   /2TLVX/VjvXOsLRDkmCL/wripBPW6hgEeQU72EURk+2b4oqyuPnZVcuTB
   Q==;
X-CSE-ConnectionGUID: OmwnzTd8QDCPtzO4gY/PAA==
X-CSE-MsgGUID: grNY0X/XTzW6eIvOiG9IVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25146749"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25146749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 03:28:56 -0700
X-CSE-ConnectionGUID: FxBkd0CGQf+YoXWyjZZQsA==
X-CSE-MsgGUID: C2Je18PeQIuqrhZeOub8Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="68238285"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Sep 2024 03:28:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spQ1M-0007dY-2V;
	Sat, 14 Sep 2024 10:28:52 +0000
Date: Sat, 14 Sep 2024 18:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 1790/30000] ld.lld: error: duplicate symbol:
 debug
Message-ID: <202409141843.ikQ03W3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1b6ac823ff98dd4dbd1b6bff478a1b9b44855f67
commit: 8e695222e0638bf3867561a1e7342d20fd9683a1 [1790/30000] Huawei BMA: Adding Huawei BMA driver: cdev_veth_drv
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240914/202409141843.ikQ03W3n-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141843.ikQ03W3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141843.ikQ03W3n-lkp@intel.com/

Note: the openeuler/OLK-5.10 HEAD 1b6ac823ff98dd4dbd1b6bff478a1b9b44855f67 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: debug
   >>> defined at bma_pci.c
   >>>            net/ethernet/huawei/bma/edma_drv/bma_pci.o:(debug) in archive drivers/built-in.a
   >>> defined at virtual_cdev_eth_net.c
   >>>            net/ethernet/huawei/bma/cdev_veth_drv/virtual_cdev_eth_net.o:(.bss+0x0) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
