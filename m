Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA8018037
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692300595; x=1723836595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xU2+/U7gKPmKRHOSAncjE5bxwtQq6AR2i9/r/c5PWEs=;
  b=loGEYDhbjm8KVJpUlrnLD+bY+ktQ/+JmetIcSiZpV9sra1puVrl77f6L
   9fnJGGSvqne3psuoJ3D4FSC4HwtVolTWG01aROfvPlJz/5Cu1Pdqeqf5r
   gdDMdbbgYTdfAdSQTMH6PWkiMFYl29wh6mDk7oVcEPSmsxK0K1Y9ASPVU
   wzTu0Vhbl2Z7c5gQtQgrPfMSUmt4tYITnQqhQU8fZamsqE2Wvktscv97G
   Fiw2MBoLZ3PO82idOw190is7yZPR+5UMFEk190qH/pbmf9dzwscY6Qrtp
   LcPym61bgZtDaaRjEpQAC+ciu+gDsIi4vbQSiR/nK2AmnfgC2DoE2o+Rs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363067690"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="363067690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 12:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908536150"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908536150"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 12:29:53 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWigq-0001Q3-06;
	Thu, 17 Aug 2023 19:29:52 +0000
Date: Fri, 18 Aug 2023 03:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 7365/10848] htmldocs:
 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:623: warning: Incorrect
 use of kernel-doc format:          * @replay mode: Replay supported
Message-ID: <202308180330.ylzpuj1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47762f08697484cf0c2f2904b8c52375ed26c8cb
commit: ec8e59cb4e0c1a52d5a541fff9dcec398b48f7b4 [7365/10848] drm/amd/display: Get replay info from VSDB
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180330.ylzpuj1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180330.ylzpuj1m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:623: warning: Incorrect use of kernel-doc format:          * @replay mode: Replay supported
>> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:626: warning: Function parameter or member 'replay_mode' not described in 'amdgpu_hdmi_vsdb_info'

vim +623 ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h

   592	
   593	/**
   594	 * struct amdgpu_hdmi_vsdb_info - Keep track of the VSDB info
   595	 *
   596	 * AMDGPU supports FreeSync over HDMI by using the VSDB section, and this
   597	 * struct is useful to keep track of the display-specific information about
   598	 * FreeSync.
   599	 */
   600	struct amdgpu_hdmi_vsdb_info {
   601		/**
   602		 * @amd_vsdb_version: Vendor Specific Data Block Version, should be
   603		 * used to determine which Vendor Specific InfoFrame (VSIF) to send.
   604		 */
   605		unsigned int amd_vsdb_version;
   606	
   607		/**
   608		 * @freesync_supported: FreeSync Supported.
   609		 */
   610		bool freesync_supported;
   611	
   612		/**
   613		 * @min_refresh_rate_hz: FreeSync Minimum Refresh Rate in Hz.
   614		 */
   615		unsigned int min_refresh_rate_hz;
   616	
   617		/**
   618		 * @max_refresh_rate_hz: FreeSync Maximum Refresh Rate in Hz
   619		 */
   620		unsigned int max_refresh_rate_hz;
   621	
   622		/**
 > 623		 * @replay mode: Replay supported
   624		 */
   625		bool replay_mode;
 > 626	};
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
