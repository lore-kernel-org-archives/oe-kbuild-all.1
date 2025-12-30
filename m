Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E22264A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085195; cv=none; b=lQQ0PWaR9pC10EL+VpuAsCLf92CNrj8jJpWlNwB0I0PuO+lfNSc9TX7I6qYGkn/2Ju3jrUPObUvFKyGqW6Vf1Pdho+1J8f/DBmp4AygNrTks7Sn7Ohsv4yUaiMIxFoUxboogYSdPVMAh2G2BWK/m7PBCGnd4++cgo533WDDFSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085195; c=relaxed/simple;
	bh=t4k1gTBKusXwu9nYo3nVEMVaJUCnprScuO+nJReWSD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=APt3yEk4nepu4gDJFyoaBtZ5YnljNn3Vvg9YI+SDo6dCN+PhW/Y/RzeXMLQouXtGAsrovia+MVYpCCr6z4QzTuOQlZf70DMZgWMmuP/t4WRXqrN7NBJfsYuVtiIhzDTp0/czLOcghWxeWIiAIlYS0gsNbFqyKbM+dOpFcsMbTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imv1w+To; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imv1w+To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767085194; x=1798621194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4k1gTBKusXwu9nYo3nVEMVaJUCnprScuO+nJReWSD0=;
  b=imv1w+ToQy0L/xUvCJ23V4+8e7R0frKb8higr+YranANkmtYE/1i5p8/
   N7IkgJSLLqNGIUBTC0pur+btXXnDYAgVK9fQxA4uc3HqIe95aPmM+o8CP
   uIHNswq5cjAljC20OlJCYiUs2KUMHH8FwVLe4Q2eXs/CClFL8k1XHeTF9
   77Lg20E88qLZAhgepzJvwfrNH9dCIlnn4lLNT8B1ZEuH1T1rxSX6arFMk
   5CxQnNXtF1BpAj0tiKKimEdK59Jry4jwipJmnvyyNxm/OdLpTiQVCDOm2
   6hp/9TFHJvgRXciqbMpmGm8Vc19cwBi/8cas3WKIHAlTeCUayQ1cDPuyn
   g==;
X-CSE-ConnectionGUID: 95Sgz40WSKGUfOFCaSaOeA==
X-CSE-MsgGUID: MyhiXi9HTySJH7VL+baGnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79795840"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79795840"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:59:53 -0800
X-CSE-ConnectionGUID: dIfrPpjZSRGmtW7RQJsBPg==
X-CSE-MsgGUID: 9MXhDnF+SziWnoXD0UZlQQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 00:59:49 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaVZz-000000000G1-0ASq;
	Tue, 30 Dec 2025 08:59:47 +0000
Date: Tue, 30 Dec 2025 16:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Ville =?utf-8?Q?Syrj=C3=A4l=C3=A4"?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Warning: drivers/gpu/drm/gma500/framebuffer.c:34 function
 parameter 'info' not described in 'psb_framebuffer_init'
Message-ID: <202512301603.QAlZ24xe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 4a792c59203b650b90ddbc36d055591a1547ac5c drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()
date:   6 months ago
config: x86_64-randconfig-073-20251230 (https://download.01.org/0day-ci/archive/20251230/202512301603.QAlZ24xe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512301603.QAlZ24xe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512301603.QAlZ24xe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/gma500/framebuffer.c:34 function parameter 'info' not described in 'psb_framebuffer_init'
   Warning: drivers/gpu/drm/gma500/framebuffer.c:101 function parameter 'info' not described in 'psb_user_framebuffer_create'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
