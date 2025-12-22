Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5862C11CA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413345; cv=none; b=bdzuO8kvjVRlhMrtHooOHNRFA3h5nTJIP8N91JNjgwscdRXueRP0y1CsbLrLIJ2ghVnF7RFXkADqwv8fDf0xL2XDXE+20V4zVXyoJxLv2/gzdKAQroBcQEwXE7I9xIe5tOYi1O2JEit0TN8AVTX2xeM8q8LaeHoaow1b2nsFa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413345; c=relaxed/simple;
	bh=heEIPZYqTxIS+TzN5UwdxTrbogvJz41Y84YftjfGX1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT+sPGoMxlYvrQmfokZ1I/oss8zIrrkksCP6BJZA9hn+P4MIYdouh+m9o6m1sqlwadTJDJcvxQOlmp33e5pEbnVgDx0mr2bZvBfcHRV3B3kH1EOSCHfTNiWNTgmlIT0aJS/olXGBVbcHrRns+YqAido79J2ak5ps6IM3Bkqywlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwfGHAqu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwfGHAqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766413344; x=1797949344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=heEIPZYqTxIS+TzN5UwdxTrbogvJz41Y84YftjfGX1E=;
  b=VwfGHAqu1kgCcEuOgKgTHDObI84/rMWB3i444OO2N1Z1pFDO34MyxGme
   tzt6UXcoypcHGCTzlwss5aOBgLLoy0W8/jfZ4RkZ5yUuA4Zg2fdtqFWNR
   jxyVpEybQfzr6/oC/FfWOUW5VZrFlnDTnzU+OFUXA8n0KnpY7rH5eos/u
   vK7I2ZgJs7lZhECj/GBVbXd5pjiYRjhw9VIYncuIynUD95SEYfZKEVWHm
   gm8oRrULLPE2CuAN3B4pQjDS49Hh5czxdjlnrvIceeQJGXm/ZWY+EBzx9
   /2Sju8XvCjAC+MVxdH7bKCYoNHbqKwb7Fjm4HYJNiQtEykTQoJI7Qa1Dk
   w==;
X-CSE-ConnectionGUID: eYR+V4sVRx+1ur1is5+TIw==
X-CSE-MsgGUID: NuCItGNiR36u/A1EecysPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79720563"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79720563"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:22:23 -0800
X-CSE-ConnectionGUID: QBXgvF0bRmuzpzT5ABjZzQ==
X-CSE-MsgGUID: aNrEX8sZRRmAjx3gdSn2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204483629"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2025 06:22:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgnh-000000005VI-498I;
	Mon, 22 Dec 2025 14:22:17 +0000
Date: Mon, 22 Dec 2025 15:21:32 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Robert Richter <rric@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Drop obsolete brcm,vulcan-soc binding
Message-ID: <202512221537.xL09XWuA-lkp@intel.com>
References: <20251215213022.3325133-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215213022.3325133-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-mem-ctrl/for-next krzk-dt/for-next linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-arm-Drop-obsolete-brcm-vulcan-soc-binding/20251216-053906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251215213022.3325133-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: arm: Drop obsolete brcm,vulcan-soc binding
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221537.xL09XWuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221537.xL09XWuA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/sphinx/parse-headers.pl
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/mediatek-mdp.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
