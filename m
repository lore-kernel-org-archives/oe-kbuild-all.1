Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062577;
	b=N5sd6NVvlcYTt/VLrfupcaIOnEmHN/RuoSrhGABGRpepjixFDZFdZjLKb7qxiL8ODFUH
	 gFdHrA3nU4k+0zFy7KFzEC5tqjjG1hBRpokU4ewx66UklO8VtM2dzwtmhLAi4vFZi7Jxg
	 UORYbEk1GZxmSo1+aKfQt6j0dJDoTGwPR+fJg7eTQbttHRzL8tZ5jahFOgmn99EHc3Bax
	 uhhf5vgI2+0VwMlY4tvtoR9WRaLszOFGLcbcfvE1y4T2bWQwDZ11UnJwUIEIh8BayG3r8
	 zNZYEFp19zpznFa4Ipq89nctKjXIhVoWn1M+cAIDu7MZ/hN5oXsvxhpyk/omltRktIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062577;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Jq+mf6xqYv/xu3F2z5YMhX+sguTx5eTXxIxJCNMTX5Q=;
	b=jsyfJjEifyxEu7LinDeIYPj+eNgobeUW1NmnTkgHPKyG4IrFeCmqQTND9s/bAPEyi1oQ
	 6E+jp5UzGyOoKUtm6bTnBBdlQaT4Of1tjzi9XJ+Jk44aX+DET3p3Gs7T5W3WzlYag3cNz
	 c7nfOWauGm16nWQTdKYX7HBw7eyxcZq6zQ3AnG1CqAUMHHb5eJupwiVoVoW+zgglCYTCw
	 YLzbZxYb7+Lpt1C4/7h+VvyX8MhBMCAuUrFZFsU+G43+0gD3oh6L0MY/ikaDwbFzyEx4+
	 gUKrp9FvcVMMp+F+xjQxXONTIHW+EJCMKJXtc6/R/gQRooJMAJ93JXSmd05vni5sBFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KP82xjD2;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95BE606A669
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 14:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95BE606A669
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KP82xjD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794062575; x=1825598575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4mTXxOSkvAXHDxLEHytMTRc69OA9ugla3w1C9kytPZQ=;
  b=KP82xjD2ePrLV6sqaoHQDHDXKNZgLoLt5B6N4GRImmY6E43pizncyOFI
   nHnk1GDr+Kdhu2WvCb4e3kEBTRi0YsTM6fdbptwY3wqjdXKKlHAUtP80V
   CJoyWTT9ooxJcjtnnXhSNGyJBIJmwOoGZnxD9FLQU4JCOPFZPZtk7oE7l
   i9AVuigUz82b9vgccf7zlt9Tn/i9LcwiqgO4uCL/EGDL9fyb43X7aQd1X
   6QnllwaTyg2gDgkNlIfyOmv5FMOHQZ+Z11wW0is3joR0wW8I4u2oGVIk1
   fid1Cet9NTGHgBew9BGIHNnlb0aaFqPh8UiCnYNjM4S9ivwjqEwIfEh3d
   w==;
X-CSE-ConnectionGUID: fYlqjG7ISJGw8G8RUsepNw==
X-CSE-MsgGUID: 7yyuBoXgSD+pz01V12WnGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2746861"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2746861"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 06:42:54 -0800
X-CSE-ConnectionGUID: jG18SRh7SJio61M1cprBWQ==
X-CSE-MsgGUID: 3chtGHXmRwi/89uB/rM0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9279231"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Nov 2026 06:42:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPhd1-00000000AgB-0kzM;
	Sat, 07 Nov 2026 14:42:47 +0000
Date: Sat, 07 Nov 2026 15:42:33 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 32/34]
 samples/configfs/configfs_sample.c:378:14: error: initializing 'const struct
 configfs_attribute *const *' with an expression of type 'struct
 configfs_attribute *[2]' discards qualifiers in nested pointer types
Message-ID: <202611071521.GQJ8xZgw-lkp@intel.com>
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
config: i386-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071521.GQJ8xZgw-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071521.GQJ8xZgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071521.GQJ8xZgw-lkp@intel.com/

All errors (new ones prefixed by >>):

   samples/configfs/configfs_sample.c:343:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     343 |         &symlink_child_attr_nlinks,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> samples/configfs/configfs_sample.c:378:14: error: initializing 'const struct configfs_attribute *const *' with an expression of type 'struct configfs_attribute *[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     378 |         .ct_attrs       = symlink_child_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:411:2: error: initializing 'struct configfs_attribute *' with an expression of type 'const struct configfs_attribute *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     411 |         &symlink_children_attr_description,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/configfs/configfs_sample.c:421:14: error: initializing 'const struct configfs_attribute *const *' with an expression of type 'struct configfs_attribute *[2]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     421 |         .ct_attrs       = symlink_children_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +378 samples/configfs/configfs_sample.c

0a51cf54232ecd Breno Leitao 2026-08-26  375  
0a51cf54232ecd Breno Leitao 2026-08-26  376  static const struct config_item_type symlink_child_type = {
0a51cf54232ecd Breno Leitao 2026-08-26  377  	.ct_item_ops	= &symlink_child_item_ops,
0a51cf54232ecd Breno Leitao 2026-08-26 @378  	.ct_attrs	= symlink_child_attrs,
0a51cf54232ecd Breno Leitao 2026-08-26  379  	.ct_owner	= THIS_MODULE,
0a51cf54232ecd Breno Leitao 2026-08-26  380  };
0a51cf54232ecd Breno Leitao 2026-08-26  381  

:::::: The code at line 378 was first introduced by commit
:::::: 0a51cf54232ecdfb8172ad7943e04e67e401538a samples/configfs: add a subsystem that accepts symlinks

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Breno Leitao <leitao@debian.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
