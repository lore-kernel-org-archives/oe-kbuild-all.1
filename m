Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA02E11BC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769935370; cv=none; b=ttmC2INU6iUHnLQWjJDxtE9/+Wpvl7Ae0rBUs9Hh9DtKWU3uK3ybSjRn/VAyiLNPKvClpasE6JT0ZZ5KBYuKsdB+FMs0wTdOSBWhsOuvxuw8ds0Ac50rwmv1Jf7jMaTLiBxYHxtIIuOeHMpb8gi6BS27RYULxVUtWdI3TzNQfsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769935370; c=relaxed/simple;
	bh=5V5i8Iqgl1oqivLkAmA/UZGnjM81lIy807+iScBoO7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oZfJGl7/j5dVpq7mjdKGs8wdD3GHtXChh5zRiHECINuGpPNKxCvcd8Qj+lshlHsEn+SAdULI17+HEElp/3fbUcFOmX+NC5CWkQcQ2zGQj7zmca5hAWNrStsgeXKAOGwTZghk1sMy+B009kqSvHPQ9Z7wouI7UdXmSD3t19ar7SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IeKGpfRn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IeKGpfRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769935368; x=1801471368;
  h=date:from:to:cc:subject:message-id;
  bh=5V5i8Iqgl1oqivLkAmA/UZGnjM81lIy807+iScBoO7Q=;
  b=IeKGpfRnhcrtiFxMILqsr//hg0M6Iyq5tHZU9j2OYuDvKiygcDXDrq4f
   esJH9CbqzoB63a/WBj4Afh6b85RaShm8r35ml+Bns+r7+dPaZ8M4oQOr4
   DOY4+zQdGnSMQ+9kMv87Rg8Hlp1K9WBug9IWKE/iGXSD1kqG4Ceh9Paw5
   OyJAXNK6h0dRXQ86tmxx3XxJSsh4DWaqcSjbu0vy5szXZancwvVM6QJyI
   bZQkSVOD+1SnxBpPDnP9A3dLOP9l7gZX6pTC7EEm3fWzBKphnT0sf/tYi
   o9/xhKLfAmuswgD1KxRz8xVqh2XYIYK/PsvygC5N7o+hkqOc3nkz8ikOs
   Q==;
X-CSE-ConnectionGUID: oIjVbETcSjO2GCZI4qDh7Q==
X-CSE-MsgGUID: MIInMOXLSmOuXA6QH6g9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="82548848"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="82548848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 00:42:47 -0800
X-CSE-ConnectionGUID: 7IH2kYRGRPuMhGw/a3Zytg==
X-CSE-MsgGUID: 2VoFg68xSBGm0lHhMqWZ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209617695"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2026 00:42:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmT2Z-00000000efo-2z7w;
	Sun, 01 Feb 2026 08:42:43 +0000
Date: Sun, 01 Feb 2026 16:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4-wip 8/21] kernel/bpf/core.o: error:
 objtool: ___bpf_prog_run+0xd: ignoring unreachables due to jump table quirk
Message-ID: <202602011607.BVriBi3X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4-wip
head:   2b63aad2629c6c635b749d6de05a4d20fd29e3e6
commit: 97e1889365cf61110c72c1d25695e378089c9343 [8/21] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-014-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011607.BVriBi3X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602011607.BVriBi3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011607.BVriBi3X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.o: error: objtool: ___bpf_prog_run+0xd: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
