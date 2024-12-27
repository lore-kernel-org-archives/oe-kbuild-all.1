Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E779C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 00:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735261007; cv=none; b=kYa7/Qr8bDk9rJt7+qasgSV3mRj7MF+me9DQwBMr7dTXZ0lPQDpmGE33rLCl66fZTXSdQwLis5sV+BtCttlh1+WyjJQIe/LTNWDON3zgKFf/1njg3mjuuTBua6AXwFKUkYqwt+IR3cxHwCmPq70OicFUfxgRQgn9rLA8imoQ754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735261007; c=relaxed/simple;
	bh=qdAe/1izlglFUx40wYjTZMur5i5Usr5ybF5tB2VYmOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SxhlrDvg9lKuCiW31Zg4JBbVFzQD/QiF0RToHkrTHzjgsqZYTTv2Cy0oOt3alIaHjDp1qgJVisZoxLUckt1ugdYFIDX+7uBV74SFbwSvTCNhIC7l+FbFNZOepCU7nKe1SzWFyF854owJQKji1LH4+GYYsCO+VtN90UScrPNaytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFmNu9mQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFmNu9mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735261005; x=1766797005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qdAe/1izlglFUx40wYjTZMur5i5Usr5ybF5tB2VYmOk=;
  b=iFmNu9mQkvdOLblO9dEGZ37t1WKWLROzhLgm8SuPY++ERp4eOdQvI/24
   ty29hHmltBu8+Uc9dM0QxXcqDMIu7tyQ5w0pQqNJtjjRp8moQq5gSDAfQ
   f2vnXZKphvP72DbqOMzWIyoX8BLnhyF5XR7KTEUQVYOIPfjaveoJLsSe6
   2/WycmS7QQikjwdStUctvWbuSPmKu7IB8EmIu9dg9aV1KrXDPEF6mFchA
   1KYWyFcsjLKIHJNL+SwxBdLPQ/Z70cBgnv9vMT9Q/w0SOfivDmBcqS4wO
   IAXrwDwK90beP6LVtGYwjC5ckfZh0caClKgfcXGkcHU1rYc7DhGEr0q7h
   w==;
X-CSE-ConnectionGUID: Uti8SIcoTfa55ip2S4j9Ow==
X-CSE-MsgGUID: XWYqzZRTRziSpomxmrH6Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="47047806"
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="47047806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 16:56:44 -0800
X-CSE-ConnectionGUID: iqG/T9XtQzSE2FjjKGQ7Gw==
X-CSE-MsgGUID: vvzTTMs/TgSwqXMSIhTxlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,267,1728975600"; 
   d="scan'208";a="130890791"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Dec 2024 16:56:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQyef-0002t4-2J;
	Fri, 27 Dec 2024 00:56:41 +0000
Date: Fri, 27 Dec 2024 08:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Stafford Horne <shorne@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stffrdhrn:or1k-rseq 5/5] tools/testing/selftests/rseq/rseq-or1k.h:
 rseq-or1k-bits.h is included more than once.
Message-ID: <202412270840.23RVr7Xf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/stffrdhrn/linux.git or1k-rseq
head:   1fa73dd6c2d3c915af3f33929f8a9b437d7cd112
commit: 1fa73dd6c2d3c915af3f33929f8a9b437d7cd112 [5/5] rseq/selftests: Add support for OpenRISC
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412270840.23RVr7Xf-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/testing/selftests/rseq/rseq-or1k.h: rseq-or1k-bits.h is included more than once.

vim +158 tools/testing/selftests/rseq/rseq-or1k.h

   155	
   156	#define RSEQ_TEMPLATE_CPU_ID
   157	#define RSEQ_TEMPLATE_MO_RELAXED
 > 158	#include "rseq-or1k-bits.h"
   159	#undef RSEQ_TEMPLATE_MO_RELAXED
   160	
   161	#define RSEQ_TEMPLATE_MO_RELEASE
 > 162	#include "rseq-or1k-bits.h"
   163	#undef RSEQ_TEMPLATE_MO_RELEASE
   164	#undef RSEQ_TEMPLATE_CPU_ID
   165	
   166	/* Per-mm-cid indexing. */
   167	
   168	#define RSEQ_TEMPLATE_MM_CID
   169	#define RSEQ_TEMPLATE_MO_RELAXED
 > 170	#include "rseq-or1k-bits.h"
   171	#undef RSEQ_TEMPLATE_MO_RELAXED
   172	
   173	#define RSEQ_TEMPLATE_MO_RELEASE
 > 174	#include "rseq-or1k-bits.h"
   175	#undef RSEQ_TEMPLATE_MO_RELEASE
   176	#undef RSEQ_TEMPLATE_MM_CID
   177	
   178	/* APIs which are not based on cpu ids. */
   179	
   180	#define RSEQ_TEMPLATE_CPU_ID_NONE
   181	#define RSEQ_TEMPLATE_MO_RELAXED
 > 182	#include "rseq-or1k-bits.h"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
