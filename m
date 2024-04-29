Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1D83CB1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714415233; cv=none; b=P8JNkP7cQW0TZtIzT2brh2wbohT42LQMjgXNimwj5bGFAxRl0Upp4d4hUDCoIkhpqbFGWw6xpnFg9MkDDLB/wcf5h8bm9W03cesOyrkTM8ULkX4N7FdaVJyflte20+0iyffqKJhl9S+2BF+29Faezx0tlfUX2GL6DWbcDBPC0qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714415233; c=relaxed/simple;
	bh=djuBQDOhpb9W4LLpPC/kK5lHqwmjhZIzI5XnplGQBq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/tAetdqiil5IAdZVZysDYLTZQaoc+Xe4DJ+ktebsQ9fSL2wO4W2skRQ/V9O0P4WYEz41iSE/kEgcGvVKb/XN7+mAKvAy1b3igt3AWvbeAjDFdcwWUW1h3OUK7I65bcvxrTNzHUpIeul8V6dxd8rqDqA8gqMmxCixELkkRZnfKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBSqD9dO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBSqD9dO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714415231; x=1745951231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djuBQDOhpb9W4LLpPC/kK5lHqwmjhZIzI5XnplGQBq0=;
  b=QBSqD9dO9Hfp6tpJzUqTW71SD0OAns2XhsPsnwcq//9D5jZIBjvZDXCX
   BV8neaWB6K4YeM6mJpPrRRxjP3WMYwwK8W4uBoaEkS2ZY0VPdG83nRFI4
   UbRb/aT4Ulj/jNbyhMxg4cHiB81BVIi5shTUJ6aO3DdjbczdYzs/VTxtX
   6CSB25WCDHxKGKt8Ggn0krN98ZQhNFO95Fr5zLa4ml5vFnSbQaDw83Uoe
   cNM9WeVUiCk3cdVszYd9sFDInJabk5DuKA20BdWW/QouIqhvJn+1XZC0r
   /DAgLd3yvTcB+owh+e1BwieOOf7nym/gWumEuJcNlHHfsuNdRiN65PfpT
   Q==;
X-CSE-ConnectionGUID: i4PMC+C/T5ioV8VUTIAjyg==
X-CSE-MsgGUID: Fgro1XcvSUW87Uu4tC0k9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13917272"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="13917272"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 11:26:57 -0700
X-CSE-ConnectionGUID: PWKdO3J4S4eK6eukd5h5SQ==
X-CSE-MsgGUID: C5VoJEOySbKLIRHB+8nPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="30840037"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2024 11:26:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1ViH-0007N2-0K;
	Mon, 29 Apr 2024 18:26:53 +0000
Date: Tue, 30 Apr 2024 02:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Davis <afd@ti.com>
Subject: [linux-next:master 8678/9390] dtbs_check:
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008',
 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$',
 '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$',
 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
Message-ID: <202404300248.dblz5vZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: c6e9f107eb0f1cab3514f551343892ca93c46628 [8678/9390] arm64: dts: ti: k3-am62/a: use sub-node for USB_PHY_CTRL registers
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404300248.dblz5vZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300248.dblz5vZ7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
