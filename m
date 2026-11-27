Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790860;
	b=oPW555ahJ7NBGr5hbrC9iYEy8aM4ihvAMosGa0BLJR0bDdHETwz/czdnvvkDDI4Vo5eI
	 r7QmgMYidKlKxkoQghp7qEAWTDMIZdcXiSolvEoofq6Vv8v0GM2aePl+9ImkkfNpiR3+U
	 WMZgDjT0L0dfKkza+JUyK325GMEzrkAv04q/ax++oESHZ3CT4p+ebp+f/fdONL56b0RJ7
	 /6CcLZlRjLraR6S5uwLS03cKZuNKU22voC+FWg0Dyh/99liqixb6ZfnYKUmvC/8P3EWB1
	 WwZ3VtlUiw3REXQSSr3ELDT1RXaoaeqwtS0XhY1gm23kd7mwxOekntfyoPjV4QUwrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790860;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lHviFuo/aoyUfuK3ZmI7p41nXJ3RUVJrxG8mJ3PbEAQ=;
	b=1meUQiHiG7E6eVpvq+B41WjsyxIUgNIoLYVlmbh6NkWRz/ev1ALkv324fpo9J6G/OuJD
	 cBxJeUg6PGUm4GlumRetpW0g+3AbFmnsgPCwD6K18D8HFwQqu+0BOqelfG+G1MkFQBdMH
	 3OSBABT0ZIBZtGoNcM9siBd4BFLDoLM+lHicYLRCu4gj+uXBo2wWCO9P9n2+KYaxezqrV
	 BB0Px1IaBXsFvFXBl/efSJO9KyBoAQVjJ8N1m3YEMPY2p4M1pGQ7J02qRV6wkyZ2WsTZe
	 hq4fc6/HUwkipZI5yXSk4o9rZrXm51gsYdk2Y5VGzyW+N+zFdYVuCLsvkqG4NA4KFpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RRjDv+7Q;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0D4606A31E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 14:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RRjDv+7Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795790860; x=1827326860;
  h=date:from:to:cc:subject:message-id;
  bh=w/H48WzCUuCPYWbqDy5MYLV8DTSYNgl63kAw4Af8d70=;
  b=RRjDv+7QrsNgnTeR94lOeN6/RIuNujkgKfuw8qPOS2put57g+R2zi+gm
   31NJ2HdwOXqpPCkPKJKdb5UaevQZiCSfh0ZD3MxQW5iVcRRF6ejXJVy+R
   yvVpmF7CjYNBORl66nHod+vRKK2neZHlSQP/H28lwM9m4eZk30QsI8MIQ
   610UKysE7WgA8bg/HqeA/X88UzsYB4V0bDs2KEGaU2RCm/F1YCN9RNcvn
   YsNSGO7dZjn7pqHEUgUgyY6KpQbVxdm+8NifG6uTKk90/aPfw/fGX9eFH
   SfdKpUiJizDLHnIfM3kt6A3OdQmztoWb3IglI9Cbn3l/2mQHqWZkLWlUV
   g==;
X-CSE-ConnectionGUID: jdhA0FFXSAm0IDZDnOj9sg==
X-CSE-MsgGUID: F+kCrNZhS724nCk+AAT/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4594096"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4594096"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 06:47:39 -0800
X-CSE-ConnectionGUID: KMAb8f9kSYSl4+NjtqT7dw==
X-CSE-MsgGUID: 4PCoxc48TDStjH2U1k1klw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12828000"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Nov 2026 06:47:38 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWxEe-000000000D1-0I2V;
	Fri, 27 Nov 2026 14:47:36 +0000
Date: Fri, 27 Nov 2026 15:46:41 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4a 5/20] vmlinux.o: warning: objtool:
 ___bpf_prog_run+0x72: ignoring unreachables due to jump table quirk
Message-ID: <20261127153750.FLgA2gbA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4a
head:   72f452c00f0e4782c2c48e5e06e074b8d4a5da43
commit: 6926ac3bfabbb8c1897ac2eedefddd7ab0de442d [5/20] x86: Use PIE codegen for the 64-bit KASLR kernel
config: x86_64-randconfig-2002-20261109 (https://download.01.org/0day-ci/archive/20261127/20261127153750.FLgA2gbA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127153750.FLgA2gbA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127153750.FLgA2gbA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: ___bpf_prog_run+0x72: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
