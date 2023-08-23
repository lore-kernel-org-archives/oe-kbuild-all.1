Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29BC152
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692800735; x=1724336735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTTOfy+gQuDlkuvowLX4+4CC+fl15wR07CPeOT4422M=;
  b=JCjFU124zvKQdsIPGT2xAKKpOUId2hqSGAVnIrmEoG5AkAftNu3n4Dmv
   pqAPyfZj7Gh6OBDwfQMRarzLM1YNdKC9XEtgPX2ySJkBWrjqzVOYg2XCU
   UUMtejl6+f+QxFUydr0yfLqkAnZl4yWojsUyrgiblyWeoVqRBLa8Focyo
   TNMdnKfElqyo1J9HY3gNvk/wJMI5rmE/uKCYT7xG5zZcKp4aXBab+TgpI
   0cJM85aLf+nyCLaUe38Trn1Y1XJxLVAvmYBQpFJ4M0ViqqX+Q5W658Yfk
   ZGOOF2xl+XB4Q7kXkA+fj0PTR1lW/+WD1lG76JjiQTY9JluJMxHCpm2UX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377931630"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377931630"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 07:25:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730227756"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730227756"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 07:25:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYond-0001Gy-1j;
	Wed, 23 Aug 2023 14:25:33 +0000
Date: Wed, 23 Aug 2023 22:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6542/11209]
 arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for
 'rb_event_size'
Message-ID: <202308232200.yMyZ9Kej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   9fd41ac1729d0f43826adf5c74cfe1142f3c2bea
commit: 4c095252cfa95e2d7850c70ec055de1b2284cc76 [6542/11209] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r016-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232200.yMyZ9Kej-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232200.yMyZ9Kej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308232200.yMyZ9Kej-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/trace.c: In function 'rb_move_tail':
   arch/arm64/kvm/hyp/nvhe/trace.c:150:56: warning: variable 'new_head' set but not used [-Wunused-but-set-variable]
     150 |         struct hyp_buffer_page *tail_page, *new_tail, *new_head;
         |                                                        ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/trace.c: At top level:
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: warning: no previous prototype for 'rb_event_size' [-Wmissing-prototypes]
     190 | unsigned long rb_event_size(unsigned long length)
         |               ^~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/rb_event_size +190 arch/arm64/kvm/hyp/nvhe/trace.c

   189	
 > 190	unsigned long rb_event_size(unsigned long length)
   191	{
   192		struct ring_buffer_event *event;
   193	
   194		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
