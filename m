Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD991BE7D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709468399; cv=none; b=tDhl6ovCuylyAYgEVNrn9Xd3Lk8QwqMLAwXdrrcUNgGPFLFPSgFZflbrWBCkg//C+6Ahj/gTd15u9Aq48N2DjvlHx+BBZ5s8WWHIFrTlRpqzMQy9v+WJB3cLk+8sRKNRwbBn+p5wazjcElNDm3lZtxrfJ6ZY2SXDUNcIFn7o0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709468399; c=relaxed/simple;
	bh=MwZYwnyFRPHcQAnl2xFpDncZ4Po95D4eSUhSEucytZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHy0a1jkoEZcxMkl6+UQXC9LNdnSy1vPcn4CtKejdnUbpj4jgiIL8EOEb/UEQOCTqS4ivL1IEAXkdGDOUBgdsf+JHPoEzL/T7PgwzaxlpF3cRuTdHRaJU+zFarxaMDSK8IOMwt2jKyEWs4tdIsXkz1FO77np9CE8rOBaoHjhfew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mI1borQt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mI1borQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709468396; x=1741004396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MwZYwnyFRPHcQAnl2xFpDncZ4Po95D4eSUhSEucytZU=;
  b=mI1borQtTTnNRXWQAt9GGY5QLJIPfs1wthproomiwYjkWUtSXuei15Jt
   aGdM7q5ezd3RzyoVPbsnz+sww64T8YtfBwgCDUx1ErPrqTb8TOm8fjCrV
   9jRrWI2SDbnHBxMqchkzybu699xTMXIbzahoUNXYs63OzGbg3Wl0yrOZL
   PcqDqKFJ6zAsk4VHmwb3LxKVZbkwL6skgct0eyM7xijHA6g5uKDLmur1b
   Ql+v3rT68fD9OkaTq1C5HTZy9gB2xMHAd1a9h50bGIY/J69xx0w9sO6f0
   B4ulVJnLo8TYi/Cu/vP5i8WhubgRAM4WUau+0rtj5FiqATeZOexfAZR1L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4130997"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4130997"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 04:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="9149366"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Mar 2024 04:19:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgkoj-0001l8-0B;
	Sun, 03 Mar 2024 12:19:45 +0000
Date: Sun, 3 Mar 2024 20:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Wagner <wagi@monom.org>
Subject: [cip:linux-4.19.y-cip-rt 1968/30000] net/core/skbuff.c:334:30:
 warning: 'netdev_alloc_lock' defined but not used
Message-ID: <202403032015.0AbXidTk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   dcbd51e7744fcf9baa3ea87a028b574fda95d428
commit: c8148273578463d3f35129ff0a22c68cfdf6ad51 [1968/30000] net: Another local_irq_disable/kmalloc headache
config: arm-randconfig-002-20240303 (https://download.01.org/0day-ci/archive/20240303/202403032015.0AbXidTk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032015.0AbXidTk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032015.0AbXidTk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/skbuff.c:66:
>> net/core/skbuff.c:334:30: warning: 'netdev_alloc_lock' defined but not used [-Wunused-const-variable=]
     334 | static DEFINE_LOCAL_IRQ_LOCK(netdev_alloc_lock);
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~
   net/core/skbuff.c:5021: warning: Function parameter or member 'skb' not described in 'skb_gso_size_check'


vim +/netdev_alloc_lock +334 net/core/skbuff.c

   331	
   332	static DEFINE_PER_CPU(struct page_frag_cache, netdev_alloc_cache);
   333	static DEFINE_PER_CPU(struct napi_alloc_cache, napi_alloc_cache);
 > 334	static DEFINE_LOCAL_IRQ_LOCK(netdev_alloc_lock);
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
