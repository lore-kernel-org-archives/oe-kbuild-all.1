Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194091B2186
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 08:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274912; cv=none; b=pG1VrFaNVTOWpbu+4td2bq0Q2yiHQVJQkjSQSoJcQNV/EKVZusm2aYdzEJqa2t7GZ4DITx0zYgHqa7Md55LRnF0LsjlEJN+srMkghuPHazUdxakvA+zn7Y8jAI+16iHUycAzktm5aT1J68aMsbh6LtmPoncbWY/7C5CR19vZCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274912; c=relaxed/simple;
	bh=P/7IIwmVbRxj5UvcTDhQB9Oc0nnRRQA7gDS+fBeARWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qa0EB2J4zvty6Y06XQiM/j/SLYp822XxC0goIS4mHEKB4yYyOWsxA1schBMNHOqDwkAbDJDYJDbWB7O9DdRnbfcSWFDFZqWTC/FtFvS3qYGsVAzrCYXPQWOAx0ngwQNSAMIZ+7uVa5TaAuBdT4wCTV+0trPC9wjVk6kOPQ7w/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnDkUH9G; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnDkUH9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744274907; x=1775810907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/7IIwmVbRxj5UvcTDhQB9Oc0nnRRQA7gDS+fBeARWA=;
  b=lnDkUH9GMcjUKQm70VochQxVAvpbBxNlmZGXRru3Nbs5NtRiRE8mZiVr
   A+ah0NyvnKs/8ZgNCeMFyjMO9ceCZ1hGMjeE6VclOZeY8D5GEw1BjHpbO
   GJEecZM7G8e1NJzjRxs+DLiEVB7g3Ki9t1HFZNCPqFbsu4Y77JSQl+hfJ
   KLVn87tIWt5Bdn54f2VwaWhsrhtBmM8x3GF2yS03CZ8QiK5Aqn/GrL3Is
   8uwo0nGkKKD/j+raSxPenIV3Ojnb0tbs7+616EtuwT5CsBiA1yZbBYRgr
   YVMyTAKhgva8v76iZIt0mkXoSI9ljjDgP3m6FSyQdP2E+q14Fg8ro8lg5
   Q==;
X-CSE-ConnectionGUID: jT1AKAFpSZC06Ok0buPJOQ==
X-CSE-MsgGUID: pSOUWfA6S02FzY6M2MOflA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="63323683"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="63323683"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 01:48:26 -0700
X-CSE-ConnectionGUID: MSyZGaKLRLWiPeRVEcIQQw==
X-CSE-MsgGUID: pZawEmYNSo2W3vGEoKHyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133960345"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 01:48:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2naB-0009q3-1l;
	Thu, 10 Apr 2025 08:48:23 +0000
Date: Thu, 10 Apr 2025 16:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2116/2116]
 drivers/crypto/montage/tsse/tsse_ipc_hash.c:14:1: sparse: sparse: symbol
 'service_info_table' was not declared. Should it be static?
Message-ID: <202504101645.mRh7GNFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   62b846e657553d00552c1c71b6ecc26017eb1a9a
commit: 914854f2adb6988ac3b6521088ec96833d6743e2 [2116/2116] driver: crypto - update support for Mont-TSSE Driver
config: x86_64-randconfig-r113-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101645.mRh7GNFb-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101645.mRh7GNFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101645.mRh7GNFb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/montage/tsse/tsse_ipc_hash.c:14:1: sparse: sparse: symbol 'service_info_table' was not declared. Should it be static?
>> drivers/crypto/montage/tsse/tsse_ipc_hash.c:15:1: sparse: sparse: symbol 'service_handle_table' was not declared. Should it be static?
--
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:22:41: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:33: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got unsigned char [usertype] * @@
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:46: sparse:     expected void const volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:42:46: sparse:     got unsigned char [usertype] *
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:108:16: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:120:21: sparse: sparse: cast from restricted __le32
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:124:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *msg @@     got void [noderef] __iomem *d2h_msg @@
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:124:60: sparse:     expected void *msg
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:124:60: sparse:     got void [noderef] __iomem *d2h_msg
>> drivers/crypto/montage/tsse/tsse_ipc_drv.c:136:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got unsigned char [usertype] *addr @@
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:136:21: sparse:     expected void volatile [noderef] __iomem *
   drivers/crypto/montage/tsse/tsse_ipc_drv.c:136:21: sparse:     got unsigned char [usertype] *addr

vim +/service_info_table +14 drivers/crypto/montage/tsse/tsse_ipc_hash.c

    13	
  > 14	DEFINE_HASHTABLE(service_info_table, SERVICE_TABLE_BUCKET_BITS);
  > 15	DEFINE_HASHTABLE(service_handle_table, SERVICE_TABLE_BUCKET_BITS);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
