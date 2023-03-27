Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9340369
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679920453; x=1711456453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbwRB3qJWlx/dHMGpPlpGBzy4Qej8TsHrGccuaPGQ2w=;
  b=LE9JCwxGvIXK38VekBuAPuMQbHq9URrEAtoqUGMPYDs2o6qE2NtRHcR6
   jOkD2d2XGWGW2NhRwqBg8VRwQZVwMVXbf8YTD3B8ZIMQ0efX1Edimjojt
   GcQMtw8o3kowYLBPzpZfN/mc78edQ1Kz9eqMFg6iRBUuZSC/aW/FI/NMs
   NO7U1z4trOGBWesGvvEogZFZykJeQEqPR7WJEa8R/mfSfcp9PM7Cf2hJA
   ZkuarDsw1XoflK2rer2NLtBVAUyYMhz6Y2lP54v5R0Tggiie8RJQlKetA
   e92y9vRYDTn/tg1QM3QKI3MkoV0CGClMDhVm+Fa5KY1qpd7WLUCFcd2kW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="341825069"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="341825069"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 05:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="685953877"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="685953877"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2023 05:34:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgm39-000HiZ-0Q;
	Mon, 27 Mar 2023 12:34:11 +0000
Date: Mon, 27 Mar 2023 20:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x4b3:
 unreachable instruction
Message-ID: <202303272002.GzGlsDY1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   197b6b60ae7bc51dd0814953c562833143b292aa
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 Compiler attributes: GCC cold function alignment workarounds
date:   9 weeks ago
config: x86_64-randconfig-m001-20230327 (https://download.01.org/0day-ci/archive/20230327/202303272002.GzGlsDY1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c27cd083cfb9d392f304657ed00fcde1136704e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c27cd083cfb9d392f304657ed00fcde1136704e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303272002.GzGlsDY1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/btrfs.o: warning: objtool: btrfs_unfreeze+0x4b3: unreachable instruction


objdump-func vmlinux.o btrfs_unfreeze:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
