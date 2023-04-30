Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250CA2597
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682861248; x=1714397248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XofC74Ap5B0v7tVY0cYTcavAFRiZYubZBMJ5LcA0oJQ=;
  b=SGhCDBQqZ59AlNFnGU1y41sz68GsT8OanwL6vu8guuaslmSrpeiSGMPi
   Ystl1WU/WkKkOBdeW/ActRdEjP+q8Jf7Yvg09AaK39Zq/q4ORhDT1BQ21
   4P2yphNihWwDd/WuzeNndpiNJDJVTEU8QI5RTtdx3hq2sSuPsv/NALcYa
   XUw6VeTwortaNIRWcT5ylc1wBr0gPkK0y8Fzx/+remNKnZfNgLXfSFR6f
   ZnOk9BvuQWkOKLrc3asmW9+OaJAlX3oCE+AuAenkJNjiNoIMCBXF4e4B1
   yPGIOjPOPQXVTwl2L2e+g7IyRUG6kF9MGRAScbSkjr9lsztUX56i8WPZD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="348064475"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="348064475"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 06:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="695503384"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="695503384"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Apr 2023 06:27:26 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pt75J-0001f3-0o;
	Sun, 30 Apr 2023 13:27:25 +0000
Date: Sun, 30 Apr 2023 21:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [intel-tdx:kvm-upstream-workaround 59/338] htmldocs:
 Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected
 indentation.
Message-ID: <202304302142.pMntaRx9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   abaa3072a8763b7a6276df61d205bf33eb2f31a5
commit: f87c5d4e1ce057414738d7f1ec7d0a6897906d2e [59/338] x86/virt/tdx: Export TD config params of TDX module via sysfs
reproduce:
        # https://github.com/intel/tdx/commit/f87c5d4e1ce057414738d7f1ec7d0a6897906d2e
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout f87c5d4e1ce057414738d7f1ec7d0a6897906d2e
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304302142.pMntaRx9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-firmware-tdx:2: WARNING: Unexpected indentation.

vim +2 Documentation/ABI/testing/sysfs-firmware-tdx

   > 2	Date:           March 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
