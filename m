Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F6A926
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 10:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730628925; cv=none; b=KABaCwIBU+0ndRfzEUE6ppFMVjFEgdRrwR0zwqhBszYNYWKbwIDcC5/8gh6v5bW80alSrB3xT0wH1yWnB10oZCW0iQdTBAxn4pVdY3CQyut02Yja2ssvrZzo285Hk9ue6qkaniuye60bLzBXX3agbxe8PjJJQJV/UAC0iC7zjeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730628925; c=relaxed/simple;
	bh=IHtqwExf+BnSnchudSgV+iowLHsWjrU70A8Qeq/YfRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7WNnalfiftuiqsgw1RlrN0WgmjgiYsd0HRePuQyXfpNldNDbYtM4k0l6Ru293DDj64QI5a0do3PWA0H/qw9GA7H7XcPwtRr0cKDh/4wbFjfiElTPB71B9L0RADo0njGsSoymzbP4pSnX4BuTKEcL4MTwriFncZ4LK101azrsbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzQ0fvrU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzQ0fvrU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730628923; x=1762164923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHtqwExf+BnSnchudSgV+iowLHsWjrU70A8Qeq/YfRY=;
  b=nzQ0fvrUM5tm6rdJBbUSuYN9z7y73RVIP7VS/v7bCZkXYgjBNiaqRwjG
   MH8CeRHtSAfbvDuNg4jv7BZA374J08MFT17LGm7364KW/iA5Su3EH5yKG
   jiPHymKiEYhzH0grS14C0ou51zAtFLDkkfabaT8QRwSzR5BmDXqvFd7ME
   JGcEgPIaIncjWD3uGjsExJz/K36C4OoUHMztegc6jQS1Ve72RNDhBI0xd
   rN+N/kvSh1DdleeYmocvkBdVqKIcnjbUSnU4boakC+X79nl5prNaejXMC
   4JIKkhPcKuQ12ThoDmFnjA+6pFhiOJk75YXwqxVrHotDm+BfCZf8mARbG
   Q==;
X-CSE-ConnectionGUID: JbOxepwfShSlNaF5ljMfRQ==
X-CSE-MsgGUID: AgFvAScsRxu3NKPEbApfwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30498452"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30498452"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 02:15:22 -0800
X-CSE-ConnectionGUID: gezJFob8SouARcmDNXF43g==
X-CSE-MsgGUID: W01AkwDuSzehAmK27v3LcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="88511180"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Nov 2024 02:15:22 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Xdf-000jsX-0X;
	Sun, 03 Nov 2024 10:15:19 +0000
Date: Sun, 3 Nov 2024 18:15:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, WenChen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2284/2284]
 drivers/ub/urma/ubcore/ubcore_tp.c:392:5: warning: no previous prototype for
 'ubcore_modify_tp_state'
Message-ID: <202411031836.4wU640gU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WenChen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   170b758d064664f953e8f6de41dd4a3ef122443a
commit: 329bf7f331286ee5d571d374e31ed50d2877b110 [2284/2284] ubcore: fix the bug of tp negotiation concurrency
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241103/202411031836.4wU640gU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031836.4wU640gU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031836.4wU640gU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_tp.c:66:17: warning: no previous prototype for 'ubcore_get_mtu' [-Wmissing-prototypes]
      66 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         |                 ^~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_tp.c:392:5: warning: no previous prototype for 'ubcore_modify_tp_state' [-Wmissing-prototypes]
     392 | int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:894:19: warning: no previous prototype for 'ubcore_create_vtp' [-Wmissing-prototypes]
     894 | struct ubcore_tp *ubcore_create_vtp(struct ubcore_device *dev, union ubcore_eid *remote_eid,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:920:5: warning: no previous prototype for 'ubcore_destroy_vtp' [-Wmissing-prototypes]
     920 | int ubcore_destroy_vtp(struct ubcore_tp *vtp)
         |     ^~~~~~~~~~~~~~~~~~


vim +/ubcore_modify_tp_state +392 drivers/ub/urma/ubcore/ubcore_tp.c

   391	
 > 392	int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
   393		enum ubcore_tp_state new_state, struct ubcore_tp_attr *attr, union ubcore_tp_attr_mask mask)
   394	{
   395		if (ubcore_modify_tp_state_check(tp, new_state) != 0)
   396			return -1;
   397	
   398		if (tp->state == UBCORE_TP_STATE_ERR && new_state == UBCORE_TP_STATE_ERR) {
   399			ubcore_log_info("tp is already in ERR state and tpn = %u",
   400				tp->tpn);
   401			return 0;
   402		}
   403	
   404		if (dev->ops->modify_tp(tp, attr, mask) != 0) {
   405			/* tp->peer_ext.addr will be freed when called ubcore_destroy_tp */
   406			ubcore_log_err("Failed to modify tp to %u from state %u and tpn = %u",
   407				(uint32_t)new_state, (uint32_t)tp->state, tp->tpn);
   408			return -1;
   409		}
   410		tp->state = new_state;
   411		ubcore_log_info("tp state:(%u to %u) with tpn %u, peer_tpn %u",
   412			(uint32_t)tp->state, (uint32_t)new_state, tp->tpn, tp->peer_tpn);
   413		return 0;
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
