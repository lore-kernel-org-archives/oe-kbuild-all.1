Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BCD18C31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587020; cv=none; b=kkhiE6HPwMgz+EwKP9xscLsYupCcHRjgNS/KiKFm/eiARSxTkeA+AiBmsk8xNfAcbsrPvOu6mWmQY0c5FciJ72yRkU0SYxSAHRstVYZ6q0C2ydSiLWC/SAPfEMYz/453BjS/JFRHCAjezAjlaoap4XAB+RTQuWBXrxmSc68CJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587020; c=relaxed/simple;
	bh=+f3QI1JeTxOjZipXaQunAGd5+/BioaL9rRLT9d4Y7Io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZc7iYZVu4fZHX0jtAgZ6WW0guwkQkMc3rK5UkEtg6WKqpN06RIJTL7oxrWGT93aT3xyK3QjrvX/Z2Q5msshR5IeUxinnGqXjRXHxKkuc+wzeFLnsEuXDIaPMYIBxihiTiYZKzYznxoHObBgxgNQQ/zU3Kp6oCAYTQNuwOymYVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIwFiOK3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIwFiOK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719587018; x=1751123018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+f3QI1JeTxOjZipXaQunAGd5+/BioaL9rRLT9d4Y7Io=;
  b=iIwFiOK3zjrrnvPKR258xCH5NWXH3SVDvmDWuQetj91ZmrpSNWr/jvc8
   4MbLUw1qeoQmE0E+LQM1b1MFsnyyFSiAJ8QapATWcvGwyNXxyg0qUwyQJ
   nP1DU+OeoGJxPOpl8htJQgGENNAUCV2C23wTb9W0DnRVJShmDRSMcfyh/
   Mdb7FivUjHZKnrFNd7VaZsiE7eXdW5Z7ySQzhtGAd5JcQoOD6vIVrtZEG
   HuBqXXupH/FcVVWMqmhFGFLulj0ArLYXlTrO3aHMDZAXY9I7iaqnv67s6
   1zdv5PJLW55gE5bPHIADCUbS9xIO8Bg7AG2jPzVCp3XU5wpq4yWSqfndy
   w==;
X-CSE-ConnectionGUID: kAQvlo0oSA+nrfbqj83ESg==
X-CSE-MsgGUID: 4nHndzUfRled9DIQMoOKdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27459818"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27459818"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 08:03:37 -0700
X-CSE-ConnectionGUID: xq4Gd4gqQDqprQGrWBI4Qw==
X-CSE-MsgGUID: s2rUV99DScKuLH1Rh+DHhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44846791"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2024 08:03:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sND8P-000HDm-35;
	Fri, 28 Jun 2024 15:03:33 +0000
Date: Fri, 28 Jun 2024 23:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Marek Vasut <marex@denx.de>
Subject: [atorgue-stm32:stm32-next 29/31]
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb:
 /soc@0/bus@42080000/ethernet@482c0000: failed to match any schema with
 compatible: ['st,stm32mp25-dwmac', 'snps,dwmac-5.20']
Message-ID: <202406282230.ITyHkKR7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
head:   45fad67e83073a93bafcc39f4fa6ae1900d5d75b
commit: 48c7a321b26f5090754adc0c3d94c872cf36f300 [29/31] arm64: dts: st: add ethernet1 and ethernet2 support on stm32mp25
config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282230.ITyHkKR7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282230.ITyHkKR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282230.ITyHkKR7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40400000: failed to match any schema with compatible: ['st,stm32mp25-dma3']
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40410000: failed to match any schema with compatible: ['st,stm32mp25-dma3']
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/dma-controller@40420000: failed to match any schema with compatible: ['st,stm32mp25-dma3']
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/bus@42080000/ethernet@482c0000: failed to match any schema with compatible: ['st,stm32mp25-dwmac', 'snps,dwmac-5.20']
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: /soc@0/bus@42080000/ethernet@482d0000: failed to match any schema with compatible: ['st,stm32mp25-dwmac', 'snps,dwmac-5.20']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
