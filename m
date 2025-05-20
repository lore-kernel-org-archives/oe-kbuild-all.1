Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F6D2517B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747753747; cv=none; b=nE1bxAU1nMYUy6Nak7VwZVsKBw+4mdK+cWDoNy9/UGnOGndY2Sig3kUdarCp/oaqS0zdMUTk8OK2DADQlujsCSkwYyYJoDTDccZaIVlMDowHM59nZ7MZ3DnW12vqxm8140VVY2jTKvfzv8hJeNAaR7hu+et19KC3ND6mAX2PdRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747753747; c=relaxed/simple;
	bh=YKf24ia4AgUBUeEINtv1UCvaAZU/f/1L8iJcRbOgnao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEQoItvudi7igv+4oV/ET6Mcg4eeWp8pxfE6/8a5X1E2aPPtRObMo3UrCbMk9WEhH+6Q4cI+MC1UKck52EuiZNZzwbZ+w7wGdI2vLbxi3EPsoQglPK5zeBApvz5wHZRxAZnr7Hm6w0WPaPiBUbElIFdzYDzLi83tjRvODuyGl6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exwFibt9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exwFibt9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747753745; x=1779289745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKf24ia4AgUBUeEINtv1UCvaAZU/f/1L8iJcRbOgnao=;
  b=exwFibt9LIzXSnf9DiX3kss5mSKWpz5P2MKvufn/BBjzB0Zivw6Hedrd
   4+N38msThb154ld35AtOhsxvREOVC7FBwNDa+Ysy7/BMfLLWelY8ieSLU
   2E6GlyPRwnDSQKG4wpflcDsOj5S37L9nk0/U53pEQae46WH86Wx9XryAZ
   0AitA0yFj9W28D+Sba8MxuHpLf/uIz4qXuPzcAACYwPPYCiQe+T9iYj0l
   759LZblaKQA87PQMZhcN68XjkMS9ah8eyhhUQJSjJy/PGAs3ktyPAzSGA
   G1yYgTAl92J8Fqeu0WlwySaZIkobJX05bO7FVSxN1ZwdYWtN7D4XB8yQJ
   w==;
X-CSE-ConnectionGUID: TaPQVYlhQ7eXmZsOC+z6sg==
X-CSE-MsgGUID: qzmIra6dTauV0ZleK8ijwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49848592"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49848592"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:08:59 -0700
X-CSE-ConnectionGUID: QnputxagSdC4vpPmcYmhAQ==
X-CSE-MsgGUID: p6zSGIueSJadaMDzJ8RvDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139760220"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2025 08:08:58 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHOaN-0000z9-39;
	Tue, 20 May 2025 15:08:56 +0000
Date: Tue, 20 May 2025 23:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-05-exp 1/1]
 Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring,
 error parsing file
Message-ID: <202505202326.NFvnzdDO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-05-exp
head:   318fd288f5897bd4bfdde5ba64cd16619c9f2c3a
commit: f51d1788938f74dab42d10114f59a836b44d1823 [1/1] ANDROID: dt-bindings: CMA support for Virtual Machines on Gunyah
config: arm-randconfig-2053-20250519 (https://download.01.org/0day-ci/archive/20250520/202505202326.NFvnzdDO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505202326.NFvnzdDO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505202326.NFvnzdDO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/firmware/gunyah-cma-mem.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: fsl,liodn: multiple incompatible types: uint32

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
