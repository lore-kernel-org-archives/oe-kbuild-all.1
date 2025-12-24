Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC74D155322
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 23:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766620793; cv=none; b=BlF/dVnknqzxuvOx0UBy4M4nu+cZCusqBXwyshokw4JpD3bNELsWsCcgueX9bZUPAiAnwL6e8LnDIA7iRN8zJMNnmSRpZQOdZyaRp4MRpXzx8jqz46EIjGG6ht/yi/a6f7qhENo2OD3WAJs6xL8LoMJ3Rv8vx/kEU+RnYkUEGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766620793; c=relaxed/simple;
	bh=ns4pAbHxDEQ2aE0vk4LHJycI4Z0OVBefxIhzYz9E4/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CxoMRJUSlOedH6drmT67Rf8TW194WPO2l8393Ak3PNo/ETPsmmnQ0S3py6507SxXHzPVX7mRj5YROj2SSTBmFTuEZGpLt/wVVSFkJ4HmXhFj7bm1XYwzwsqbfkP1ZpYM79YoTdB77OiBdQSkUtKkBurdsnu4gAgvQqdmvx5f5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/4zpeDu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/4zpeDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766620790; x=1798156790;
  h=date:from:to:cc:subject:message-id;
  bh=ns4pAbHxDEQ2aE0vk4LHJycI4Z0OVBefxIhzYz9E4/k=;
  b=I/4zpeDuHz37wFfbBwQkZx/4bArs39HTfCkgw2Nt2xB3wfDjbr/cZ4mf
   pNQUhkYnt5ICaO4cPWGBHwjC7DXfQa/O9zqEPpFgZwqs5/pkUxBJt+x38
   nsRUoUlRHjayB2oUvdsnqZVT17jHL7k2EqQgRv6QiXaqPcdz6oozNlNgl
   yMVEtMmEmdhOZGttfo4TXMPO0rhGEvRVhGllC13HDfQgY6ADBEhfxMZaU
   NCp5wSzFSol2DVgBvvUAlWwPYbp/xTsN0XiDekjSSQELww5wSRRFZYlaE
   mAXRR8VmjKtDO7EFzD7LTMAORpJcJoAjHot3g3dGw4dPD2RDwM44MHwU7
   A==;
X-CSE-ConnectionGUID: ZkaMg7jlRsayD1kstiRRiA==
X-CSE-MsgGUID: GSEEIg3QSvCsEIHylwHHeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68603816"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68603816"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 15:59:50 -0800
X-CSE-ConnectionGUID: DXkzFRfsTVyB+E0SygOQgw==
X-CSE-MsgGUID: SU6jBv8KQuO0vHAOswMINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="204248428"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Dec 2025 15:59:49 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYYle-000000003ZF-1efN;
	Wed, 24 Dec 2025 23:59:46 +0000
Date: Thu, 25 Dec 2025 07:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/net/ethernet/microchip/lan743x_ptp.c:985:6: warning: no previous
 prototype for function 'lan743x_ptp_set_sync_ts_insert'
Message-ID: <202512250737.MecjkLdA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bryan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 07624df1c9efd4b7f2f6762581587c590b03c7a2 [1942/1942] lan743x: lan743x: Add PTP support
config: x86_64-randconfig-071-20251213 (https://download.01.org/0day-ci/archive/20251225/202512250737.MecjkLdA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250737.MecjkLdA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250737.MecjkLdA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:78:
   include/linux/compiler-clang.h:25:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      25 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/net/ethernet/microchip/lan743x_ptp.c:781:28: error: no member named 'ptp_clock' in 'struct lan743x_ptp'
     781 |                 ptp_schedule_worker(ptp->ptp_clock, 0);
         |                                     ~~~  ^
   drivers/net/ethernet/microchip/lan743x_ptp.c:879:6: warning: unused variable 'ret' [-Wunused-variable]
     879 |         int ret = -ENODEV;
         |             ^~~
>> drivers/net/ethernet/microchip/lan743x_ptp.c:985:6: warning: no previous prototype for function 'lan743x_ptp_set_sync_ts_insert' [-Wmissing-prototypes]
     985 | void lan743x_ptp_set_sync_ts_insert(struct lan743x_adapter *adapter,
         |      ^
   drivers/net/ethernet/microchip/lan743x_ptp.c:985:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     985 | void lan743x_ptp_set_sync_ts_insert(struct lan743x_adapter *adapter,
         | ^
         | static 
   3 warnings and 1 error generated.


vim +/lan743x_ptp_set_sync_ts_insert +985 drivers/net/ethernet/microchip/lan743x_ptp.c

   984	
 > 985	void lan743x_ptp_set_sync_ts_insert(struct lan743x_adapter *adapter,
   986					    bool ts_insert_enable)
   987	{
   988		u32 ptp_tx_mod = lan743x_csr_read(adapter, PTP_TX_MOD);
   989	
   990		if (ts_insert_enable)
   991			ptp_tx_mod |= PTP_TX_MOD_TX_PTP_SYNC_TS_INSERT_;
   992		else
   993			ptp_tx_mod &= ~PTP_TX_MOD_TX_PTP_SYNC_TS_INSERT_;
   994	
   995		lan743x_csr_write(adapter, PTP_TX_MOD, ptp_tx_mod);
   996	}
   997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
