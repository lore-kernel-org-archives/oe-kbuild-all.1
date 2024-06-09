Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8C1CD39
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717964612; cv=none; b=D3GyAiD4FGJj0c5YFZfGgNp2AT8yrkWewopu0JV0Hq6eTo3zO3xTfTSizji5pY7by8EGZcgBgeEB+Soe2S9K3e0k8Uv0gioTVYtRoo9d1Il8uEv2OV9Car7AV+btHKPjEulagEK0EovMAefqov5NFsmAQ0cpCDHvyNDKqzH9hZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717964612; c=relaxed/simple;
	bh=IaoNWEOj81c71FbQ7oFl2ntxzRokUe3jwpNjBf65bZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lU8zvu3JdoBX8KBwGisUrmUrrXxdUlO8S5rb4uDTZsW8D/Tvho+du5zPc/FDsLN0vi1vcCl02nbWM34tWn9wyMbxVetbNVAsHBBD0Kby8ep+pvkHaa/de8pWwTI9lfSR6YaGQoStQ/38ydiWV9VVUwfj2koMX6Cxks0EjPu841g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbpLjA+8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbpLjA+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717964610; x=1749500610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaoNWEOj81c71FbQ7oFl2ntxzRokUe3jwpNjBf65bZE=;
  b=KbpLjA+8X+1JGqYaku/9wSKLXN13jJB3IbABtJpBDvII/aDB5a1g65L5
   8tRtB4KpGTy3waDnfnkYIKXpFPmaktYLPkiG7g8V6gG/a2qFUMuexUEim
   IikEYUPqtsUqRJHJ3XVrenekuJjuN9JH0CFyFu1RZIhTkJwYNOz23vYhz
   bhERveQzX8sh6xPGdDHgv12U/3YeDsd0T+HGu/YkxdMVc818KYDkSwxGD
   yy1qwQW7qH92S/o2QY2LhL2zMSqEpqYvYL2sOpGbfGrwXg6Ak+yC//ilB
   p/ZTAC+9ufRJpZHd6I8MAfJv7Ppo/zQgKl5JhPqnbXVmBqItcDoPik8QK
   w==;
X-CSE-ConnectionGUID: NCoyOjleTnm04Yksv3eeSw==
X-CSE-MsgGUID: IkRWCwlrQ7uq14DqNrXm/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="18478176"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="18478176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 13:23:30 -0700
X-CSE-ConnectionGUID: Agjch+VcTfWq9lrp1LjgoQ==
X-CSE-MsgGUID: FzG3QWHkSu2JsPDnnby7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43296860"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2024 13:23:27 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGP4X-0001ZC-0K;
	Sun, 09 Jun 2024 20:23:25 +0000
Date: Mon, 10 Jun 2024 04:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-5.10.y-cip-rt-rebase 814/979] ld.lld: error: undefined
 symbol: arch_dma_alloc
Message-ID: <202406100414.iYHFS7ro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   9de69a0c701bb413c105caf0be1dd5cf574866f9
commit: c6737c17f3653372565b944cc90aecc8c6cf693d [814/979] cache: ax45mp_cache: Add non coherent support
config: riscv-randconfig-002-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100414.iYHFS7ro-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406100414.iYHFS7ro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100414.iYHFS7ro-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_dma_alloc
   >>> referenced by dma-direct.h:32 (include/linux/dma-direct.h:32)
   >>>               dma/direct.o:(dma_direct_alloc) in archive kernel/built-in.a
--
>> ld.lld: error: undefined symbol: arch_dma_free
   >>> referenced by __fls.h:23 (include/asm-generic/bitops/__fls.h:23)
   >>>               dma/direct.o:(dma_direct_free) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
