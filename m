Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2191BC41
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765007513; cv=none; b=gdradd3adL+Bc//nx2br0peqxSeBN7Sps4097JoAByLdaDtt62wzyWAybK9rsfu9YKmvv2qyH72/m8ScbzxQGshHyoMKdzWESow60C23Jmj38EcZ92UZSxWL16a1n4z50jJwkpPYH6IZQ2j4X6RLgRkqX20yFswKk/PtXh9Uzno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765007513; c=relaxed/simple;
	bh=5pK7fTr122h29znDq7kj3LIqXw9mt7C6jz4AQVN2MPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mM28jmkhRzXQNV+dB0yXftFRySqB48zgxWCsGbTNK5omAWTfSerYL8+MYuOBdOW5EQxsS9wi48P1Bat7HCK+pG9QtP/t2Pxs0wqSGlTT+joZGPWKcNFiwZfSmjL0hYgDnVkjdhDO340kk+l58mRM8WDIJmjqrwChmvrqTEottrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZeh6Od6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZeh6Od6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765007512; x=1796543512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pK7fTr122h29znDq7kj3LIqXw9mt7C6jz4AQVN2MPY=;
  b=KZeh6Od6+AKht1gJwWK30uHTdOIVUlxfNLTKHacoYPcL0KucsXUfReQy
   9vJP9j2L92mcNFbPa2CLjC+dD3baNPPNvlo5AyLQptJ9zldkRdfH4BTYd
   jhIK3mFfX/m/bVY3HiaXGdb3eNowoUqOUIgYEMbj+5ruulGb7DkaNs97l
   mmX375u3M/kBR2lONxtlnK3NJTOxElJqoCJ1znsjtsbT0ue3rvF/9BnIi
   N9R2it3QngiwMVdaYzJDi1gyeWclSGWcWKgOm8RtSOp4gZLJVD8mLGi7w
   Gp2pPqPghvTATG1t0iNmn1s0eUGWBJPU9ewkYXDVMsfFg9+y14z1fgbQg
   w==;
X-CSE-ConnectionGUID: B+HRQH+JSDO0UhZP5rRGqQ==
X-CSE-MsgGUID: kWBG6mfGQ/yxTBXWMUBz8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78500429"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78500429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 23:51:51 -0800
X-CSE-ConnectionGUID: It3sdFqLSU63GXWKHDW9Tg==
X-CSE-MsgGUID: Y/g7B++DSRq6L9MYANuZQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195116243"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 23:51:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRn50-00000000G0b-28hq;
	Sat, 06 Dec 2025 07:51:46 +0000
Date: Sat, 6 Dec 2025 15:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 12/12] mm/madvise.c:2016:57: error:
 'struct mm_struct' has no member named 'owner'
Message-ID: <202512061516.k8SFu2Hs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   029c3b29942fa7c9965736a5ab9030f41c9c02d3
commit: 8eb091b59da95aa21fed882e17e939e416c132e0 [12/12] ANDROID: vendor_hooks: add hook to optimize the madvise processing flow
config: x86_64-randconfig-161-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061516.k8SFu2Hs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061516.k8SFu2Hs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061516.k8SFu2Hs-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/madvise.c: In function 'vector_madvise':
>> mm/madvise.c:2016:57: error: 'struct mm_struct' has no member named 'owner'
    2016 |                 trace_android_vh_process_madvise_iter(mm->owner, behavior, &ret);
         |                                                         ^~


vim +2016 mm/madvise.c

  1990	
  1991	/* Perform an madvise operation over a vector of addresses and lengths. */
  1992	static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
  1993				      int behavior)
  1994	{
  1995		ssize_t ret = 0;
  1996		size_t total_len;
  1997		struct mmu_gather tlb;
  1998		struct madvise_behavior madv_behavior = {
  1999			.mm = mm,
  2000			.behavior = behavior,
  2001			.tlb = &tlb,
  2002		};
  2003	
  2004		total_len = iov_iter_count(iter);
  2005	
  2006		ret = madvise_lock(&madv_behavior);
  2007		if (ret)
  2008			return ret;
  2009		madvise_init_tlb(&madv_behavior);
  2010	
  2011		while (iov_iter_count(iter)) {
  2012			unsigned long start = (unsigned long)iter_iov_addr(iter);
  2013			size_t len_in = iter_iov_len(iter);
  2014			int error;
  2015	
> 2016			trace_android_vh_process_madvise_iter(mm->owner, behavior, &ret);
  2017			if (ret < 0)
  2018				break;
  2019	
  2020			if (madvise_should_skip(start, len_in, behavior, &error))
  2021				ret = error;
  2022			else
  2023				ret = madvise_do_behavior(start, len_in, &madv_behavior);
  2024			/*
  2025			 * An madvise operation is attempting to restart the syscall,
  2026			 * but we cannot proceed as it would not be correct to repeat
  2027			 * the operation in aggregate, and would be surprising to the
  2028			 * user.
  2029			 *
  2030			 * We drop and reacquire locks so it is safe to just loop and
  2031			 * try again. We check for fatal signals in case we need exit
  2032			 * early anyway.
  2033			 */
  2034			if (ret == -ERESTARTNOINTR) {
  2035				if (fatal_signal_pending(current)) {
  2036					ret = -EINTR;
  2037					break;
  2038				}
  2039	
  2040				/* Drop and reacquire lock to unwind race. */
  2041				madvise_finish_tlb(&madv_behavior);
  2042				madvise_unlock(&madv_behavior);
  2043				ret = madvise_lock(&madv_behavior);
  2044				if (ret)
  2045					goto out;
  2046				madvise_init_tlb(&madv_behavior);
  2047				continue;
  2048			}
  2049			if (ret < 0)
  2050				break;
  2051			iov_iter_advance(iter, iter_iov_len(iter));
  2052		}
  2053		madvise_finish_tlb(&madv_behavior);
  2054		madvise_unlock(&madv_behavior);
  2055	
  2056	out:
  2057		ret = (total_len - iov_iter_count(iter)) ? : ret;
  2058	
  2059		return ret;
  2060	}
  2061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
