Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3329025632
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916700; cv=none; b=H7uxvHTondwmfFBk275oGhs8VR6mSf4I5IOzxvVZ9J1fbQDPc1fxdtZmWV4FwgbFL7C1feVzRZgjF5f4QAUvmGNuF3u2Dc1TZcn+g9cYFm5WVJ9Uj+XH5EGJR3YZhvdm063xhaLmJ7VTy1txnAK9Vks4/U2FjogoLvj+w/ljvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916700; c=relaxed/simple;
	bh=sLKc8LW1gP1BnYOln3Bl5nVxTKRrbnpyIn2QxMCRBI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQ7LwzCuC/Pct6oA7aw7iOrz3USEIH1VK/0JX4Eb20C5JWKgX8BmCDbWs5EhZ/ljsobgpvWT4wC07zQzeHGET9o214BYS+9Xu+65BXzhuTPqB72pgFIstmwO/hIKLCLnflqHRrxlC7adFf37S1QnSkU0Fqk1k6NrOitHbWoA6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFYwes2g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFYwes2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728916699; x=1760452699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLKc8LW1gP1BnYOln3Bl5nVxTKRrbnpyIn2QxMCRBI0=;
  b=WFYwes2gkwN7egrfc15woDZcwBn8YWuJ9+GyB4KnHNYqbL3YkBXrhmvD
   oBSt0AL6lZFCvUfEr1sonVwXQihJk5z10GrimQ3lyNRsoDrLzTUfuVikx
   kSFcJgR9GkjeyLR7RvzeLNN6yyY9JyhgbsApnaY/vtSOrowVmdHt0iULk
   b27YS3ElEA8oV6y2UNT7IOcmgo++8p2v5At9fsHGZP/sbS2gXMUVMepQ+
   Qsfae/H8ykaaWBc6LwkA0fIHFl+Iwkxws1c19dRueR5DTsDqIGgn9Kpdx
   Z1AjBDFhqBrPDKSV7lnW5ChRkFnnsI0KKFJtPHnsjmN/v9jMstnlDDjvo
   A==;
X-CSE-ConnectionGUID: mTrAJ6GgRFanUNOulnvkQQ==
X-CSE-MsgGUID: vcnSN05lRcO0etuBIeXA7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27723381"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="27723381"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 07:38:18 -0700
X-CSE-ConnectionGUID: cpukRzVXT/+yfI9vAsa5GA==
X-CSE-MsgGUID: CaZkJFGNSp+ltGbsp1ZipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="78406925"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2024 07:38:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0MD9-000FcJ-1m;
	Mon, 14 Oct 2024 14:38:15 +0000
Date: Mon, 14 Oct 2024 22:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-wip 27/31] mm/hmm.c: linux/dma-mapping.h is
 included more than once.
Message-ID: <202410142241.oKdYshoP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-wip
head:   d2c9b3871b584022e66626eca6c1e603bc889811
commit: 4b5f438eef637fe6f8558a3a810272d3b1862c01 [27/31] FOLD: Provide global check for HMM users if SWIOTLB is used
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410142241.oKdYshoP-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/hmm.c: linux/dma-mapping.h is included more than once.

vim +25 mm/hmm.c

  > 25	#include <linux/dma-mapping.h>
    26	#include <linux/mmu_notifier.h>
    27	#include <linux/memory_hotplug.h>
  > 28	#include <linux/dma-mapping.h>
    29	#include <linux/iommu-dma.h>
    30	#include <linux/swiotlb.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
