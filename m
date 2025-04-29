Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA959242D68
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948693; cv=none; b=RLek2Uoe3GzBCDFArQpR70OwtN/nVdeIBhUfinCbA3XT8CYrUh+SdW3hnoqSzBHeVBV/blzPXqlggwiQaInXJmxic2KtRyfo70fk2e5dx0n6q2wI30ktBRMQCOb1MlPMRBl/waZHYb4yPji8UsuuHHcg15cVUi15jPDQGFjSJY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948693; c=relaxed/simple;
	bh=fcfeZnFyqp40EBf2zLP8IdTAz50+zcpgJzrTU7EUwlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHsNqh4ddBAJw/xyIB26sh0nmXYhMwg4StSUd+QquiBgsZzQfysQptqy6PfwPhRg9QBdnsCi5ReHIqycKX1tUcana3B9vtr9gE1WxIZ+m71H/ZYjKQODCMAJYC6NR91it6X18T02lCyCLdUXMyQ2fZN9vS7jXUs0bNS+9pq9D1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwMQ8XQn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwMQ8XQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745948691; x=1777484691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcfeZnFyqp40EBf2zLP8IdTAz50+zcpgJzrTU7EUwlo=;
  b=jwMQ8XQnJdVdBrIewKhuXnOHU4q/d7yrKZh5FHojEz6xzPOepBfJ/T46
   0Q11I6x/tjmgL6rB8xIBT/LIV8h9hOm7icwgJD6jY3j64I3ORwza4xY+k
   qdOi6YU5kMSrSi3Uop4qOFzhoGkFRFOINNJJF15Z+cYAPkC0XUkn2DaPp
   wBULdm1oXq5Y6aaTk/vr1xBEVgo9eeD001OnWKbhQGcvz+IukWjReSyRW
   G5PSX5DL4HYHvk67uTqFAyMOIJbBZpZNsqknuwGruiC8VZ8DsRdJpELmJ
   iDuNI5YvbwGyxD/E139qZ/d/y8MAfGE8Kim28DR+DEXs/EDhxfEqt3MHk
   g==;
X-CSE-ConnectionGUID: VQb6jXoZTA+V8SBvtLLdrQ==
X-CSE-MsgGUID: U+FqbypjR1WUbd21H9o5qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47469126"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47469126"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:44:51 -0700
X-CSE-ConnectionGUID: 1k8sXM8aTEyR5I1geyzqfg==
X-CSE-MsgGUID: MH10Vn1ATnGfXE50v4zSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134217304"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2025 10:44:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9p0i-00022j-01;
	Tue, 29 Apr 2025 17:44:48 +0000
Date: Wed, 30 Apr 2025 01:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2880/2880] include/linux/blk_types.h:
 linux/kabi.h is included more than once.
Message-ID: <202504300111.nH5Pw0yV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7710e01aad5e90a681267c840f4815b024b98c6
commit: dde4fe567523327d09054824030fb2d22e5009c7 [2880/2880] kabi: Add kabi reservation for storage module
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300111.nH5Pw0yV-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk_types.h: linux/kabi.h is included more than once.
--
>> include/linux/mm.h: linux/kabi.h is included more than once.
--
>> include/linux/ioport.h: linux/kabi.h is included more than once.
--
>> include/linux/device.h: linux/kabi.h is included more than once.
--
>> include/linux/device/class.h: linux/kabi.h is included more than once.
--
>> include/linux/cred.h: linux/kabi.h is included more than once.
--
>> include/linux/swap.h: linux/kabi.h is included more than once.

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
