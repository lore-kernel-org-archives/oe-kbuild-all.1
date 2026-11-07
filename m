Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794055826;
	b=VZVKrBl2hy0oshlI50vUa9NnNUoK74P2NsQ9N3Tj+0Rh7r2WPyeO1gS2FPuuObjADI5b
	 aI5zc3UV7Iy1Z7kib2y0JqcbrnDZUveIVo4hmWC6LRt1xZwYSfsxepDfmpC+2wuvSDlbv
	 n/fdx3nspnEyXyTQyHAcSLVaCZSwuOC+nQqS6Yn3+r01o70/ekQ02OFjnfNYNNxRp4Fmy
	 tkwNPW2+Wl2NwMZ/BNOhVYSbYVDfnfKo4Mz9JCrxx6HJOgpSiM4G/LzSsDSByF5TUqfsw
	 yRklG/Re1Lj9Z0QT4iyEt5eOJyz0bYOm6Uz/MHTWYzFxKc5R31H6E3dHq4rlw5CsWAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794055826;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=aw6rX2CePa+6FfKzoGFAJCDBcdcMlFidopF7U2yR5hg=;
	b=u+0GeqPeInBgaVmv1GeOr7NbXE24/tqr0F5HOr95TtuzDTxsLu5Mqtu6VM3VTD8kmahw
	 EZmO7dWzEhTKM292RfiMRnCNjaXsQQP+SwB/zgqD+PA6ZfubEx735PQf0MIlyF0R3a3Yk
	 4WedrdRMnZ4aqXRWAoL9/KoHrAiDdpjFgd8deFoWqXMFmNwtNov690rb/a/COuH1du5wo
	 AzYWOdIT4gbgblHVoON4A28FCg9iAb0Oh3p5GSg0XOEkR7NO87cO6bz3QwVfc+BVon/5O
	 OOwhMqAmrbn5fCHfMfI4Or55nyzpINq/HBc2flgc2sxBHOnWae82QvduG+XHc+jkuLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="jBE/QjVr";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80745606A32C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 12:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80745606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jBE/QjVr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794055825; x=1825591825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmWJ7c4EVb55Rld8+5F9kY4ikyEOHP4D2AXN6U/q/ek=;
  b=jBE/QjVrbC10nkrr63Woghdm12hw9fAMmnOnnrt8eJvNCPkd4v2IYf+x
   f+emKI+0OcVI2q3FcHAN25mt8X7t+/CBSSDLYWXOKev0p0TXNTuKjEQ2Q
   H6SRj75dAR7xGSn2arj5eTlbnOar7S5wL22aIV5cfrFP9lBpRO2Pk/1qS
   5BgweQbSOhZ2ZCSu7/glAVqe4liABYb8fP283yVU+1a7W5nFPxBHOT68n
   6wwjYEk4Z+R/bn1Zd6NoMEkvyuV95EHepbY/D6KGmVULS7+eb5gYZXLap
   2YyYsSRPzSKo/+UCkPjzX9y6QEXu/uEIMHDuAboZyvQ+PMWjfmH/1wxcK
   Q==;
X-CSE-ConnectionGUID: BmnkiY3SQUqE20XRf9vPVw==
X-CSE-MsgGUID: rwvzB7gxTomXoCI/iUoJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2737264"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2737264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 04:50:24 -0800
X-CSE-ConnectionGUID: talOIVUJQSOGcTq1vM4jZg==
X-CSE-MsgGUID: Tn1JPRk5Q9S0xFUUaCgJQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7380209"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 04:50:22 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPfsC-00000000AfD-10FG;
	Sat, 07 Nov 2026 12:50:20 +0000
Date: Sat, 07 Nov 2026 13:49:35 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 31/34]
 samples/configfs/configfs_sample.c:343:2: error: initializing 'struct
 configfs_attribute *' with an expression of type 'const struct
 configfs_attribute *' discards qualifiers
Message-ID: <202611071303.adYxibzH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/configfs-const
head:   0e68ea5975531faee86ef390018b5d08916b17db
commit: bd1e491ccf3cb7d868d2f06405e7419328a27a7d [31/34] macro
config: i386-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071303.adYxibzH-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071303.adYxibzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071303.adYxibzH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/configfs/configfs_sample.c:343:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     343 |         &symlink_child_attr_nlinks,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:411:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     411 |         &symlink_children_attr_description,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +343 samples/configfs/configfs_sample.c

0a51cf54232ecd Breno Leitao 2026-08-26  341  
0a51cf54232ecd Breno Leitao 2026-08-26  342  static struct configfs_attribute *symlink_child_attrs[] = {
0a51cf54232ecd Breno Leitao 2026-08-26 @343  	&symlink_child_attr_nlinks,
0a51cf54232ecd Breno Leitao 2026-08-26  344  	NULL,
0a51cf54232ecd Breno Leitao 2026-08-26  345  };
0a51cf54232ecd Breno Leitao 2026-08-26  346  

:::::: The code at line 343 was first introduced by commit
:::::: 0a51cf54232ecdfb8172ad7943e04e67e401538a samples/configfs: add a subsystem that accepts symlinks

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Breno Leitao <leitao@debian.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
