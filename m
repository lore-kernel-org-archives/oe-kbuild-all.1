Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784F185B72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737137961; cv=none; b=FgT5xIFqUWT0R+Q76ORVwJp7ezQtBAurC0rH+SOa414wCM9h+Oi8/zh/DJOGS0tiMlYk/7EeWvigd9fLRzLw9zCRQOIPBhEn65lGE2GwnILgCXV+EE593AMaxkxef9LAsCSu1VH4qZFUWnbgAy3YCnmJZaXhM8nOpDJz684dH2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737137961; c=relaxed/simple;
	bh=WBTxSJmXqvbC5eGIZdS6ju6bQWgjckB8cKXHFS1xROI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFNBJh2miwKZhBVqu20iYLSfjZ9hFE+CaQmZHmcMGUf65gUvMvl+uZw2eMD8OwCmB78JbHCZcfN+bNXj+Zez55AcuH1Ve9N0Wyj5Riw0xwMAi1aXsDMRQVYu2Cb0BRP/5U1Ac6D9QHdNgYoP8nK12imy9vtnnTJBndkcApb79CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxHd0AxH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxHd0AxH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737137960; x=1768673960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBTxSJmXqvbC5eGIZdS6ju6bQWgjckB8cKXHFS1xROI=;
  b=bxHd0AxHqP8zX4EZbF7sMzbIjH/z6SjGDew6ohAx/VMAzHqPJ9yENsUQ
   JArChyMlTUZZ8qYRx0Sa4knBvW+mTgClKolpbta3wif3E8lzMmcsi1gRE
   mWlSHhMpyC70x/QvAgMKykB0th2pKbOueXina1IXb/RfDX0f6zgcqZcjK
   Ppv8JCrmeIsNi02hmezG9K4+M/ifjHypL4IrepBfcp7bJoTWTHL3+IJzp
   3hAR3MPJP5jma8b8vpm+NbqmM72sCTIb8aTmZYWmq26yvL3GQVQqu7PYm
   0nlkjW0q7O7t9Fvu64UhhutMuKOzxLaNeeEbDkTU0xbtOI0phEiW56OJx
   A==;
X-CSE-ConnectionGUID: LfhtA8l7RguQTQM4GdI+KA==
X-CSE-MsgGUID: dbJW8zjeSWKVzjrEY8rDKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37734421"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37734421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 10:19:19 -0800
X-CSE-ConnectionGUID: gw+hoEPrRmCc/fMqScPAQA==
X-CSE-MsgGUID: c4cWZmcjRDGXQKk2CpL+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="110866141"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2025 10:19:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYqw8-000TYv-0w;
	Fri, 17 Jan 2025 18:19:16 +0000
Date: Sat, 18 Jan 2025 02:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2709/2709] include/linux/blk_types.h:
 linux/kabi.h is included more than once.
Message-ID: <202501180245.jJrp2ix8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   08e54ea5e4a4948874ca30d91be3e5cca4ecbeec
commit: dde4fe567523327d09054824030fb2d22e5009c7 [2709/2709] kabi: Add kabi reservation for storage module
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180245.jJrp2ix8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk_types.h: linux/kabi.h is included more than once.
--
>> include/linux/cred.h: linux/kabi.h is included more than once.
--
>> include/linux/mm.h: linux/kabi.h is included more than once.
--
>> include/linux/device/class.h: linux/kabi.h is included more than once.
--
>> include/linux/ioport.h: linux/kabi.h is included more than once.
--
>> include/linux/swap.h: linux/kabi.h is included more than once.
--
>> include/linux/device.h: linux/kabi.h is included more than once.

vim +9 include/linux/blk_types.h

     8	
   > 9	#include <linux/kabi.h>
    10	#include <linux/types.h>
    11	#include <linux/bvec.h>
    12	#include <linux/ktime.h>
  > 13	#include <linux/kabi.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
