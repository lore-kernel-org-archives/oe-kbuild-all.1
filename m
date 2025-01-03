Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DF17B402
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945470; cv=none; b=RE/XE2XE6MVf6Da5qGUH4AzCE/PfCiSDv/xfuo+snICXcD5A2t7TfbpSarMDwMQ3ix5FkGEttNHMNqINgi5MkvreHXkvrojnYzB5mUzSMmtoigg0uuvBIWc3MfoVezND5WsTWvtWZx45WixN32qMDpSkLQS4hrhXU8lBWbfZ8B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945470; c=relaxed/simple;
	bh=ASFKmi0OXCJsjwo7p57f3ICOfTJtWlcQqZmAm4rqZ5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9sI6Qs2CNaVF5og/ni1ytv8xvg+B1bQ1LQw9D5S0jxwog4cd89EMWxFM15LKMgPLEYh6X0C/SsVRD1SpBigBwihx4Ty0/EruWV5VGzNHuXeUlJ0QVx9FJ181G8kGi6IStweY6bVgM1C1uh3JC0WXYUH194FflDpaMef3rLEAQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcLslQKs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcLslQKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735945469; x=1767481469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASFKmi0OXCJsjwo7p57f3ICOfTJtWlcQqZmAm4rqZ5A=;
  b=jcLslQKsR5p/KvsNINp8ieBqxoAEvjJfU6eT9uJmzf4jYFIUH8jFTbpI
   CtFa4HL2Oi1j1DsBUzmeV/Fp/QR3uYoLk9goru64B7gWTgFYAOz1JjOqg
   oFOsuwsdkkTzCAZO0HabZfTudw5F8Yn1d2v8v/xKNqq4p8Y7+GXImvTCH
   v70GN+ZSMPOKPKF7aVtfVNap2ykFQi8AYstOt6qV23L6wDCJivHugPgus
   G/VJ1EHKBMsKWRwSGc1WJPrl+j83iCiE671Iz4aVXrVPgy9nFEjR1vxIa
   0ZsHjiiwWtt07OWLNQfoTpomWXPfqRx4N+ucXKPqQhJow+IhXyWTvbtfm
   w==;
X-CSE-ConnectionGUID: YWvlFkzZTlOO9vumXmi7bg==
X-CSE-MsgGUID: aX2WHLbgQhiMUhk68Eyz6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46691599"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="46691599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 15:04:28 -0800
X-CSE-ConnectionGUID: hetX8J1dTe6ffnz2mFLoZA==
X-CSE-MsgGUID: geNu6fjYRcy7gET8QxaQsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="101981350"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Jan 2025 15:04:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTqiO-000APp-1m;
	Fri, 03 Jan 2025 23:04:24 +0000
Date: Sat, 4 Jan 2025 07:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] mm/vmscan.c:4737
 get_swapcache_reclaim_num() warn: unsigned 'swapcache_watermark[0]' is never
 less than zero.
Message-ID: <202501040621.5WmwOLsx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d51fb86ce6a3a3e59d7cba58738b63903b8cb37c
commit: abfd8691d951fb037506e1ee52ed39abee8430fa [2610/2610] etmem: add swapcache reclaim to etmem
config: x86_64-randconfig-161-20241231 (https://download.01.org/0day-ci/archive/20250104/202501040621.5WmwOLsx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501040621.5WmwOLsx-lkp@intel.com/

smatch warnings:
mm/vmscan.c:4737 get_swapcache_reclaim_num() warn: unsigned 'swapcache_watermark[0]' is never less than zero.

vim +4737 mm/vmscan.c

  4733	
  4734	static unsigned long get_swapcache_reclaim_num(unsigned long *swapcache_watermark)
  4735	{
  4736		return total_swapcache_pages() >
> 4737			swapcache_watermark[ETMEM_SWAPCACHE_WMARK_LOW] ?
  4738			(total_swapcache_pages() - swapcache_watermark[ETMEM_SWAPCACHE_WMARK_LOW]) : 0;
  4739	}
  4740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
