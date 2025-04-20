Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D746A1FDA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745150382; cv=none; b=oTAFgJJGW3L7sD50If8oicuhlj/sD0YxvFIhc/8fShlhcKVll4h77lFgB7Oz/779kKoq08qDHRiQ/JdLddMe+vy1PFJAl4Rz27hpMM6p6eaZctou4KOjThlbj546epksMwFH+yoQYvhceTy/UatqLbmcaCMoV4ijBHuZaIEWYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745150382; c=relaxed/simple;
	bh=SDFgY4DJa5fO4q383a9DjBhSqtmeZl6suIwJBlbmOBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gGhxLamPFStaB8lVJjnhIYB3Q/ekGEka12wcgl61OhfE28TRZpfr4ZP5mceoVPMaKeAShIBJPHNkv/SWAq6mqscnjo5LzQGmgSj40EvjSEcLBd8L95svrazCH2tNsjGNsZYj++eYzYU1JzgL9OrQq2xVcIikcEqc5iAESNscKXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IA7CsQGk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IA7CsQGk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745150380; x=1776686380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SDFgY4DJa5fO4q383a9DjBhSqtmeZl6suIwJBlbmOBw=;
  b=IA7CsQGkVZzK/Acp9YV3VDcPcHgYVca8gljDn+NilHjef4jg+G57zbn1
   s5DY6828tCIcvOL2K6nRbLw2QdVw97VEpVWmAASNkvOchYtP89HHCnnTB
   3MwKXozifUsUacMjSOoJRRWy1eILA8P6Gd7nVRH0/M5iywti3kq40tOUh
   dQljTIjeH9cQqv5vU5oTk6l4YJ6cRDmQJ8APab+AYrPBpWxGSiwncnEns
   0Ry0DedEMK9oJWft8zYt4Kv7C00bjSEK57AqEZy277fi9Xg8jv4O1FZqb
   +9stNj+4BLyac9y1MMVlkx1Mx4GUvEFq0zWnouwAAmt7pW5G+mGhLGhDG
   Q==;
X-CSE-ConnectionGUID: iu406+XxQmeUzu2T1Z9t7w==
X-CSE-MsgGUID: yM40qO0tRemBakwCQ/26wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="57696280"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="57696280"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 04:59:40 -0700
X-CSE-ConnectionGUID: Hj6hCeXMQiOALRyM/0prwA==
X-CSE-MsgGUID: d9aaFKGWQw6il3IKnPFjig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="132062688"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Apr 2025 04:59:39 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6TKi-0004bt-1F;
	Sun, 20 Apr 2025 11:59:36 +0000
Date: Sun, 20 Apr 2025 19:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/e820 20/20] vmlinux.o: warning: objtool:
 setup_arch+0x7ee: e820__setup_pci_gap() missing __noreturn in .c/.h or
 NORETURN() in noreturns.h
Message-ID: <202504201906.A9ro22F6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ingo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/e820
head:   00188fb1706a5b13228b766cb47dcda740319a86
commit: 00188fb1706a5b13228b766cb47dcda740319a86 [20/20] x86/boot/e820: Standardize e820 table index variable types under 'u32'
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250420/202504201906.A9ro22F6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201906.A9ro22F6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201906.A9ro22F6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: setup_arch+0x7ee: e820__setup_pci_gap() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
