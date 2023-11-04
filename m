Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6471FC9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 03:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5E0bVWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699069454; x=1730605454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0r6Mh8JPqUehX1kCf4gXfkggYw2r7DeA0bqfIc0T1lQ=;
  b=U5E0bVWoJbN1R3MAfG4uqZODQtNQ4gDvkNo8p7C00HdXMeHTj1nFDKNz
   zjhifbu3dtIGkLyXmv+/8DDSiLUooDvPAqiS4E3qpTxavzqTspCASuxPy
   x3tlFfJyQHeiOtw2Fo4T8/sBjsDWtOp/CVfZOX3rzK6HzIOprH54XLgZd
   DPM+tqr/IST6CgeBUP1qMhrOY6up4muyPtIvhRXW/OKmBMkf7jRdCiju/
   PWFV6XeojMs8lYrL0MR8qV6jUZunZHoUGgMwNUZOA0a13UCB/vq90UrsO
   MKX1RIWcuGJueNdVoKjf7VXRGEVeCS4kZ1Y21dDvvx93sheM/MqL0ab2A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475293243"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="475293243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1093263360"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1093263360"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2023 20:44:12 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz7Zy-0003Ml-0f;
	Sat, 04 Nov 2023 03:44:10 +0000
Date: Sat, 4 Nov 2023 11:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/240-isp 22/56]
 drivers/media/platform/apple/isp/isp-v4l2.c:325:20: warning: no previous
 prototype for 'isp_select_preset'
Message-ID: <202311041156.BXD7xHKE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   b5b7f780ce17699202c057aff11992dbde545241
commit: 565c88c00f8bc78a467faa502c1da262c833ce4a [22/56] media: apple: isp: Working t602x and multiple formats and more fixes
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231104/202311041156.BXD7xHKE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041156.BXD7xHKE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041156.BXD7xHKE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/isp/isp-v4l2.c:325:20: warning: no previous prototype for 'isp_select_preset' [-Wmissing-prototypes]
     325 | struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
         |                    ^~~~~~~~~~~~~~~~~


vim +/isp_select_preset +325 drivers/media/platform/apple/isp/isp-v4l2.c

   324	
 > 325	struct isp_preset *isp_select_preset(struct apple_isp *isp, u32 width,
   326					     u32 height)
   327	{
   328		struct isp_preset *preset, *best = &isp->presets[0];
   329		int i, score, best_score = INT_MAX;
   330	
   331		/* Default if no dimensions */
   332		if (width == 0 || height == 0)
   333			return &isp->presets[0];
   334	
   335		for (i = 0; i < isp->num_presets; i++) {
   336			preset = &isp->presets[i];
   337			score = abs((int)preset->output_dim.x - (int)width) +
   338			abs((int)preset->output_dim.y - (int)height);
   339			if (score < best_score) {
   340				best = preset;
   341				best_score = score;
   342			}
   343		}
   344	
   345		return best;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
