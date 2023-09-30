Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B927495
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 13:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696082218; x=1727618218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCLjaTg/raEgkj9hlC7Pxy8ETULVHKcNIq4XWVuUGYQ=;
  b=DfV7kNfAjsV0DkvQbWuadknv/AaWPCKWorVnJueaIKEXf1EaGpCVO6Mv
   k8zEe+PTIUckrKeB8deFcyzrl0PT5274pfWg1Dhc9Gyoqe7whV6ipfBvE
   UHWKO0KGDOwnr8QCAdjjdEgJBpcdy7qxfhHQBkoeFVcximXkcqyuusq0E
   5AHcdU1GJ+nAE0i3F46bKDd0wzU3+0TLn+bhA5LNQgZ9cIBDO5pwNBHry
   jf/szjMcOZItRqtxPAta+QRQEuaL5uyciaAYDcqU0ImKhCcnuhQjgFV9R
   KyQKnZMkqCVKKFH4OGCB2NfANyd9s7gmyan2nkx9OKo3bkiXzE3ZtsqHv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="413348502"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="413348502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 06:56:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="1132883"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2023 06:56:58 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmaSk-0004Bj-26;
	Sat, 30 Sep 2023 13:56:54 +0000
Date: Sat, 30 Sep 2023 21:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 7/11]
 drivers/media/platform/qcom/venus/venc_ctrls.o: warning: objtool:
 venc_op_s_ctrl() falls through to next function asan.module_ctor()
Message-ID: <202309302125.GfgURWSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   3cf9365660f9bcf3dd0b09582d9f49634436b28b
commit: fca16257ca2966b34ef1689ef101170bf932e835 [7/11] UPSTREAM: ubsan: remove UBSAN_MISC in favor of individual options
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230930/202309302125.GfgURWSd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309302125.GfgURWSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309302125.GfgURWSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/venus/venc_ctrls.o: warning: objtool: venc_op_s_ctrl() falls through to next function asan.module_ctor()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
