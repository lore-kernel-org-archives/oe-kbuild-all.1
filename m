Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9031B0413
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765559420; cv=none; b=bRwTDKBWJcTS6ZEFHBsbMPPMNa9xPhm7I4MJBpp5u+6j+GwkEl4MVumOOZxQjP2J57d87SO8G5Yagb7BO5sfmmaJds+/F02W37K5sIykggYSo2Rh79Ai727diCn8EPdIc976iFecbXxCDrZNNL8f8fo1/wc2opF/+ejw2MT6SAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765559420; c=relaxed/simple;
	bh=FNQkYgNNyE9tG8Aq++EUVYCgncIaN9trZA+Nv10ADDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCX17DcdAHZdqw2zuKu1WaBz5lFUVTwCz2dx1ASyrTli3B2oOMYUo4A5Hxw/1pU9+dIEqfsCKBYfgSBQWaM2qUEr8M81bNYqijjnKdkjsShwIXgXFvpabU2lSN4USRhgAgdMBjYYelJuwypHMTPOHCZL+0nfUTUKxyUE7gGul2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hc7qlmUB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hc7qlmUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765559418; x=1797095418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNQkYgNNyE9tG8Aq++EUVYCgncIaN9trZA+Nv10ADDY=;
  b=hc7qlmUBUv9jK3teTmvZizGbrcADl1K/43M8/czT4Fu+vOL7Xb5euO10
   ZgJ6DQX9ngQZBQjDM3zI9ATsC7uYByS8+UXdiHYTuXKOJWH24H8tnMe/e
   1rbguDrCygtwRJuM2GwJADvY6b46Ih7djtIROrUBYqbUG95ZSteBRNpJp
   w3Y67VKydwRvk6SWriMkqLapOypGWeGqYHcXmfjIN7YAjHuHzKDymXsgS
   lPsGnH+nJVcxaPpT4Lb2rX8n1nrKZXyYMYejmjgUWMwELrE4dWGLtfq0g
   9nBn6kNCFMqRXU1qN2/a2uIG3wImfbqdESVtlpEI1waBDbXFClvMnyM8v
   A==;
X-CSE-ConnectionGUID: VWDQToA4SFassrmdqrLq+w==
X-CSE-MsgGUID: JE5YqgCHRiW82ftxVRLW2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67508596"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67508596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:10:18 -0800
X-CSE-ConnectionGUID: 2KfstLrcS6Kp1yoINPAmjg==
X-CSE-MsgGUID: ycmXok6VSoiVm1rXbV38BA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2025 09:10:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU6ek-000000001lk-06bU;
	Fri, 12 Dec 2025 17:10:14 +0000
Date: Fri, 12 Dec 2025 18:09:46 +0100
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Antonino Maniscalco <antomani103@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [drm-msm:msm-fixes-external-fixes 8/80] htmldocs:
 Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2447: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202512121816.8VLXwMx2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-fixes-external-fixes
head:   185e9bf178097f5580b9b38d940e638326b62797
commit: 471920ce25d50bb39bfdaf3c3d9bc9dde30fa265 [8/80] drm/gpuvm: Add locking helpers
reproduce: (https://download.01.org/0day-ci/archive/20251212/202512121816.8VLXwMx2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121816.8VLXwMx2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./include/drm/drm_bridge.h:942 struct member 'hdmi_cec_transmit' not described in 'drm_bridge_funcs'
   ERROR: Cannot find file ./include/linux/hdmi.h
   ERROR: Cannot find file ./include/linux/hdmi.h
   WARNING: No kernel-doc for file ./include/linux/hdmi.h
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Unexpected indentation. [docutils]
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
