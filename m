Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8A7F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683893585; x=1715429585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdmbhHQoucDdhiP6BkX2tiHGZZ8b8VdlvgMYA7MyWgQ=;
  b=AYb6klfPCGSffpiCom3m1NQvO9P+QXgznRruWae2abZdzZzrodk7RnK+
   I/0RBb93CX7MVFGLVcz1rhdn+ho5MMpC6fO5wMinF9IVW0FSu4eFKfozH
   rYuF1V2RbQc98m92JcEthHecjmIB5uQIXxauM+8I4RYbHA9fvULTnckD3
   ysdPdm8LAypmfHTgKNgdNIY5kmRPWw4me6CjC2zC60R3TDijgYXdRpNve
   4OJgIMvg0/BjG6wV1q8ZqlbMS/vB2KCzp6nTNWhx+AhbstN+wDCoE0Q3o
   M8hB1p/VYhHtYbPEaqWjBKjt6+EjozyUcNR15iR1bfO7q7xfloUtnFq9u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416407801"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="416407801"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 05:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824337612"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824337612"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2023 05:12:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxRde-0004qE-23;
	Fri, 12 May 2023 12:12:46 +0000
Date: Fri, 12 May 2023 20:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Ramalingam C <ramalingam.c@intel.com>
Subject: [intel-lts:4.19/android_t 4850/30000]
 drivers/gpu/drm/i915/intel_hdcp.c:182:28: warning: no previous prototype for
 'conn_to_dig_port'
Message-ID: <202305122038.SsHU0MNa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   180df1199944ebd8928f320a1bd16c8a87dba2ed
commit: 54c9b1c8df1df89c0173aad2d559884a305c797c [4850/30000] drm/i915: Passing the intel_connector to HDCP auth
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230512/202305122038.SsHU0MNa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/54c9b1c8df1df89c0173aad2d559884a305c797c
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout 54c9b1c8df1df89c0173aad2d559884a305c797c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122038.SsHU0MNa-lkp@intel.com/

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
https://github.com/intel/lkp-tests
