Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564E15B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681788319; x=1713324319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXfKf1PzqoLJDNzEQe7uTsgWusyrtxstzUdaYwKGWEY=;
  b=a8T/VjK1MFYqwtMLs6B5UI6libq5up8wubePUUdyfyZQIrOtKzqA37Ml
   YyJqvA4NodPQTV7DARQ/uGjiObcpZobWXH0wcPoefFddxpEjB99bfvUjJ
   ZPDhCbkyk8QfpMcgY535NjWN44znQW3S4VT0rtYzu4PMm16C7G3dw87E7
   zbjjF4/wTFtaui09MacpoReNPjvaVOe6vh5exjlu9m+a1hRD8+zyOTYNZ
   DHsDwjJ2y5qpZrlLQ1YDccfanTWCTsSJXm/59WOdDam0Br5Yn+STQBxKc
   A/Sm8gzeifLx11MTZs8hucVUCdt9Ws7oqapiAPlOkYCKoshuZ3pYyZmfQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="345062339"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="345062339"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 20:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684405062"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="684405062"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 20:25:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poby0-000cue-1w;
	Tue, 18 Apr 2023 03:25:16 +0000
Date: Tue, 18 Apr 2023 11:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:wip/sm8450-working-audio-speakers-headset 11/35]
 drivers/soundwire/qcom.c:331:13: warning: unused variable
 'rd_fifo_outstanding_cmds'
Message-ID: <202304181121.qv7qRf41-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-working-audio-speakers-headset
head:   56644a6a53b9f6fabf0aee4ee8ab6a7ad1284818
commit: 594504aebeec2e5f159869b6906c8c950b0e3175 [11/35] soundwire: qcom: wait for fifo to be empty before
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181121.qv7qRf41-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/krzk/linux/commit/594504aebeec2e5f159869b6906c8c950b0e3175
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-working-audio-speakers-headset
        git checkout 594504aebeec2e5f159869b6906c8c950b0e3175
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/soundwire/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181121.qv7qRf41-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soundwire/qcom.c: In function 'swrm_wait_for_wr_fifo_done':
>> drivers/soundwire/qcom.c:331:13: warning: unused variable 'rd_fifo_outstanding_cmds' [-Wunused-variable]
     331 |         u32 rd_fifo_outstanding_cmds;
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/rd_fifo_outstanding_cmds +331 drivers/soundwire/qcom.c

   327	
   328	static bool swrm_wait_for_wr_fifo_done(struct qcom_swrm_ctrl *swrm)
   329	{
   330		u32 fifo_outstanding_cmds, value;
 > 331		u32 rd_fifo_outstanding_cmds;
   332		int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT*2;
   333	
   334		/* Check for fifo overflow during write */
   335		swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
   336		fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
   337	
   338		if (fifo_outstanding_cmds) {
   339			while (fifo_retry_count) {
   340				usleep_range(500, 510);
   341				swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
   342				fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
   343				fifo_retry_count--;
   344				if (fifo_outstanding_cmds == 0)
   345					return true;
   346			}
   347		} else {
   348			return true;
   349		}
   350	
   351	
   352		return false;
   353	}
   354	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
