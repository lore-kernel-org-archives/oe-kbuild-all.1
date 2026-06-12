Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88593CFF5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245843; cv=none; b=Z+8cTHeA+Vp0hmdmoa4IEwuv6aBZ5/V4GrjXzTx7h4QsgDNBktwnw8QVR3hooTephmK9tyVksRO/zjf1PfX/0Qst1lsVFkVUm4ihc0mATCsQGsUag5LelApq92AYQYfSGsHWQ84aSw0Suk9Swt3+XnaJYtZDX4ixBXBrUA4rW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245843; c=relaxed/simple;
	bh=YRx8aKRjTio++TE80EvWixgZG5P1SEViiJV2QhxnzDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e+7WS5IS0w2n5P7b7i4nY7njh57L2fbhTfAztAyT9JdKuPSahF/8oUde3HEA1FeMS+jyvGwvmSwYJd+XPgc4v9Oi+O9faEQZ68ZxKAUBlOycQMYxdtZtElEGzY5ix9keuSjoYe5zI8ag6s6RcPnR54xLdlQYLNAsNoBRvaIUFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJaG0PDU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJaG0PDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781245839; x=1812781839;
  h=date:from:to:cc:subject:message-id;
  bh=YRx8aKRjTio++TE80EvWixgZG5P1SEViiJV2QhxnzDE=;
  b=UJaG0PDUAzHGJ5oFr/t8KAyc33nEb7uuNpcWXuGZj098Wf5WMV/O18mz
   XYgzWlVqA+Sa2JND1sU6yDRFI++1gORQAHJoS+b31hRAH4dEr+J8Hcdgn
   Xc6vWtsIT5h2hUVslVCmxS5nHyEvoQQRdgMh2GKd7KDh1NavGdOGWOVuq
   LPL7o9c+n+rwaoncnR/lAL2/367nlDkKV8HHb7HzdbGOrTX7V5yf12mWR
   vyiIjlRSRp7tggkc7PI/tUQQXlAJyZjguyhMfvZRTnkJzoc/z958Rrem2
   q3l3Rs2GO74xZ8PO5wvKwNSRJnAhzFuhtPuLAPm0hxwf+jOkkEqZRx6+J
   g==;
X-CSE-ConnectionGUID: ZZf2SMCWTz2cB1DFvoLXEw==
X-CSE-MsgGUID: nIuV5Ow+SgOsMZiSzpiyBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92640473"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="92640473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 23:30:38 -0700
X-CSE-ConnectionGUID: mfg3QYODSGWqzsUijvvpYQ==
X-CSE-MsgGUID: 5owDTQH/QHqtknOvE1ZNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270393989"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jun 2026 23:30:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXvPV-00000000OPZ-1Thh;
	Fri, 12 Jun 2026 06:30:33 +0000
Date: Fri, 12 Jun 2026 14:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>,
 David Disseldorp <ddiss@suse.de>, SeongJae Park <sj@kernel.org>
Subject: [linux-next:master 6176/13336] WARNING: modpost: vmlinux:
 section mismatch in reference: trace_initcall_level+0x54 (section:
 .text.unlikely) -> initcall_level_names (section: .init.data)
Message-ID: <202606121426.r8PbW39U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
commit: 3fb2d124b64716f16355b9b722b2f062c0702f24 [6176/13336] init: do_mounts: use kmalloc() for allocations of temporary buffers
config: xtensa-randconfig-001-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121426.r8PbW39U-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121426.r8PbW39U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121426.r8PbW39U-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x54 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
