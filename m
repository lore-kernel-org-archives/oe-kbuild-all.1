Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647143;
	b=gTHEgTRJlb6dSCiZrlCTV52ryqlKxIJVVbZWWvDSgeTf7NdBWL+taHbr/nYGkRqYc2xY
	 sSilzd7+9udCH+v254Q4E7cBkmnb/A+5xkhPwUiadMXZJTHOzP+4dy6NNptH5Uv4zCLN8
	 hcv3V3u2KiT1DKtCXzDNrYsH9UgZbMAnWfnErnhavmQpseW1UslODfwEZDOuNi83PvIbP
	 rUkHAToMxiqYfmCb5KHIfQMUH2uYnfnpJPlTN5/cOGtFGteOUMNlalHEhYm77JgqTsq3H
	 xibjgr+3SCVvbfaJNYCuh0CSwvkVFE0ZATnlySoUMRCu09RXltMdwpc2ZHSyQT3fLkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647143;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=G4nIsRAxYIHnwu2eqbjQS2FOcZ/5xqBt5KTicjqaJ3I=;
	b=3jAXuL5WffcPAQ2YZbHw/di7DJJa9DI43xVfh3JFDlg7QrD3eeDBD6OJh73UW9BHOZ8X
	 SLL7nEMoW4lcWhLa8gnaky0TTwKofE9c1RCfxfZFcAKogC1y2bjCQts/iTo0pgxCRdxh7
	 OZrvp79qtifj/pacDLj9ft0Ch+s6Orb2UAerYdq6aP3hqTbvjs+0j8ewxz5BzZag+MzRx
	 nWP8L9wcABnxtSMy8FJ5QVq5P8Zbzage+IF3KZqEh3jeBtAwm6wzB7SjVTv6JL+tjlP8p
	 6J+49KgZBLJ88tqRxZV678SyJrBSV3IVAxagE8CatUtxmZDpQEHRUeJQHQQuK29/F5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="R/waX1ux";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB1606A327
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 09:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87CB1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R/waX1ux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794647141; x=1826183141;
  h=date:from:to:cc:subject:message-id;
  bh=6EMIoCbDE3DlCQtNw2ZbWrAFdr/bM98GHau0f6rL4Lo=;
  b=R/waX1uxGtwWq5ujJxHfFnCzO5ORISXX7AJIE0P6jN+cFbTNJAZyLxmd
   ycOiRyn1zsqrTAjl9ZfbjacFkaPjDdjYaWOi5wbAY1/eb4TBLPHzSfU1Y
   Mm+ZcUHENg21HHEmkzd2wjd8afLk1SZnXYmjw7Cs9Y4NzOA4rIoJzObgH
   83Jd9sY/w5o83PHFLUkNZU77765gvqNf+XokG5Xq/qdhhi8Q4i8u65FtF
   DvtasHZeqpzywc4ykua9Uc17GzT4qBFkrObfSyT2Vdwa320PgO+NE2gE7
   T12iz3GbVXHru1rvV0BfIv/z91p+uD6vYUTOMqpifJxbwQ3Z7f94kuMdO
   w==;
X-CSE-ConnectionGUID: KVsCN1JZSqWYfHBDyZ7Gwg==
X-CSE-MsgGUID: f5gzP4GmSnK8efgRkPiM4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3438407"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3438407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 01:05:41 -0800
X-CSE-ConnectionGUID: XPruJpCiROSCjy5vN8vO9A==
X-CSE-MsgGUID: ZuarkeR0S2WJ4eJd65selg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9278538"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Nov 2026 01:05:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS9hZ-000000001X3-27L5;
	Sat, 14 Nov 2026 09:05:37 +0000
Date: Sat, 14 Nov 2026 10:04:59 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68] ERROR: modpost:
 lib/ctlv/ctlv-kunit.ko: symbol '__aeabi_uldivmod' undefined!
Message-ID: <202611140941.9pOqL51r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
config: arm-randconfig-r2311-20261114 (https://download.01.org/0day-ci/archive/20261114/202611140941.9pOqL51r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140941.9pOqL51r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140941.9pOqL51r-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/ctlv/ctlv-kunit.ko: symbol '__aeabi_uldivmod' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
