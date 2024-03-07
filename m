Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3280136663
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709840301; cv=none; b=cU53xkK+x+JyzgKp3wW2NOXfLikv7NkGhfWOFpdMpDPK+b7KWMT77YZQDEdmyD3vjNLz+28NPLsvbE7b2z5aM0kagUM/IOtVUJVjJ4/8SZPaeSKGxzNJ2TrwmlR2tp1K097kHSAwqKa35hJjG37920pGSbUuvsveP80ew1KY1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709840301; c=relaxed/simple;
	bh=5yNu7USQlVpehCC2tiOvsJ0CW4B0Oooh6dQckwZ3LQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukUVIUBRL1NJrfwp1sjIy9LnpmgVXXwOIc9OLWMompU4MRqwZDJJiN6FUjUX1cJpP1sI+RM/YEZpiG3z9fCEQsevFOGaEkf1niNjTJxZpFSDFQb30XcqhiKlO2fctLUXGWk1L3Mxcaoz0AWwidDVBSRxVhqx0mLkmSDsUAm6fvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXbx1fLw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXbx1fLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709840300; x=1741376300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yNu7USQlVpehCC2tiOvsJ0CW4B0Oooh6dQckwZ3LQ4=;
  b=QXbx1fLwJ8xN0xIH32dEyeMZaE1duBN+nz/mRcS4uvvU9smUNNqL/zbM
   rG4zHUEtrGs9N1rDglUw6gMwt/yvxGo2qG8SYr2rEoNPJVVPET2foQlZI
   99h73cpJChumnxerp4gWle5ehVV02Re8SuETQn+9bOWQQUCCD71OQV4BD
   jdWlJSPxcY3Vph2NPRf9K2YjC3yUJ3rpBe6l0dqBmmArhzTKnZUKn68Oc
   uOpXq63qDTW8HS8jbMVGOtJaGSoEn8C0roOCdIaVNyPEn58mNCOy0EuEn
   05lDaya+GB0Ygllzq5f9goAmRZZfXmgLJTkHbVsLwMpoXa9EkuN1TERZ5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4412067"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4412067"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 11:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10657802"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2024 11:38:18 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riJZH-0005dB-2r;
	Thu, 07 Mar 2024 19:38:15 +0000
Date: Fri, 8 Mar 2024 03:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2023-05 2047/27432] ERROR: modpost:
 "virtio_dma_buf_attach" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
Message-ID: <202403080305.41BX1qsD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-2023-05
head:   3a023c6c8036e1663e1171da7730608da95b6194
commit: e03a3cf3cc429a2770817a1721bda8946a8c3989 [2047/27432] ANDROID: GKI: Unhide VIRTIO_DMA_SHARED_BUFFER
config: i386-randconfig-061-20240306 (https://download.01.org/0day-ci/archive/20240308/202403080305.41BX1qsD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080305.41BX1qsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080305.41BX1qsD-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "virtio_dma_buf_attach" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
>> ERROR: modpost: "virtio_dma_buf_export" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
