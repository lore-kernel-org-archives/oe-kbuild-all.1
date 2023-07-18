Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7283C2F3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689685667; x=1721221667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGM6FRMvhKV/wjIWXX3oGuAhPtH31ku6rj+6XMODEDU=;
  b=cj4nOYGIq5Rcf+0carAXfRtldDZGts3aqayt0LwGmhO1x+zz72F+FQ8D
   PboW23dCIdrHmPFxZlJ1ZQCMZJw5omKVh7ttyBTWO6Ofn4JaBTexSZkpE
   NlFsxc72oG0ptsy/1s4v0GaQrEE4l9p28CwARlPcFgc7Lx6qY45eIWX6B
   b8gdBwk1SaQ3f1OtGugC6hqPHZo95HK4Kv2R/2tOpJQs6mlMbSokNyBHs
   7joddM8IXAPKFDquyoLob7mrEVaqourflV+cKzPy5Gv/RzNWwPuL3/aTT
   GmrUwHm7XxyG5mCMcPy1Uo9SU79eP4CGi9wGvm4UujoBBdEs3tKQ0qOVZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397039737"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="397039737"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 06:07:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="700891566"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="700891566"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2023 06:07:44 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLkPQ-0000cH-2l;
	Tue, 18 Jul 2023 13:06:47 +0000
Date: Tue, 18 Jul 2023 21:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 17409/27788] htmldocs:
 Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc"
 directive:
Message-ID: <202307182027.iDUXeEh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi WeiXiong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   14e059a4e07a4298d9cb041a9f5dd4b7e19a039b
commit: c0003a71672a751ec23d85451cbe43ff64609ab1 [17409/27788] UPSTREAM: Documentation: Add details for pstore/blk
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307182027.iDUXeEh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307182027.iDUXeEh1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/pstore-blk.rst:152: WARNING: Error in "kernel-doc" directive:
>> Documentation/admin-guide/pstore-blk.rst: WARNING: document isn't included in any toctree

vim +152 Documentation/admin-guide/pstore-blk.rst

   151	
 > 152	.. kernel-doc:: fs/pstore/blk.c
   153	   :identifiers: register_pstore_blk
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
