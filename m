Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8232BE639
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606881; cv=none; b=TjIgn0KoB5jhp2cYb6z72P5iha7JCFytORgHD0bKnvos0Y1OVh/6/ULybDXpZtQsygGrCPlriHnDGEntF6yps3WNkXG1UcvIuIpAD/s4w7WDvKZQ6zWNUnUHF7MnGa5JEwYCLryNXa2rY//RY1W3kj/duDzqia3Hj9VM1BG9od8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606881; c=relaxed/simple;
	bh=eFiplHmoMWVIM6Q9i3DUmLyqnunS9EF/sn/AMma66xs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W5VOGPXNVD4Yc0mlVWEmReBwjpK5jmMa0/OckQRzxAYGEmk9UQrgGwaau5Tx3Vw9m8mjlOmCIkRpH6WMtG1wLgiCQIueUjk3unpWJ6YUcVFGFjtvZSQqYxL8vGHQPR65bk6X8p+GBFUywEqJu6Fj6di+Hkxv04rW2mxh8d1uu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iu6RyBiX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iu6RyBiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791606879; x=1823142879;
  h=date:from:to:cc:subject:message-id;
  bh=eFiplHmoMWVIM6Q9i3DUmLyqnunS9EF/sn/AMma66xs=;
  b=Iu6RyBiXeI+ceZHweqQoNhzVnJdApOb7bDo3slBtISSt6cydyxgG5778
   BX4K4yeE9Q/levA0SJzNSj7/jQMTviahhr+a72yhAToHWHuiLRJSks4V9
   ca28srM6lrPYkCXu153kG5UqInhCYmyflhE+aH5u4WPGfXdSSdHUEeWjX
   Z+Lgm41rOTXrosz3SfqloAwNkkQeBcfm4GGfjW5Bx8TVS90g1izigo0DJ
   Xlk/zId0I4D5UHNy8nXrYGfAVdcXdPaPfHkc8icA8xqHtOEVNPLR1D1+5
   rRSHHkSdb7hnAzSiN0bRSWuX5VHqm2OE26udbdFwHGI2mt3t36EEUsj/M
   A==;
X-CSE-ConnectionGUID: dxrqE7nyQmeYyCHl/BYcpQ==
X-CSE-MsgGUID: +IbJz+bDSpOKKve6SfY1iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="410472"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="410472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 21:34:39 -0700
X-CSE-ConnectionGUID: x74iL89sQqWv8uskDj9EDw==
X-CSE-MsgGUID: wiBJqnG4RDKj1zoy2OmV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="823496"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 21:34:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFOn5-000000007Yz-1ylk;
	Sat, 10 Oct 2026 04:34:35 +0000
Date: Sat, 10 Oct 2026 06:33:51 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 34/52] scev.c:undefined reference to
 `__udivdi3'
Message-ID: <202610100647.jdtmejID-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   15b578b1715d9a318c804350d98af87c203672bc
commit: 6ccf49f7932781f441e1e52459a4053bbfd19ddb [34/52] bpf: Use SCEV to widen bounded loops
config: sh-randconfig-2001-20261009 (https://download.01.org/0day-ci/archive/20261010/202610100647.jdtmejID-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100647.jdtmejID-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100647.jdtmejID-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/bpf/scev.o: in function `compute_max_iters':
>> scev.c:(.text+0x3780): undefined reference to `__udivdi3'
>> sh4-linux-ld: scev.c:(.text+0x38b8): undefined reference to `__udivdi3'
   sh4-linux-ld: scev.c:(.text+0x3a64): undefined reference to `__udivdi3'
>> sh4-linux-ld: scev.c:(.text+0x3a70): undefined reference to `__umoddi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
