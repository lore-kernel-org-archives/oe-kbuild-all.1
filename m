Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15271B6CF6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735046047; cv=none; b=nnc9u0q/Zq9iIxxR5np7vg/aab74P5Yz1HajYihCsUVEfyaXip4QEudsQs2or+LpIcvnjo/mReH7KNsmrOxMoQyR2sW6Rux75ULktbeNc1yc+lZZp3jdtryOUg9ezIWr9qIal+jm7/JZMluKqRnaEjcXwz+IhsJbIH7n6EzSPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735046047; c=relaxed/simple;
	bh=e4GJ3CTZltEfs7LmIqlJa3qOeos+MwXyNXicRPQHtgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zf1Z307Mzxx9SW0kzLRyMMu8rNrhXB0RjQvA6fkox4y4cvt12ke+ZS3hm09skT6nvjvSJ13sNMCm5DOSFYw2y1GzaqyIMAqlAr8fZJtEmwd9d2HsjuTeIxwFy3jpLgDUwtUQaXeL11Z7hVQyn2GsrGd3YTHqCC48++gyWWCdrI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M6LzgqoB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M6LzgqoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735046045; x=1766582045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4GJ3CTZltEfs7LmIqlJa3qOeos+MwXyNXicRPQHtgM=;
  b=M6LzgqoBSgy9P3bQkW9iwPdXGb6jJb4xqYKF6LZDj3EqGl4zJc/NXZm9
   yas7/qk0aW2dJzYC00uwUc0RtVOLeq506WYGHn7zKK7NgxJX83AqCcvIB
   0g/RXGTjAym2WFPF22BUsWOZMskc43x5HNQnCPumhvF/F1D5xKFqSyUMp
   3251lSpRaYXsaLxmztwReDg0urkL0hlCkgHZLDt0X3ac9z+4LJwK30r5d
   kXWtPs5zBwc8WfHJA7/Rf3mvALzYPoK9r3dmAjESLDJqmRyc5ZztCJcO/
   t6ZQuEZTA4pcAACc2VdAEGBJ4abqyXy+RJfzdoRwAwbB6jgI3HPIlxZQd
   A==;
X-CSE-ConnectionGUID: aUPkEE2rSWO1fzwB44SNbQ==
X-CSE-MsgGUID: 84iWTb4JRpeWF6g04Y/PQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="52920148"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="52920148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 05:14:04 -0800
X-CSE-ConnectionGUID: reun1QNjTsWvfkU/EhvA8A==
X-CSE-MsgGUID: CbkSHPGDRjmAfkHlH98hqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136803169"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2024 05:14:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ4jY-000199-1V;
	Tue, 24 Dec 2024 13:14:00 +0000
Date: Tue, 24 Dec 2024 21:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343]
 drivers/iommu/iommu.c:979:31: sparse: sparse: dubious: !x | !y
Message-ID: <202412242131.GLZuoZe5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a23f5b9f615aef1973a9e3894d42c2ddd7364b3
commit: ac084b72b429b1bc0378add3abecfe107a732b7a [1343/1343] iommu: introduce device fault report API
config: arm64-randconfig-r113-20241223 (https://download.01.org/0day-ci/archive/20241224/202412242131.GLZuoZe5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241224/202412242131.GLZuoZe5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242131.GLZuoZe5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/iommu.c:979:31: sparse: sparse: dubious: !x | !y
   drivers/iommu/iommu.c: In function 'iommu_unregister_device_fault_handler':
   drivers/iommu/iommu.c:937:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     937 |         int ret = 0;
         |             ^~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/iommu/iommu.c:21:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'iommu_device_register' at drivers/iommu/iommu.c:101:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             25-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   In file included from include/linux/mutex.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:21:
   drivers/iommu/iommu.c: In function 'iommu_device_register':
   drivers/iommu/iommu.c:97:24: note: object 'iommu_device_lock' of size 4
      97 | static DEFINE_SPINLOCK(iommu_device_lock);
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'iommu_device_register' at drivers/iommu/iommu.c:101:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             49-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/iommu/iommu.c: In function 'iommu_device_register':
   drivers/iommu/iommu.c:97:24: note: object 'iommu_device_lock' of size 4
      97 | static DEFINE_SPINLOCK(iommu_device_lock);
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'iommu_device_unregister' at drivers/iommu/iommu.c:110:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             69-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/iommu/iommu.c: In function 'iommu_device_unregister':
   drivers/iommu/iommu.c:97:24: note: object 'iommu_device_lock' of size 4
      97 | static DEFINE_SPINLOCK(iommu_device_lock);
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'iommu_device_unregister' at drivers/iommu/iommu.c:110:2:
   arch/arm64/include/asm/atomic_lse.h:458:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     458 |         asm volatile(ARM64_LSE_ATOMIC_INSN(                             89-      |         ^~~
   arch/arm64/include/asm/atomic_lse.h:479:1: note: in expansion of macro '__CMPXCHG_CASE'
     479 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/iommu/iommu.c: In function 'iommu_device_unregister':
   drivers/iommu/iommu.c:97:24: note: object 'iommu_device_lock' of size 4
      97 | static DEFINE_SPINLOCK(iommu_device_lock);
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/spinlock_types.h:81:44: note: in definition of macro 'DEFINE_SPINLOCK'
      81 | #define DEFINE_SPINLOCK(x)      spinlock_t x = __SPIN_LOCK_UNLOCKED(x)
         |                                            ^
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,

vim +979 drivers/iommu/iommu.c

   960	
   961	
   962	/**
   963	 * iommu_report_device_fault() - Report fault event to device
   964	 * @dev: the device
   965	 * @evt: fault event data
   966	 *
   967	 * Called by IOMMU model specific drivers when fault is detected, typically
   968	 * in a threaded IRQ handler.
   969	 *
   970	 * Return 0 on success, or an error.
   971	 */
   972	int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
   973	{
   974		int ret = 0;
   975		struct iommu_fault_event *evt_pending;
   976		struct iommu_fault_param *fparam;
   977	
   978		/* iommu_param is allocated when device is added to group */
 > 979		if (!dev->iommu_param | !evt)
   980			return -EINVAL;
   981		/* we only report device fault if there is a handler registered */
   982		mutex_lock(&dev->iommu_param->lock);
   983		if (!dev->iommu_param->fault_param ||
   984			!dev->iommu_param->fault_param->handler) {
   985			ret = -EINVAL;
   986			goto done_unlock;
   987		}
   988		fparam = dev->iommu_param->fault_param;
   989		if (evt->type == IOMMU_FAULT_PAGE_REQ && evt->last_req) {
   990			evt_pending = kzalloc(sizeof(*evt_pending), GFP_ATOMIC);
   991			if (!evt_pending) {
   992				ret = -ENOMEM;
   993				goto done_unlock;
   994			}
   995			memcpy(evt_pending, evt, sizeof(struct iommu_fault_event));
   996			mutex_lock(&fparam->lock);
   997			list_add_tail(&evt_pending->list, &fparam->faults);
   998			mutex_unlock(&fparam->lock);
   999		}
  1000		ret = fparam->handler(evt, fparam->data);
  1001	done_unlock:
  1002		mutex_unlock(&dev->iommu_param->lock);
  1003		return ret;
  1004	}
  1005	EXPORT_SYMBOL_GPL(iommu_report_device_fault);
  1006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
