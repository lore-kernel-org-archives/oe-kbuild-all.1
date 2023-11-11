Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444C373
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDcEWggL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699660997; x=1731196997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8kmd7wsL6OFW7EynavPvQJ1PH7CN/bOlJUwjh4EayTs=;
  b=mDcEWggLix7dKATAUnShDzAtvoizQ9so6bb5MzTehr+h8Ate1S7yBaZl
   sUi63QcM/QLvyv03EH8eTuuzSxwP1j2j9cxXpjJQUHV9zvkp0afhmL3nS
   uhLSVL9k4CPP8o3L+W4ILZzRD7srHWAZPDjOsIAeqtWZRDLfV/M7/wHeR
   LiNVd8cmaqFLKufuOV47F2zWZX1S39smvdsRwtuu0pgUCUv0Y9sx7ZNh8
   oRqkEfLFMZy7e78i0zRHOvIb3pKMDcsjKk8x/jQRgD3DzTS37/ULM0Z9C
   NFk0seqjEaJ98ye5i6nwRwcofmW8DOiZIuLhN3T7PrNY0phYbAvO7NwDT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="421339238"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="421339238"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 16:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="937281581"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="937281581"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Nov 2023 16:03:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1bSw-000A3y-0X;
	Sat, 11 Nov 2023 00:03:10 +0000
Date: Sat, 11 Nov 2023 08:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Ramalingam C <ramalingam.c@intel.com>
Subject: [intel-lts:4.19/android_t 3756/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:182:27: sparse: sparse: symbol
 'conn_to_dig_port' was not declared. Should it be static?
Message-ID: <202311110715.2y7jcnTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 54c9b1c8df1df89c0173aad2d559884a305c797c [3756/30000] drm/i915: Passing the intel_connector to HDCP auth
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20231111/202311110715.2y7jcnTA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110715.2y7jcnTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110715.2y7jcnTA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/intel_hdcp.c:182:27: sparse: sparse: symbol 'conn_to_dig_port' was not declared. Should it be static?
   drivers/gpu/drm/i915/intel_hdcp.c:743:5: sparse: sparse: symbol 'intel_hdcp_enable' was not declared. Should it be static?
   drivers/gpu/drm/i915/intel_hdcp.c:755:5: sparse: sparse: symbol 'intel_hdcp_disable' was not declared. Should it be static?
   drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous prototype for 'conn_to_dig_port' [-Wmissing-prototypes]
     182 | struct intel_digital_port *conn_to_dig_port(struct intel_connector *connector)
         |                            ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:743:5: warning: no previous prototype for 'intel_hdcp_enable' [-Wmissing-prototypes]
     743 | int intel_hdcp_enable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:755:5: warning: no previous prototype for 'intel_hdcp_disable' [-Wmissing-prototypes]
     755 | int intel_hdcp_disable(struct intel_connector *connector)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.o: warning: objtool: intel_hdcp_auth_downstream()+0x1a1: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_hdcp.o: warning: objtool: intel_hdcp_auth()+0x99e: sibling call from callable instruction with modified stack frame

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
