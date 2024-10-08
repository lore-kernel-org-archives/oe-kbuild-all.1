Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874D413AA36
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 05:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728363998; cv=none; b=uW8cnRGFo/lWqUc0vdD0irTlHHm1Ve7EATN2OrunGI5RHmBWIBhchBSnrm1H1NdDaNGBvgVCS4/m+lQGZPUZXJ9kQ3lGon2oS5kIY+aKd3U7Y0cZTS8Z7rjOQMfaZ6JXFUi9EwS0VSqoGtv51P0CgVgdOUce0Q3mfqei7HzSTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728363998; c=relaxed/simple;
	bh=Ur+yOcH1+O6rHIPeONezjTrmAHaBDgC0kVHVgrBRXkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+ENhIZRpbH8LlPqtYQgwngz3bJ+DJM5JzCN1XcmSZDIkdTivuF7YfH8+r/B4vCS9ScjJe0q1/fy4qqGABl1/5QFtWWP1ghD7GQaDeCd26RrLJmqf4vwBJ46AvQOHug0iptPTotaobRGUFigDD8JKhKtbY648BWh08JO9sDqJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRayE2lP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRayE2lP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728363996; x=1759899996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ur+yOcH1+O6rHIPeONezjTrmAHaBDgC0kVHVgrBRXkQ=;
  b=WRayE2lPh/251Iq3s+NkUoH56i0bfGrlNtQUG4zraKq2XvMXvv289dmV
   zN6iuvejVs0+j8f2F11XK0uD52WsaxOv0k8dcd1ivrXXtGk2JyIz1wy+F
   JNQRRbBLs6Xlg4uVn+IMXa1e3cnk9FkSMsiQlNkAOBqOhmODPCyrmTSHU
   6MSrN2O+QtvmTSifXhwxfNNtXGf7ZzgKvc6Zzl8F/gLsr/eTgEZFOTJ82
   9hJWokvfm9edMXuUt8mxqhjydVrHu5nzLrxaBFDF97WG0rhC2Z9Dkh/cg
   EYBYoWK/ElUfFVN7mgPDY3pKeH2C5oWyDJe3S7uJpn6X0VW3j/RpQexPP
   Q==;
X-CSE-ConnectionGUID: E/GWAMURQPaunfPL2Dxeuw==
X-CSE-MsgGUID: jEfmK9TaTIehjyVQ1wOHgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31234332"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="31234332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 22:06:36 -0700
X-CSE-ConnectionGUID: yHHUtnMPRXi/txhiTkbhwg==
X-CSE-MsgGUID: x6wYFKllSHOT3Hm7TmDYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75713583"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Oct 2024 22:06:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy2Qa-0005vE-2C;
	Tue, 08 Oct 2024 05:06:32 +0000
Date: Tue, 8 Oct 2024 13:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 385/2483] parallel-display.c:undefined reference
 to `drm_bridge_connector_init'
Message-ID: <202410081208.M2gTQiUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: 61b86391fb5d7b9cad35169b1660119754a01134 [385/2483] Merge drm/drm-next into drm-misc-next
config: i386-buildonly-randconfig-003-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081208.M2gTQiUX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081208.M2gTQiUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081208.M2gTQiUX-lkp@intel.com/

Note: the linux-next/master HEAD 58ca61c1a866bfdaa5e19fb19a2416764f847d75 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
>> parallel-display.c:(.text+0x21b): undefined reference to `drm_bridge_connector_init'
   ld: drivers/gpu/drm/imx/ipuv3/imx-ldb.o: in function `imx_ldb_bind':
>> imx-ldb.c:(.text+0x4f6): undefined reference to `drm_bridge_connector_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
