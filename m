Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC87080D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321880; cv=none; b=iL2DIbcooJiLgcyE6B1mll3gtuSHW9VNY1hLqZlu1Bi5r5ZVtesucw7B+r4XsISjxOPTNINBFfsCfI64rStIxq6yyixVuhm0m7w6QRHM5YGBSgDhy8OEEPS9JabqOSwCY2/EMViTLwvoA0ASyS4CcdVtEN3geK2gRCfI3p4eBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321880; c=relaxed/simple;
	bh=2Dir7c0+cQ9YMMpwFuPFc+rPkrxUVECQAFQOC0u1AqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3vnXzVtLb+EWEJTZEMVIm3oJAFPcbN5a5qcvINbHr46jqgRCXs+83gGIU2lpTcy40d9oDLe8qzat1lhqsumEEtBNjsxPZ6fqsdp50Qripw+WO6sHKPg2grWF5c1zmTmmkt46OUi+679oGKxJw+lq1P/MRdIaNZt1zcQSlO0Jns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpHFbt+f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpHFbt+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735321875; x=1766857875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Dir7c0+cQ9YMMpwFuPFc+rPkrxUVECQAFQOC0u1AqI=;
  b=gpHFbt+fcRPTueJbwCT2/faADmTWERp3U+yP324HxPG6+daiyTV72f9N
   bsUcPT5e87gqqK9v1ire7sztXKQws7F/1P4fnaT3OSn3bFUzuHgp44F2X
   lWXon4mJzeKX6ZP+zTjnd/h7VUn1Nr5xmXa4Lz59iWwa/8dQTkhNgF62p
   W/egGFHrcODbb4w9cLxDmMC7zN3vRVwvVfViImMyv9fOHzpclzo0MvZfB
   XAzWm3CLMlW6DKBRb2mm5NMkM+RFFLmM2rrjJyQlXAJ9C0QAhLKj3fWLW
   8QZ4qGlxK/anXooF9mNi16Cqw0EQBLgdEDanRmWzGCqvQcw+Wq/FdebZw
   Q==;
X-CSE-ConnectionGUID: EDhaI/0NQPmYlsJLC/hGRw==
X-CSE-MsgGUID: fM/4/GFkT8+4ZRovZar/tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46311344"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="46311344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 09:51:14 -0800
X-CSE-ConnectionGUID: n8SIeL2OTW6l8LeFQ1JYkQ==
X-CSE-MsgGUID: rBukoaVlT1C0glwsi7kE7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105180231"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2024 09:51:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tREUP-0003Ou-1f;
	Fri, 27 Dec 2024 17:51:09 +0000
Date: Sat, 28 Dec 2024 01:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.12.23a 26/31] include/linux/srcutree.h:230:9:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202412280126.CZ90B9A6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.12.23a
head:   c4aa4bd45dbc6902d559238debd2c79d9e107814
commit: 54bd8ce1737414436322ddcda7634ad0a6f499a1 [26/31] srcu: Make SRCU readers use ->srcu_ctrs for counter selection
config: powerpc64-randconfig-r112-20241226 (https://download.01.org/0day-ci/archive/20241228/202412280126.CZ90B9A6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412280126.CZ90B9A6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280126.CZ90B9A6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/nvmem/sec-qfprom.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/imx-iim.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/mtk-efuse.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/lpc18xx_otp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/layouts.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/microchip-otpc.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/apple-efuses.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/nintendo-otp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/sc27xx-efuse.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/imx-ocotp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/lan9662-otpc.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/lpc18xx_eeprom.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/bcm-ocotp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/mxs-ocotp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/rockchip-efuse.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/brcm_nvram.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/sprd-efuse.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/sunplus-ocotp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/stm32-romem.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/rockchip-otp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/core.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/uniphier-efuse.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/vf610-ocotp.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   kernel/rcu/rcu_segcblist.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   kernel/rcu/rcuscale.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   kernel/rcu/srcutree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/srcutree.c:747:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   kernel/rcu/srcutree.c:747:32: sparse:     expected struct srcu_ctr *scp
   kernel/rcu/srcutree.c:747:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
>> kernel/rcu/srcutree.c:749:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   kernel/rcu/srcutree.c:749:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:749:9: sparse:     got signed long long *
   kernel/rcu/srcutree.c:751:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/srcutree.c:372:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:390:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:1002:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1091:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1342:35: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock
--
   kernel/rcu/refscale.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/refscale.c:715:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/rcu/refscale.c:715:24: sparse:    struct refscale_typesafe [noderef] __rcu *
   kernel/rcu/refscale.c:715:24: sparse:    struct refscale_typesafe *
   kernel/rcu/refscale.c:670:13: sparse: sparse: context imbalance in 'typesafe_lock_acquire' - wrong count at exit
   kernel/rcu/refscale.c:677:13: sparse: sparse: context imbalance in 'typesafe_lock_release' - unexpected unlock
--
   kernel/rcu/update.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/update.c: note: in included file:
   kernel/rcu/tasks.h:2057:5: sparse: sparse: symbol 'rcu_tasks_trace_lazy_ms' was not declared. Should it be static?
--
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/rcutorture.c:439:22: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:707:9: sparse: sparse: context imbalance in 'srcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c:733:38: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:2036:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
   kernel/rcu/rcutorture.c:3989:49: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
--
   kernel/rcu/tree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
   kernel/rcu/tree.c:1064:9: sparse: sparse: context imbalance in 'rcu_start_this_gp' - different lock contexts for basic block
   kernel/rcu/tree.c:1440:9: sparse: sparse: context imbalance in 'rcu_poll_gp_seq_start_unlocked' - different lock contexts for basic block
   kernel/rcu/tree.c:1457:9: sparse: sparse: context imbalance in 'rcu_poll_gp_seq_end_unlocked' - different lock contexts for basic block
   kernel/rcu/tree.c:1908:9: sparse: sparse: context imbalance in 'rcu_gp_init' - different lock contexts for basic block
   kernel/rcu/tree.c:2680:9: sparse: sparse: context imbalance in 'force_qs_rnp' - different lock contexts for basic block
   kernel/rcu/tree.c:2746:25: sparse: sparse: context imbalance in 'rcu_force_quiescent_state' - unexpected unlock
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_stall.h:986:17: sparse: sparse: context imbalance in 'rcu_check_gp_start_stall' - different lock contexts for basic block
   kernel/rcu/tree.c: note: in included file:
   kernel/rcu/tree_exp.h:192:9: sparse: sparse: context imbalance in '__rcu_report_exp_rnp' - different lock contexts for basic block
   kernel/rcu/tree_exp.h:1081:9: sparse: sparse: context imbalance in 'start_poll_synchronize_rcu_expedited' - different lock contexts for basic block
--
   drivers/nvmem/layouts/onie-tlv.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/layouts/sl28vpd.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)
--
   drivers/nvmem/layouts/u-boot-env.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:227:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:227:32: sparse:     expected struct srcu_ctr *scp
   include/linux/srcutree.h:227:32: sparse:     got struct srcu_ctr [noderef] __percpu *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
>> include/linux/srcutree.h:230:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got signed long long * @@
   include/linux/srcutree.h:230:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   include/linux/srcutree.h:230:9: sparse:     got signed long long *
   include/linux/srcutree.h:232:20: sparse: sparse: subtraction of different types can't work (different address spaces)

vim +230 include/linux/srcutree.h

   214	
   215	/*
   216	 * Counts the new reader in the appropriate per-CPU element of the
   217	 * srcu_struct.  Returns an index that must be passed to the matching
   218	 * srcu_read_unlock_lite().
   219	 *
   220	 * Note that this_cpu_inc() is an RCU read-side critical section either
   221	 * because it disables interrupts, because it is a single instruction,
   222	 * or because it is a read-modify-write atomic operation, depending on
   223	 * the whims of the architecture.
   224	 */
   225	static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
   226	{
 > 227		struct srcu_ctr *scp = READ_ONCE(ssp->srcu_ctrp);
   228	
   229		RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_lite().");
 > 230		this_cpu_inc(scp->srcu_locks.counter); /* Y */
   231		barrier(); /* Avoid leaking the critical section. */
   232		return scp - &ssp->sda->srcu_ctrs[0];
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
