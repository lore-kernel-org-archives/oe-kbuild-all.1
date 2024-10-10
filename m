Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B241EF92B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549422; cv=none; b=jwO7EwBa+0fwk7qYJ6iRPal+7j5QA0O+37UhpyZxchHFXveDHVuvvrCw/hUV8Ub4ZYImC3pQZTfd9dl6f7WnPA7MLxQspdcya4EflKQ8bDyWV9B0kzYXZQulwZAkDtESKWQV7Ny1gcxfXEq7K05YAfFF5tohdzbXBe65kQABGPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549422; c=relaxed/simple;
	bh=b8DP8kA18Ydai+UHZsyDcLjNb3pPSM87T/vGMYxonR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8BEWXCazmYrvH4itf3N0roV3x0WTqIKc5+ek5K4e/VG5o+ijHTGwTO+AvAJxDkDYBBpVc45w+u0TlWj3UB/kAniEdkBxs0krVwcp1ZZEVVRXXu9xzRm5KZP1fQeoKsn6K2eIcgNy6JTNm8KG74BxQiCmE8kEJaG68DjgZh2+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BolYeurw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BolYeurw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728549420; x=1760085420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b8DP8kA18Ydai+UHZsyDcLjNb3pPSM87T/vGMYxonR4=;
  b=BolYeurwIPrk7P7qxgqAHroSH8l4HmDwlaHHjUbPm6SPYtX3v+4vP/Vy
   KRA3sk25uoGWMicclPoJ+WrNLOcFNTuH0ZE18JbsjtWWKt9mwc7MoZnvV
   tkg8F9N8n5BDQx3gF1O+rrN1fXptiCv575lYn7lRcbudJc3AR8wZgK6cn
   ATUPRkaEfUhKHpVIf0p/FMQhBaub2yUq8lW+zfB6S6lk5yv2OYViprQ69
   oS0on92W3SEMZ2+TUOMu/wLqRIMDT8D20bDVP3cjqyKU/y5jc1T8y23nP
   bKf452IUB/HCAAeJy8wFJl9o92IuJ8VQMWR90x2S0u3I71j9fEDy50KHD
   Q==;
X-CSE-ConnectionGUID: reQRuLsPQyCsKyly16eEWA==
X-CSE-MsgGUID: 6mEbo8h1QdO/C4kh+5ZMLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45368757"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="45368757"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 01:37:00 -0700
X-CSE-ConnectionGUID: 02v/hmPbRwu92hQjfIMmXg==
X-CSE-MsgGUID: GgKxtyKmQjupvtu0q38Y8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76731271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2024 01:36:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syofJ-000AUV-03;
	Thu, 10 Oct 2024 08:36:57 +0000
Date: Thu, 10 Oct 2024 16:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 61/65] ld.lld: error: undefined symbol:
 xfs_zone_record_blocks
Message-ID: <202410101602.OaxrWJ6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   d8a9d812373b2a67b55d9122292f21f4b75a28b0
commit: 504ee6e13910320846d5913b48941f7d995eff5c [61/65] xfs: split the zoned from the COW end I/O path
config: i386-buildonly-randconfig-006-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101602.OaxrWJ6L-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101602.OaxrWJ6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101602.OaxrWJ6L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_zone_record_blocks
   >>> referenced by xfs_reflink.c
   >>>               fs/xfs/xfs_reflink.o:(xfs_zoned_end_io) in archive vmlinux.a
   >>> referenced by xfs_reflink.c
   >>>               fs/xfs/xfs_reflink.o:(xfs_zoned_end_io) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
