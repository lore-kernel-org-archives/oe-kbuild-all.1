Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3110F363
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 02:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690770741; x=1722306741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Am8IfSNec6yU04PLdetTUuvL/GaTvqfQdWWDqmjSMWA=;
  b=TgkrPqXMfGjC6hIxDIlsghnGHBasz3BTI78+B790xq4Z+VLdWed8D0T5
   QjEXiSd5ylCBZkywPjemidbm7SdGiFxHXJCbyYHckHpTw2PpU09zxqTbT
   ug+R9s2MrZ97LHidt/EhwwZ8mbXnj1AHC8qhBFtAUXAA4xmeg5y3O29TX
   LRbCyjc/vQjwHibHfQyGq9wgy158q8r/d/rlkhhrqTtYRJMDA/TljaVNI
   WZTr9V8+MKE+gdqICKpa1nayUt/2PXaSep2hzyi03IFNvGLFas7Ps0AHq
   mYNpMpLBPVWecg3gtp8D3L0ipfrLAQWSKVktEODJK/UnkF6kELHLTdo0p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="358938760"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="358938760"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 19:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="757775467"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="757775467"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Jul 2023 19:32:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQIhB-0004t9-0n;
	Mon, 31 Jul 2023 02:32:16 +0000
Date: Mon, 31 Jul 2023 10:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 111/141]
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:71:13: warning: variable 'ret'
 set but not used
Message-ID: <202307311008.HlAu3Aw0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   ade14a1785368ef634f78e4a46ce217f7937b066
commit: 4e26ad911226b36d88aa2bd48a39917a276afdfa [111/141] RDMA/bnxt_re: Enhance the existing functions that wait for FW responses
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230731/202307311008.HlAu3Aw0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311008.HlAu3Aw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311008.HlAu3Aw0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/bnxt_re/qplib_rcfw.c: In function '__wait_for_resp':
>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:71:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      71 |         int ret;
         |             ^~~


vim +/ret +71 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c

    55	
    56	/**
    57	 * __wait_for_resp   -	Don't hold the cpu context and wait for response
    58	 * @rcfw      -   rcfw channel instance of rdev
    59	 * @cookie    -   cookie to track the command
    60	 *
    61	 * Wait for command completion in sleepable context.
    62	 *
    63	 * Returns:
    64	 * 0 if command is completed by firmware.
    65	 * Non zero error code for rest of the case.
    66	 */
    67	static int __wait_for_resp(struct bnxt_qplib_rcfw *rcfw, u16 cookie)
    68	{
    69		struct bnxt_qplib_cmdq_ctx *cmdq;
    70		u16 cbit;
  > 71		int ret;
    72	
    73		cmdq = &rcfw->cmdq;
    74		cbit = cookie % rcfw->cmdq_depth;
    75	
    76		do {
    77			/* Non zero means command completed */
    78			ret = wait_event_timeout(cmdq->waitq,
    79						 !test_bit(cbit, cmdq->cmdq_bitmap),
    80						 msecs_to_jiffies(10000));
    81	
    82			if (!test_bit(cbit, cmdq->cmdq_bitmap))
    83				return 0;
    84	
    85			bnxt_qplib_service_creq(&rcfw->creq.creq_tasklet);
    86	
    87			if (!test_bit(cbit, cmdq->cmdq_bitmap))
    88				return 0;
    89	
    90		} while (true);
    91	};
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
