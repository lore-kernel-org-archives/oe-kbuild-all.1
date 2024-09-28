Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F22210FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 17:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727543911; cv=none; b=loU2q5FKmJbdIAEKOAkYpBPtLi/G5GcfXupAyeOCwJykBg9O1bDGyH89hp/gTttlKCtTkDuFu59jv+wRtVnES33d6Bfq7QuH1rhAgEOnBFudMjf5lXgajK1uxdmBY5aqrcfXteTfjhdCxePjjgptJAjNVCfVUQstZYgO5rB6Drc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727543911; c=relaxed/simple;
	bh=CVSk52ybfdcEikS7zoawEHccO/TfZcA1tjs7r8zPBUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anBrltOlIbVUtuS/59vh6Un7Nw4E78CCROTQlGDTtJqU+14yS5MxpjrXDjHOMoXEOK3Uo+xA+t3QXhxII6a8otYHk+oJpHsbnwWx6MrjO/3gu4XuliMDqqbAqh9t2fifgyHGZkh/aeRpRwDMvJNIXDZ9XwVqz71HKHlfitg0Occ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aZZHstJl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZZHstJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727543909; x=1759079909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CVSk52ybfdcEikS7zoawEHccO/TfZcA1tjs7r8zPBUc=;
  b=aZZHstJlvS8kd1Dh5Z0SoAnL1mchEMwiaRdg7UdJuxt121xfKjrEqs0E
   S1CoslYMS+fPffoFb9EE9dEZi3qrxLH1oZbgQr8iUD2S43kE30KDH7bfv
   eG4eQsU21cFGuNrUbtHEuohZow+R7u9O4c57WSpP8oIgMmdAv4KyRPAt8
   P9yILozwpa/XvhMrulE3243Wt6m44LXtioffPW92gOEW1POYRFeIPcowV
   HiK5ciVOS0Ox2sVsLf+r0Syh3ic6iRT+nSqNqbwvN/9HKKuo3ktWu9O8S
   wlABZH1rfRWCF1g9L5gLholRVBK4idBeUg8r5h+wHBdZ3zmtgndfeSRq1
   Q==;
X-CSE-ConnectionGUID: S5VMbUdZTjiYcPAOuQDQog==
X-CSE-MsgGUID: lCrPOeLWQ2KSRoBx3/5TUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="30561572"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30561572"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 10:18:26 -0700
X-CSE-ConnectionGUID: EAWos9zIS9qNt3JdddKqKA==
X-CSE-MsgGUID: /hL4HEFUR7mg7sBY5cOIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72717728"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 10:18:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sub5L-000NUR-0R;
	Sat, 28 Sep 2024 17:18:23 +0000
Date: Sun, 29 Sep 2024 01:17:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19223/30000]
 drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for
 'ubcore_post_jetty_send_wr'
Message-ID: <202409290129.erX7l03j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: 33800c2820ab85fe02800e33f6b3287130278bdf [19223/30000] ub: ubcore add data plane ops api.
config: arm64-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290129.erX7l03j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290129.erX7l03j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290129.erX7l03j-lkp@intel.com/

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
