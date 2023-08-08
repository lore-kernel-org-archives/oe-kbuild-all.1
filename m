Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6CF1379
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 07:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691478052; x=1723014052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQa/nLCvvfPoY2VVE8FRA+Ob2DoyjYkrNPJQ7XMHWrA=;
  b=a92Kp9vNU29R4dxVQopeVQD6vJe2O529o/s1uJcTrPYosYYxQAJEUwdC
   +tDHmW/ZLnNqZpjJ+nlc9jl027xi3yy5C0br0aBBbqyfm1mQbP/jwlJM3
   CuVtJSz7KiPAEJ2bTgG/I2grL0QDovmXjvRi//t5JaTGVqn3vK3dsFqs4
   gVfL4opHm1sk0A5qlfp/n3BKx8r4Ip7RLOQgDZ7P5czaTp+3DQyEhCSLs
   wbs4ibffgvWCLCet+E0EUoD+nU8l+wpj75kERUt1mf3sAcBlHrR6kXgvL
   /w8twhEw6//k8IpGx4scvvB9ZPMIeFxxk9luAl4z9rBoHq54IEhxUsT00
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360828585"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360828585"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 00:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708137514"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="708137514"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2023 00:00:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTGi1-0005Aq-09;
	Tue, 08 Aug 2023 07:00:49 +0000
Date: Tue, 8 Aug 2023 15:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 7602/7933]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:37: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202308081459.US5rLYAY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
commit: c7ddc0a800bc9f681a18c3bdd9f06b61adfabc11 [7602/7933] drm/amd/display: Add Functions to enable Freesync Panel Replay
config: xtensa-randconfig-r022-20230808 (https://download.01.org/0day-ci/archive/20230808/202308081459.US5rLYAY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081459.US5rLYAY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081459.US5rLYAY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:37: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get Replay state from firmware.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:66: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Enable/Disable Replay.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:116: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set REPLAY power optimization flags.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:134: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Setup Replay by programming phy registers and sending replay hw context values to firmware.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:219: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set coasting vtotal.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:238: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get Replay residency from firmware.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:271: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Construct Replay object.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:280: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Allocate and initialize Replay object.
   drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c:297: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Deallocate Replay object.


vim +37 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_replay.c

    35	
    36	/**
  > 37	 * Get Replay state from firmware.
    38	 */
    39	static void dmub_replay_get_state(struct dmub_replay *dmub, enum replay_state *state, uint8_t panel_inst)
    40	{
    41		struct dmub_srv *srv = dmub->ctx->dmub_srv->dmub;
    42		/* uint32_t raw_state = 0; */
    43		uint32_t retry_count = 0;
    44		enum dmub_status status;
    45	
    46		do {
    47			// Send gpint command and wait for ack
    48			status = dmub_srv_send_gpint_command(srv, DMUB_GPINT__GET_REPLAY_STATE, panel_inst, 30);
    49	
    50			if (status == DMUB_STATUS_OK) {
    51				// GPINT was executed, get response
    52				dmub_srv_get_gpint_response(srv, (uint32_t *)state);
    53			} else
    54				// Return invalid state when GPINT times out
    55				*state = REPLAY_STATE_INVALID;
    56		} while (++retry_count <= 1000 && *state == REPLAY_STATE_INVALID);
    57	
    58		// Assert if max retry hit
    59		if (retry_count >= 1000 && *state == REPLAY_STATE_INVALID) {
    60			ASSERT(0);
    61			/* To-do: Add retry fail log */
    62		}
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
