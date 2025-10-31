Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13A12E2DD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761913250; cv=none; b=V9uOci4b731rTpyOEJl7y1NGuo7sNXpoeGfrLa37najlDr5+Oig/f1Ys/HQZlaQIDM1ihXok2F3iQFxVQ3R0rojw0QnYF3KLkqcA1vuKnX2J0W4M7vT/r94XOxK+soH3KTr1UU5nR5rc0OORQMjKuQVbQBCNw71sA9+NlhgqvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761913250; c=relaxed/simple;
	bh=3zR4/5Lr7jNQWWlCropatcr/tfl6B4511xizexUrgfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mXMANTVZp4w9QAYyfTyTz4tdnAT6ZFT0dHxAW6/2Epo0yd7+APojOGL5PUoZAv4w/6rBYrdgvOEk8AZif4bZtQPqti5tkACzQTJvyYPijtIW9V0QRkl9V7NNyDZlUvVZfz926uHxP60WyuxywmT8jgTn5Q+y9KgOjUYBsQY2BVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZkiddr4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZkiddr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761913248; x=1793449248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zR4/5Lr7jNQWWlCropatcr/tfl6B4511xizexUrgfY=;
  b=RZkiddr4F2VtTEaAxZzN80GZ0U5cBAgAR/xzKiv/ZZS1PD4m7njvNZV8
   tH5m0ctiaRWa551KyHieWJzoB28TZZXQW88SEcfGwKotJlTy21tLBFDsx
   Hn/qQL2TCaZ/d5GmlLiWcjXH6Nwa4lbNN16VykC93QtBbMEKPbMm/h8au
   2ZGTYPbcdmD9gRmHGhC+o1ZB4n6wjhMEl+1rUX5ufqWRSqax5QU/u6183
   RzwetmN8iAH1gquldMNrGMCAusq0ehtrsvJFipG7q/NO5JE8PM2fDJicO
   I67M7DJteyNpMSxoS7T8nvcoZ/DzOcJckmVPthbTa0UkFv7duUJ4oXoXv
   w==;
X-CSE-ConnectionGUID: vARP4N55TZ+JQiwJZrpd6w==
X-CSE-MsgGUID: 0V9aXuuvQFyLFBiva/dezA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67933683"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="67933683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 05:20:48 -0700
X-CSE-ConnectionGUID: LmCIBgcSQI6hHO5UADUdxQ==
X-CSE-MsgGUID: YwHhyr5xQfOmfBVoippBNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186102128"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2025 05:20:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEo6T-000N5W-21;
	Fri, 31 Oct 2025 12:19:53 +0000
Date: Fri, 31 Oct 2025 20:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:blk-crypto-fallback 3/9] Warning: mm/mempool.c:399
 function parameter 'caller_ip' not described in 'mempool_alloc_bulk'
Message-ID: <202510312024.zeKHT8CX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git blk-crypto-fallback
head:   7046442804f2d8296aa28a8b1959b01d8ccf7a1f
commit: 5a8459dc6f4c91e14d61b4a8d1c3c287f7c4c6c8 [3/9] mempool: add mempool_{alloc,free}_bulk
config: riscv-randconfig-001-20251031 (https://download.01.org/0day-ci/archive/20251031/202510312024.zeKHT8CX-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510312024.zeKHT8CX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510312024.zeKHT8CX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/mempool.c:399 function parameter 'caller_ip' not described in 'mempool_alloc_bulk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
