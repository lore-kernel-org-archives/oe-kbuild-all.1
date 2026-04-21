Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB8439D6EC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776769731; cv=none; b=kyVAwOMO6875stIPLgZF7bRy+JL/KgiqjQj+GFo6lWM6aVIA/eWclGjQdQuAY7PwEtwTQTRLD0AtddJjgSmiI+LrP07xaYXW24TBZyiodoBP//FuDtLkhf0BN2ghJzraKNZhYocrWQ6XYq3g6D7fK2eqwki02Jbm/o/LA3PSS0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776769731; c=relaxed/simple;
	bh=OeDNHRU79WaG0ZKrqxuZJYzFNK66hcB5aJigefNW67s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTqcgPTJ9/ynDMN8M+jNoevlqG3SSCwxRoX7bAAmJmljeuFjSUZcJaYGu8S1aUyAoK9eXQYA+UWDhCdCgS9sELmDBJAzT5EJPoPF1+WZ2LBGzgodjMat3J7hkGNpM3vRk1/AN6XgdldkNOPH1q03b4NYfUU9GCkF/4WpJJwPAyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjnY+FcM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjnY+FcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776769727; x=1808305727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OeDNHRU79WaG0ZKrqxuZJYzFNK66hcB5aJigefNW67s=;
  b=NjnY+FcMVZtcbnWmnu0/w7O4fOe3rvzrZd5CFReMC/1CiDz7Q9JNu4g7
   XrF4eIDsi6rhAKx5Qyds5RfWDPIo+s7tptqcMVEGgxh7GgO9npkeqZ55L
   RKJkxe4Bgakc9K1OfQ+jgPm+UVV1BzG2Sv/yV/IiObuVAflfh1OPJ78k6
   aHHpC08CXNUoP1+Xoe4ew8U/81Qh782fJFy0m/0M8djsnZRTu1qsbbaoJ
   tUrIDOo5DVNxEq74W1v51bGd8qW5Em7xSHyY52/4ypZWCKB7a5jMqa17o
   N4d1vQAVqjvqBFHiCOuUsWI1XXFpUOCHUNzL6BHwaCRBwwtUV4RssqaAL
   g==;
X-CSE-ConnectionGUID: IardNaEKRwKijyn1FLSFqg==
X-CSE-MsgGUID: ZbJGNVveQkuhirqXKy5W4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95257953"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="95257953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 04:08:47 -0700
X-CSE-ConnectionGUID: gUCRgVilQF+/8zgWNJVDBw==
X-CSE-MsgGUID: h5r2wrwxT16rd+Nk+oK+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255473858"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2026 04:08:46 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wF8yB-000000003Qa-3dGO;
	Tue, 21 Apr 2026 11:08:43 +0000
Date: Tue, 21 Apr 2026 19:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: zhaoguohan@kylinos.cn, jgross@suse.com, sstabellini@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: Re: [PATCH] xen/manage: unwind partial shutdown watcher setup on
 error
Message-ID: <202604211801.rqptlYaS-lkp@intel.com>
References: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407022443.12971-1-zhaoguohan@kylinos.cn>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0]
[cannot apply to xen-tip/linux-next linus/master next-20260420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoguohan-kylinos-cn/xen-manage-unwind-partial-shutdown-watcher-setup-on-error/20260416-185003
base:   v7.0
patch link:    https://lore.kernel.org/r/20260407022443.12971-1-zhaoguohan%40kylinos.cn
patch subject: [PATCH] xen/manage: unwind partial shutdown watcher setup on error
config: arm64-randconfig-002-20260421 (https://download.01.org/0day-ci/archive/20260421/202604211801.rqptlYaS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604211801.rqptlYaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604211801.rqptlYaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/xen/manage.c: In function 'setup_shutdown_watcher':
>> drivers/xen/manage.c:380:1: warning: label 'err_unregister_shutdown' defined but not used [-Wunused-label]
     380 | err_unregister_shutdown:
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/xen/manage.c: In function 'shutdown_event':
   drivers/xen/manage.c:357:60: warning: '%s' directive output may be truncated writing up to 71 bytes into a region of size 12 [-Wformat-truncation=]
     357 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                                                            ^~
   In function 'setup_shutdown_watcher',
       inlined from 'shutdown_event' at drivers/xen/manage.c:389:2:
   drivers/xen/manage.c:357:17: note: 'snprintf' output between 9 and 80 bytes into a destination of size 20
     357 |                 snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                          shutdown_handlers[idx].command);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/err_unregister_shutdown +380 drivers/xen/manage.c

   353	
   354		for (idx = 0; idx < ARRAY_SIZE(shutdown_handlers); idx++) {
   355			if (!shutdown_handlers[idx].flag)
   356				continue;
   357			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   358				 shutdown_handlers[idx].command);
   359			err = xenbus_printf(XBT_NIL, "control", node, "%u", 1);
   360			if (err) {
   361				pr_err("%s: Error %d writing %s\n", __func__,
   362					err, node);
   363				goto err_remove_features;
   364			}
   365		}
   366	
   367		return 0;
   368	
   369	err_remove_features:
   370		while (--idx >= 0) {
   371			if (!shutdown_handlers[idx].flag)
   372				continue;
   373			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   374				 shutdown_handlers[idx].command);
   375			xenbus_rm(XBT_NIL, "control", node);
   376		}
   377	#ifdef CONFIG_MAGIC_SYSRQ
   378		unregister_xenbus_watch(&sysrq_watch);
   379	#endif
 > 380	err_unregister_shutdown:
   381		unregister_xenbus_watch(&shutdown_watch);
   382		return err;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
