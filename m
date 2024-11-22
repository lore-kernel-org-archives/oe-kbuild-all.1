Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC917107F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263127; cv=none; b=eGQ7Dk1yWuJGaT+FC6UkY9lWxUKYVBFY0gXFesGMA7kKLUSzAz8kIE3kXy8YJG/wHcF9nZ+QH3b1nL3ogQJedyBzoX4M/F1U97lyERZ/pP21CSSvnM4jVuPkrEQLo0JG+677TXWJk69CKsTcvJ60+A5EWyweI/yoHjKuNn4+Hlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263127; c=relaxed/simple;
	bh=WTPlB9TGys0QjQDNJMW/jdIEQxwVPRwyRxhMeFkmXJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MZiSKfGQeEyZFxa7U5pu+b62WXr/Df3enwJQMVO97Hhj48+OtfB5HDTYFkjGB255DFKilVrROcOZdf3AA/VlvgUsUhXW1RRhGSu6/IrxGgkTLMHGBO6pAURUcKlhdHggGXYq8iuLkAfOYETBY6SfUxit1btQbxBntgte/kG8FWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Erc/QP3l; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Erc/QP3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732263124; x=1763799124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WTPlB9TGys0QjQDNJMW/jdIEQxwVPRwyRxhMeFkmXJs=;
  b=Erc/QP3lK68WDcVPzpmsmVRZNnYFORps0UGCDeIFPFaRGf+foet7+OIq
   lvs4rACwGuZeJZerRr/T3G9GTPSBYmW/9ASNfQ1s2pn+81Hk8voE9lHAW
   o/dbLAuOwx2WPuU3tvuE4OXgAz4fkM6I4aDb3JoYBodTWJ13lu2agZsfa
   I7d7ZMGifE5ji9VGAH8KLMulCuZGkWjCJnmfBTPfjM9QStin+T2iXGiXR
   ZRuJ7gFIWlRTPG/UtAKetf3+CzNGIXH21AMkhluwthQXeH5RmNgvJg1Kv
   tsYu398FY6YXdOMKWKA67VCY6Xk41eAijpuvEpNHqjwkI5Jh64pIbRWH1
   A==;
X-CSE-ConnectionGUID: Kv656cICQMiVv22KGUr/uw==
X-CSE-MsgGUID: 3gnonH/CQa22IOZGMWI0oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43025087"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="43025087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 00:12:03 -0800
X-CSE-ConnectionGUID: YeGV6dPrQn2yncKHz34l8Q==
X-CSE-MsgGUID: 3fC1ReD/QUCdQcUjyDj6xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95561760"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 00:12:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEOlj-0003mZ-27;
	Fri, 22 Nov 2024 08:11:59 +0000
Date: Fri, 22 Nov 2024 16:11:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1304/1304] drivers/md/md.o: warning:
 objtool: md_seq_show()+0xeac: unreachable instruction
Message-ID: <202411221626.DlqoiHuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Logan,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: a89f484219c9ea217d26908f16037d1ab55d4f17 [1304/1304] md: Ensure resync is reported after it starts
config: x86_64-randconfig-011-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221626.DlqoiHuN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221626.DlqoiHuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221626.DlqoiHuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/md.c:49:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/md.c:2231:24: warning: variable 'bi_rdev' set but not used [-Wunused-but-set-variable]
    2231 |         struct blk_integrity *bi_rdev;
         |                               ^
   2 warnings generated.
>> drivers/md/md.o: warning: objtool: md_seq_show()+0xeac: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
