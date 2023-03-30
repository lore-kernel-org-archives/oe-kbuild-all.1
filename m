Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B16E1374
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 02:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680142416; x=1711678416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79U6n8fuaR/fbL4/R5k5amzfp7funXKNT8Sd0t1gKWM=;
  b=eWkFE18Mkeqdgupfx1ADbgubOFbr65+VFUjxRKKDjsZqSM6pneJPX1VL
   unShibYE91Eswmhos5Iyj6QAF4BqgGvKboHfHa1Alh/fUFRiEvLye+YJF
   RcTx/vIHQw+V9JnwgXVadsms4ksyo6uJNwgljv0wAYi7iGoZqrgpGgE08
   904TZed4uXrLkCjlFGj48sIEbs6jCvuEGs4x0j97EIWsYQWRJAX0nSjNT
   KJ+5/9TBjh962iOjz9pSXqnLirsKpUgOXAqHI3J4d9YbLosbF8U59TCIe
   kwtdZqBBAJw4uo1+ASGTKV5a5xqbyFKwkYZPtR7UsFUOk2fkeMRIXpDto
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="403694757"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="403694757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 19:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="717120769"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="717120769"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 19:13:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phhmy-000KAk-2v;
	Thu, 30 Mar 2023 02:13:20 +0000
Date: Thu, 30 Mar 2023 10:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/17] (.text+0x7f18): multiple definition
 of `bpf_uprobe_multi_link_attach'; fs/xfs/xfs_trace.o:(.text+0x28728): first
 defined here
Message-ID: <202303301055.JqNORLzu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   f81bdc54f7ac3f1c0c66810141f94cc1629d68e3
commit: 84757f34ed3e8132c54a96949e3939f27da7d0e5 [1/17] bpf: Add multi uprobe link
config: microblaze-randconfig-s033-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301055.JqNORLzu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=84757f34ed3e8132c54a96949e3939f27da7d0e5
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout 84757f34ed3e8132c54a96949e3939f27da7d0e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301055.JqNORLzu-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/xfs/scrub/trace.o: in function `bpf_uprobe_multi_link_attach':
>> (.text+0x7f18): multiple definition of `bpf_uprobe_multi_link_attach'; fs/xfs/xfs_trace.o:(.text+0x28728): first defined here
--
   microblaze-linux-ld: drivers/scsi/qla2xxx/qla_dbg.o: in function `bpf_uprobe_multi_link_attach':
>> (.text+0x2dd4): multiple definition of `bpf_uprobe_multi_link_attach'; drivers/scsi/qla2xxx/qla_os.o:(.text+0x7028): first defined here
--
   microblaze-linux-ld: drivers/target/target_core_fabric_configfs.o: in function `bpf_uprobe_multi_link_attach':
>> (.text+0x16c8): multiple definition of `bpf_uprobe_multi_link_attach'; drivers/target/target_core_configfs.o:(.text+0x6604): first defined here
   microblaze-linux-ld: drivers/target/target_core_transport.o: in function `bpf_uprobe_multi_link_attach':
   (.text+0x8184): multiple definition of `bpf_uprobe_multi_link_attach'; drivers/target/target_core_configfs.o:(.text+0x6604): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
