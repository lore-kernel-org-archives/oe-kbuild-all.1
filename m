Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B6911193
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 22:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694040489; x=1725576489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uR+sIdT8jxoGU3g60j0p8PYZWjkaBCnuwg3jU1yEFE=;
  b=l1Ok5+Fthx/64p3DKBa8KkL6nKwdINSVz8fWAuPp1HUJG/Oo6ml3/Pca
   uwWwbrhZuW0i+lbwW7ULeF8txWR0mG5CLrWX7ZAXX7zuLy/5GHiYA0IQk
   w3sI0b5KVJHzLK8bEVbwnmZy101PTAmYSWCN/l8Vbe0EgYqD4wnJBtm90
   8uFzHAK0N+OVSsuLQ50e+Dydn3Ue3jBxp7HrsqZ9k7H8f3kreNiaoUbm0
   V5U22zxabDoWqXVGZ9N2/SxI0aAEXdi0Av0434MMk2qQtNp+3/LKGn9es
   aNKEbG6DC/d7i0L3oXqHggrqh///jqCGYwN0/ldKvzawg4ZzY2DkCFlov
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376103967"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="376103967"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856650672"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856650672"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 15:48:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe1Jd-0000et-15;
	Wed, 06 Sep 2023 22:48:05 +0000
Date: Thu, 7 Sep 2023 06:47:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Ramalingam C <ramalingam.c@intel.com>
Subject: [intel-lts:4.19/android_s 3757/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous declaration
 for 'conn_to_dig_port'
Message-ID: <202309070638.tMCCZls2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   6bfae51123c09ed71d82cfc739c5ccbeac60c4aa
commit: 54c9b1c8df1df89c0173aad2d559884a305c797c [3757/30000] drm/i915: Passing the intel_connector to HDCP auth
config: i386-randconfig-013-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070638.tMCCZls2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070638.tMCCZls2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070638.tMCCZls2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous declaration for 'conn_to_dig_port' [-Wmissing-declarations]
    struct intel_digital_port *conn_to_dig_port(struct intel_connector *connector)
                               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:743:5: warning: no previous declaration for 'intel_hdcp_enable' [-Wmissing-declarations]
    int intel_hdcp_enable(struct intel_connector *connector)
        ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_hdcp.c:755:5: warning: no previous declaration for 'intel_hdcp_disable' [-Wmissing-declarations]
    int intel_hdcp_disable(struct intel_connector *connector)
        ^~~~~~~~~~~~~~~~~~


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
