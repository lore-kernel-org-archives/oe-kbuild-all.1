Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27919BA1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIPORMK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698863641; x=1730399641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2hha5y0uZTR/Q8rjd8NFwaLRluMfCDBLP1FED/gGgo=;
  b=dIPORMK9jfrAicTocQKF1O3hQrNdFaa2NSF5dF5n/T2GyAEDhCO2/IaZ
   /eGRiknpmO363pOV9nSxr0GYF8mbzRmn0zblK/ecuHYYULdZqjiC4bsTi
   pFlb04dqNVDk0q+88JL1Z8zn4Sl7srq6rw2xv/juBzAA4V4FbRg8laBPi
   EBDgEA62r3q6dZNJ3RKmWxUj9iNmleFpnCwIQNtBrfZBBKYurcN1XKk3i
   kXNTao+5hAaqZ3+xtkjR16hGnwQiJKg6zG6UliWUsC5zi2VrFlRCfF95d
   tYIX8LWasWeBaVaGEPGpoQQmhbxKCmI3QUZ0VahxK82kwGuI/1M6Eb/dx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="419672860"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="419672860"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 11:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="9132839"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Nov 2023 11:33:58 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyG2O-0000u8-1p;
	Wed, 01 Nov 2023 18:33:56 +0000
Date: Thu, 2 Nov 2023 02:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: Stanislav Fomichev <sdf@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: net/core/xdp.c:737:5: warning: no previous declaration for
 'bpf_xdp_metadata_rx_hash'
Message-ID: <202311020203.CdXuCwy2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bc9e6515183935fa0cccaf67455c439afe4982b
commit: 3d76a4d3d4e591af3e789698affaad88a5a8e8ab bpf: XDP metadata RX kfuncs
date:   9 months ago
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231102/202311020203.CdXuCwy2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311020203.CdXuCwy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311020203.CdXuCwy2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/xdp.c:725:5: warning: no previous declaration for 'bpf_xdp_metadata_rx_timestamp' [-Wmissing-declarations]
    int bpf_xdp_metadata_rx_timestamp(const struct xdp_md *ctx, u64 *timestamp)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/xdp.c:737:5: warning: no previous declaration for 'bpf_xdp_metadata_rx_hash' [-Wmissing-declarations]
    int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_xdp_metadata_rx_hash +737 net/core/xdp.c

   729	
   730	/**
   731	 * bpf_xdp_metadata_rx_hash - Read XDP frame RX hash.
   732	 * @ctx: XDP context pointer.
   733	 * @hash: Return value pointer.
   734	 *
   735	 * Returns 0 on success or ``-errno`` on error.
   736	 */
 > 737	int bpf_xdp_metadata_rx_hash(const struct xdp_md *ctx, u32 *hash)
   738	{
   739		return -EOPNOTSUPP;
   740	}
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
