Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD12AB55
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 20:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687291373; x=1718827373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xC8h5nWZ4r3t154CLp4C5FI2xD8j7/pc0juWmAecKcw=;
  b=OmPUua2ji7b28rajyP7+h1iKMRDEGF08iDywnfb/Aik/H7xx3HqZg5ev
   ORfguTRXXmT/uWChMPBAFeQw23+iLp4dw0nNqWDw91FBnJSH3JPG5Xw8T
   1UidiQXisjhnKpWZs9ym8rYNGQTGZ9JM+wQnvw5OF8mH0hxDux0wcRqRz
   VkI5dxExqi3Kcn2uhHmekoESOjNkOZtl4jXrgABM0o6TgyGbmUT3r5lnM
   3VNO5R6UNBURaicitbYeonGsp4D7hJFRbK1rf8hAR2VBAdE6kaBRcQTNK
   YWmz/MGBOCDBL1k3kYWzNLOWmodShda6slae1grd7TXTs6FZMGh2IU9Fd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446345440"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="446345440"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 13:02:39 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="748277977"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="748277977"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jun 2023 13:02:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBhYj-0006D6-0O;
	Tue, 20 Jun 2023 20:02:37 +0000
Date: Wed, 21 Jun 2023 04:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/urgent 1/2] vmlinux.o: warning: objtool:
 kthread_from_fork+0x6: call to {dynamic}() leaves .noinstr.text section
Message-ID: <202306210312.FjBtrRrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   d715c2e3f6a2f5593adc5396085d61720c9578ae
commit: e54a77cfaa98942e2f04827c7819d99dc3340c08 [1/2] x86/cfi: Fix ret_from_fork indirect calls
config: x86_64-randconfig-a016-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210312.FjBtrRrF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210312.FjBtrRrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210312.FjBtrRrF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: kthread_from_fork+0x6: call to {dynamic}() leaves .noinstr.text section


objdump-func vmlinux.o kthread_from_fork:
0000 00000000000002f0 <kthread_from_fork>:
0000      2f0:	48 89 f8             	mov    %rdi,%rax
0003      2f3:	48 89 f7             	mov    %rsi,%rdi
0006      2f6:	ff e0                	jmp    *%rax
0008      2f8:	0f 1f 84 00 00 00 00 00 	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
