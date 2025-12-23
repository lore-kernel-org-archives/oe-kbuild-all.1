Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779132D24BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766498337; cv=none; b=DnCq7rtuQzwhgtZvEC2ZK/DQnX++Ev7CXFLpr5UaKXm7MzSh/EpcUhZzdgR6RMr3zzpvzLfU7FyVzvQ5pzSuZOtyGR+lJ8+D0zQtJng8LXINecgVuZEf0WfrXjuK6HUvZxK/f913JrYpRF0Z9I/jRW2jc9IfnGr4Q1o0DGuvyNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766498337; c=relaxed/simple;
	bh=gk+IARRiINQjwUKtzqpFndJ2tAuxUjevRsIAhFJJsbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lnP4dTEu+xVofifEQ4KSohh1qRgqbPLpr+4dar3OMcRdwkRBcoejxxX9M+rzlMCyMpYPxAkev27mda3Bq8Yk64RzzTRtFypPQr9W2AQdWXbyNpVqvAEpixktpHLdQFJp4jo76pT3pAQST+4YcT3UrPwyTxM6Bm3cc7g4NS/tllg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQ/jC4Tq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQ/jC4Tq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766498332; x=1798034332;
  h=date:from:to:cc:subject:message-id;
  bh=gk+IARRiINQjwUKtzqpFndJ2tAuxUjevRsIAhFJJsbc=;
  b=BQ/jC4TqZBslgQwZOyKgVh799EPfXKYTatMd6bxOKBFjefBwNLYSg+We
   pHVSjXNYjJxUCfm/tQ+vkMYyg+EdhT/qFG468aYU7yi5NeoF8yK7x4sko
   xq7kBhCHIk9UtjLbGYCHEjD4MQ2dyivePN9BIfj7p3SaL5cF1wYKyjs0B
   Kh1LJYF8E3kONx7Qw85OnW1sr2W7q79cn3Rk4XjaZr5qa6MBiWspCT2Xp
   HbBdmmy0wR/nEf3JQtUan7ywl9lvTgH0SKJseGvD1FmAivdCtzDH6Dm+9
   Xwoz8rB0c9b8cFcTDPI0hNKnxxtfqVy3m+Vn998hwaCjIpHTDvagrBfeS
   A==;
X-CSE-ConnectionGUID: O0i1lCsKTTicfXTFbINFew==
X-CSE-MsgGUID: iBEmqkvwRYWecVQS07y+qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72193308"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="72193308"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:58:51 -0800
X-CSE-ConnectionGUID: BuEr+sBUQGCdf8OOv1A9WA==
X-CSE-MsgGUID: oOPbgKInTZaYpZdb1fQ95A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199697940"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 05:58:49 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2tU-00000000203-4A62;
	Tue, 23 Dec 2025 13:58:08 +0000
Date: Tue, 23 Dec 2025 21:55:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2/2]
 drivers/crypto/ccp/hygon/hct.c:233:18: sparse: sparse: symbol 'hct_mdev_type'
 was not declared. Should it be static?
Message-ID: <202512232143.LPloCdRW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: c74ae2c5da57becf3f41c596d79b3dd30fa1baa6 [2/2] hct: add mediated ccp driver support for hygon crypto technology.
config: x86_64-randconfig-123-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232143.LPloCdRW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232143.LPloCdRW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232143.LPloCdRW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/hct.c:233:18: sparse: sparse: symbol 'hct_mdev_type' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:237:18: sparse: sparse: symbol 'hct_mdev_types' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:459:23: sparse: sparse: cast to restricted __le32
>> drivers/crypto/ccp/hygon/hct.c:1204:20: sparse: sparse: symbol 'hct_mdev_driver' was not declared. Should it be static?
>> drivers/crypto/ccp/hygon/hct.c:1333:13: sparse: sparse: symbol 'hct_pin_memory' was not declared. Should it be static?

vim +/hct_mdev_type +233 drivers/crypto/ccp/hygon/hct.c

   232	
 > 233	struct mdev_type hct_mdev_type = {
   234		.sysfs_name = "1",
   235		.pretty_name = "hct mdev type"
   236	};
 > 237	struct mdev_type *hct_mdev_types[] = {
   238		&hct_mdev_type
   239	};
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
