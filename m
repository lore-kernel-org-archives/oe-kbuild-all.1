Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11A20E6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D1HMxqJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699540660; x=1731076660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qGsxbPIIrpuLfzjfHHh8ZOT2ukCssWL2eJtdFXoZeyI=;
  b=D1HMxqJx/g3rheEGYUjpRp1+SRMAi8EEtMwcgzVQ2pmLTiyAElbnvcD7
   5CweRqsY85SFmSrHo5O5XZ6RHCIz8MQHjndadj4cLQI/qnws5764c2ygL
   Vot7mrCcQ5FKtv7oQlxN64e/B62YLdrJVV7ZzHgsGiI5KLQnKazimLrAz
   mA5Ont8XTzbHbcZyRDfK30+v+QMLwhoZpBlxJB7lG3mQMl9FyhsFBd5uv
   GHVqMyBhkBi0rkOCCPTKecUMRYBUgbThvfPmyVLmBNUlzxAxdFSZjIKM7
   28Td9u7xgigq4kGp2lXSHflXM+LOhBIrHxzWjUps6PcwcYBG44ZcFhUEe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="476225808"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="476225808"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 06:37:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="798328012"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="798328012"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Nov 2023 06:37:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r16A4-0008no-0Q;
	Thu, 09 Nov 2023 14:37:36 +0000
Date: Thu, 9 Nov 2023 22:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 2/2] vmlinux.o: warning: objtool:
 common_interrupt_return+0x3a: stack state mismatch: cfa1=4-128 cfa2=4-120
Message-ID: <202311092238.19c47AA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   ed03ac062608e85cad7072179595ebbeaa1fb9c7
commit: ed03ac062608e85cad7072179595ebbeaa1fb9c7 [2/2] x86/entry: Harder return-to-user
config: x86_64-buildonly-randconfig-002-20231109 (https://download.01.org/0day-ci/archive/20231109/202311092238.19c47AA3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092238.19c47AA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092238.19c47AA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: common_interrupt_return+0x3a: stack state mismatch: cfa1=4-128 cfa2=4-120


objdump-func vmlinux.o common_interrupt_return:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
