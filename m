Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9771E834C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830574; cv=none; b=toB3StLQ+fe5Z6dX5zcjANG0NuGP7FCG3WfIvkIltDXR05eOdzX1e4JdgCAZEbRnjI9ETrrxde1b35WyCb99C3BmeWBJDcGydGCpOFItRxRmMVu4eIx1VxdmO5HGJrZ2itgrlvSOJ1zJu4iZSaFgUy8PQa4tWc3474cgf1VpwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830574; c=relaxed/simple;
	bh=ykeiTTZQTKcqhgIWxoFCd5xDuMvnen+3qbaXmaaXP8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZxN1hKCqk0SQyRMn9oTwn4M2XqyBghCroSbbRaK5s/6xWKfEh5itcHNtEG0IHndGVafeiI9L2ddnCsh64SklZYNKwNMtFcwASdKYydBQylS15CbCqIerKdyJEIqUn++hNPetuZNjgiMaoh2od2Z+R3Uw40eFMwrzz1iFsJahWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXrr8rJx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXrr8rJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749830572; x=1781366572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ykeiTTZQTKcqhgIWxoFCd5xDuMvnen+3qbaXmaaXP8U=;
  b=MXrr8rJxXIzRcpVXXGXFDQmiQqlg5Mj6WKUknPiyK3rumxF/PRJfp6VN
   R/bDSd3d0mDGvgN4eQEWtky+vmPNSSm63nAslVWBl5186R3D8DrSfUB9R
   /Bm4HtjGbkxpN1Hrwo5vwXBtJZkOKg7hHTw/Ayrc1YxM6WZhHElPhroIA
   LpRHzjytXOChPw4oVUC8iRscYhZTaVohUgcBPhxII1Bles/BjQBgxGLcs
   uAVhl+1X/ta4mNug6OxOSYWeL6fEP20pJuDYEU6p5nTpKqfhVfSdgTUWk
   U5SwNSS+/+G0hjmHzuTjyLx4bBDJmMz9XvG+exHYhVJD7PwvaQPF2kjbP
   Q==;
X-CSE-ConnectionGUID: RHHFFTqNQtKbPm0NyZiwxg==
X-CSE-MsgGUID: kBf964YJTTyYXEm+hZJNZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51930787"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="51930787"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 09:02:52 -0700
X-CSE-ConnectionGUID: xVi0Anq6QmGv72VMgtCC1A==
X-CSE-MsgGUID: v3REuoD5RfOhzsBuKRWtQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148407979"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2025 09:02:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ6rg-000Clu-2G;
	Fri, 13 Jun 2025 16:02:48 +0000
Date: Sat, 14 Jun 2025 00:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: input: melfas-mip4: convert to
 dtschema
Message-ID: <202506132330.hudjqtiv-lkp@intel.com>
References: <20250613-mip4-touchkey-v2-1-9bbbe14c016d@disroot.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-mip4-touchkey-v2-1-9bbbe14c016d@disroot.org>

Hi Kaustabh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb71d301869446810a0b13d3da290bd455d7c78]

url:    https://github.com/intel-lab-lkp/linux/commits/Kaustabh-Chakraborty/dt-bindings-input-melfas-mip4-convert-to-dtschema/20250613-034434
base:   0bb71d301869446810a0b13d3da290bd455d7c78
patch link:    https://lore.kernel.org/r/20250613-mip4-touchkey-v2-1-9bbbe14c016d%40disroot.org
patch subject: [PATCH RFC v2 1/5] dt-bindings: input: melfas-mip4: convert to dtschema
reproduce: (https://download.01.org/0day-ci/archive/20250613/202506132330.hudjqtiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506132330.hudjqtiv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
