Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F62D1869
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgEw64vO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697268196; x=1728804196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Msg04i3Gmg/4vgzIBaRMPJgkdapqWeGqxHK4RGISng=;
  b=AgEw64vOgm/85zJTr7u3IkMf3q7pwHmHZlCXGvfDa49XM93KgKBA+OAj
   uB6qDi8T456W6d/gVtNyFhZHE69t3F0JkI9UnVh5c3opriTki/pv2XX5g
   g6ZvqU6hsFjTwzKWPmPJyERatzObUHliL4ejOERrH75D7BIoorqcK6B2V
   r/ugwq0p8ccEyUSFwAtIGEbzEeDrHrYUPKfstt45Ol6DlwrEAgtvGymDI
   uV/FUhaRfoR+eNa9zEfZdK5qQvZEWBBOmNq9D6O9lEGAu+crI3rk9n9cd
   LLTykG11LWpze6/tZtBSoOeuwQJdxjF9VYqLY0GhPYKbY2l1nAWO4wYAW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471539363"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471539363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784416665"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784416665"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 00:23:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrYzL-0005of-0J;
	Sat, 14 Oct 2023 07:23:07 +0000
Date: Sat, 14 Oct 2023 15:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1003/1018] zc_rx.c:undefined reference to
 `dev_get_by_index'
Message-ID: <202310141512.txMqcqjL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: b75dd3ad68b4b49f885a47a4e5d96bfe723bf8aa [1003/1018] io_uring: setup ZC for an RX queue when registering an ifq
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231014/202310141512.txMqcqjL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141512.txMqcqjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141512.txMqcqjL-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
>> zc_rx.c:(.text+0x210): undefined reference to `dev_get_by_index'
   sh4-linux-ld: zc_rx.c:(.text+0x214): undefined reference to `init_net'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
