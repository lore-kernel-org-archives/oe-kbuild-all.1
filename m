Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC323A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724132901; cv=none; b=LYoEnbbnBzW/kGkQ4X1s3B9DEsVidvLPUxTCQQNjRUn0Qim+uSMFyjXKfDehRxA4s6DxvpSgF5gL2eIUa9Q79TNpZ1HCrFz7QusvDxQaM5N0NGc0gcaUGhQAa0DseSRwf0ByTfvpPKvsu+ZEZTq0atqGIXqIGn6s2gOsL6kbOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724132901; c=relaxed/simple;
	bh=kWa4hgbIsr9MeLB7DGZLASFvY2Ep33KQRozYMGp60vA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q8nGIkfnU8yK0xJ0SHPQBND9P8mnHPWZoNRPUbEIeOKgcIYdCVxQR6iLhYj1cGxfCchILk/XPU3rdU1r6MjhWlkp9A3MBmD/Kq6zzaN8+54+LGbDQfwRMXNu+HcSV/n8xG5bLRlKO3qGlWyakjcBSVhRNAsIFqSKj1jxsL680OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DchSB4eP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DchSB4eP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724132900; x=1755668900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWa4hgbIsr9MeLB7DGZLASFvY2Ep33KQRozYMGp60vA=;
  b=DchSB4ePeXkCN/ewD+yvaVGng+V8mzzZ3+QgvD8kkU9/62AOraNDcf3A
   V9hywna0q2qc1xCvUh7mxwIXpi8xFcvPWgsRGWj4wzh6qS61P2hFw1RYp
   wtZHDesoOOq5GIeu0kty/r983khL4m1P5T1fiZBJ3Et5AWtpN6UJ52GzG
   Xs56j1izGjGNcGExWaaPSXih2qzyz5+TPCi/FNY4mCIEmaT9C/GS9TJi1
   +hxm5Hsmt0u3yVJed0bN1imSlzpBOWOsaCz4o7gyQsCST9tOS83f8KcK9
   4Zb1q2GhAaQoE4JZpQ6AJnQDXd78GTUGTPARAMNMgc925wT9B/l4m0FQE
   Q==;
X-CSE-ConnectionGUID: y9Qke0ouQlaAuH0WG0fPxA==
X-CSE-MsgGUID: gX2tzoYKSqeiXlbJOSIrXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26162690"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="26162690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 22:48:19 -0700
X-CSE-ConnectionGUID: 0nPHvUk8TR2R6dFp5NjqiQ==
X-CSE-MsgGUID: lHT61q+AR7qjdpfIMoEmHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="60759315"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2024 22:48:18 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgHj5-0009lx-36;
	Tue, 20 Aug 2024 05:48:15 +0000
Date: Tue, 20 Aug 2024 13:47:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [cel:lkxdrgen 1/2] htmldocs: Warning: tools/net/sunrpc/xdrgen/README
 references a file that doesn't exist: Documentation/sunrpc/xdr/
Message-ID: <202408201340.om7VEoQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux lkxdrgen
head:   d2dde1dcbef024cf055522cee424f8f67de56984
commit: bca6f242396960d86ae46f11349cd87caede3c62 [1/2] tools: Add xdrgen
reproduce: (https://download.01.org/0day-ci/archive/20240820/202408201340.om7VEoQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201340.om7VEoQe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: tools/net/sunrpc/xdrgen/README references a file that doesn't exist: Documentation/sunrpc/xdr/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
