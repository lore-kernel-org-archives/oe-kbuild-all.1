Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BBC203710
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 11:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751800306; cv=none; b=CKuIOE37lmjjZvIIBm7+a42tE4W+4pIPQnXPtrxdu73ztmZfWU/8Tex2OEblSrXIBWRymWiKWts3oRc2O5sMSCFG7ygdIPlp8mQBXtObR9BR5G9F0cPQ2MznxVfLG9nIQVK4yKwGOpOlW+eq3BPkQhtkJPd6/tKT33yq3Y9YSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751800306; c=relaxed/simple;
	bh=laktGJn6P9CerUW9GoLLTuBDc75oz6kJnPPcOmXSut4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PBqUEf1DNyVWtBqv+EyTXG4eXxQvKzsPwygOANMVEV2m5B0S729kUbM0nLkHmwi5YVeat5ocQLRGnAEWwY/neVdaHDkxZ014Zr+JiTNygCCRhCTBxb8FoG7DXFsTAh1ZFUige175uqgiJKB00Rh4QWZHgamZcZXL759Fq2uPM1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp/+uDc1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp/+uDc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751800304; x=1783336304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laktGJn6P9CerUW9GoLLTuBDc75oz6kJnPPcOmXSut4=;
  b=dp/+uDc1p8Xokk1w7iH13wmHDkznhScwLRPCPipUY/cT9kODCBfzEyjY
   xWnqYO6OF2rb5aA/hwL6RQS8ImEvs6X9OKR0qW19Q3ZL6rYW2awa/hrs2
   1K9u1WzECdhGEzjhVI4daSVrhEwpgax0CVs7189mf3QmvvvMxAWwu2mTy
   GxQzaW0iQjx+yz1uY92EmOfA14nC3IkAsbPRgjssi4tSrrobrokG2oI28
   jVSF+E0vKVcTC1kQH8oqNAoZv9xevcj7suqF56KEfwYhXndE7ZcD6B+gr
   bYmAvYa+MyohGcnNiihZczAnHOlpUwuC5qAxn5N+dG0+snwdPWEXj0PON
   A==;
X-CSE-ConnectionGUID: TmSnaEPbQKe1Mt2K4Lf+lA==
X-CSE-MsgGUID: Y+LAviamRPCkvI0fQ9//Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53965787"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53965787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 04:11:41 -0700
X-CSE-ConnectionGUID: AonuLKyiR3KXjsMagOeovg==
X-CSE-MsgGUID: mGq3vvYVQ0Go8L5JCzwt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="178646477"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2025 04:11:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYNHW-00052T-1J;
	Sun, 06 Jul 2025 11:11:38 +0000
Date: Sun, 6 Jul 2025 19:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1719/1719]
 include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202507061929.YtEh1pDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e6b6811414fe4cfc995369e8bda32fc1b4ee1d51
commit: de1b854e74d99da0917ef841500d597f75838dd2 [1719/1719] bdi: get device name under rcu protect
config: x86_64-randconfig-121-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061929.YtEh1pDk-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061929.YtEh1pDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061929.YtEh1pDk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/fs-writeback.c: note: in included file (through include/linux/kernel.h):
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/fs-writeback.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h):
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/fs-writeback.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-6146a88f60/lib/clang/20/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   fs/fs-writeback.c: note: in included file:
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *
>> include/linux/backing-dev.h:510:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device [noderef] <asn:4> *
   include/linux/backing-dev.h:510:19: sparse:    struct rcu_device *

vim +510 include/linux/backing-dev.h

   502	
   503	static inline void bdi_get_dev_name(struct backing_dev_info *bdi, char *dname,
   504						int len)
   505	{
   506		struct rcu_device *rcu_dev;
   507	
   508		rcu_read_lock();
   509	
 > 510		rcu_dev = rcu_dereference(bdi->rcu_dev);
   511		strlcpy(dname, rcu_dev ? dev_name(&rcu_dev->dev) : "(unknown)", len);
   512	
   513		rcu_read_unlock();
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
