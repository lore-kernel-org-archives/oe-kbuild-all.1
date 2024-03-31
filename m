Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AB1DDCE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711906717; cv=none; b=khZpNEkvVlefv4plvvsN5Or78TjCBF+lMm7XVjbhdqMwMyGxWkeuUMeHUcwGZUU5nDnil00wY/gtn6M0O/88F+JkZhnqC6zR+ZeUtgX9VOX1Da6Krh8zBHXGs6MkUtX6k3pfVuXxuPhNsguRdmmfFVwuvPuSvth98CF8H81mXXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711906717; c=relaxed/simple;
	bh=KMjOVbd2gFxbcgony3u3VW1lpbVEne2JijW+P97MGQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IkJyCJeRSG8gPvG+0gDvthz1LG9+YqO2AvgDpTA1rugrgLlTRtYJ74whvm9UCxqXUyzRUALqctXDXSTTu6IrGRrnC4K7OkE7jPaW6FpxRctC/vA0VR5AlFXrDjwvmoM6SsY/iMRs8CR4Fhay+QA53LoUD8vgTPD4noi/JpSCSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TihIXf8L; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TihIXf8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711906716; x=1743442716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KMjOVbd2gFxbcgony3u3VW1lpbVEne2JijW+P97MGQo=;
  b=TihIXf8Lc7C06kOb7m4yutYzn/mq580BTP5ceD2fJQM0lQ8gsO78ozlH
   fIz/Tj7AwQNvt0oOwntPkG9T7SI8qlHzqAfuTleJsNgEjEOZewqtygPZE
   JtW9M+BC8EQyF7NvrpgxEEwc8FtXl00da7nExgZy2xA+sZnsuSM79B1gX
   Vdxzih5s6FRvMP6YiftkU0L2rNTT+DG9VbRgglZOyZZS+y3lMqy766oO/
   4CxqOFdGLsH/MQy22Kv40lrLluY4fao/JHoIJFHzuq9LSd9UCVtwpN57X
   IIrruxVzSda6UflqXuiwrcfnUp8mTjHGH3zST1zYUzFBBUusPty4og2WY
   A==;
X-CSE-ConnectionGUID: v8Q8LxHWSTGy7Xt6fI62MA==
X-CSE-MsgGUID: nY5TttgVR0S1BeZQtytfAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="10859034"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="10859034"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 10:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="48699805"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Mar 2024 10:38:34 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqz8a-0001Is-0I;
	Sun, 31 Mar 2024 17:38:32 +0000
Date: Mon, 1 Apr 2024 01:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10848/22010]
 net/netfilter/nft_reject.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202404010158.teq90Txe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: 652d06efaf87f238d7bb96f3d63561c6cf65f910 [10848/22010] netfilter: nf_tables: avoid BUG_ON usage
config: x86_64-buildonly-randconfig-006-20240324 (https://download.01.org/0day-ci/archive/20240401/202404010158.teq90Txe-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010158.teq90Txe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010158.teq90Txe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_reject.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
