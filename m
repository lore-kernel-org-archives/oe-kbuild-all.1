Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F5F3DB8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwpLMaiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700078961; x=1731614961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Fl4TmDegKHukRcpeQWBwWSN7Z6hUF6Ur4vuReWvkic=;
  b=cwpLMaiUCNTrZC7jzB0avZUjmh9DJT6uLRYMdm9Uly2d1SEtVnvbyng3
   fdqcwEYOPJsyd94/JvBxprigaHmwER5VHMToQ+28MekPC7ttL4KsW/cD+
   RR+xn8zntip1LbBekfluyaSbCKsU+Y0orp6F31WTde2/X/lHxKkunCHrA
   VnDaQRVoI+Lvppvz+R+viky2bNyQ1FEewU6m9fN0TTmfcZyaNUe5TArnw
   0dsRVhV/hegNapzplEhXUZ318VhitBJq3DWjfSa+XyQRrA+QMj18QC3S7
   hzzTg2br8KMTZ/QC6lvY5nx/Po/CkjjfTCxWhoeopfBwydMe1vxftZQ08
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="375987611"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="375987611"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 12:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1012373638"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="1012373638"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Nov 2023 12:09:19 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3MCL-0000mQ-1l;
	Wed, 15 Nov 2023 20:09:17 +0000
Date: Thu, 16 Nov 2023 04:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Sebastian Reichel <sre@kernel.org>
Subject: [sre-misc:rk3588 32/37] ./usr/include/drm/rockchip_drm.h:19:10:
 fatal error: drm/drm_file.h: No such file or directory
Message-ID: <202311160415.cmb1LJXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   f41b3e9a9d7f22bef0735b4fe0007321ce6b6d6b
commit: 140267c1c11d90f4889e57ae6d58280b261081c0 [32/37] drm/rockchip: vop2: Add basic support for rk3588
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311160415.cmb1LJXC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160415.cmb1LJXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160415.cmb1LJXC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/drm/rockchip_drm.h:19:10: fatal error: drm/drm_file.h: No such file or directory
      19 | #include <drm/drm_file.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
