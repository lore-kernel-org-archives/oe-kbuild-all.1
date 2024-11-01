Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725001D554
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 00:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420704; cv=none; b=vD+uBNIcaGiJP/qt6R7bm2Cx4omQmvQ6x4XWQp3R3mahydPw28rR6PuDNyokrUmkRRfTLUzXuJDn38kOOGtmIN2Gc6a1RT5Xrt45ey/blKYxOnIxAHGnrWdov4pfQckpCKoRrct6kQ+vhSK0AgSdZKEHM+mvlQeTaNWejym3TrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420704; c=relaxed/simple;
	bh=UTX7qDh+sUJ9OrBzHfFinwLnv4yllOhlmUEByT/7xzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VZnUTUKSRtYKO2atpSBnqpRwbAh79Gs1OtVfF2Sbun4E1LfrdnSpUiiq5CFaq7h2dnc5KSh8ugyWsamchUa+/3Yy+yFqpcJBVIqd7ztz67jyPn/iUj5A75D3i7mrj75AdAaTUFPWUM0401Z/pGC6paxtEQRfq1O4GlICWB9yPIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRdG5nxl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRdG5nxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420696; x=1761956696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTX7qDh+sUJ9OrBzHfFinwLnv4yllOhlmUEByT/7xzY=;
  b=HRdG5nxlbhNMkvmdfMhFf6AwZbTYQktosyu8wLYe/07D0MjWqoCdG6bJ
   I7tOLgmrJKLJfoCM+Za/YKftQwNZ0bHkizq/lk1nQ9HM800eI2xHCdCcM
   XLHGluz3M/UokPeil/yWJ9T8JkvZcYtkIE8VBwg3vmNIs8utAJh76ON4T
   idbkZnoUorKHerNq3mPuV9Wk50kLF+kUWUEk3VYogpX686+M0FrfzDrnc
   4C4N4peEYtJJa/ZQ+maxQ3uRQC1U6uqVgt8pkj5O1zjJPVd+Cs53grZsv
   2eX8aTEBGSWLQB/hntIMtymOAs8TUAcWQtoV4RRAr0Mt3sEFF0Ov1Ns9f
   g==;
X-CSE-ConnectionGUID: Yahl5AbfQuylwWOKVB2Fdg==
X-CSE-MsgGUID: uiJL085tTNeorZsNdLGyPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33988264"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="33988264"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:24:53 -0700
X-CSE-ConnectionGUID: jWcTpKkqRdKI0Yt5NBbvmw==
X-CSE-MsgGUID: MM3CIyJsREeq38L8iPN6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82323061"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2024 17:24:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fT7-000gsB-26;
	Fri, 01 Nov 2024 00:24:49 +0000
Date: Fri, 1 Nov 2024 08:24:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18689/30000]
 drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for
 'ubcore_post_jetty_send_wr'
Message-ID: <202411010813.TGMdTWRa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c78205e40443cde6028b0539f30a00fda4167edd
commit: 33800c2820ab85fe02800e33f6b3287130278bdf [18689/30000] ub: ubcore add data plane ops api.
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010813.TGMdTWRa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010813.TGMdTWRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010813.TGMdTWRa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for 'ubcore_post_jetty_send_wr' [-Wmissing-prototypes]
      26 | int ubcore_post_jetty_send_wr(struct ubcore_jetty *jetty, const struct ubcore_jfs_wr *wr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_dp.c:42:5: warning: no previous prototype for 'ubcore_post_jetty_recv_wr' [-Wmissing-prototypes]
      42 | int ubcore_post_jetty_recv_wr(struct ubcore_jetty *jetty, const struct ubcore_jfr_wr *wr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_dp.c:58:5: warning: no previous prototype for 'ubcore_post_jfs_wr' [-Wmissing-prototypes]
      58 | int ubcore_post_jfs_wr(struct ubcore_jfs *jfs, const struct ubcore_jfs_wr *wr,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_dp.c:74:5: warning: no previous prototype for 'ubcore_post_jfr_wr' [-Wmissing-prototypes]
      74 | int ubcore_post_jfr_wr(struct ubcore_jfr *jfr, const struct ubcore_jfr_wr *wr,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_dp.c:90:5: warning: no previous prototype for 'ubcore_poll_jfc' [-Wmissing-prototypes]
      90 | int ubcore_poll_jfc(struct ubcore_jfc *jfc, int cr_cnt, struct ubcore_cr *cr)
         |     ^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_dp.c:105:5: warning: no previous prototype for 'ubcore_rearm_jfc' [-Wmissing-prototypes]
     105 | int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)
         |     ^~~~~~~~~~~~~~~~


vim +/ubcore_post_jetty_send_wr +26 drivers/ub/urma/ubcore/ubcore_dp.c

    25	
  > 26	int ubcore_post_jetty_send_wr(struct ubcore_jetty *jetty, const struct ubcore_jfs_wr *wr,
    27				      struct ubcore_jfs_wr **bad_wr)
    28	{
    29		struct ubcore_ops *dev_ops;
    30	
    31		if (jetty == NULL || jetty->ub_dev == NULL || jetty->ub_dev->ops == NULL ||
    32		    jetty->ub_dev->ops->post_jetty_send_wr == NULL || wr == NULL || bad_wr == NULL) {
    33			ubcore_log_err("Invalid parameter");
    34			return -EINVAL;
    35		}
    36	
    37		dev_ops = jetty->ub_dev->ops;
    38		return dev_ops->post_jetty_send_wr(jetty, wr, bad_wr);
    39	}
    40	EXPORT_SYMBOL(ubcore_post_jetty_send_wr);
    41	
  > 42	int ubcore_post_jetty_recv_wr(struct ubcore_jetty *jetty, const struct ubcore_jfr_wr *wr,
    43				      struct ubcore_jfr_wr **bad_wr)
    44	{
    45		struct ubcore_ops *dev_ops;
    46	
    47		if (jetty == NULL || jetty->ub_dev == NULL || jetty->ub_dev->ops == NULL ||
    48		    jetty->ub_dev->ops->post_jetty_recv_wr == NULL || wr == NULL || bad_wr == NULL) {
    49			ubcore_log_err("Invalid parameter");
    50			return -EINVAL;
    51		}
    52	
    53		dev_ops = jetty->ub_dev->ops;
    54		return dev_ops->post_jetty_recv_wr(jetty, wr, bad_wr);
    55	}
    56	EXPORT_SYMBOL(ubcore_post_jetty_recv_wr);
    57	
  > 58	int ubcore_post_jfs_wr(struct ubcore_jfs *jfs, const struct ubcore_jfs_wr *wr,
    59			       struct ubcore_jfs_wr **bad_wr)
    60	{
    61		struct ubcore_ops *dev_ops;
    62	
    63		if (jfs == NULL || jfs->ub_dev == NULL || jfs->ub_dev->ops == NULL ||
    64		    jfs->ub_dev->ops->post_jfs_wr == NULL || wr == NULL || bad_wr == NULL) {
    65			ubcore_log_err("Invalid parameter");
    66			return -EINVAL;
    67		}
    68	
    69		dev_ops = jfs->ub_dev->ops;
    70		return dev_ops->post_jfs_wr(jfs, wr, bad_wr);
    71	}
    72	EXPORT_SYMBOL(ubcore_post_jfs_wr);
    73	
  > 74	int ubcore_post_jfr_wr(struct ubcore_jfr *jfr, const struct ubcore_jfr_wr *wr,
    75			       struct ubcore_jfr_wr **bad_wr)
    76	{
    77		struct ubcore_ops *dev_ops;
    78	
    79		if (jfr == NULL || jfr->ub_dev == NULL || jfr->ub_dev->ops == NULL ||
    80		    jfr->ub_dev->ops->post_jfr_wr == NULL || wr == NULL || bad_wr == NULL) {
    81			ubcore_log_err("Invalid parameter");
    82			return -EINVAL;
    83		}
    84	
    85		dev_ops = jfr->ub_dev->ops;
    86		return dev_ops->post_jfr_wr(jfr, wr, bad_wr);
    87	}
    88	EXPORT_SYMBOL(ubcore_post_jfr_wr);
    89	
  > 90	int ubcore_poll_jfc(struct ubcore_jfc *jfc, int cr_cnt, struct ubcore_cr *cr)
    91	{
    92		struct ubcore_ops *dev_ops;
    93	
    94		if (jfc == NULL || jfc->ub_dev == NULL || jfc->ub_dev->ops == NULL ||
    95		    jfc->ub_dev->ops->poll_jfc == NULL || cr == NULL) {
    96			ubcore_log_err("Invalid parameter");
    97			return -EINVAL;
    98		}
    99	
   100		dev_ops = jfc->ub_dev->ops;
   101		return dev_ops->poll_jfc(jfc, cr_cnt, cr);
   102	}
   103	EXPORT_SYMBOL(ubcore_poll_jfc);
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
