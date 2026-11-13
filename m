Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528980;
	b=AVKx0MLD6d4QOXuMaa7AMGf5m02iADLqXOgJMJe7825kJ0Q+qxZRhIEEY0O3Byjp7p7m
	 4PuR81w907NjZiayYAvA1SIQj5Hze2Sj6+6Onmrq+DyVmWi+158oMrA7i8esAzDZlQ7Ha
	 oi+sM01FlzE4CXI9SGEksTqyui6Lf75uOcAgdagDAcX3K2pNaiOWuyjJHv+0gfsgxlBZ+
	 A/QxCl6bH3UdjgkEUjjvWq27i3V5B1zZzwoPPRnxGEmOf3IvwyoVX5w2YG/6evldJUKK7
	 92EGL6IDocd9D3H6BJrOxbeWucqpymZzeYgGVHwjBxK5Hx1NgDt2lGvOXHmmP0La6IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528980;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kAIWu371kXiW3UyPKqkc7vKnarRP7TZcDkiBBMtFiiY=;
	b=gRsis11LAaccPA9rfK4Uete850iIw9MpaKf8803RdzALr/SU+ZM+z278rpEeElhtUFno
	 CBwzYrlvAFSq+eu4mYBz8OA/GgIm3XCw1XonglVP0vuF5+38k6O2LbENfDvgpxqVoKgPi
	 632I3mlYMsGalR5U0jWIcPV22D9tkz8qLCQZa1R39r4wXjxBvqnzPWwzOvZGnu9ep6Ixw
	 zbzv2gKsUFU5YIIXWlBuS9Hn7wJaUsZYqGvwt1SUrEppG+b5eBdq7voUVoxxIydCD3hYy
	 XUX8Tj6RQK5QIFayhZPO4vtPlw1/Tct6MfixxaxN8qjzbRjYWKd3FTh1aQipllEceBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxv6HUCC;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27347606A338
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 00:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27347606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxv6HUCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794528981; x=1826064981;
  h=date:from:to:cc:subject:message-id;
  bh=hEjlvu/IebBlE4IcH8JNIXugMZOwiWQW9gKtPdPRXqc=;
  b=gxv6HUCCXH2Vu3bPu5zCP+jdZrNG9VtFiZzFaDN9yIf11klzVqTSKqfO
   Hp9Oo8yDAgqarArmUOK7Q0Z2wG1zcyn75cDbY3C89gczIj5H4oDN0n0q7
   PxwOQ8SpyclSfugOMLoYCYcYLGvgV8V81wrpYrpxjCkSe3C6+N89oJhSA
   1+1P6kNezVFFM98siWZdwacbc3pC7TsNGdWz/X8OK3Vkv3/uNvwjn1CyL
   w4vACmMeheav8iZqYwOJdTBxZlWeScQBeAfT7uv3krE4U48AOAS6rqlAr
   kiI8I08bURUuy6NzFFvOLGSe1JQQaW05DxPNxRkqxWdUqU+x4l0DvshZc
   A==;
X-CSE-ConnectionGUID: 8EUVcEjaStmFzCJc0br7Ag==
X-CSE-MsgGUID: NlVmfCq5SOqND8u+CYiRcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3410473"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3410473"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 16:16:20 -0800
X-CSE-ConnectionGUID: deduL/mLQmKEj9cma/mWsg==
X-CSE-MsgGUID: vAagmO9BTcGWjvBPGlZQWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10562224"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 12 Nov 2026 16:16:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRexj-000000012C5-3ztC;
	Fri, 13 Nov 2026 00:16:15 +0000
Date: Fri, 13 Nov 2026 08:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 1/1483]
 .github/pull_request_template.md: warning: ignored by one of the .gitignore
 files
Message-ID: <202611130845.1ZN7zY4h-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Michal,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   85261a88dc955839e3dabe5339b3a8d86ec545db
commit: aaffa6079b8ed74da5e1d6b0642a7795dc3c1692 [1/1483] xilinx: Add a github template telling people to not use pull requests there
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261113/202611130845.1ZN7zY4h-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611130845.1ZN7zY4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611130845.1ZN7zY4h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .github/pull_request_template.md: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
