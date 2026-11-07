Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084600;
	b=qPLuGST9Oy0BhiU53sUhlqlNFyCMeoNcrn6JgqrSzl0SoabOOdI5jdrliGLX7rdaQaGa
	 +iaZmhhSCn1UJJ4CDxaQfOYsv/v2g4sWPyp8GkuemTqC+uLM0U2ia7D1OH8+Apl3FqiC3
	 qjDZ+Qap33pU08dP8yfp19xYrXAF0eftZgJUgHK+PxnpoBYVojMOqgohoXCzhyBvaJUYN
	 id8yOdnv6vBQM6N+fPpMJ4l8ACqpFdJuiLeouI8lH0WZMwmLwCXYIfxhwx8TSrMZhQ4Mh
	 EhkdwNYA812ADCflbQOXHvP+StqcdiVJvWsQ1LV96EAEf6m5mXxtoutTGgwzUWmyNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084600;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=pXiz6CRzF8bZhe+ox3NVdJ7vSU729LNA1Uazq6v3+s0=;
	b=IEpxiZog9gsqBRnveT8nkNMDBxsSpr8J4t9nkESXAFhtcJOtdRKSlgJcqbPp1wYf7nxV
	 vidqPCvIYAJAATkyCsYLBxN7sAZuMEAhLEm1Rzcd0cK6X0T0fjcYaFRdzatf0iyGJl55Z
	 8iDZakXSI9AIFt6OEgPo753rVXepdy3W6SXewWwkfKEDG3cqmgiCvycml0G6lxU4RhgUy
	 m0GA/YRsoAOgUxbLw+VTDWwrspnB/jyuqu6IkFpW0vRhxSS+5PvZkth3RoMDQ4219ETT+
	 ZCFie6MzaN84bmiD7cE+t5oZsiaGWzgd1RYdhJITrpM3G2RYIvt2UvmW+MWQABSVrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nQJkz5IH;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E0D606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 20:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E0D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nQJkz5IH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794084599; x=1825620599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRUkhLfZPZGns/PV28nPKAdbdzGjc+nPYDOvqJQQ1uQ=;
  b=nQJkz5IH/Xq8aSXqnuPi0eamqhfEdCfA+ls6bBBBHaOqgwlaD3w8Fenx
   WVrlCLylNnJN0EnXeCaxMrgZ/HstdrKSAsUUXCd0QUl6B1rmSfCbEEafK
   cXMZu34Y4vuKvQESagfI6L9oY8TrDegVBmQMmH+OlsqEwt72AoMahI4bv
   FmIPOvAivmQq5cyh68nkQfQmJ0t84LH+HzYM46a13mGwvrndjZGJOISDp
   QUloHg9iGdNP5qRlRy/wEJqZ8aRx2wEbwu/ZwawounkB2fXSjDyr1n10o
   BorRn2WDyTOYvRpp0xuBmE3h2zZ8DIPjU5lQGhAZOO13SrehAELhgpwnC
   g==;
X-CSE-ConnectionGUID: emUz4VbLTVmKfadv+XF4Cw==
X-CSE-MsgGUID: MmLxAJUPQpWBzSDOEFy91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2768110"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2768110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 12:49:58 -0800
X-CSE-ConnectionGUID: K2ATXsB6Rqi6L9cAnoYW2A==
X-CSE-MsgGUID: /fk6lAtaR9emF8yiNzAKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7704207"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2026 12:49:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPnMI-00000000Amt-36oi;
	Sat, 07 Nov 2026 20:49:54 +0000
Date: Sat, 07 Nov 2026 21:49:17 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 32/34]
 samples/configfs/configfs_sample.c:378:27: error: initialization of 'const
 struct configfs_attribute * const*' from incompatible pointer type 'struct
 configfs_attribute **'
Message-ID: <202611072127.5ZXFcMim-lkp@intel.com>
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
commit: 4762ca57ffcb5fe7b2fddd96882daba9fe3ce303 [32/34] const ct_attrs
config: x86_64-randconfig-2103-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072127.5ZXFcMim-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072127.5ZXFcMim-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072127.5ZXFcMim-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/configfs/configfs_sample.c:343:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     343 |         &symlink_child_attr_nlinks,
         |         ^
>> samples/configfs/configfs_sample.c:378:27: error: initialization of 'const struct configfs_attribute * const*' from incompatible pointer type 'struct configfs_attribute **' [-Wincompatible-pointer-types]
     378 |         .ct_attrs       = symlink_child_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:378:27: note: (near initialization for 'symlink_child_type.<anonymous>.ct_attrs')
   samples/configfs/configfs_sample.c:411:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     411 |         &symlink_children_attr_description,
         |         ^
   samples/configfs/configfs_sample.c:421:27: error: initialization of 'const struct configfs_attribute * const*' from incompatible pointer type 'struct configfs_attribute **' [-Wincompatible-pointer-types]
     421 |         .ct_attrs       = symlink_children_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:421:27: note: (near initialization for 'symlink_children_type.<anonymous>.ct_attrs')


vim +378 samples/configfs/configfs_sample.c

0a51cf54232ecdf Breno Leitao 2026-08-26  375  
0a51cf54232ecdf Breno Leitao 2026-08-26  376  static const struct config_item_type symlink_child_type = {
0a51cf54232ecdf Breno Leitao 2026-08-26  377  	.ct_item_ops	= &symlink_child_item_ops,
0a51cf54232ecdf Breno Leitao 2026-08-26 @378  	.ct_attrs	= symlink_child_attrs,
0a51cf54232ecdf Breno Leitao 2026-08-26  379  	.ct_owner	= THIS_MODULE,
0a51cf54232ecdf Breno Leitao 2026-08-26  380  };
0a51cf54232ecdf Breno Leitao 2026-08-26  381  

:::::: The code at line 378 was first introduced by commit
:::::: 0a51cf54232ecdfb8172ad7943e04e67e401538a samples/configfs: add a subsystem that accepts symlinks

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Breno Leitao <leitao@debian.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
