Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003B242D9E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756583584; cv=none; b=qOhAyfCN1HOAVLZ3t+F/yDAciZzAPUfEPsc+49O/+f0bOGkLpZgtUd7pkUn11gCBQOvjPxLetFYqiGpyqqO9B4U4wXpDqqzx9Tg2tpkkOrvubugh/REWMr9VrZclix7z2FtX/QaOmIag0++Lib16d3zASQAvEuT7xBshBZZ/cWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756583584; c=relaxed/simple;
	bh=bH7BvoKEXpXXrYL+P9Hde1J1WmqRhGdfNTtlXTajCEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+d+MQuYP9gBXCkpUSqdqT44BIwz/dYQi8LHHLF3CA0X/t2k3bAffJIK44DPIDlIQ8epsxBoHnjh3ryzor2NCC5SNh2xdBlJcIwPJqU+YqNOw+7RRarzD6B7W5LjA66SwTPt9muto5MCM6G+JtiFd10nqWgzvej+BBxssc1pMyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k826VVgA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k826VVgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756583582; x=1788119582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bH7BvoKEXpXXrYL+P9Hde1J1WmqRhGdfNTtlXTajCEw=;
  b=k826VVgAkHWLGt5OkOKMDfe80QcfhUGmCKyxM+1qhPmF7E4bx2TB+PTQ
   O93WADvInJQ5ofr5cu6vC/0IpW9c5maDcu4GblSs5JM2AfdK8bto8aDR4
   D3rcbyskm7NR1TPm27rpzUoUciKZyXn1AWzXg5zrNluXZ0BdXBTrgMbJj
   rxL00Tzjg7gH8ocYuwMNM55yMksS//N59jBXV2ziVkF427QHMurMzu3gU
   o2C+A+MtWcp5eLg7vP/e6pYICFtS69s9E0RnV5o4Ea6B10CVasoFKCKLJ
   HEVARaPV08b7eOIUOBW0xoaIkLOVXrwoeh13yBLiklkf1LxVlNvUzFgOV
   w==;
X-CSE-ConnectionGUID: umn5Om9ATW2QMHrSCMXxTA==
X-CSE-MsgGUID: bYTUjNJGQWaYihcxLxD+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57860764"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="57860764"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 12:53:02 -0700
X-CSE-ConnectionGUID: HPoS8WGjT0SUD50fAxhdFw==
X-CSE-MsgGUID: ttNFu0z8TemQo04hP9dbFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170162891"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Aug 2025 12:53:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usRdC-000Vee-2D;
	Sat, 30 Aug 2025 19:52:58 +0000
Date: Sun, 31 Aug 2025 03:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [davidhildenbrand:nth_page 24/37] ERROR: modpost:
 "page_range_contiguous" [security/keys/encrypted-keys/encrypted-keys.ko]
 undefined!
Message-ID: <202508310314.YBmrPk9N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux nth_page
head:   29f8796aa0c18cdc8307214d02e541d4e9468b93
commit: fcf664e432b54a3349d393defbe1f7f22514e8c7 [24/37] scatterlist: disallow non-contigous page ranges in a single SG entry
config: arm-randconfig-r111-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310314.YBmrPk9N-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310314.YBmrPk9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310314.YBmrPk9N-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "page_range_contiguous" [security/keys/encrypted-keys/encrypted-keys.ko] undefined!
ERROR: modpost: "page_range_contiguous" [crypto/ccm.ko] undefined!
ERROR: modpost: "page_range_contiguous" [crypto/tcrypt.ko] undefined!
ERROR: modpost: "page_range_contiguous" [crypto/essiv.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [crypto/krb5/krb5.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/dma/sh/rcar-dmac.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/net/wireless/mediatek/mt76/mt76-usb.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/net/ipa/ipa.ko] undefined!
ERROR: modpost: "page_range_contiguous" [drivers/media/common/videobuf2/videobuf2-dma-contig.ko] undefined!
>> ERROR: modpost: "page_range_contiguous" [drivers/crypto/stm32/stm32-hash.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
