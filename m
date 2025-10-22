Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA427456
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761092418; cv=none; b=XYcnI/VFJJQfY0hNH6bSwWQGYvF+IRo3aE7oJfDscDPFve4/hvKB5yMry2MuZ9thoUwVWBC7Lz6Ep+MIWkx5dVVbIICD1dZTU7PzVFq6hgrJHmOU4Uvp0UDvn9Rvs6/MvDvDJfOCGCbLLVfkzooceiV0Oeoyke+N6ujGq/1mgg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761092418; c=relaxed/simple;
	bh=KJ17YW66ynYUiJ0P8ffimOO7CdIqxYEDD9LpCU0GBX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9iaJiTxe+2tOELRAkLXggTSY1oUQc6DuMYsCOdOfDyMp9VAEIi4cXQ2U6Ol7NnmomDZTwh7ta7gDBHjAKP7KZdx9rrPIkWFhWsEcIflyH49PH37ex8O0chbOpRJzCF2PFIy3pTu27kIeAPu1ZVBIkZbi3xlWu3lv5PHwg7kBh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhABGOBf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhABGOBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761092417; x=1792628417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJ17YW66ynYUiJ0P8ffimOO7CdIqxYEDD9LpCU0GBX0=;
  b=mhABGOBfutz7G594kVY6wDwyzH/gbiOccP4GH6nsH7IibVlhXau+NTsn
   UUzvk9EUKYWxADl3k/6q+t+C0C69E/n8YHJZZLYuYsWUbdTrFcYGuZuyf
   x8cQmJeozmE6WqW0UleFrlwJS39P/Vll6pB69kTBfULLalCP+9tC5pY/4
   eslWxhRbez17kutJ2FwutcGeV968riFxAe4kVnSFfVChsvJVadAuuTf4V
   1+UwvVFVBFMGFOZCXUypu/M1iaCekDWZOwggzzxw3MWQKNmzu3VFcKwk8
   ITCuM1aEmB0pP+xS7NOzwW9TbugKEIK3WR0caHv7NVLqezjQqgDsCxSGg
   A==;
X-CSE-ConnectionGUID: u4IEorYhRYijlMBZabHjsQ==
X-CSE-MsgGUID: +dyo6U3uTNm89T/YvgPUKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85855199"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="85855199"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:20:16 -0700
X-CSE-ConnectionGUID: h/rhI2aDR4SlijfB7rIjzA==
X-CSE-MsgGUID: tLKRwMv3QAaWq2/9+ZgDsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="182893536"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2025 17:20:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMaK-000Bqx-2C;
	Wed, 22 Oct 2025 00:20:12 +0000
Date: Wed, 22 Oct 2025 08:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-6a5 44/51] lib/dynamic_debug.c:1693:58: warning:
 left shift count >= width of type
Message-ID: <202510220842.zFGLzDug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-6a5
head:   a2f8b47e22fa6a1a9852e392166bc9adf45cc17d
commit: 027112748f47cdafe35ea0a28f410fc70d31e705 [44/51] dyndbg: optimized caching of dynamic prefixes
config: i386-buildonly-randconfig-005-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220842.zFGLzDug-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220842.zFGLzDug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220842.zFGLzDug-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_prefix_key':
>> lib/dynamic_debug.c:1693:58: warning: left shift count >= width of type [-Wshift-count-overflow]
    1693 |                ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                          ^~


vim +1693 lib/dynamic_debug.c

  1689	
  1690	static unsigned long ddebug_prefix_key(const struct _ddebug *desc)
  1691	{
  1692		return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
> 1693		       ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
  1694	}
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
