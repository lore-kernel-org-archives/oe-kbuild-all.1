Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC414AB8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707912594; cv=none; b=J3p3n90ssbijLqPm8ygVl/cVIPPJmYxLXkiQyfuPyp/X2zBLfrstkiG+lcQY8p3/Ovb4lYWfQAZoYZdMd6t6W3puEvjoedAQQ3OPxkeK3u4rRb3i9AMaiCQcLWnUPJDRdKjRTWjYuPL/a1Y4S3509Aeg2bUxLJJyuserDJpY4n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707912594; c=relaxed/simple;
	bh=oyljSEPPu1RKC1I9wx0scrr8UDsqqj0EGnkGBw/unbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkfiQyJBh1SHF+ux/SGiuxha9CfNuQ/mrZqhVcdah94GsnUGTq9grjUyeQcfVj6YsmCs+WtrHouRm5SBt3bdG7Q4O04F1Km+Aw3QOOAnl10/7gSnOKVOa/pKDn06ciYodpKkSGpaN/MiZ+LXCSu+v6Gu/1eALElewAmpuAYdoyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjIa07pO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjIa07pO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707912592; x=1739448592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyljSEPPu1RKC1I9wx0scrr8UDsqqj0EGnkGBw/unbk=;
  b=IjIa07pOtfE1HEpVN2ZO97+1lH9uMaun34AfzAfaLvSKNf8yo5nQkgDu
   whARAaFldol535IiRozyGqo1I+CguDXXuIOycoTd+q48H+sC6KwXZuzJM
   ZCjw2/FQziUN3EGz8z1/djYdqKMHqemy1lTHv3naPofRrhgcGMdN7hcCh
   95wIoTcLOG293pS7+P1n9dMO2cmZXBez/s+Aknev/MygwcoAdPBitZEZt
   qbVRwhySV+kcZwx+9Wd0CPCc08qBQPi5To2YJ2mQHnG3kVY0cCGgHwLR9
   vkMK3hxU6lYrEU0HKskhbLdXndXnLY0ImiWsRnBncvFNlVIVdN64sNJjy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19463469"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="19463469"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 04:09:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3523963"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Feb 2024 04:09:50 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raE5D-0008kG-2F;
	Wed, 14 Feb 2024 12:09:47 +0000
Date: Wed, 14 Feb 2024 20:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 19/38] kernel/sched/fair_eevdf.c:663:6:
 warning: no previous prototype for 'update_entity_lag'
Message-ID: <202402142003.h32EnN6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   efd81cb7bd74278826232f0556137a71fb757350
commit: a115e5d67e8707fd4f6ac76edf1fb6c719dbc72f [19/38] BACKPORT: sched/fair: Add lag based placement
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240214/202402142003.h32EnN6R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402142003.h32EnN6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402142003.h32EnN6R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair_eevdf.c:663:6: warning: no previous prototype for 'update_entity_lag' [-Wmissing-prototypes]
     663 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c: In function 'update_curr_se':
   kernel/sched/fair_eevdf.c:971:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
     971 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_start':
   kernel/sched/fair_eevdf.c:1038:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1038 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_end':
   kernel/sched/fair_eevdf.c:1058:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1058 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_enqueue_sleeper':
   kernel/sched/fair_eevdf.c:1102:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1102 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'set_next_entity':
   kernel/sched/fair_eevdf.c:4936:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    4936 |                 struct sched_statistics *stats;
         |                                          ^~~~~


vim +/update_entity_lag +663 kernel/sched/fair_eevdf.c

   659	
   660	/*
   661	 * lag_i = S - s_i = w_i * (V - v_i)
   662	 */
 > 663	void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
   664	{
   665		SCHED_WARN_ON(!se->on_rq);
   666		se->vlag = avg_vruntime(cfs_rq) - se->vruntime;
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
