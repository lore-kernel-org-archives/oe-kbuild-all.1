Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058362;
	b=p17IkJg6TFuxNFLuqCc9MUImDdrtLhANYeT915BxIiwV/qDavrA8vLTaIyyHuxMpP+uk
	 5nGXBksW3ngW+Aa24mgbZPWqONusns09y3Ix0M1WGVkWaRAHPkDC1d1DUAkH2LECSqp3U
	 fLa+72BQrGfFPXSFKRU+i+pOf2WLMj+ZDW39h2ycYRtr/D/KOmppw1knwA3NFPk9gMSun
	 tAMQNp+lv/cds6SBvhjOGs0GViwsTlLNPcqfTf/RtXYFBQoUQgX1fDxuh9GGEcHMovUBn
	 am7cJs4Z2J3m38FgmbXho2nF1IYb1O9ZC47vr/pJvBD/TO63zjyuwDzM8KfMBVACYpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058362;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=Gj7AuzYol2Q3EVLg3Dc82xBfzlvaqFM3ZKlmRAllAIw=;
	b=f+hWOt3uATvIQ4A9+1ZnwmVj86orRmoYB6k6W0NUMFfBRiDgvP9LOCJ5UBVAzfG1dPym
	 P0e/GoDBxmv5EPzbFn8GDM5h1LhO+liQDvNLzc37WhctRZzNJ7v+m2mwihsYSckwH1kb2
	 8jyccZuVHyd+3Ubqo7sY+rwvVqx2+whdvKSuPm+Riuk5cnG8k3H0M47uQGn5hMw9KFDrC
	 KaxpGEPM3Ai92D5bolde3+0aTeh+C0F7sKHYzHgJww8v9JIUq1ygjnXqe8ATrykniZZEr
	 9Oex1sLDNkdcjGS7uDJlLuF1TsiehiQYuLkpgdIYXCEYIM409yY2nSdXx2Pwpm2yhvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehOnD5AS;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9411C606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 13:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9411C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehOnD5AS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794058360; x=1825594360;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Zf602tFb27MyZCA95KyA6368GeYfeuLU1A4uc+yjbs=;
  b=ehOnD5ASjW8LavmqlomicKFe6Mfwc8hFvEm6kQmUd96wgwH8Uzm+3Yvw
   GyuFsrXyyskiu+B3aKeNaKr2ztHKLevH8tjwCjxWD8R21JqgpFPXcAFjv
   EktUnsVNP7N+I3ZMxNg6LAWcAgTv0XnaUZUZhpV8fXNqdMkL1r/ARPzmN
   BX+gmezzq08XUq9n3X/h0E3dwa2mUO+7tIIIY7mM/vw64u7WKtpSG27/o
   OcgZdPDAfvEGxKKY50V3nUvoy7RCEnS3d2GPdVb8uf1RNh7ZygxvUuIYw
   FKPCMKaiXDBopjh8E/jMeMQmFLKghIO6XrrlpCV1VMITYFQzhRK0cbcbo
   w==;
X-CSE-ConnectionGUID: qA8mPjVoTTGikOeGjm7QHQ==
X-CSE-MsgGUID: GaUF3gVwQmOimW1AdsRAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2868287"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2868287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 05:32:39 -0800
X-CSE-ConnectionGUID: NQG5eO3RR4al1MZT+BRFIg==
X-CSE-MsgGUID: DvavVaelQduEVz1L8etXuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7522160"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2026 05:32:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPgX5-00000000qt5-269D;
	Sat, 07 Nov 2026 13:32:35 +0000
Date: Sat, 07 Nov 2026 21:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/configfs-const 32/34]
 samples/configfs/configfs_sample.c:378:27: error: initialization of 'const
 struct configfs_attribute * const*' from incompatible pointer type 'struct
 configfs_attribute **'
Message-ID: <202611072155.KSMUrRTI-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-1001-20261107 (https://download.01.org/0day-ci/archive/20261107/202611072155.KSMUrRTI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611072155.KSMUrRTI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072155.KSMUrRTI-lkp@intel.com/

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

0a51cf54232ecdf Breno Leitao 2026-08-26  341  
0a51cf54232ecdf Breno Leitao 2026-08-26  342  static struct configfs_attribute *symlink_child_attrs[] = {
0a51cf54232ecdf Breno Leitao 2026-08-26 @343  	&symlink_child_attr_nlinks,
0a51cf54232ecdf Breno Leitao 2026-08-26  344  	NULL,
0a51cf54232ecdf Breno Leitao 2026-08-26  345  };
0a51cf54232ecdf Breno Leitao 2026-08-26  346  
0a51cf54232ecdf Breno Leitao 2026-08-26  347  /*
0a51cf54232ecdf Breno Leitao 2026-08-26  348   * The VFS holds the source item's directory locked across symlink(2) and
0a51cf54232ecdf Breno Leitao 2026-08-26  349   * unlink(2), so ->nlinks needs no lock of its own.
0a51cf54232ecdf Breno Leitao 2026-08-26  350   */
0a51cf54232ecdf Breno Leitao 2026-08-26  351  static int symlink_child_allow_link(struct config_item *src,
0a51cf54232ecdf Breno Leitao 2026-08-26  352  		struct config_item *target)
0a51cf54232ecdf Breno Leitao 2026-08-26  353  {
0a51cf54232ecdf Breno Leitao 2026-08-26  354  	to_symlink_child(src)->nlinks++;
0a51cf54232ecdf Breno Leitao 2026-08-26  355  
0a51cf54232ecdf Breno Leitao 2026-08-26  356  	return 0;
0a51cf54232ecdf Breno Leitao 2026-08-26  357  }
0a51cf54232ecdf Breno Leitao 2026-08-26  358  
0a51cf54232ecdf Breno Leitao 2026-08-26  359  static void symlink_child_drop_link(struct config_item *src,
0a51cf54232ecdf Breno Leitao 2026-08-26  360  		struct config_item *target)
0a51cf54232ecdf Breno Leitao 2026-08-26  361  {
0a51cf54232ecdf Breno Leitao 2026-08-26  362  	to_symlink_child(src)->nlinks--;
0a51cf54232ecdf Breno Leitao 2026-08-26  363  }
0a51cf54232ecdf Breno Leitao 2026-08-26  364  
0a51cf54232ecdf Breno Leitao 2026-08-26  365  static void symlink_child_release(struct config_item *item)
0a51cf54232ecdf Breno Leitao 2026-08-26  366  {
0a51cf54232ecdf Breno Leitao 2026-08-26  367  	kfree(to_symlink_child(item));
0a51cf54232ecdf Breno Leitao 2026-08-26  368  }
0a51cf54232ecdf Breno Leitao 2026-08-26  369  
0a51cf54232ecdf Breno Leitao 2026-08-26  370  static const struct configfs_item_operations symlink_child_item_ops = {
0a51cf54232ecdf Breno Leitao 2026-08-26  371  	.release	= symlink_child_release,
0a51cf54232ecdf Breno Leitao 2026-08-26  372  	.allow_link	= symlink_child_allow_link,
0a51cf54232ecdf Breno Leitao 2026-08-26  373  	.drop_link	= symlink_child_drop_link,
0a51cf54232ecdf Breno Leitao 2026-08-26  374  };
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
