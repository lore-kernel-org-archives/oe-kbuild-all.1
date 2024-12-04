Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE6C3D0D5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344884; cv=none; b=LhNelQssdBkVQku7f0YcGV7xiLqKfK4PnVT68+kZqWRnB9qAox2LtJVQRh8m/cBc/SypHyiiXubV1XO5M+PyZudjMciOeeaFCxqOKda/545H6zrGleEL5M1kEoUnLv4IZMY0E5Gwej8SeHtRk9BelADvXve7g+OB/G3+YpHt6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344884; c=relaxed/simple;
	bh=L4rp/2MLE+CiT4iNOJzpcuES+bxO21D4SqPYZ9iymGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKj6W6ks8X8vvJWl8mQa1ENhy1XAositkUBTCYOkXLV36jANeHbsymHFxpqKi0rpci4DAN056ZsayI45kvpfWm7g2gQWuuS1qtGnq9Hzo4VhbQQxbibTo0Ga5sycX8iozdAgBjJ83ko3C22WkKFzcG76sRiab4ePi5jRa9ZtlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbENXr+L; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbENXr+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733344882; x=1764880882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L4rp/2MLE+CiT4iNOJzpcuES+bxO21D4SqPYZ9iymGs=;
  b=KbENXr+LmDMmRxM7lmoOiSZ1vWtFlbcZPOoYLa0jOe5GmjHdiQldZA6I
   wuJdVCD+bn1Z4gzlG1HvGj5Hz+qCoLGLADdzIg+vP1L9c27klvOLaKsij
   oIPJebEHFS8bXDQbCmURdxoLpz05b66+LPcw5VzPCRRNGzMg2JOKsIPir
   0s3ymttIwaS4t98t31Rey6iV8EUJn+bfifVyeUDo6dWXKwmorV9LBzQQn
   853VjJPluHQgD3A7lzdMOJnS5N1vhr395UmKDyqBBESf1yQWb1Zzc6NJi
   LTPS6AmtZosfnoWHVoDMdIUAqhL/lb/Kgx1AyrRavLVX2EKGQEoA6j2PO
   A==;
X-CSE-ConnectionGUID: f1o1ssa5TVmivINUsX9qpg==
X-CSE-MsgGUID: 7qKq3l0jTDKQtlo9z8aBbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33548146"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33548146"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 12:41:21 -0800
X-CSE-ConnectionGUID: ZqW94lkcTGC/Wz8BtxpBiw==
X-CSE-MsgGUID: rF5WPJdSSAyNxLI0YJZzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93725446"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Dec 2024 12:41:20 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIwBR-0003TG-0u;
	Wed, 04 Dec 2024 20:41:17 +0000
Date: Thu, 5 Dec 2024 04:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ilpo =?unknown-8bit?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 1665/1849] drivers/gpu/drm/xe/xe_vsec.c:183:22:
 sparse: sparse: symbol 'xe_pmt_cb' was not declared. Should it be static?
Message-ID: <202412050418.8ecQxYXj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
commit: 0c45e76fcc6243723f1f90848170d6bcb4a5bc6c [1665/1849] drm/xe/vsec: Support BMG devices
config: x86_64-randconfig-122 (https://download.01.org/0day-ci/archive/20241205/202412050418.8ecQxYXj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050418.8ecQxYXj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050418.8ecQxYXj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_vsec.c:183:22: sparse: sparse: symbol 'xe_pmt_cb' was not declared. Should it be static?

vim +/xe_pmt_cb +183 drivers/gpu/drm/xe/xe_vsec.c

   182	
 > 183	struct pmt_callbacks xe_pmt_cb = {
   184		.read_telem = xe_pmt_telem_read,
   185	};
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
