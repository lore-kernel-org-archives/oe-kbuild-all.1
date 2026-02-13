Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A440B3093BB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 22:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771021015; cv=none; b=CuvBohPalwXnZPK5DUN4afp7oS/Phdq4J0w6Xk+gUr7R3cWD48piV1O3UIe+JVXiGCGXsZ7faEu+vExx9y9BuD7hgxM2TWpPgQ2TUmlTyC7ZbOLoAt9FaZNgesoFMNy4lUleHiyx+tqiht0wmTt8fmhxr6sE3VHkzSJUm6T7DG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771021015; c=relaxed/simple;
	bh=7oKnw0ivGCYRoF3oJhdhVlYKBR4yCVu9f+h5h+q3v84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WP5nkV8LOUgzwfrIdcpLVadLo+O1xcacOQytSU+yvGeAmiikIocECr9PM61zttG5rtuiktFZWFqNSAPutmJoThElb0IpStFrVmYfbOXTNpaIfPdYD3EZOmxBG/Tavefgjjau+IU+yoe8nRIpBWFtrg2vyQ1pYU5kYMT8lxVjrpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T34fS67M; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T34fS67M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771021014; x=1802557014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7oKnw0ivGCYRoF3oJhdhVlYKBR4yCVu9f+h5h+q3v84=;
  b=T34fS67MR8D+4mC8174T3AnUr8eiEc90+AMCLoPi2/8TWIRZuclqjL4x
   ZUdNEjw+97J9yTVeN8Ny8DLRxS/YJqcNx5t7M/yzJk87PFSr2xuwU7S64
   YAZQ12eZieiwBVod/t1HrzIsUhYCuC9m+OHRv2Dw24ZVNu5lvkbcVb5ST
   e8hs9F37kJ06QzMgGucz+RJceuobekFxRtDihofeeu5TlGmG2F6ogyXYT
   pVE+6B3blsPfroCgibHlap7JPtqYBtTyp8slVqNq0v4fdIWRW8gi0gLFz
   j/CK7iXg/fb5pSz+sbltrd7xpQGfzIAYngNcNXj/QQ7FTh3Mk8cdHvj5a
   A==;
X-CSE-ConnectionGUID: 66fgoLYtRqaA8XxfuFbVAw==
X-CSE-MsgGUID: qXA4gpLJRBSqua7nQLF7bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="97671117"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="97671117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 14:16:53 -0800
X-CSE-ConnectionGUID: 2zOqJhy3QYimJZgxa5OuaA==
X-CSE-MsgGUID: ASKSMcKBQgGCmF32mIm5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211919825"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 14:16:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr1Sz-000000001hR-3rZ4;
	Fri, 13 Feb 2026 22:16:49 +0000
Date: Fri, 13 Feb 2026 23:16:33 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 5/7]
 s390x-linux-gnu-ld:./arch/s390/kernel/vmlinux.lds:12: undefined symbol
 `TEXT_OFFSET' referenced in expression
Message-ID: <202602132304.1Ao7FSTl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   f3f3c2f9cf8c8793e126868a6f934bd8c333ccfa
commit: 3348250fad3005f91f96ab4967e4589c9e234235 [5/7] s390: Trim includes in linker scripts
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260213/202602132304.1Ao7FSTl-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132304.1Ao7FSTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132304.1Ao7FSTl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390x-linux-gnu-ld:./arch/s390/kernel/vmlinux.lds:12: undefined symbol `TEXT_OFFSET' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
