Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF6C653
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686919589; x=1718455589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Da+84U6q/H3/Wm4MqdLyrQBnG1wFpWgV0BgTnUScdos=;
  b=MRukZ7d+GKq2P5KO1pEfOQm6ZKMFT60FLPyimr3u5w8a74DHv2rrGrnu
   XJSI6zOBtErQjdAH6WBix8IB5btaQBE0vrRDJzOf8GsuKSIYWYLtDly+k
   plhT7RgaiG4fLRwY9KEgFS8JaUa07bJuQbEuvSBIFFB0I/7sstxcogW6Q
   dBBjdqlgCYW7ErYpfhopENgLvfwXQ0LYDXAfYltb8fhkt5llmXJfPihwz
   hEjxBzBqWR0t+5xwfMqitTVzb8iyEgIiGsdbAAP3CdnemU/C+y/lYwnGy
   eEAF6HCtdH5SuD7PGnPBy+qqDzyr4LrahDuJ7+1/46NQH9tt81IP5wfMa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445587357"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="445587357"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 05:46:28 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="746249320"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="746249320"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jun 2023 05:46:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA8qQ-0001Es-02;
	Fri, 16 Jun 2023 12:46:26 +0000
Date: Fri, 16 Jun 2023 20:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Ramalingam C <ramalingam.c@intel.com>
Subject: [intel-lts:4.19/android_t 4650/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous prototype for
 'conn_to_dig_port'
Message-ID: <202306162049.xirL7Cmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khairul,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   73bac264a173617a7d813635c0731ba6ceb345e8
commit: 54c9b1c8df1df89c0173aad2d559884a305c797c [4650/30000] drm/i915: Passing the intel_connector to HDCP auth
config: i386-randconfig-i014-20230614 (https://download.01.org/0day-ci/archive/20230616/202306162049.xirL7Cmj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162049.xirL7Cmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162049.xirL7Cmj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous prototype for 'conn_to_dig_port' [-Wmissing-prototypes]
     182 | struct intel_digital_port *conn_to_dig_port(struct intel_connector *connector)
         |                            ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:743:5: warning: no previous prototype for 'intel_hdcp_enable' [-Wmissing-prototypes]
     743 | int intel_hdcp_enable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:755:5: warning: no previous prototype for 'intel_hdcp_disable' [-Wmissing-prototypes]
     755 | int intel_hdcp_disable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~~


vim +/conn_to_dig_port +182 drivers/gpu/drm/i915/intel_hdcp.c

   181	
 > 182	struct intel_digital_port *conn_to_dig_port(struct intel_connector *connector)
   183	{
   184		return enc_to_dig_port(&intel_attached_encoder(&connector->base)->base);
   185	}
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
