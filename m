Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78440A921
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jul 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197864; cv=none; b=CY2PuNX4K3igG5iStjryjGR4wJcgK1ZcqdY5Ee2fJ1dztKLV9f74EOyflPyFbYBHOc7nkRcX1flcXzsmbVoKIccZWQe9r6uXP9PS5jJJ86ZS3QpUGbaLRyZG7T2A9PmmwetzmiXkDqWkiKDV5sMhopTVLVZY9dNXsMdY4Yuq4+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197864; c=relaxed/simple;
	bh=rPa5oOGUjD3I0kwcRBprzZK7WqzyGq4sMH5zKLnLN3Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u0suFKbVmlc0Uld00/RF2Wn8WLjua76FraTBgSZwbqQVEjeBfeLBLKVxQcqa27XC00Fl2TF4xL7i394bBrWU2x5492WVMo0byocDdCMpN7Zsd9x0anoresm0xNspqG2+yZaVdGfbX9ktw3AD0R28c1oFhboDWr649keZswdwPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+M3TL87; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+M3TL87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784197863; x=1815733863;
  h=date:from:to:cc:subject:message-id;
  bh=rPa5oOGUjD3I0kwcRBprzZK7WqzyGq4sMH5zKLnLN3Q=;
  b=E+M3TL87KjPAA0Ptu9o7aUxifciRuNvD/jMXkChc3zPbJpRHDEUytDJS
   +3kxIh4TLi7EudnIfNdBG9Gg9clWo/wMvxfmav3KktBwX5pH3srcb5faE
   MOSNirIWmY2bsQeLkr9o4QByu89XcWFzCwXztwuIItbwrd9Vf+L1cJYel
   ZeQGTW2OpukyMQcQTLx6KgedklEGme8L1DbthO5q3mzx5iyZ9RDwJDryX
   iJkquKbGLiCit2Tvb6E79pHiLxHQQpFSvgEHaNZYplNoHbhyRvkWk5khc
   IrGWJSODC3oF7cQjvYwV5+d7IGiV//ozTmTOdAGb+fwmcI2jIywAGRj0F
   Q==;
X-CSE-ConnectionGUID: LFSf2ZhsT+qRtMJqLUSWwg==
X-CSE-MsgGUID: cdTeE8a/TcKzWfs1J3Pe5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84633523"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84633523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:31:02 -0700
X-CSE-ConnectionGUID: gCvKK/CARBymtbEEiExVgA==
X-CSE-MsgGUID: XN4qTm11RiWFX0H0rqkqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260765340"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2026 03:31:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkJMl-00000000OgY-18GA;
	Thu, 16 Jul 2026 10:30:56 +0000
Date: Thu, 16 Jul 2026 18:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __do_trace_initcall_level+0x40 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202607161809.9RG85RTG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steven,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58717b2a1365d06c8c64b72aa948541b53fe31eb
commit: a46023d5616ed3ed781e56ca93400eb9490e3646 tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast
date:   6 months ago
config: xtensa-randconfig-r112-20260716 (https://download.01.org/0day-ci/archive/20260716/202607161809.9RG85RTG-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607161809.9RG85RTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a46023d5616e ("tracing: Guard __DECLARE_TRACE() use of __DO_TRACE_CALL() with SRCU-fast")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607161809.9RG85RTG-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __do_trace_initcall_level+0x40 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
