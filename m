Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2BB1549E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692289276; x=1723825276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWfndbU1oNEDCpHHdZg1mo+Zof4XQ0auEf8gPgbCGn8=;
  b=Y8jPBZoZ+x0+4Kikdh1eAdrMJReJsZpe92xUcU0MRpliG4CXXO+alAt9
   PleRbpSmkiGt74cY4TmMko8fzh53RTuVr+wT1FnYKNiM5lqEoIpOCFMeX
   DCPhzs+Q97cut/DX569XJ90dH3h/eRWkwZY2anuJCTyKOslMhEn1Sl5lt
   u9YXrTtbQ5qBl+AAWcAj3Qoc+OT+Ncw/WsmIPsxg46c87Co3L94z6r/pU
   moP4dHp/B7uJsA1seIdjn4PwV7MI03M2fsOLD31vZ2/rgeX0q58Kzh66n
   2ZjvRqZH3t4bmQb3cxGsW+XecBxTo8gxoCmvEX06kCq0SBxQxjGQ4FTu5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403841244"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403841244"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 09:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="734713801"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="734713801"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 09:19:29 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWfia-0001Jf-2w;
	Thu, 17 Aug 2023 16:19:28 +0000
Date: Fri, 18 Aug 2023 00:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kashyap Desai <kashyap.desai@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:73: warning: Function
 parameter or member 'opcode' not described in 'bnxt_qplib_map_rc'
Message-ID: <202308180055.6zM4AK6V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 3022cc15119733cebaef05feddb5d87b9e401c0e RDMA/bnxt_re: Avoid the command wait if firmware is inactive
date:   9 weeks ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308180055.6zM4AK6V-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180055.6zM4AK6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180055.6zM4AK6V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:73: warning: Function parameter or member 'opcode' not described in 'bnxt_qplib_map_rc'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter or member 'rcfw' not described in '__wait_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter or member 'cookie' not described in '__wait_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:105: warning: Function parameter or member 'opcode' not described in '__wait_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:147: warning: Function parameter or member 'rcfw' not described in '__block_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:147: warning: Function parameter or member 'cookie' not described in '__block_for_resp'
   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:147: warning: Function parameter or member 'opcode' not described in '__block_for_resp'


vim +73 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c

    55	
    56	/**
    57	 * bnxt_qplib_map_rc  -  map return type based on opcode
    58	 * @opcode    -  roce slow path opcode
    59	 *
    60	 * In some cases like firmware halt is detected, the driver is supposed to
    61	 * remap the error code of the timed out command.
    62	 *
    63	 * It is not safe to assume hardware is really inactive so certain opcodes
    64	 * like destroy qp etc are not safe to be returned success, but this function
    65	 * will be called when FW already reports a timeout. This would be possible
    66	 * only when FW crashes and resets. This will clear all the HW resources.
    67	 *
    68	 * Returns:
    69	 * 0 to communicate success to caller.
    70	 * Non zero error code to communicate failure to caller.
    71	 */
    72	static int bnxt_qplib_map_rc(u8 opcode)
  > 73	{
    74		switch (opcode) {
    75		case CMDQ_BASE_OPCODE_DESTROY_QP:
    76		case CMDQ_BASE_OPCODE_DESTROY_SRQ:
    77		case CMDQ_BASE_OPCODE_DESTROY_CQ:
    78		case CMDQ_BASE_OPCODE_DEALLOCATE_KEY:
    79		case CMDQ_BASE_OPCODE_DEREGISTER_MR:
    80		case CMDQ_BASE_OPCODE_DELETE_GID:
    81		case CMDQ_BASE_OPCODE_DESTROY_QP1:
    82		case CMDQ_BASE_OPCODE_DESTROY_AH:
    83		case CMDQ_BASE_OPCODE_DEINITIALIZE_FW:
    84		case CMDQ_BASE_OPCODE_MODIFY_ROCE_CC:
    85		case CMDQ_BASE_OPCODE_SET_LINK_AGGR_MODE:
    86			return 0;
    87		default:
    88			return -ETIMEDOUT;
    89		}
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
