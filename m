Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F81B415F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Apr 2025 08:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745657691; cv=none; b=rQo0b6VqURec3Nk0NMKA4A7M4hQoc8dE6fIyEzJekcB+Vmd50QLerOn5gPQ2JsfoaYIl+kA/3zK1bVrM1IRxN5qPr2XU2e1DEtbb9rEed03Ms30dEud8PDEKBnAOvKiAq8ROr+aVxrbB8l0zv7SfBHzoVyq0SvpYvK16BvYu4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745657691; c=relaxed/simple;
	bh=s7kevVmE4hen9Evty3NpyfoQ60pX21o3uEWG7lg3mKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TypTmAl3xE9XNa/kBPQdl2P3BIDJ75rYGidvNpxFLrcId6csID+FCLg0tRHdepPPBoH8+L+XKsHpR5FxgyUpP3zvY5wcV9h2gYLoVlqO+6aOh9GmzmVwqGN6EbmwGvUKa/SYn4NeSPVx3UJHIxODkl/cquLSj/45nYVmIwFbjYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRiVlVqx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRiVlVqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745657690; x=1777193690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s7kevVmE4hen9Evty3NpyfoQ60pX21o3uEWG7lg3mKk=;
  b=CRiVlVqxQ6miw/2Vuf67fYxxQf59OfI4Mhj8Vr5t8+2VGq97NjVviRGp
   HlMQEpk3iMKFWIwqfdgjJKiRaT1XAGUmNwwpKwOVvOl/vOFqlwDgyc8fL
   vqzyoJv15rvjG7SVSrKv8ZFtVTRy8WrdjGTrqlxxcYSmpw0SbQGSPall6
   0Idt85u2+iIGJeW6JUQhoFE1kJDD9EQt+xGv/EJNVwAPfcjYKBV4ywRvc
   Bz3BBUpCTSaSGxVbl/IUEbAIrQ/vgmFSxuyq4kjhMjQUJz4a76z7F9AOt
   HMwIq79yZdVABSJ7LceUCh5b3UcjnGhngH6XK0AsHiXuhl2ii8K65Zm3K
   A==;
X-CSE-ConnectionGUID: W8jdjfVjQAqRcf8dzf7k6A==
X-CSE-MsgGUID: Rksddo2iTyWqmSp0dYkRfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57957782"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="57957782"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 01:54:49 -0700
X-CSE-ConnectionGUID: j29CRLpWRvSP5t6hS6Fnow==
X-CSE-MsgGUID: ry1AqL3dR1eT9zzm4RDeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="133616640"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Apr 2025 01:54:48 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8bJ7-0005mz-17;
	Sat, 26 Apr 2025 08:54:45 +0000
Date: Sat, 26 Apr 2025 16:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [drm-xe:drm-xe-next 1/4] ERROR: modpost: "__moddi3"
 [drivers/gpu/drm/xe/xe.ko] undefined!
Message-ID: <202504261628.EDuMMQs1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   238ae3be582070aedd91c75f07483fbb2a77fc45
commit: c4a2e5f865b7230a9565c57c54b375b1d2ce82f5 [1/4] drm/xe: Add devcoredump chunking
config: powerpc-randconfig-003-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261628.EDuMMQs1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261628.EDuMMQs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261628.EDuMMQs1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
