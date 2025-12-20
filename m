Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D4C1A9F84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249611; cv=none; b=lhTQTWU7na+ySOZNwvAUjRvzotcyKFYOlxOjY0LJbrOIn/9svA07IwHYYu2rz3OPSU0gW07/ghs4W00CCYX5dcnu/KzcKTDUS5AITHHhR+Q4Fp98i+BKXtYUnNTsb7QwJ6UWQyvGtV8PbOKN/+jTxp7kc4zVmcJxIsAT8n7Yt34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249611; c=relaxed/simple;
	bh=YUPF6j5Z+KrlgFfM970AzJDWxg8Osm/psVYnXlEGfuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AtVXe5mDBgM0c3vNmHbsze8sCHEiNuFMJivwELpJzd1YeOzTcFHsb3tB4pSByWZZ9Z/KVfJsnBqEOwZAqvQlKgk5TYCamqZVvNeYTECt1WS3Wjhjmp5V1qCNxOmra8jnGDVeD9K8HGkQjPtrGdoSxDP+s696ygFige/pidFTFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjHaKLe0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjHaKLe0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766249610; x=1797785610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YUPF6j5Z+KrlgFfM970AzJDWxg8Osm/psVYnXlEGfuA=;
  b=TjHaKLe0avP5PjMzR1zBGEPOeC+BE30xCkCMCB9TLquCtG7xfeL8fomg
   +xIY9EMsP7z+kohMdj/GVlP78tltzSRtNZFRl0g2W9Of5C4IXHBQF++2l
   z5SFYYufHSH33nz+CutlyGKiQPzUtBL8QYxqpb66pRsef+ac7OEN07IXH
   q0zAZky/rZxF8ZH4gg5OQ+TpWOPwMTz88KLFAtXXT6ZQtwoixr4c/L8uu
   hEiaGZdTT8uH4pjOdqrZr2j/T2V32u7l7gaXvNcYaZ557Ww2fDlMshX11
   n4oNiqK/9TEbW9ZtaAaVSfo80UBK3dYEI4y0Qrdu4kLdhPMcJq82N0iew
   g==;
X-CSE-ConnectionGUID: pea04DzhRFe5dDf04roQyA==
X-CSE-MsgGUID: i2CIM3g/S4qWiLIUx8BxCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79546030"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79546030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:53:29 -0800
X-CSE-ConnectionGUID: gU5UpsAyQp2DlSpqgswaCg==
X-CSE-MsgGUID: kav5ACfQSaemZurEb6sqxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204190303"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 08:53:28 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0Cr-000000004uN-23xS;
	Sat, 20 Dec 2025 16:53:25 +0000
Date: Sun, 21 Dec 2025 00:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 461/799]
 fs/bcachefs/util/darray.c:35:17: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202512210043.y8tkAuOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: a5c2f21bff6a883e2a0fc96e4f0127350186665e [461/799] bcachefs: move utility code to subdir
config: m68k-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210043.y8tkAuOT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210043.y8tkAuOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210043.y8tkAuOT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/util/darray.c:35:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/util/darray.c:35:17: sparse:    char [noderef] __rcu *
   fs/bcachefs/util/darray.c:35:17: sparse:    char *

vim +35 fs/bcachefs/util/darray.c

73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08   8  
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13   9  int __bch2_darray_resize_noprof(darray_char *d, size_t element_size, size_t new_size, gfp_t gfp,
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13  10  				bool rcu)
73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08  11  {
73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08  12  	if (new_size > d->size) {
73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08  13  		new_size = roundup_pow_of_two(new_size);
73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08  14  
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  15  		/*
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  16  		 * This is a workaround: kvmalloc() doesn't support > INT_MAX
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  17  		 * allocations, but vmalloc() does.
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  18  		 * The limit needs to be lifted from kvmalloc, and when it does
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  19  		 * we'll go back to just using that.
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  20  		 */
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  21  		size_t bytes;
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  22  		if (unlikely(check_mul_overflow(new_size, element_size, &bytes)))
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  23  			return -ENOMEM;
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  24  
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13  25  		void *old = d->data;
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13  26  		void *new = likely(bytes < INT_MAX)
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  27  			? kvmalloc_noprof(bytes, gfp)
f0d3302073e60b5 fs/bcachefs/darray.c Kent Overstreet 2024-10-19  28  			: vmalloc_noprof(bytes);
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13  29  		if (!new)
73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08  30  			return -ENOMEM;
73ab9e03861c22e fs/bcachefs/darray.c Kent Overstreet 2023-11-08  31  
2e118ba36d56acf fs/bcachefs/darray.c Tavian Barnes   2024-06-21  32  		if (d->size)
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13  33  			memcpy(new, old, d->size * element_size);
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13  34  
68230270e04d5eb fs/bcachefs/darray.c Kent Overstreet 2025-08-13 @35  		rcu_assign_pointer(d->data, new);

:::::: The code at line 35 was first introduced by commit
:::::: 68230270e04d5ebe026e89137d23bed6201bae6c bcachefs: darray_make_room_rcu()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
