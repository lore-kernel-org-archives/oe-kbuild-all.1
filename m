Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F358EED8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312797; cv=none; b=Iq64XEw18BCZRlFTkYQLPnYgM9suC/bykj8kUk5svRO1+WEcnDPhwsIOezuNmgzXidljg+9lEI+oPg71kJ9s3LqtdgTojGlkf/F6n76MBk9bgtMY+MySAqbOAi7sm4fxhODPCwB1juyESFjfYZE11Z3pfhCYDU7uinrqRTg2Ssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312797; c=relaxed/simple;
	bh=uDqhFf7xeLMD4FbD1XwfSDQUVBfh0ZvFCI2Qo5+Tkkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/tUPxwlpa4kfPij+OnGacRjYnxOGkdQyksZwv30IPelyqTLqaW7WQL+SlppKKxedq8Ln/+chigaI5lCkigtb/4jmXJcQhrwskvk0T26u+uMRB38GyCKLLZ/6SDVy53Tn/u5eMzzX6OtJTCDolCCNv6I/Wd+dR2atm3GfJw9iwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ngr6oKAQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ngr6oKAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738312794; x=1769848794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDqhFf7xeLMD4FbD1XwfSDQUVBfh0ZvFCI2Qo5+Tkkk=;
  b=Ngr6oKAQ9UXe9XqHuyJhXcFsnZSAb/aVE+GjRF2KYeI2YDK4q6clJRji
   tpBeZ30uzf6CA+loV6nQigE0gCloRPug+Io3sjjdsoAyt4Ie7thJbGqC1
   qd7Io5GCGU6iZA+8ZuBjDmYiOX7jMfOFxxJVoPvVHH5gpTNLtnGgbijZ/
   U0VfBTSk7cfXtK4pK8q2q50+MC88sSQpqxsBuERRvrHVrTjVT8tyf1wYD
   xSFyzcNLdGLNmGkK/lF4XM2S5YkUDL5o37EO7jSwJhasrGd0MM5nA+3nO
   bVVPwnwUm72Wdcjz3YbIJdY65Ks9lWWYU5cvMYDJ6YVMrT9njaHvo9CjZ
   Q==;
X-CSE-ConnectionGUID: MnVhUCI2Sm2qLZHBoR/XmA==
X-CSE-MsgGUID: JNU0C3b1Tc6mxISvWyB96A==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38583198"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="38583198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 00:39:40 -0800
X-CSE-ConnectionGUID: p6kMNP6pQW6Ju8ONPUageA==
X-CSE-MsgGUID: eUgZnimYRWejEJuCoTqS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110448665"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2025 00:39:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdmYq-000mBj-1I;
	Fri, 31 Jan 2025 08:39:36 +0000
Date: Fri, 31 Jan 2025 16:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 71/88] mm/hugetlb.c: linux/page-isolation.h is
 included more than once.
Message-ID: <202501311653.mOxDNCYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   495206a68b359eb6117d0860861578113bbb94e7
commit: 0dfce6b46bf52a9cf68a600eeac4eab00dbfd554 [71/88] mm/hugetlb: set migratetype for bootmem folios
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311653.mOxDNCYy-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/hugetlb.c: linux/page-isolation.h is included more than once.

vim +39 mm/hugetlb.c

  > 39	#include <linux/page-isolation.h>
    40	
    41	#include <asm/page.h>
    42	#include <asm/pgalloc.h>
    43	#include <asm/tlb.h>
    44	#include <asm/setup.h>
    45	
    46	#include <linux/io.h>
    47	#include <linux/hugetlb.h>
    48	#include <linux/hugetlb_cgroup.h>
    49	#include <linux/node.h>
    50	#include <linux/page_owner.h>
    51	#include "internal.h"
    52	#include "hugetlb_vmemmap.h"
  > 53	#include <linux/page-isolation.h>
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
