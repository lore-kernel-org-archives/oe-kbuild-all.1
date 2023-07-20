Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA222FA2E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 18:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689878896; x=1721414896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cz0FNsA4bufodhloowiwPhoVNlrqIU5n7caX7ZCoqgo=;
  b=lR8V/pp0a6ijV/mD5JeGtqMSPdI0SzwFM0EL7j7dKzRx9mIoabUiUKdF
   JbxXP4VhIhUd7ICLMdZqU+cHkp3+ZBXQOrMM1nOU0Hnfe2+YekwVe8hjM
   hPkZvYzbX1jvRqBCqXLA1Eos4t/ExQ4mVpNESYJ1NAe/JLsMq+8TNoDUF
   gohQGm5UW+QPAkKD/IUIwW3VzJW1eYGR4MXKQepBbReC44Dp1DNw4MUmN
   9/YaBJiiM+lWeuy9SpP8cl1YgzQzjE7He41A5nc5aoQyVh15rhnCXPNWC
   G/BZ0qI54NIJsK8ttfKfPOBYED8zB1eIgCy8cljV8jzLYiT7DbByIRzcS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="365733457"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="365733457"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 11:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="848549399"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="848549399"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Jul 2023 11:48:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMYh8-0006P1-2z;
	Thu, 20 Jul 2023 18:48:11 +0000
Date: Fri, 21 Jul 2023 02:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-delegate-superblock 2/2] fs/fs_context.c:64:32:
 sparse: sparse: symbol 'vfs_parameter_spec' was not declared. Should it be
 static?
Message-ID: <202307210230.vYGQDNTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-delegate-superblock
head:   0ba8b43791d5073cf5334fcc686d303224e207d9
commit: 0ba8b43791d5073cf5334fcc686d303224e207d9 [2/2] fs: add generic "delegate" mount option
config: x86_64-randconfig-x061-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210230.vYGQDNTr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210230.vYGQDNTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210230.vYGQDNTr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fs_context.c:64:32: sparse: sparse: symbol 'vfs_parameter_spec' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
