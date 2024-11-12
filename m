Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46439219E21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439982; cv=none; b=dsZh07CpqeWPAXBe9qo/TossU6FzRYREZQg8vflLD2QT2+S2Nwhf7jCpKSUJ+V8R0BUMlLjs9lr7gGS90caJi+I5VShxa4ZytNK41Qk2NCqeVZ36y7X/deZrxoLQBrhTFo3i7K6SnpFAfIxYucTX3lXbXgC6Nm4py+qKdjE2d40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439982; c=relaxed/simple;
	bh=oPWCmTH/qls28Exn8OgJzumPpXXmCC7zeNY90Tjn14g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TujQCIVx0PUnJjnIqTWspyKJOjw8f0xJxAYjvesQxabEVRA299wNnspSllxLEeJnd7yEpIwC52mHCu92GkBJhn78pO/6AlFChPpePeHtyeD8GXCCAFmwyIBohAEdr9T+FNP9k+E6rHNH4A6QnUqPFS8LgMu4edbJmNzLb/9HnGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3x3it+t; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3x3it+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731439981; x=1762975981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPWCmTH/qls28Exn8OgJzumPpXXmCC7zeNY90Tjn14g=;
  b=c3x3it+tNOkFbKVa8D/yoSw3h3gwbuFnn9toZ1zMeCdbg+0D+DRqBXju
   z/tuh/tWknsnv7GiUFnOLHkhbtJktoj5tBIXO0QEgsOMRZnpajuaEB7hm
   RFmwpdViVp3QODd1AnWRk9Uj7Pw4KP7ObL3LWwmrcUuBhzCYFoYYbo5Ty
   QbcTXGoLOStwKZOJFwJiL7B+rKz9oH9a5GqhGS11PDAutg+AQYI01uL6G
   iZ4mcV0ZoPj8QI3dnwCSh7t7uM+XNn0A1Yh9nQwV+HJm012XXCr6gonSc
   8I5loOkkiLSinZwlErReiWnkn0XbTBzZATqx2w39PfM+dxEmqUEDTpHBr
   g==;
X-CSE-ConnectionGUID: j5OHwnFpShSieZnMf4ZLAw==
X-CSE-MsgGUID: Q/6hFzPpSVKEEvXrko4pYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48755549"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48755549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 11:33:01 -0800
X-CSE-ConnectionGUID: 2/OZbk9WQr6aHMeGdmgTVQ==
X-CSE-MsgGUID: 3USObfSiQOCZbyFYf/m6LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="88020734"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2024 11:33:01 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAwdG-0001gL-0F;
	Tue, 12 Nov 2024 19:32:58 +0000
Date: Wed, 13 Nov 2024 03:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:buffered-uncached.7 10/17] mm/filemap.c:466: warning:
 expecting prototype for filemap_fdatawrite_range_kck(). Prototype was for
 filemap_fdatawrite_range_kick() instead
Message-ID: <202411130309.pIovJsp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git buffered-uncached.7
head:   91ccdbf88b31dbfc0bcff98ca31c84e893cc2dac
commit: 4f13cf9f36288fbc10713ff62372b161dc3ca649 [10/17] mm/filemap: add filemap_fdatawrite_range_kick() helper
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241113/202411130309.pIovJsp3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130309.pIovJsp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130309.pIovJsp3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/filemap.c:466: warning: expecting prototype for filemap_fdatawrite_range_kck(). Prototype was for filemap_fdatawrite_range_kick() instead


vim +466 mm/filemap.c

   452	
   453	/**
   454	 * filemap_fdatawrite_range_kck - start writeback on a range
   455	 * @mapping:	target address_space
   456	 * @start:	index to start writeback on
   457	 * @end:	last (non-inclusive) index for writeback
   458	 *
   459	 * This is a non-integrity writeback helper, to start writing back folios
   460	 * for the indicated range.
   461	 *
   462	 * Return: %0 on success, negative error code otherwise.
   463	 */
   464	int filemap_fdatawrite_range_kick(struct address_space *mapping, loff_t start,
   465					  loff_t end)
 > 466	{
   467		return __filemap_fdatawrite_range(mapping, start, end, WB_SYNC_NONE);
   468	}
   469	EXPORT_SYMBOL_GPL(filemap_fdatawrite_range_kick);
   470	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
