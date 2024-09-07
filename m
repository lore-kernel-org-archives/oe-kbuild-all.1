Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A73210EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 03:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725679216; cv=none; b=GKk9pg5xaEqgQ/M3790oH4ZGr5uFrwp8Cz4nvqYBHQC8kaa/aD3sloEy/nHl73e7iRRiYBzcmu0SdqUMhRb+VDcQuDKjG4q3AOOa2HbjKYsc8a8cwAw5fq4j/PNzuZ+rNnzcI93UF8bhTuQTV6DHd5qhNiHWDBjXAEjsVVcEKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725679216; c=relaxed/simple;
	bh=IQRUMfjjq9I5i71pLL0PcAXKo+na7sZjcy6FBc0YIZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9MjTrKgda53FbLH/Bp9yiHaWFt70MuwJUrzf6A9Dl4R6UIR5rTVNCA7pAY4RsXw4FM8LDRKTcy8645FdgYzQEbWHv5xB3/oEeO/YkvFgE+y2I/mAPQ1YAY7aVVlZzOQj7BW/jLXLHFDuDb1thpwppWxIMsV8kxrPSvpcNzDg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXbR8O3J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXbR8O3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725679215; x=1757215215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQRUMfjjq9I5i71pLL0PcAXKo+na7sZjcy6FBc0YIZ0=;
  b=hXbR8O3JRqRllIoRnUx2esfQ5zgdqgaEZuxeYsO6L1dNWueACbGoVOo7
   6X1FXwZ9meE9wyXpqip3XF5Lk84AZmgk+4VSyKKZFrgU2jLBoucOUoyaE
   DpBtdeRcgl4PGHR8/B9WUqQLQrQUF/Mbq7puLpHDvYJBNK8F+krnGgOHZ
   M9Fj1TkEqRaGpCw058twgvj+R9d7LCMBZ1pX5VUwyO9Fe5E7VBTzAdZr1
   ovxzQ/lRT/EA9Ni/97YEQYqUfVthaVGxN0Ytdm+Ik4szeQF5fqUpUuiul
   T3XkVXf6UaGT9N2eY3Vr0szSboi/BjZb1Onr+Bl+sR7rD5AAF7DV0blx1
   Q==;
X-CSE-ConnectionGUID: YyGo7m+fRiGN0L06I3bk+Q==
X-CSE-MsgGUID: IgeDsLT8SDGkGSTQdtL/KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24594782"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="24594782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 20:20:14 -0700
X-CSE-ConnectionGUID: 6eli9j2mRvWaFPey1/RC2A==
X-CSE-MsgGUID: qu1mMUo3QQqrw+BIK9Mi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="66160687"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Sep 2024 20:20:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smlze-000C5Z-18;
	Sat, 07 Sep 2024 03:20:10 +0000
Date: Sat, 7 Sep 2024 11:19:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <how2soft@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.6.y 41/82] drivers/char/aml-gpiomem.c: linux/of.h
 is included more than once.
Message-ID: <202409071144.FbASaTez-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/82] ODROID-N2/C4: char: Add /dev/gpiomem device
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071144.FbASaTez-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/aml-gpiomem.c: linux/of.h is included more than once.

vim +49 drivers/char/aml-gpiomem.c

  > 49	#include <linux/of.h>
    50	#include <linux/platform_device.h>
    51	#include <linux/mm.h>
    52	#include <linux/slab.h>
    53	#include <linux/cdev.h>
    54	#include <linux/pagemap.h>
    55	#include <linux/io.h>
  > 56	#include <linux/of.h>
    57	#include <asm/pgtable.h>
    58	#include <asm/io.h>
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
