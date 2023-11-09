Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5898D31A61
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esVPPcfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699553065; x=1731089065;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1ovb50mxFVQ5hAdzlFdb93GJ/TFGpRaCzuMgey0j+M0=;
  b=esVPPcfnO7AzV1NCCbQ3HNGglggbbgqxP0Y36gY2TU4vBs0D2SRJbaF2
   tAbbCir4zsnFc/8ZXxYlLzINny3cNxwKlMCaTOOEfAXIs6sSL8Y67Q2Mt
   LofIbsAXuS1GxhWxgN1o2Qa7sX4egS6OKjNo40DIC6tiUcfNNvUvz8Fc9
   OYosdwnKpkQASczqm/ApqBL8LeEYy42rkvEdJLTU0FVr9QkgB8saVZQvo
   a1aSJ/nV+y84cLyTJvJ1JBNKeTow9Hm0UcKOCRrA4vkYf4//e5Ihlx1Fz
   4tzctPErVkZaE6QjVo7FhddtIl9wP5NLOiMWcOcBB8l3WlS0Uo1zhxKFv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="476268919"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="476268919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="1094947442"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1094947442"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2023 10:04:23 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r19O9-00091x-2W;
	Thu, 09 Nov 2023 18:04:21 +0000
Date: Fri, 10 Nov 2023 02:03:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 3158/30000] security/security.c:324:5:
 sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be
 static?
Message-ID: <202311100126.MwJPpl0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 7cb75cc654c717697b9152cbce9ce5efbf4edab4 [3158/30000] LSM: Infrastructure management of the task security blob
config: x86_64-randconfig-122-20230910 (https://download.01.org/0day-ci/archive/20231110/202311100126.MwJPpl0H-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100126.MwJPpl0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100126.MwJPpl0H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   security/security.c:303:5: sparse: sparse: symbol 'lsm_file_alloc' was not declared. Should it be static?
>> security/security.c:324:5: sparse: sparse: symbol 'lsm_task_alloc' was not declared. Should it be static?
   security/security.c:303:5: warning: no previous prototype for 'lsm_file_alloc' [-Wmissing-prototypes]
     303 | int lsm_file_alloc(struct file *file)
         |     ^~~~~~~~~~~~~~
   security/security.c:324:5: warning: no previous prototype for 'lsm_task_alloc' [-Wmissing-prototypes]
     324 | int lsm_task_alloc(struct task_struct *task)
         |     ^~~~~~~~~~~~~~

vim +/lsm_task_alloc +324 security/security.c

   315	
   316	/**
   317	 * lsm_task_alloc - allocate a composite task blob
   318	 * @task: the task that needs a blob
   319	 *
   320	 * Allocate the task blob for all the modules
   321	 *
   322	 * Returns 0, or -ENOMEM if memory can't be allocated.
   323	 */
 > 324	int lsm_task_alloc(struct task_struct *task)
   325	{
   326		if (blob_sizes.lbs_task == 0) {
   327			task->security = NULL;
   328			return 0;
   329		}
   330	
   331		task->security = kzalloc(blob_sizes.lbs_task, GFP_KERNEL);
   332		if (task->security == NULL)
   333			return -ENOMEM;
   334		return 0;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
