Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4158F4E284
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695932913; x=1727468913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sHCwWjwsx53xp1HeAsNEt/O+wi63WkKkc9B6hjQRK40=;
  b=Zhe7Ao2i3P86OW2LQCf3l3FYq+2oZhN8UpocFCe3SEp3hwM+lpqQLm34
   +mOKn0udZ//Yj/DuY+dipgsK7k3Zrvz3O1zKlazX8iIB0pjbqNGtaOuOs
   OZXd34ylGAClM/0yYZr62kglsz2tyBQHc+peT2p/JCzmZDZ45hnqnGe/9
   fi8YIizDIWleHFr4XNp14q6lOSXJucBqZscWnRteBI5rvtx2x/fMZtMGw
   9vbkFsH3tV4z5BNzZc/bzloKfS0JMajax0NfvpH6RWhgRsu3pPqtK4xzU
   gmOPgHl36QK7QD4KktwOez5kNGIUTh6GCBCIGBr5GGikM5fJWLLg/U0ld
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="382070576"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="382070576"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 13:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753132719"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="753132719"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2023 13:28:28 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlxcY-0001vS-2f;
	Thu, 28 Sep 2023 20:28:26 +0000
Date: Fri, 29 Sep 2023 04:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-unionfs@vger.kernel.org
Subject: [mszeredi-vfs:statmount-v3 4/4] <stdin>:1576:2: warning: #warning
 syscall listmount not implemented
Message-ID: <202309290415.ZLowlHzk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git statmount-v3
head:   5321994510f383b43dd2d49fcbdaedcf8cba1306
commit: 5321994510f383b43dd2d49fcbdaedcf8cba1306 [4/4] add listmount(2) syscall
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230929/202309290415.ZLowlHzk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290415.ZLowlHzk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290415.ZLowlHzk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1573:2: warning: #warning syscall statmount not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall listmount not implemented [-Wcpp]
--
   <stdin>:1573:2: warning: #warning syscall statmount not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall listmount not implemented [-Wcpp]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   <stdin>:1573:2: warning: #warning syscall statmount not implemented [-Wcpp]
>> <stdin>:1576:2: warning: #warning syscall listmount not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
