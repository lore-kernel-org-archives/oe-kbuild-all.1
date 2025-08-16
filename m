Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D8154BF5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 04:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755317681; cv=none; b=ocZbPgAZIXRMQfPrN61puWgK7ykFbvyxrfS1wd7WMUrob9+fNH+y164zzYFSErmkTuOPwUmZGratqz1O5EjlKQlEMz3UTBg0sz3piYFa7WFZAiTWO3cPqJhliIWDuk1aMT5TDbQLgjmITGBVghC6aoCJQ/r9CNy/W/XXYUvfbvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755317681; c=relaxed/simple;
	bh=ifANGTfhfXYEfBFlTHgqUcNJksck47vDXftcoMpTLQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knn6uFOgQVm8pbDSpJv6qo21zRl6GFmR3b6R/Xfsrqd06TVeJari7/xPsVkujjNe94789KPy/CWiiJ/b0BywK2eHNWmA+18aFZMPKX9izchJez8LCT1yAmuyMRWlnaui4G3jbBtvqeHpzVTzYL0PeEYJhg8DgRtOvXjSjlhUCco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frkMS995; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frkMS995"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755317680; x=1786853680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifANGTfhfXYEfBFlTHgqUcNJksck47vDXftcoMpTLQo=;
  b=frkMS995NUXEtzzm562wR6v+rL1e89pSdzOhUT0lllMdiUT1ddASFkh4
   Gm79ccAKdqK70fzKxmzHUgaBae5xA6/g7QONSqsx+WIQD1i5XMrBGd6AX
   J3L3lAIbT8IbeY1w+wYbHRSV0AP116/l0IJlzYpFBrLyBq4Mi9Rk08R8G
   Z092fqOgXMHZ848vmMczj6OuNkzokeZnYyUxeO79JHHTbQLGGJ1+4cRKt
   22Ui0pYM6+c7ZM++BmwmNFSwSjYYYdaEZKOMfOq6X3rg7/T6VudJiOLAw
   ZFlCkDgtxQr3AcFZueNP+KhIhKRjFAuKa431nJwOLz/lVWGgpURwQcT29
   g==;
X-CSE-ConnectionGUID: fjTAkpRAQXGhwZ9CPGv7Yg==
X-CSE-MsgGUID: FImWDjAeQpqqTETEVSxtRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="68722724"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68722724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 21:14:38 -0700
X-CSE-ConnectionGUID: VSpa71C6RGuyq3N+Wpwz+w==
X-CSE-MsgGUID: oUl9ZGJzTGGbvxvSA3QrFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204322733"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 21:14:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un8JP-000Ca8-0M;
	Sat, 16 Aug 2025 04:14:35 +0000
Date: Sat, 16 Aug 2025 12:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 300/304] fs/bcachefs/darray.c:34:17:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202508161253.mnWENV8W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d5942ce2cc0c080ab0e9783d01c6d50475df5d25
commit: 4882cbc676aa35854337b7302d982f54c4f4bc70 [300/304] bcachefs: darray_make_room_rcu()
config: nios2-randconfig-r121-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161253.mnWENV8W-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250816/202508161253.mnWENV8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508161253.mnWENV8W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/darray.c:34:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/darray.c:34:17: sparse:    char [noderef] __rcu *
   fs/bcachefs/darray.c:34:17: sparse:    char *

vim +34 fs/bcachefs/darray.c

     7	
     8	int __bch2_darray_resize_noprof(darray_char *d, size_t element_size, size_t new_size, gfp_t gfp,
     9					bool rcu)
    10	{
    11		if (new_size > d->size) {
    12			new_size = roundup_pow_of_two(new_size);
    13	
    14			/*
    15			 * This is a workaround: kvmalloc() doesn't support > INT_MAX
    16			 * allocations, but vmalloc() does.
    17			 * The limit needs to be lifted from kvmalloc, and when it does
    18			 * we'll go back to just using that.
    19			 */
    20			size_t bytes;
    21			if (unlikely(check_mul_overflow(new_size, element_size, &bytes)))
    22				return -ENOMEM;
    23	
    24			void *old = d->data;
    25			void *new = likely(bytes < INT_MAX)
    26				? kvmalloc_noprof(bytes, gfp)
    27				: vmalloc_noprof(bytes);
    28			if (!new)
    29				return -ENOMEM;
    30	
    31			if (d->size)
    32				memcpy(new, old, d->size * element_size);
    33	
  > 34			rcu_assign_pointer(d->data, new);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
