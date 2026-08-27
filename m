Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327FF4DBD8A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857671; cv=none; b=DdP39bsIa9hr3sNRStshly3dGFybw6TBm+GMFcOETp742OqICcdJKtt0r/YoorbDV4cd5M+/m41xcWPei+Zgz+DA4zHR6wIAzcBxT6oRK04eEJsif5Mc7+Q2RBR/qyhxlqutIL+WfaN6p5E5AUZCij1/hH/RhEOQUhXkdXStp5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857671; c=relaxed/simple;
	bh=RUTNOVmZrQnuHBk71EBrhQtxHU/WMxqmShwK0PP+fYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uTrIRTBAd4GmopoycPCX/L/Z1Lk1F/eRlvfSVuHipztV0kT0cjr28TpQsQIchIuzZmEGJxKVbLKWD7xLLVeqbgjui/LNLWtw0a+9EwbHOI4zniwF6kL2jxauvF8xFxXvx0uNL+Y3cvyq0gj9E5ZwCAOphbJTGpoWwnZM8Lsxf7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6EwShEy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6EwShEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787857666; x=1819393666;
  h=date:from:to:cc:subject:message-id;
  bh=RUTNOVmZrQnuHBk71EBrhQtxHU/WMxqmShwK0PP+fYE=;
  b=B6EwShEyUvJ2Ken9j2OuEkJtiB7Gi/gopzFSQ0n2o1LQd/ovDhfj/9lw
   7qENkVWJH7Ac3UjUbdruvgznkUTK3VeWdRSPfdBIutuuWeflWEGwZftV7
   3CtD5IFbHxai5Ggjvr5maHZw1+PpjSxbzyMfdXW3R9lSZzFDFd/203J1w
   lBZxUBEM8u+lgrewW5UrinjD7LqSUezDGCa3gy7kBxFultMglwO48xbbJ
   TBe/EQHE9VAEJLQUk4a8sG674KRUeRlre0qzQP5f5ghln0SzW9O8hyuFD
   /9OTRYBXOjV/f0ZDjQopIvBtD0x3uih/4zE2egBVdAo4MvUYwdUwpToRg
   w==;
X-CSE-ConnectionGUID: b0kNYsqLToyIZ7erKsyReQ==
X-CSE-MsgGUID: eF5dQbx8SoWJqzV2xdXTzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="90881856"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="90881856"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:07:42 -0700
X-CSE-ConnectionGUID: i1mkiSmnQCmFN4RvwEO6OQ==
X-CSE-MsgGUID: vdK+XjVjSL6yidKqscFZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="265362411"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Aug 2026 12:07:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzfRp-000000009wv-3vpe;
	Thu, 27 Aug 2026 19:07:38 +0000
Date: Fri, 28 Aug 2026 03:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:noreturn 25/26] vmlinux.o: warning: objtool:
 xen_prepare_pvh+0x187: mem_map_via_hcall() is missing __noreturn in .c/.h
Message-ID: <202608280214.c28GlIx6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git noreturn
head:   cce026d22bdcc6f946c07c58381bc8cc59b6d270
commit: 3b2a8f0dfeed86a0227057d4caa2343c83e3b070 [25/26] objtool: Annotate all module-exported noreturns and remove noreturns.h
config: x86_64-randconfig-075-20260827 (https://download.01.org/0day-ci/archive/20260828/202608280214.c28GlIx6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260828/202608280214.c28GlIx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608280214.c28GlIx6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: xen_prepare_pvh+0x187: mem_map_via_hcall() is missing __noreturn in .c/.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
