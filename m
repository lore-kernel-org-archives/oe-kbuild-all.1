Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB8152532
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638427; cv=none; b=kU+eSnioUbmw5Hh/+5LOkAt/LHuWAd+MvPZ/Vb5EeOwqhEtDoBa0Ap4jTRfC86W/yj4UhokEd4SM+ouyEJdt69ElD5DRA2/SoOsgiZEZMyTdFqYHBQuqSqT9a4s+rFczw2Hs0hSrDtKDhu8COEqU+XuJQWX6V1Xui5QcWF5dxM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638427; c=relaxed/simple;
	bh=MwJyevtvDw1nJuivkum3HzVkBkeiYiLDp/6RGgnB0FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFP1XmX5ke0+a3KWtLK5sN0E7WEQitRsFgxlFnQq47AhR/deqFt55QVlfWxb423mGc19egl5U5AOU2/8xQRpYt3UyXVpPV7O6FuxTq57wy5ID3mGSn+j9oAClRdrgZ9dqp9jRmePdu82ElvPrxQ2SEPcIg/p5Xo8EjhZnxwxkqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GUCKPO76; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUCKPO76"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738638425; x=1770174425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MwJyevtvDw1nJuivkum3HzVkBkeiYiLDp/6RGgnB0FU=;
  b=GUCKPO76Opbga6zyVj7sOXmPBjcn073g/BhAx4tE0UPiCgf+si+YG27F
   bo/IQroB2Wh6jo7VdS1/34s3w+ZS5uAoL18XTbpwoPINds0z0xXQOU/MM
   O1iA+9/V8M+0FUHAca2dU01DkgmPWiKflZL9Gmh7XBtMWZRGpJAeSGjjV
   ccSazcc4Pg2gx8zUMSDtf9lvbYnBL0kRIWxMOc2wup+Lrut1uOv7t1gjt
   IkjunoY1URcSvXtpLmT9t8n2EyHtXAx/sHakBtR8SbNV4IS9eKVypw01s
   cKVSpG/j7necEnyQ00Kf4XFljmoO3gTYZ7cH0LfRvoGzv0cjkaCL3UDyh
   w==;
X-CSE-ConnectionGUID: nKmRpNvJRca4ZbEdMNaMRw==
X-CSE-MsgGUID: g0wYymAwT9aoLvlWh+eJsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39053285"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39053285"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:07:04 -0800
X-CSE-ConnectionGUID: 7rYUy+0sS3uuk30KyeTtPQ==
X-CSE-MsgGUID: kiZtyc/FQaOOMen+5FYC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="141344448"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2025 19:07:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf9HA-000rtr-2g;
	Tue, 04 Feb 2025 03:07:00 +0000
Date: Tue, 4 Feb 2025 11:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: Selvin Xavier <selvin.xavier@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 17/75]
 drivers/infiniband/hw/bnxt_re/debugfs.h:34:40: error: variably modified
 'gen0_parms' at file scope
Message-ID: <202502041114.K8XQYeJg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   10565c5cadcb629f7780d24dd351878de9f46db5
commit: a3c71713d9548f1a9ee141c7cfb35550c3487443 [17/75] RDMA/bnxt_re: Congestion control settings using debugfs hook
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502041114.K8XQYeJg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041114.K8XQYeJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.K8XQYeJg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/bnxt_re/main.c:70:
>> drivers/infiniband/hw/bnxt_re/debugfs.h:34:40: error: variably modified 'gen0_parms' at file scope
      34 |         struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_PARAM_GEN0];
         |                                        ^~~~~~~~~~


vim +/gen0_parms +34 drivers/infiniband/hw/bnxt_re/debugfs.h

    32	
    33	struct bnxt_re_dbg_cc_config_params {
  > 34		struct bnxt_re_cc_param        gen0_parms[BNXT_RE_CC_PARAM_GEN0];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
