Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D24129E88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713269069; cv=none; b=gXVh1jQ0IbCkLi5Jsb4KaBnLa4w7cD/RAvq9CFTkZV5eJos0V5dibBPQVMQpn4CPuPrqNSTM88LvcqqXOPURDczr2+GxhwQUjh4HqOTWqddhIKBw7X6n4uTrqw6DLKNIFkUuDzMcz6uPDnW2NUl8K6DsSm/EqYl+LVGqC74Nljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713269069; c=relaxed/simple;
	bh=PUqwRAsD2zpBHyMCM/WA/oHX5xFtI0zfdDtaD/IG32Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGnOHU4HHzO2wy/dI7j2HVrhoGPyCFQxmJ/5bG2TuRUtRXMeHN2YWcGs+8GEOa9bII5eYcB0yJpIGa0CKfBiDBXZJBNG8ZdJtxPBTYTXRYz2nli4f1PDpeHZXHagzin3iUcTCXDDD8jAB9CY3I8sQGWnvWcL2vz3+H+7iSxyEDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfU9Kl3F; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfU9Kl3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713269064; x=1744805064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PUqwRAsD2zpBHyMCM/WA/oHX5xFtI0zfdDtaD/IG32Y=;
  b=jfU9Kl3FE5roBHrCUg6N2UtOixm8Ka0/Rjx0JQVprpE0uxeyZpwikJnX
   OSBYcUAlJCbkxMOsG0oYYzie2INTmkU6SJG/X0FKOsJJMc4pEnR/TQfNt
   KoyOzCbK/VqdYq/QxhBJeMqU4ysp8qxjPz1Wbq+Xvc88JSgN9s2f8GP/D
   LsL4cPcvIK+0VCHDBm5w49htPhnO3lcqq6fI3PQz3b9OiurzeDdk6q+Bc
   sZHuc0HCMMJaajGhi3TJCdqGrFI07ShC1o2kbhnEkKdDJofkc3O309lFX
   O5D8rxwXrwB1Et5Oxf2LtOuMrUIU6Ln+3tV22fUn4IhScHRm9wrFp8LAY
   A==;
X-CSE-ConnectionGUID: PLlFzMMhQN65EwnO58VuVg==
X-CSE-MsgGUID: 4zwUBYpUQjm12ldKmL0sCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="26215109"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="26215109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:04:23 -0700
X-CSE-ConnectionGUID: 3cFFUPkOQOKvwwYpfaSX9Q==
X-CSE-MsgGUID: S8yaeh/PRt61CUGd2AK8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22305535"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2024 05:04:21 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwhXv-0005DQ-1d;
	Tue, 16 Apr 2024 12:04:19 +0000
Date: Tue, 16 Apr 2024 20:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29814/30000]
 drivers/net/ethernet/bzwx/nce/comm/txrx.c:5:10: fatal error: 'ne6x_trace.h'
 file not found
Message-ID: <202404161958.Po7ipjlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a474d353b33ec1a40219c2e286c74e1b19377dff
commit: 5b3d89af9629848d7a4a4928fd911364e310cb06 [29814/30000] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240416/202404161958.Po7ipjlU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161958.Po7ipjlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161958.Po7ipjlU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:5:10: fatal error: 'ne6x_trace.h' file not found
       5 | #include "ne6x_trace.h"
         |          ^~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:14:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:35:10: fatal error: 'reg.h' file not found
      35 | #include "reg.h"
         |          ^~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:8:
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h:41:10: fatal error: 'reg.h' file not found
      41 | #include "reg.h"
         |          ^~~~~~~
   1 error generated.


vim +5 drivers/net/ethernet/bzwx/nce/comm/txrx.c

     3	
     4	#include "txrx.h"
   > 5	#include "ne6x_trace.h"
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
