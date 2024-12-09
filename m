Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504F15854A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718317; cv=none; b=jJHWg9F8zLgSPc2o6026Iss5OEXxRk3w0dKsGLHhY6rzaXQsIyh25q2FKYXOUmXFyP82OuwSNJ//eSPV11EaYiptGKqYv6rDo+hQHVNENgeKBZkjhk1ZhZdaagTVk3zGJ8A3T52Qy6eR/Uz5GwpRGv9AXzmnjCD68P6NDmtPdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718317; c=relaxed/simple;
	bh=D7nzjFaTJUBFAStLxGRlgzdsDRy2AwukIQyk8YpR074=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2pazd4TB2dUNkubP+ZiGmsGr3shjfNZfS6EWMgAbYBxfhn1VaWRcirqTEVBRO5TZgn2h4CYYXMTvRrM5GE4jCDuLWjIcTQ9FD6YndLn/8RZx+ZKouxn7bA0YJRYVkmkgnOqFVXeDORGCc8cKysxNNRU+CjSqJz3WH8y9Y+IUfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3iWBMCr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3iWBMCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718316; x=1765254316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7nzjFaTJUBFAStLxGRlgzdsDRy2AwukIQyk8YpR074=;
  b=i3iWBMCr9Zi34ehP/FeCk4xHvs8hyJ2/CVWnQjPGusmXEncbwnA4Wwbp
   APqxu5/CiIZJ7N9dh1BGqLhyVPjs2OunZk7YDZe4mQPaJmnchtd/NO88U
   lERPZAYYwqKC0sIAlQx5XOjmo/eLOND20avIEZqzf3yb9urI+TruNam42
   zx0qqY5e82RvM3bDg060tmapU1GUc99C3xVi9GHtQw3D0b9EBE2g7eaUg
   k4sLpkVkdWuU/03Y0wzvWA5mNAUSo73nBlI30G5QOYikBgnhe5ekZMlhm
   DASdvpc1UWSDSVNCAbvVyrO+Bh5zaP+BWlOcrZ8hohYx4iYYTUytqSp/g
   Q==;
X-CSE-ConnectionGUID: NL5n4hf7Rx6hPCHME/T+9g==
X-CSE-MsgGUID: cY6Y4iiiQqKbTMdwOuDMCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45380097"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45380097"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:25:15 -0800
X-CSE-ConnectionGUID: 8M6Jn5ooRF2gMaVBbC/pyg==
X-CSE-MsgGUID: dbAW+J8QSlyR3Zjc4qqsxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95155699"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Dec 2024 20:25:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVKZ-0003qe-1M;
	Mon, 09 Dec 2024 04:25:11 +0000
Date: Mon, 9 Dec 2024 12:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 52/84]
 Documentation/devicetree/bindings/thermal/mediatek,virtual-temp.yaml: $id:
 Cannot determine base path from $id, relative path/filename doesn't match
 actual path or filename
Message-ID: <202412072327.l2IXQv5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ebfb3a7ab8a9ff5202e3d9aaf3156efc9d82d36c
commit: 1304d0d174280bd1c76d27705fc663ce26b0431b [52/84] CHROMIUM: dt-bindings: thermal: mediatek: Add vitrual temp definition
config: arm-randconfig-051-20241206 (https://download.01.org/0day-ci/archive/20241207/202412072327.l2IXQv5n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412072327.l2IXQv5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412072327.l2IXQv5n-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/thermal/mediatek,virtual-temp.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
   $id: http://devicetree.org/schemas/thermal/mediatek.virtual-temp.yaml
   file: Documentation/devicetree/bindings/thermal/mediatek,virtual-temp.yaml
   Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml: flash@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
