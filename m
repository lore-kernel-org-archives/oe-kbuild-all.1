Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9C4411
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfzWO41d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696821603; x=1728357603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kAI+KLgd/FlEPEWWcf/+irbrlRE5ZObYGdKxm3Y9/lo=;
  b=dfzWO41dTEVm5ynmIOf/5FV7VD0kAsChoGBg8A/r7/wag17I1QDAdat8
   jy7mg7n4l6GvzG6cfn77G3mJBrcXXtgIlZvxPLRQ29cvygv/vyEel+2hb
   +/8/tlSY1SeMLlvTjIeZSRovSSm7nDImKxRDQEo4r5fcCBT7B5FQSJBrX
   NRTr578xcaatK1Y2g78is4jBGrLyIKV9ghBvEc168f9Dg0D1wgtNJwsdL
   Q8u0dCVd1u+F1l39debBfXK3M/m9+CaVta8NtZXfbf9oJW2m1ckx2zkNU
   95xoEAAOh+lpQ+l05etUAuPWtr3nMNqttU6NirkBPa6oXRQV4DYxUJizc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="369123822"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="369123822"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 20:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782346860"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="782346860"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2023 20:19:32 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpgnq-00060C-1c;
	Mon, 09 Oct 2023 03:19:30 +0000
Date: Mon, 9 Oct 2023 11:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 284/284]
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:33: warning: Function parameter
 or member 'link' not described in 'gsccs_client_ctx'
Message-ID: <202310091123.leXDyr3q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   46079968be0cae5701e8cf249974c01fbd56f454
commit: 46079968be0cae5701e8cf249974c01fbd56f454 [284/284] FIXUP: CHROMIUM: drm/i915/pxp/mtl: Add client resource management into GSCCS
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231009/202310091123.leXDyr3q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091123.leXDyr3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310091123.leXDyr3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:33: warning: Function parameter or member 'link' not described in 'gsccs_client_ctx'
>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:33: warning: Function parameter or member 'exec' not described in 'gsccs_client_ctx'
>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:33: warning: Function parameter or member 'drmfile' not described in 'gsccs_client_ctx'


vim +33 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

9b39a063a58553 Alan Previn   2023-01-27  21  
9b39a063a58553 Alan Previn   2023-01-27  22  /**
46079968be0cae Guenter Roeck 2023-10-06  23   * struct gsccs_client_ctx
9b39a063a58553 Alan Previn   2023-01-27  24   *
9b39a063a58553 Alan Previn   2023-01-27  25   * We dont need to allocate multiple execution resources (above struct)
9b39a063a58553 Alan Previn   2023-01-27  26   * for a single drm_client that is executing multiple PXP sessions.
9b39a063a58553 Alan Previn   2023-01-27  27   * So we use a link list of nodes indexed by the drmclient handle
9b39a063a58553 Alan Previn   2023-01-27  28   */
9b39a063a58553 Alan Previn   2023-01-27  29  struct gsccs_client_ctx {
9b39a063a58553 Alan Previn   2023-01-27  30  	struct list_head link;
9b39a063a58553 Alan Previn   2023-01-27  31  	struct gsccs_session_resources exec;
9b39a063a58553 Alan Previn   2023-01-27  32  	struct drm_file *drmfile;
9b39a063a58553 Alan Previn   2023-01-27 @33  };
9b39a063a58553 Alan Previn   2023-01-27  34  

:::::: The code at line 33 was first introduced by commit
:::::: 9b39a063a5855376413f556cf1911df355f502d1 CHROMIUM: drm/i915/pxp/mtl: Add client resource management into GSCCS

:::::: TO: Alan Previn <alan.previn.teres.alexis@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
