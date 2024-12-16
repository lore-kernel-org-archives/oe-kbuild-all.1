Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E9E1D47D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383148; cv=none; b=A6WxoXr6w9JuKHvbNtyAEqn/nVtDrt8Krsi0XlBTcVnpz7vNbJnz+LBqf+h9KyjHlZR+P8wQ3vrXeuIZdYP4DMZQUET8+qNHtosj2Ih6CJknXMStGBqeAT7lnbnjUGRDQGjvckBi9u/sQ56QCxEvsJhm4iXZQ8gsIsY/44XNxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383148; c=relaxed/simple;
	bh=M2rBb9Tunl+scqIPLFH/HTu2diROMRbDZL7PB05uMDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekWIi2e8EJR9nEaJLhuLdO8HvE30zO8AVuZA2ANnceVNoftzMT6YCRrX8vpUIloT3EtHUKsO1ZhyQHdjxxCzvbgCxwzAWusgQt7K4Ql2CQ1aoYgSOlOgGYVbQlDEgu/ArFqP7cPE4cZ5iNZ3ZV2v2yRBOEWjKnfXZbf+SSMKDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnRH9GIw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnRH9GIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734383147; x=1765919147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2rBb9Tunl+scqIPLFH/HTu2diROMRbDZL7PB05uMDo=;
  b=BnRH9GIwe8rzB16lsqaw1rYGlUSUHOKNDr+cYfLyxwgdvbYLZNigH2tH
   Zffo10ZTJPm53asfQBxaoofBXGNqpufzsBswGbdDcXHhfCWGRefDiTcBE
   ta1cQqjycMW0sZQ6be1I3gRygVrskr5nlDzZ0p+0oVrKu8/wZbTAAC3ua
   EP8bd9IwmOgnx4UgruD78m+bQLxLlgbELvCq56ECau9qf1KI/Q3FCV8/3
   3zw03rVFan4JMARB0o5Y36ImtBIXqrQ86xpNwyppSJMqjrL/xZVtaXQ/u
   cETOrwfgBv/CfD8QcaNp8YiF05G8w6aiETyJUVFPGpVbbJtRXfLpOiHv5
   w==;
X-CSE-ConnectionGUID: Gct4iqQyQq2uk0jZLbh9VQ==
X-CSE-MsgGUID: WOEVflz+QTC70fRWS9KY5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46198972"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46198972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 13:05:46 -0800
X-CSE-ConnectionGUID: VQgvv92bR3yw75NCmDmieg==
X-CSE-MsgGUID: 1f8aR00oRC+XUrGbohWg2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="102346359"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Dec 2024 13:05:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNIHe-000ETV-2P;
	Mon, 16 Dec 2024 21:05:42 +0000
Date: Tue, 17 Dec 2024 05:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1320/1320] fs/f2fs/recovery.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202412170555.tG86Dqq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   098a595b2caf96f57cda68f082b4dc0019d7814d
commit: 21d0fe9fd291eec496a4c174924ea645ed5d7b9e [1320/1320] f2fs: fix to avoid racing on fsync_entry_slab by multi filesystem instances
config: x86_64-buildonly-randconfig-006 (https://download.01.org/0day-ci/archive/20241217/202412170555.tG86Dqq4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170555.tG86Dqq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170555.tG86Dqq4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/recovery.c:12:
   In file included from include/linux/f2fs_fs.h:14:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> fs/f2fs/recovery.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
