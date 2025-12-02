Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8A95CDF1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 00:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764636290; cv=none; b=U3aay8vG4q7vDPR8SMv5biqGxcmUtWm/S77+Xs+DwBezwZSalX1sMq8/ny3zeuuBer5OFLdY1ilE+6sjW/+1PSDAcrfPUDT1cUkmZ3CdK1Z/8NbUaiH+qTAgifK/WKRRF7P1l+cw7y7r73n2h4qU2QDL/JmQvlBACCRuQo6u9SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764636290; c=relaxed/simple;
	bh=R6LFnythY/Hf3B7QFkTDLwdwNLxyhhY5g02BF2rtzb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ED2deHt0vvZYmTxe2BSFyNK4G8BbJokzs5sRdoBTPO2n75SwTpW/NRrx7P1Pna7ajYHt4EooQGFB4WQAvJmrXecVrOjFipsqrKmn150SsPCOvcXPafK9k35D4nzo2OVjP7j4ajPiIkfXFGW1DKLce/Vurrsr7uUY60Cy+7+Vt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BgLwqjH1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BgLwqjH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764636289; x=1796172289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R6LFnythY/Hf3B7QFkTDLwdwNLxyhhY5g02BF2rtzb4=;
  b=BgLwqjH1J4vTOmobrmEEcPFqQhujbGaK0R36EPn6MCKT3hqzym4k121J
   PGmwdysCIhKLkY/15IpCZXFOfghY6EF2qpf/xwxq4b3qwg7lASRGdoK6n
   Rq5b3uplk7xUH/M6qK+IaMLyvZB1cDXj26T8liVSaTSkYfBMrOajkdj1h
   e9mT5O7TXucV1zpVcZuRJpzeS7TT0OTtpfCLeUEYC3Cyc0Vp7w37/i8VY
   SPklPqyCOMSiEXzsink8SrPfM9dV9TWQ4mzn4oNBsubvB7SqHqlH0E6D2
   CCo1mY7YOJcIOkUZW3G61hu4Zi/YwJ3Eg4d4FFqujupOv78r4DfqFMvUf
   A==;
X-CSE-ConnectionGUID: DdV/6lo7RXS48KN5z2CY9w==
X-CSE-MsgGUID: 3upYGK7aSiSpMcDKlu/hfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76912568"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="76912568"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 16:44:47 -0800
X-CSE-ConnectionGUID: O0UO/vyPRyapijrmq/thBQ==
X-CSE-MsgGUID: WIyodh9CTYCSrfUmLIy7MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="193498842"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 16:44:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEVX-000000009GX-2DQa;
	Tue, 02 Dec 2025 00:44:43 +0000
Date: Tue, 2 Dec 2025 08:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 9/17] WARNING: modpost: module
 virtio_msg_ffa_bus uses symbol dma_heap_add from namespace DMA_BUF_HEAP, but
 does not import it.
Message-ID: <202512020859.gF4PCkwr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   6f7d2e4ce72cd0c8b9be7705662e3609d0c0ddc6
commit: c04606fb852b55d7050256e0645fbd6fd504e9c3 [9/17] virtio-msg: ffa: Add DMA-heap allocator
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020859.gF4PCkwr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020859.gF4PCkwr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020859.gF4PCkwr-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module virtio_msg_ffa_bus uses symbol dma_heap_add from namespace DMA_BUF_HEAP, but does not import it.
>> WARNING: modpost: module virtio_msg_ffa_bus uses symbol dma_heap_get_name from namespace DMA_BUF_HEAP, but does not import it.
>> WARNING: modpost: module virtio_msg_ffa_bus uses symbol dma_heap_get_drvdata from namespace DMA_BUF_HEAP, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
