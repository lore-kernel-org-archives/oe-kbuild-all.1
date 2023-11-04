Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E086322E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdDRJDuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699080289; x=1730616289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPesquRD8faS/mTdNNVk0hg0m9cvyAoaIe8vhGKpaL4=;
  b=JdDRJDuhrZmuONHZ+vQKukb6CpAMGn1GDtgSMVvS5moMrF7aTLV33R4w
   Kovpxig9M0Abvh008uamjngn8vgHdZ6HKNsoU0rPI0Z/9FKkKkiTvl6g5
   tQ5Z2c3eKpi+vZhugHsvJUK8iFM9EeYF24R7ZzjmdNHkmzQDQf2hchM+V
   m0UF2wkEigZnJfgMGt9fiVkm02KFNznjwuwFj6BQ3XroOhxMFw0Yf9Rfu
   bRXf1hnZloIXDyfPdxbt5hocgfjK7DgtKEpEzRjHvWSYMZzhZ1/gat6oL
   3zhOkFob3BrBqFSsDrLtopeI/5aDEpInyOwvqd/EusRNdiSDN/AUkZJ4+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388890129"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="388890129"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 23:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761826304"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="761826304"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Nov 2023 23:44:46 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzAOi-0003ZM-11;
	Sat, 04 Nov 2023 06:44:44 +0000
Date: Sat, 4 Nov 2023 14:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:hdmi-dbg 27/33]
 drm_atomic_state_helper.c:undefined reference to
 `drm_hdmi_avi_infoframe_colorimetry'
Message-ID: <202311041402.OINZlQXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   8e65f28447c830fe113ba037c2ba210d781d4420
commit: 444cef98ad6ebf50c25fd10174aaa05af94f1633 [27/33] drm/connector: hdmi: Add Infoframes generation
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20231104/202311041402.OINZlQXZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041402.OINZlQXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041402.OINZlQXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/gpu/drm/drm_atomic_state_helper.o: in function `.L445':
>> drm_atomic_state_helper.c:(.text+0x1834): undefined reference to `drm_hdmi_avi_infoframe_colorimetry'
>> loongarch64-linux-ld: drm_atomic_state_helper.c:(.text+0x1840): undefined reference to `drm_hdmi_avi_infoframe_bars'
>> loongarch64-linux-ld: drm_atomic_state_helper.c:(.text+0x1888): undefined reference to `drm_hdmi_infoframe_set_hdr_metadata'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
