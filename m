Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE211DDF8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689096509; x=1720632509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKwzED17uFnn9gxE/QC45hPja9noXhDGU5NsKZbPvrQ=;
  b=SSchcmMCpiZlcOMysCvwPoI/OPmus/VWgtOk8JtzZwt4qWwBb68TK82T
   0x3Rs3UgnwMv9LtVPkmwsYvB+5vafhd1EtfdQEZ3W7X0/ch0oQRC1hFJ6
   cJMNA5poK0irFL19GLWLB7AFojxvJ/4J89kD0hU66iTGPpg29PktCJPrZ
   762xm4YY/QI1R2Jm1dfRHNbbIHHODD+v/FSf9Ffra6ScWQrqi/zFkqS6H
   NA5BudFWUPENs2MHy8/3k6o8oLXHPNA9C6kALWJ8ppg1u+ypsIHKtLs2U
   Ze/mnv7KXwNHMJ5wtMEwVT0kO+urOEGa0SgQvt7TU1+3xeLDyR539tJwR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="345001366"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="345001366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="786689975"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="786689975"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jul 2023 10:28:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJH9n-0004yU-1s;
	Tue, 11 Jul 2023 17:28:11 +0000
Date: Wed, 12 Jul 2023 01:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Ramalingam C <ramalingam.c@intel.com>
Subject: [intel-lts:4.19/android_s 4290/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous prototype for
 'conn_to_dig_port'
Message-ID: <202307120134.DESODu6R-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   d86cf6f06c9415a617dd1a1e3c9dc081a3cf0f8f
commit: 54c9b1c8df1df89c0173aad2d559884a305c797c [4290/30000] drm/i915: Passing the intel_connector to HDCP auth
config: i386-buildonly-randconfig-r006-20230711 (https://download.01.org/0day-ci/archive/20230712/202307120134.DESODu6R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120134.DESODu6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120134.DESODu6R-lkp@intel.com/

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
