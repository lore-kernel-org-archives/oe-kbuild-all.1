Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F307A1ADC86
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742640580; cv=none; b=cAtANTVf+2BvtVrMaNnjPqV94GWei5blYKP3qjaE1cyCH1Nk4OfPbKimXh04r4a1Pk2/8NtTfjpKqngSSFxr4GIPatMwvqkIt6j1thXqZO/B28VQ4UBcT+V9vte4rY5rIP6D6Lk6WDTFsmdj/OPOFOGiqdNdgqMmlf5fRnARZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742640580; c=relaxed/simple;
	bh=584UIAeOCe7u/Pizy6dXAxkb0xmPpq+VgpuQoSTimD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHFnvVy5I03ifO8ei7gmK7W+zNSfHpypa5a0GQiTMevYvPffPnO6ynxPYLlBSaRGlm6kUQqeODrH2QJvvf1bPJ66xQtjfk3XeZLDjfsVKOGjuRJWMxWmxZkk+nyAQkf/BK4WIz94iAw9cJL/+gwFQBTSz8WWaBjI/7NMt1mND4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+MQax9l; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+MQax9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742640577; x=1774176577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=584UIAeOCe7u/Pizy6dXAxkb0xmPpq+VgpuQoSTimD8=;
  b=U+MQax9lsoyi1koESzkmIYeXFkb9RTcSQkiRJ3MmozPSTKlQrs9D1KdH
   bW7JwrM/omB0dqoiyKmBm39kticf5ckyBYtINpc++uAPq0ZFHFww5FlqK
   PbtWVnyeZrziEfwzdbg8rDh9HaZDLeuja17IZYUCkcgu7LaioQQxm/R1F
   iesLeFknZZvtuApHcQtIQf21l5fzf+EL2pREupONLSIO4hncYpLdll0Uq
   QxcLmowwLntvqIdsB80tce6oll1ORIC0CVTqN/wPjhM/sSvvsAEqBY/6E
   NM6jD5NeVk1z8A//8uHAN2o9qW8juQEFuvU/nZgAdWBk+rVO9BBsOddXa
   A==;
X-CSE-ConnectionGUID: iAS+c6RiTveSF2WlV7UaPg==
X-CSE-MsgGUID: lhiYamkaTGGAczTNgqq9aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="31494396"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="31494396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 03:49:36 -0700
X-CSE-ConnectionGUID: K4wpJmC+TbqjDOXYK9kgvA==
X-CSE-MsgGUID: FzEu5jXJTSGaDFaRfk0M+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="154513288"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2025 03:49:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvwPy-00026c-0m;
	Sat, 22 Mar 2025 10:49:31 +0000
Date: Sat, 22 Mar 2025 18:48:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510] mm/maccess.c:64:6: sparse:
 sparse: symbol '__probe_user_read' was not declared. Should it be static?
Message-ID: <202503221848.AeSAEte6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   abf385ef625e6aeb4923da42fef9ebce788f4ecf
commit: 5c5bac1227aee80ee106ec07b32c981558049304 [1510/1510] uaccess: Add non-pagefault user-space read functions
config: arm64-randconfig-r132-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221848.AeSAEte6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503221848.AeSAEte6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221848.AeSAEte6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/maccess.c:64:6: sparse: sparse: symbol '__probe_user_read' was not declared. Should it be static?
   mm/maccess.c:64:6: warning: no previous prototype for '__probe_user_read' [-Wmissing-prototypes]
      64 | long __probe_user_read(void *dst, const void __user *src, size_t size)
         |      ^~~~~~~~~~~~~~~~~

vim +/__probe_user_read +64 mm/maccess.c

    50	
    51	/**
    52	 * probe_user_read(): safely attempt to read from a user-space location
    53	 * @dst: pointer to the buffer that shall take the data
    54	 * @src: address to read from. This must be a user address.
    55	 * @size: size of the data chunk
    56	 *
    57	 * Safely read from user address @src to the buffer at @dst. If a kernel fault
    58	 * happens, handle that and return -EFAULT.
    59	 */
    60	
    61	long __weak probe_user_read(void *dst, const void __user *src, size_t size)
    62	    __attribute__((alias("__probe_user_read")));
    63	
  > 64	long __probe_user_read(void *dst, const void __user *src, size_t size)
    65	{
    66		long ret = -EFAULT;
    67		mm_segment_t old_fs = get_fs();
    68	
    69		set_fs(USER_DS);
    70		if (access_ok(src, size))
    71			ret = probe_read_common(dst, src, size);
    72		set_fs(old_fs);
    73	
    74		return ret;
    75	}
    76	EXPORT_SYMBOL_GPL(probe_user_read);
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
