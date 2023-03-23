Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870D33E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679564962; x=1711100962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ycxgOQljALB2AXC7KDpkRMItGOL7u5St+8TEfmY6BM=;
  b=dtZLNkUfWyMS+qqivcg+ajFqZv31+EV5geLQNEIvcft6qn9/1JaL+nCZ
   XT5SXu14Gmh+w0nMjp1EdRYPrjsNZBacEvZOvHrbb/XrFBuVV7sBvRBXz
   2Fr0yTug0MDbwuOKRbb+2T2A7H8FggpkRqVWgZj1Hz+abucrRTGQI1NuG
   VKKmjqPSbjGdCzbR8demcz3arzTMaypqFgnaG5qKsmx02/8Lm0NCZzYae
   9kV3pMCxHRu94gOV2VO7hEMQuhwtsVyYePoL9B23DojHa7cYwOpkRexh8
   dlOL4OJGf9QGjnuyNsiG+tkosJKwQQH3VuUO2LK5Wc+xvxx1fPaAl7YDk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="340982848"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="340982848"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 02:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682251067"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="682251067"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 02:49:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfHZQ-000EDw-0p;
	Thu, 23 Mar 2023 09:49:20 +0000
Date: Thu, 23 Mar 2023 17:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 10/20] tcp.c:undefined reference to
 `nvme_tls_psk_lookup'
Message-ID: <202303231715.uhzE1AuT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: 31b3d10dcf4a28f931001df8b4e539716bcbd5d3 [10/20] nvme-tcp: enable TLS handshake upcall
config: openrisc-randconfig-s042-20230319 (https://download.01.org/0day-ci/archive/20230323/202303231715.uhzE1AuT-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231715.uhzE1AuT-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/nvme/host/core.o: in function `nvme_core_init':
   core.c:(.init.text+0x26c): undefined reference to `nvme_keyring_init'
   core.c:(.init.text+0x26c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nvme_keyring_init'
   or1k-linux-ld: drivers/nvme/host/tcp.o: in function `nvme_tcp_lookup_psks.constprop.0':
>> tcp.c:(.text+0x1a84): undefined reference to `nvme_tls_psk_lookup'
   tcp.c:(.text+0x1a84): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nvme_tls_psk_lookup'
   or1k-linux-ld: drivers/nvme/host/tcp.o: in function `nvme_tcp_alloc_queue':
>> tcp.c:(.text+0x53dc): undefined reference to `nvme_keyring_id'
   tcp.c:(.text+0x53dc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `nvme_keyring_id'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
