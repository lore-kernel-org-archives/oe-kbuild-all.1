Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D736D134BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715942093; cv=none; b=LrCRDtJT78AcTEBUqPNf65objhsFz+nd8/Z0QiJba7w2KyAG/zwQOftgdLQT3yP6RMjZJ7myXlzJQ4huofs5NUzH1PtTCnxtUcfxaeQ1AeFMMchTcyB8nwa+w0/uqTpj55in2QFaIdLhAgcxb0/tMIIHKZrDa4P7WO5CBk5zsOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715942093; c=relaxed/simple;
	bh=D3N9eyYYkqfWBZkMJInhv6VlWU772MlWs0Y8gSJaifk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AexeK5UYDh9ZnPheDJwpKOSa6Og3QWlI/57QBU9f8jUKM22Q/rC8Fkfzf8vgQElV9MLNonhN0xGhJKNx1BweaAoViQzW23xOCIq751OCyO+Cq3ObvCzLR8TVPVR6lQfH275Mz67aERn/p7IUMb4KFaY9HD5vu5XwTztQ3rGioYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMN6EIq4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMN6EIq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715942092; x=1747478092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3N9eyYYkqfWBZkMJInhv6VlWU772MlWs0Y8gSJaifk=;
  b=BMN6EIq48odzuVf0Qoeb6ffoiFaUtrZroIIzwa335Aa7Gf2YHSwNIwpj
   I0Xlq0cCd1px4qObxx3SXgpg35Nvrpc5iLDlEnQNaEdmHSDPiQ0kyQVCk
   +CjI1004sS1FGxDjh9hDqp+fpv6CjWNCwvTtFj2jS03Bku54aONlic7qB
   rwz64al79x0TPpIU/kg3TZGz8kSNw+Fa/pAFf+qvqrHD9b5zB836Dgw1n
   LBKtMJnXhoHHKyRckIXPVRBwAcVpqm/nDQjbEUB5jyJWNyR50m4i1NBbD
   HTvrPXJP/m/KWa36ZwLeGR47HEQipo/9Ywq4GrX/gu9wK90T38FPRaZjo
   w==;
X-CSE-ConnectionGUID: tPxLkq37RX6BJ+5I5SxkZw==
X-CSE-MsgGUID: qJDAoat+TQy0/DUZg0Bo0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23250216"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="23250216"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 03:34:52 -0700
X-CSE-ConnectionGUID: eNCM0tcnSk6rzkQxWioJEA==
X-CSE-MsgGUID: mnJy6+JjTw+MkZ31FrXzgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="36557629"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 17 May 2024 03:34:49 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7uvG-0000ZU-0i;
	Fri, 17 May 2024 10:34:46 +0000
Date: Fri, 17 May 2024 18:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6621/6628]
 drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for
 'atomic64_exchange'
Message-ID: <202405171812.wSu149di-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: c097717a325e4c5014658c59c828ba909498dc24 [6621/6628] newfeature: crypto: ccp: concurrent psp access support between user and kernel space
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405171812.wSu149di-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171812.wSu149di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171812.wSu149di-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for 'atomic64_exchange' [-Wmissing-prototypes]
      25 | uint64_t atomic64_exchange(volatile uint64_t *dst, uint64_t val)
         |          ^~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/psp-dev.c:39:5: warning: no previous prototype for 'psp_mutex_init' [-Wmissing-prototypes]
      39 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:47:5: warning: no previous prototype for 'psp_mutex_trylock' [-Wmissing-prototypes]
      47 | int psp_mutex_trylock(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~~~~


vim +/atomic64_exchange +25 drivers/crypto/ccp/hygon/psp-dev.c

    24	
  > 25	uint64_t atomic64_exchange(volatile uint64_t *dst, uint64_t val)
    26	{
    27	#if 0
    28		asm volatile(
    29				"lock ; "
    30				"xchgq %0, %1;"
    31				: "=r" (val), "=m" (*dst)
    32				: "0" (val),  "m" (*dst)
    33				: "memory");         /* no-clobber list */
    34		return val;
    35	#endif
    36		return xchg(dst, val);
    37	}
    38	
  > 39	int psp_mutex_init(struct psp_mutex *mutex)
    40	{
    41		if (!mutex)
    42			return -1;
    43		mutex->locked = 0;
    44		return 0;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
