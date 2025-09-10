Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49089219A8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 02:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472740; cv=none; b=iB8w1JYNUNIduqggQksrMxgjdcmZ/qKRILKewXOMW/qCXJ9Ekesa37Jn8NAaUa5ORpsGXSayxHZRRCK0yT3oblFgDGb2mRcD+xTK79jaY+QQuJ9jDmRuVT3Y8boV3r5X1j7AI9gznEIHuC1vpxffmZFix1uSHHBVjab63ttyjjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472740; c=relaxed/simple;
	bh=jKkiV/Mju5hGkWHmUQIFCgvI5sWmzLV6RoLTZvQMkiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eyzHWs3BXt2mg+xY0zbXzlkQ2h5uPJH9GOQK4YWicE5ovznJiIW/5+P1f24u909j9hbz0K51LY7xblBtaxp+fc9SPOY6gouoQvNj8kNvfUe2T5AXiqFWOw8yhAHKjYnQLC8TZ0TjpZemXmfSC5pIwWut/yHObZwj5r7kfcNhyIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=at3VSrXA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="at3VSrXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757472738; x=1789008738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jKkiV/Mju5hGkWHmUQIFCgvI5sWmzLV6RoLTZvQMkiI=;
  b=at3VSrXACgZ2WSG5Iki8tPxyLLi7Au2rAb+JP0n5jU22zTcpnRBfSbxR
   QaOFmn8YxTy/9Wdfz2T/i8sqr78KA5okpVPxNPd1+St+CTqSq6BnH2LsS
   pLr4R1vcSMCf7svrjd7g0FCnsMue+Rsh+hSeLsj9E5iXr5A6sKIurqnP8
   RbDiWTKhsfDB0leXR+fShJwvgUX7dLGDHf9GB8yZbHY/DUJ6eVbJ8s0wk
   0rraxiLzMfjlZWxGmV4A54V3xNCM4SCGoMjx53ZFEXXEFKpvN9G0cxiQ8
   JOH5CQLh7BkCF+2C5uTPBMoaXt5uDa3w6QHHwZJGyfqu3bUBtiHYzUwM3
   g==;
X-CSE-ConnectionGUID: wYSxxch9SlOSnzsWX1zcCg==
X-CSE-MsgGUID: 2oTVJHi4Rg6Rk8J/BGp6tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71188176"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="71188176"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 19:52:17 -0700
X-CSE-ConnectionGUID: UqPPe3mhQCeca7PYrnWq6g==
X-CSE-MsgGUID: 3YpwmuZkTpGigQw/b/71dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="173711524"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2025 19:52:15 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwAwP-0005Tp-1E;
	Wed, 10 Sep 2025 02:52:13 +0000
Date: Wed, 10 Sep 2025 10:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <Atish.Patra@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [atishp04:b4/pmu_event_info_v6 8/9]
 arch/riscv/kvm/vcpu_pmu.c:458:15: warning: variable 'end_shmem' set but not
 used
Message-ID: <202509101020.MTWOwAwp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux b4/pmu_event_info_v6
head:   e60bd839b91f8d8e213cd9eeab066c214d53a24a
commit: d1fa49cbe06f3b36a186c582c3db3367b1e32d03 [8/9] RISC-V: KVM: Implement get event info function
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250910/202509101020.MTWOwAwp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101020.MTWOwAwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101020.MTWOwAwp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_pmu.c:458:15: warning: variable 'end_shmem' set but not used [-Wunused-but-set-variable]
     458 |         gpa_t shmem, end_shmem;
         |                      ^
   1 warning generated.


vim +/end_shmem +458 arch/riscv/kvm/vcpu_pmu.c

   451	
   452	int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low,
   453					  unsigned long saddr_high, unsigned long num_events,
   454					  unsigned long flags, struct kvm_vcpu_sbi_return *retdata)
   455	{
   456		struct riscv_pmu_event_info *einfo = NULL;
   457		int shmem_size = num_events * sizeof(*einfo);
 > 458		gpa_t shmem, end_shmem;
   459		u32 eidx, etype;
   460		u64 econfig;
   461		int ret;
   462	
   463		if (flags != 0 || (saddr_low & (SZ_16 - 1) || num_events == 0)) {
   464			ret = SBI_ERR_INVALID_PARAM;
   465			goto out;
   466		}
   467	
   468		shmem = saddr_low;
   469		if (saddr_high != 0) {
   470			if (IS_ENABLED(CONFIG_32BIT)) {
   471				shmem |= ((gpa_t)saddr_high << 32);
   472			} else {
   473				ret = SBI_ERR_INVALID_ADDRESS;
   474				goto out;
   475			}
   476		}
   477	
   478		end_shmem = (shmem + shmem_size + PAGE_SIZE - 1) & PAGE_MASK;
   479		einfo = kzalloc(shmem_size, GFP_KERNEL);
   480		if (!einfo)
   481			return -ENOMEM;
   482	
   483		ret = kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
   484		if (ret) {
   485			ret = SBI_ERR_FAILURE;
   486			goto free_mem;
   487		}
   488	
   489		for (int i = 0; i < num_events; i++) {
   490			eidx = einfo[i].event_idx;
   491			etype = kvm_pmu_get_perf_event_type(eidx);
   492			econfig = kvm_pmu_get_perf_event_config(eidx, einfo[i].event_data);
   493			ret = riscv_pmu_get_event_info(etype, econfig, NULL);
   494			einfo[i].output = (ret > 0) ? 1 : 0;
   495		}
   496	
   497		ret = kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
   498		if (ret) {
   499			ret = SBI_ERR_INVALID_ADDRESS;
   500			goto free_mem;
   501		}
   502	
   503		ret = 0;
   504	free_mem:
   505		kfree(einfo);
   506	out:
   507		retdata->err_val = ret;
   508	
   509		return 0;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
