Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE75A26B90
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 21:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690321889; x=1721857889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4j1REvpsFGcYj8gu5WcqDBuw17M5YBKjzoMA4WaJsJo=;
  b=CUPyjp5W6Mv3p2aGSak+S0+yRr4J1Ew9PFKP+b1Za3vHx0qnloMM6pjX
   YI12Ahi791DJ9PIluL5TkRBVHgSIIcT7CUhV4RgNWF3bXqqebsettI8ae
   4ryAL9931X2aSllMCMpYoL4MuCwasviTTFFAwSWDhPTLOA2m7HIl5FUrC
   BL5kC/crekrkY+TB1z8wQJ2LldulCkpAgRcJimSZ9kGhrxA5+WgjbsZ/R
   hEZQXkFlntoUJEUUzZDMu44uEXopecdYFlAPRLkf1wp8plSZpeMgkd24Q
   aO5RILAbTheNLF0tkjIb2eGjugqd4UmKucP3atM6jli2p0HcqnW0UtaNO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="352753631"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="352753631"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 14:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="1056933626"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="1056933626"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2023 14:51:27 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOPw9-0000Mn-2X;
	Tue, 25 Jul 2023 21:51:23 +0000
Date: Wed, 26 Jul 2023 05:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
Cc: oe-kbuild-all@lists.linux.dev, siddaraju.dh@intel.com,
	Anthony Nguyen <anthony.l.nguyen@intel.com>
Subject: Re: [Intel-wired-lan] [PATCH iwl-net] ice: avoid executing commands
 on other ports when driving sync
Message-ID: <202307260524.gD96xyN6-lkp@intel.com>
References: <20230725203125.508243-1-jacob.e.keller@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725203125.508243-1-jacob.e.keller@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/ice-avoid-executing-commands-on-other-ports-when-driving-sync/20230726-043405
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230725203125.508243-1-jacob.e.keller%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-net] ice: avoid executing commands on other ports when driving sync
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230726/202307260524.gD96xyN6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260524.gD96xyN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260524.gD96xyN6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:1326: warning: expecting prototype for ice_ptp_one_port_cmd_e822(). Prototype was for ice_ptp_one_port_cmd() instead


vim +1326 drivers/net/ethernet/intel/ice/ice_ptp_hw.c

  1312	
  1313	/**
  1314	 * ice_ptp_one_port_cmd_e822 - Prepare one port for a timer command
  1315	 * @hw: pointer to the HW struct
  1316	 * @configured_port: the port to configure with configured_cmd
  1317	 * @configured_cmd: timer command to prepare on the configured_port
  1318	 *
  1319	 * Prepare the configured_port for the configured_cmd, and prepare all other
  1320	 * ports for ICE_PTP_NOP. This causes the configured_port to execute the
  1321	 * desired command while all other ports perform no operation.
  1322	 */
  1323	static int
  1324	ice_ptp_one_port_cmd(struct ice_hw *hw, u8 configured_port,
  1325			     enum ice_ptp_tmr_cmd configured_cmd)
> 1326	{
  1327		u8 port;
  1328	
  1329		for (port = 0; port < ICE_NUM_EXTERNAL_PORTS; port++) {
  1330			enum ice_ptp_tmr_cmd cmd;
  1331			int err;
  1332	
  1333			if (port == configured_port)
  1334				cmd = configured_cmd;
  1335			else
  1336				cmd = ICE_PTP_NOP;
  1337	
  1338			err = ice_ptp_write_port_cmd_e822(hw, port, cmd);
  1339			if (err)
  1340				return err;
  1341		}
  1342	
  1343		return 0;
  1344	}
  1345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
