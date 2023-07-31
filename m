Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580D5362
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 02:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690769214; x=1722305214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sDeVNrybkSNdjrHb3huAycJbr3IXx1FcBU+b7c56RVc=;
  b=ZFbavFnNf50qAHLhs/JatCtVZ4lc9nQ7puSszcV/pgm5MLWHH7ip0DNB
   JMam09mW3g4YUyRm7cEM2nzm/r4fPe/Yf643ZpcCsOwALqBk6fR70eLgp
   5y2viArNsK0N4CDq5mb9L2M/ZZZvIMyY/PEcfrIBzeHu5I8Bvz1gbOcIp
   s8AvNdKXqPi4gr+XwkYGDkeBGgkagy23+SmKw5fxH8KaCa50Q9MgE+AVa
   +Ce3opIQKmEj+x8DlhvRI/GgdwkyzN95mSh3i8+YJOK6dftLob65Y4Td6
   MztiGG0OnEHMOoGb8mxLX+WJbocBWGPiGGNnAsN8Lk83DGcIwocNeHR1r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="455273469"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="455273469"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 19:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="974714032"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="974714032"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jul 2023 19:06:52 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQIJ9-0004rr-2b;
	Mon, 31 Jul 2023 02:06:51 +0000
Date: Mon, 31 Jul 2023 10:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 111/141]
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:71:6: warning: variable 'ret' set
 but not used
Message-ID: <202307310925.KyE2S5zu-lkp@intel.com>
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
config: x86_64-randconfig-r011-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310925.KyE2S5zu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310925.KyE2S5zu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310925.KyE2S5zu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/bnxt_re/qplib_rcfw.c:71:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


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
