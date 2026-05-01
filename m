Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20220E030
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777611508; cv=none; b=lYkae2rRyMdFsauMukzn/wHcZ/aUki836lUbfxgOwbwvyngYmTrF5z43Pt//xCPg5US65Lp9CuI7P5/cxIlL/GvMh0++a9Gn1LVZecTGo9PL6aJx84RENOQci7mJQs6mF4nM3oY6YKmlcIvHapIgkkFYkCqdM6GxNFMVD3aYU3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777611508; c=relaxed/simple;
	bh=kbwr8NYTMcykbk2SDB1GQ+h/pmBruvqH5vNXsGzBcQ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C5PomFEbU3hXq12PUQnYkqJk+7cR/qYDinh0EHiZ/rNpSw36XaD8FgOqFHkQ4Soyt9zUbdmP969+CRwO+CHDjznJKq0T1MhczDTNr/WnsCKpDoIKeB71OZWwgx0zfBfdRGOLgj/Vu/XbHpuBO1g6KfNPLYHKm18DWcZIxci42+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/9wsJAq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/9wsJAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777611507; x=1809147507;
  h=date:from:to:cc:subject:message-id;
  bh=kbwr8NYTMcykbk2SDB1GQ+h/pmBruvqH5vNXsGzBcQ0=;
  b=Z/9wsJAq38XAPr3GNV90aOeEhh3brp0JSt7ReZv8P5nl07Pk534f4rzR
   o5kj7hQbWrg92RwU2t8rkmQWNsWonmXxQuK2PHv6zAt+LKVpivN3WLy9h
   HUvVv/CNNRXAAVOcgga9gU8Hb71yg/jzUUTdSANSURJ7HbI5cKhngNURl
   my9fzUz3dAOipqOPec8R35Oo+U6JC6jZ+KNeYCmi6jmjZLcjxk6MTo5OL
   Ikp/3EcUEid36tKY+0ryspYAK8V8Cpa00YDv6bBejM8RbpXoYU5LaVYo9
   x32q9IDPqWTpR8lxp3rttwPxHNV+01yUWYVniTfkcfu15zTrPTfT/47BP
   g==;
X-CSE-ConnectionGUID: e0LGjnV+S1GUBBc8RKOsPQ==
X-CSE-MsgGUID: TWWAisRqSIWOkHsoBeL7+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="96141897"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="96141897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:58:26 -0700
X-CSE-ConnectionGUID: L6EQWRWARFmob1yRumCr0g==
X-CSE-MsgGUID: Tzme584EQMWaIYms/eGglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="232135862"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Apr 2026 21:58:25 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIfxG-000000000Bp-3g3y;
	Fri, 01 May 2026 04:58:22 +0000
Date: Fri, 01 May 2026 12:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] kernel/bpf/core.o: error:
 objtool: ___bpf_prog_run+0x8: ignoring unreachables due to jump table quirk
Message-ID: <202605011258.Jp5nMnDP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   9a6d85275cb1def4a196bd5c757f22c4e21f1d0a
commit: 07c6fcc0ac3d793fe9ee0b7a8a1b8b636e8881ba [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260501/202605011258.Jp5nMnDP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011258.Jp5nMnDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011258.Jp5nMnDP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.o: error: objtool: ___bpf_prog_run+0x8: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
