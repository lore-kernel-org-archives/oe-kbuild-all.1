Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B6F1662E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 01:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688213; cv=none; b=rh7n1ox7WgCDbH6t3Jz4LdZqbwiTJL1kv15bO7jcl1FAJHGKlsSX1AhoOH01wvRFnd1ECmTCWdNkr3WXSJio6Tf9+J2LAaPw4qmo2PEftYuHKQx5j6inKZAOStK/ksB8k4L5fLNNXNq8dbHwWXsgq7v8P491rfWULLMVT2v4a74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688213; c=relaxed/simple;
	bh=VTqn6EI2w8GbsbasZ2yxSD/fqqwBl4jy7SgZnj6hKYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z1YCosotFA2pVy4L8oFRfLPbmYocMFLn5D0zbzpbG3zueG2wsdKRQ2BLQwC01+Fg3xGsp1oI91tSEp+Yn377IdOIxw23ACWtIi2wzDl8j3GB5equQ56gKlnfFmlWgXcwLq41cqtkvqKpVZaYJkarTRGkEJ8dTN49TL3smfn+oRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHoFPgKt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHoFPgKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770688211; x=1802224211;
  h=date:from:to:cc:subject:message-id;
  bh=VTqn6EI2w8GbsbasZ2yxSD/fqqwBl4jy7SgZnj6hKYM=;
  b=dHoFPgKt8aqgL3vJjnPcwkOo6tKX9K6Be1vVmpB8KTTva1jj1voM3wQ5
   ovoTQh5dBaWwbalC9HZJDhYSZCz3cGWN3Z+XhVzzm9kCGIAj/Dj8hFHB+
   Pd04hSvjC/P7a3o9C60HEZN1OVuB4IpFP+rKIEM2D2QHz5GVIp3P+vU1M
   RDvrrja98WFOYkAXpzKgMLGoS8aM0GvS1Mm+H60NdqvXLMPt4+v5AE0Vs
   Woi8y+JZsHH3fNbLAaK2oQmleMTCH7kdutvojdOMdf95K6BqdS9A4Sx/l
   642JgmJXN7ZM6q+UJ8a1bzC9woiVD2nMnU1i/V+QWb45PVQ7ZyO1JwUnx
   A==;
X-CSE-ConnectionGUID: fO38HGWURBO8QbE8m9r2PA==
X-CSE-MsgGUID: fNmUPvsVSyyhmcZcICEQgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71795417"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71795417"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:50:11 -0800
X-CSE-ConnectionGUID: ZkP7Xpd6QmGFFDyFqpVxng==
X-CSE-MsgGUID: XdRcJMYPTBSGyUL/gNj7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216132116"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2026 17:50:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpctD-00000000oVK-3Ocb;
	Tue, 10 Feb 2026 01:50:07 +0000
Date: Tue, 10 Feb 2026 09:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 465/799]
 fs/bcachefs/data/extents.c:536:5-8: Unneeded variable: "ret". Return "0" on
 line 542
Message-ID: <202602100911.TUxCbmP3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 78e53242d57830619d4964261dda9934f4d18c47 [465/799] bcachefs: move data code to subdir
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602100911.TUxCbmP3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100911.TUxCbmP3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/extents.c:536:5-8: Unneeded variable: "ret". Return "0" on line 542
--
>> fs/bcachefs/data/reflink.c:49:5-8: Unneeded variable: "ret". Return "0" on line 56

vim +536 fs/bcachefs/data/extents.c

4de774952b1296 fs/bcachefs/extents.c Kent Overstreet 2019-11-16  531  
d97de0d017cde0 fs/bcachefs/extents.c Kent Overstreet 2024-08-12  532  int bch2_reservation_validate(struct bch_fs *c, struct bkey_s_c k,
a6f4794fcd8627 fs/bcachefs/extents.c Kent Overstreet 2024-11-27  533  			      struct bkey_validate_context from)
4de774952b1296 fs/bcachefs/extents.c Kent Overstreet 2019-11-16  534  {
4de774952b1296 fs/bcachefs/extents.c Kent Overstreet 2019-11-16  535  	struct bkey_s_c_reservation r = bkey_s_c_to_reservation(k);
b65db750e2bb92 fs/bcachefs/extents.c Kent Overstreet 2023-10-24 @536  	int ret = 0;
4de774952b1296 fs/bcachefs/extents.c Kent Overstreet 2019-11-16  537  
d97de0d017cde0 fs/bcachefs/extents.c Kent Overstreet 2024-08-12  538  	bkey_fsck_err_on(!r.v->nr_replicas || r.v->nr_replicas > BCH_REPLICAS_MAX,
d97de0d017cde0 fs/bcachefs/extents.c Kent Overstreet 2024-08-12  539  			 c, reservation_key_nr_replicas_invalid,
b65db750e2bb92 fs/bcachefs/extents.c Kent Overstreet 2023-10-24  540  			 "invalid nr_replicas (%u)", r.v->nr_replicas);
b65db750e2bb92 fs/bcachefs/extents.c Kent Overstreet 2023-10-24  541  fsck_err:
b65db750e2bb92 fs/bcachefs/extents.c Kent Overstreet 2023-10-24 @542  	return ret;
4de774952b1296 fs/bcachefs/extents.c Kent Overstreet 2019-11-16  543  }
4de774952b1296 fs/bcachefs/extents.c Kent Overstreet 2019-11-16  544  

:::::: The code at line 536 was first introduced by commit
:::::: b65db750e2bb9252321fd54c284edd73c1595a09 bcachefs: Enumerate fsck errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
