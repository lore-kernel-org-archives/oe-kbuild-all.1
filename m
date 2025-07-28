Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA22F56
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753663901; cv=none; b=KMJrZQYa3FVOjqmCraBSQHim+go/7ELYV+paBc8qEbZh9MTJ/OVsufl+cdpn+WA7uaZs9T8/vxZMJ3jWzwRWHKI+axD7rQVKMIvSf7asv+++V2RaUfkbRhrxA2kRGiGcEquZX/RpGRozYI6qweo8goK8gYyA2jh4NOAd+Utib/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753663901; c=relaxed/simple;
	bh=BNKDYEs4uo1Oy2Fjac+G0WYREMa6z56/pkLNnnM6gu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sc5FTEgb/38w4zrqpDoccrwL36m/ODt/qzyp/9r/InohYC1QPN69FAqT8NXBPYCY0PzEVPMOhq+gRZIHyL5gwIgBtf57wOCV/9bl4OskuFbx8nu47WRtBvMMGNDsPefUrAB8CbZHKS8id/sJoiuZ4gUelt5Sm/48ANiNZBUyGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=As9mmT6J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="As9mmT6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753663899; x=1785199899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNKDYEs4uo1Oy2Fjac+G0WYREMa6z56/pkLNnnM6gu4=;
  b=As9mmT6JI7gWrUQmuaYu2FgfP07DWt69ArNAo/M+zScx8us2ZROc//6n
   0hIBcddA91Jk5YCfOryaRW7gLOQx+3LQeyJ6ATIClQmoLzadCsa8o542s
   mTOL4+x1125lXhyd97K5JBpcj/8GkJTCaQK/ury/xW+WRzNiRrK367T9g
   nqlw+Ki/JW59lATLqA0fZYQAsTISTw031nDcfgthMuZ4IPAWcLFfZ3N2W
   +l+Pm4s3zdPkgfBDXbZnJXDqX/hM5wsCNQQfewsh8RrU4EWGKLwmoAsz+
   Tft0nO4MqI0HXwHhwNVXMjHS1eC5//nBVhXIvrNCv4utqtxsX0MXQvkwX
   Q==;
X-CSE-ConnectionGUID: rVyqAK25Sq2CyVL6l3vLUA==
X-CSE-MsgGUID: Z3jePHAHQfaTWSgig6rQMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55873119"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55873119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 17:51:38 -0700
X-CSE-ConnectionGUID: dWWoIsXmQ6iXlR9OhG9jfw==
X-CSE-MsgGUID: gnKQG547TEu+HuPDWWtyBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162731331"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jul 2025 17:51:37 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugC5X-0000TL-2K;
	Mon, 28 Jul 2025 00:51:35 +0000
Date: Mon, 28 Jul 2025 02:51:06 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] lib/find_bit.c:46:15: warning: no
 previous prototype for '__find_nth_bit'
Message-ID: <202507280252.VIQgLAMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yury,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 8b9a759b54b442fb86b9fe4182c933103c12bebb [92/92] lib: add find_nth{,_and,_andnot}_bit()
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507280252.VIQgLAMo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280252.VIQgLAMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280252.VIQgLAMo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/find_bit.c:46:15: warning: no previous prototype for '__find_nth_bit' [-Wmissing-prototypes]
      46 | unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
         |               ^~~~~~~~~~~~~~
>> lib/find_bit.c:52:15: warning: no previous prototype for '__find_nth_and_bit' [-Wmissing-prototypes]
      52 | unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:59:15: warning: no previous prototype for '__find_nth_andnot_bit' [-Wmissing-prototypes]
      59 | unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~~~~


vim +/__find_nth_bit +46 lib/find_bit.c

    45	
  > 46	unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
    47	{
    48		return FIND_NTH_BIT(addr[idx], size, n);
    49	}
    50	EXPORT_SYMBOL(__find_nth_bit);
    51	
  > 52	unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
    53					 unsigned long size, unsigned long n)
    54	{
    55		return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, n);
    56	}
    57	EXPORT_SYMBOL(__find_nth_and_bit);
    58	
  > 59	unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
    60					 unsigned long size, unsigned long n)
    61	{
    62		return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size, n);
    63	}
    64	EXPORT_SYMBOL(__find_nth_andnot_bit);
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
