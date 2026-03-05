Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7332246BCD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720411; cv=none; b=qSwxQhW2y2zFyj05Rm5yzUBsGUiTDgGwTjSucu/MbZ69/AYUxx7NnGCXLV8X9jr8/HsQCsYnFPlgVxcodU+aCyqvREwCW99ZTX3xTRVemZh+XNl63yZpfNmVxu0dYejxHBDbGzvUboOZl7+NJ6y7Op9wgG+6pegLXij17iSBfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720411; c=relaxed/simple;
	bh=W2h6K1uFQ5HX/0+WnJ/AyzHLKdTuDdWlm1UhzsD+gwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hnnZcEBZhHGz8FPMTiv2YDFWEgBs4dSL9Twf54OiDRM/mF/iJcqcNKPyELZ4GlwV/WUWpPKMzR5iGVrhEsCRy7k7H6WOOA46D/RsSdOeWH4AB42KpyWSNL+sn4Y6esBxK6kSHRobZ8tic+c0KptvR7zirE8RyyMjEBl3+lD9Sd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsiYl1kQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsiYl1kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772720410; x=1804256410;
  h=date:from:to:cc:subject:message-id;
  bh=W2h6K1uFQ5HX/0+WnJ/AyzHLKdTuDdWlm1UhzsD+gwE=;
  b=IsiYl1kQqeNZaIXcOQ2+2cBWxC1VzUp5LzH3NouetwlpCMsfSDNZpiQD
   Z/tCrMiELyVNvDImsrCnkR48KPNzJyxPsY3Q40jz3ol0YoLf6pk/YDemG
   Z2wenG20zK+nIqBtmTUWCZogWhrlN5pmR/k9TdBEh+NDl8aSlSrVmzCss
   7wwfkp4IjYQTjeXQ+SQHzS6NVmuYxhrQgDrPLRY6Brf+icgHvLdlLXa68
   JquEoDk6xdK8oTCMHmMF9fgEu0hjZxFOj33+9CTUUTYZf9FfsmH7SGsGu
   EzmZ0jsJGuxcquISvoNzZrffYQZUJWzIFDyBtY1cGm5yZImFZy+0A2Yr+
   Q==;
X-CSE-ConnectionGUID: ynXgM4TxTsKN1WP7AK9lFg==
X-CSE-MsgGUID: yd/4RkvwSt+RRz37huBciw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73007268"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73007268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 06:20:07 -0800
X-CSE-ConnectionGUID: mN3L3t1CQwCHNFLxUNmaiQ==
X-CSE-MsgGUID: RjkNUcUKROC6bhlF+7HFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="245154778"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2026 06:20:06 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy9YZ-000000000j6-2qNi;
	Thu, 05 Mar 2026 14:20:03 +0000
Date: Thu, 05 Mar 2026 22:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 11/467]
 drivers/gpu/drm/xe/xe_gt_debugfs.c:255:29: error: 'stats_write_iter'
 undeclared here (not in a function); did you mean 'vfs_write_iter'?
Message-ID: <202603052250.xq60VPem-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: e4ffbdddffd78b187be43ed9102c311e8b0a6dc2 [11/467] seq_file: switch to using ->read_iter()
config: arc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260305/202603052250.xq60VPem-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603052250.xq60VPem-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603052250.xq60VPem-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/debugfs.h:16,
                    from drivers/gpu/drm/xe/xe_gt_debugfs.c:8:
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:255:29: error: 'stats_write_iter' undeclared here (not in a function); did you mean 'vfs_write_iter'?
    DEFINE_SHOW_STORE_ATTRIBUTE(stats);
                                ^~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:282:29: error: 'force_reset_write_iter' undeclared here (not in a function); did you mean 'force_reset_write'?
    DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
                                ^~~~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:309:29: error: 'force_reset_sync_write_iter' undeclared here (not in a function); did you mean 'force_reset_sync_write'?
    DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
                                ^~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:292:16: warning: 'force_reset_sync_write' defined but not used [-Wunused-function]
    static ssize_t force_reset_sync_write(struct file *file,
                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:265:16: warning: 'force_reset_write' defined but not used [-Wunused-function]
    static ssize_t force_reset_write(struct file *file,
                   ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_gt_debugfs.c:239:16: warning: 'stats_write' defined but not used [-Wunused-function]
    static ssize_t stats_write(struct file *file, const char __user *userbuf,
                   ^~~~~~~~~~~
--
   In file included from include/linux/debugfs.h:16,
                    from drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:6:
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:98:24: error: 'restore_auto_provisioning_write_iter' undeclared here (not in a function); did you mean 'restore_auto_provisioning_write'?
    DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:98:1: note: in expansion of macro 'DEFINE_SRIOV_ATTRIBUTE'
    DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
    ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:245:29: error: 'pause_vf_write_iter' undeclared here (not in a function); did you mean 'pause_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
                                ^~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:245:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:246:29: error: 'resume_vf_write_iter' undeclared here (not in a function); did you mean 'resume_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
                                ^~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:246:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:247:29: error: 'stop_vf_write_iter' undeclared here (not in a function); did you mean 'stop_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
                                ^~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:247:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:248:29: error: 'reset_vf_write_iter' undeclared here (not in a function); did you mean 'reset_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
                                ^~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:248:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:249:32: error: 'save_vf_write_iter' undeclared here (not in a function); did you mean 'save_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
                                   ^~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:249:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:250:32: error: 'restore_vf_write_iter' undeclared here (not in a function); did you mean 'restore_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
                                   ^~~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:250:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:250:32: warning: 'restore_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
                                   ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:237:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:249:32: warning: 'save_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
                                   ^~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:237:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:248:29: warning: 'reset_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
                                ^~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:247:29: warning: 'stop_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
                                ^~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:246:29: warning: 'resume_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
                                ^~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:245:29: warning: 'pause_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
                                ^~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:98:24: warning: 'restore_auto_provisioning_write' defined but not used [-Wunused-function]
    DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:85:16: note: in definition of macro 'DEFINE_SRIOV_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~


vim +255 drivers/gpu/drm/xe/xe_gt_debugfs.c

2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  238  
56e6d568854519 Matthew Brost    2025-08-29 @239  static ssize_t stats_write(struct file *file, const char __user *userbuf,
56e6d568854519 Matthew Brost    2025-08-29  240  			   size_t count, loff_t *ppos)
56e6d568854519 Matthew Brost    2025-08-29  241  {
56e6d568854519 Matthew Brost    2025-08-29  242  	struct seq_file *s = file->private_data;
56e6d568854519 Matthew Brost    2025-08-29  243  	struct xe_gt *gt = s->private;
56e6d568854519 Matthew Brost    2025-08-29  244  
56e6d568854519 Matthew Brost    2025-08-29  245  	return write_to_gt_call(userbuf, count, ppos, xe_gt_stats_clear, gt);
56e6d568854519 Matthew Brost    2025-08-29  246  }
56e6d568854519 Matthew Brost    2025-08-29  247  
56e6d568854519 Matthew Brost    2025-08-29  248  static int stats_show(struct seq_file *s, void *unused)
56e6d568854519 Matthew Brost    2025-08-29  249  {
56e6d568854519 Matthew Brost    2025-08-29  250  	struct drm_printer p = drm_seq_file_printer(s);
56e6d568854519 Matthew Brost    2025-08-29  251  	struct xe_gt *gt = s->private;
56e6d568854519 Matthew Brost    2025-08-29  252  
56e6d568854519 Matthew Brost    2025-08-29  253  	return xe_gt_stats_print_info(gt, &p);
56e6d568854519 Matthew Brost    2025-08-29  254  }
56e6d568854519 Matthew Brost    2025-08-29 @255  DEFINE_SHOW_STORE_ATTRIBUTE(stats);
56e6d568854519 Matthew Brost    2025-08-29  256  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  257  static void force_reset(struct xe_gt *gt)
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  258  {
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  259  	struct xe_device *xe = gt_to_xe(gt);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  260  
bedad003e8e76e Matt Roper       2025-11-18  261  	guard(xe_pm_runtime)(xe);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  262  	xe_gt_reset_async(gt);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  263  }
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  264  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19 @265  static ssize_t force_reset_write(struct file *file,
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  266  				 const char __user *userbuf,
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  267  				 size_t count, loff_t *ppos)
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  268  {
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  269  	struct seq_file *s = file->private_data;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  270  	struct xe_gt *gt = s->private;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  271  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  272  	return write_to_gt_call(userbuf, count, ppos, force_reset, gt);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  273  }
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  274  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  275  static int force_reset_show(struct seq_file *s, void *unused)
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  276  {
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  277  	struct xe_gt *gt = s->private;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  278  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  279  	force_reset(gt); /* to be deprecated! */
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  280  	return 0;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  281  }
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19 @282  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  283  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  284  static void force_reset_sync(struct xe_gt *gt)
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  285  {
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  286  	struct xe_device *xe = gt_to_xe(gt);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  287  
bedad003e8e76e Matt Roper       2025-11-18  288  	guard(xe_pm_runtime)(xe);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  289  	xe_gt_reset(gt);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  290  }
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  291  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19 @292  static ssize_t force_reset_sync_write(struct file *file,
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  293  				      const char __user *userbuf,
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  294  				      size_t count, loff_t *ppos)
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  295  {
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  296  	struct seq_file *s = file->private_data;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  297  	struct xe_gt *gt = s->private;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  298  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  299  	return write_to_gt_call(userbuf, count, ppos, force_reset_sync, gt);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  300  }
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  301  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  302  static int force_reset_sync_show(struct seq_file *s, void *unused)
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  303  {
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  304  	struct xe_gt *gt = s->private;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  305  
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  306  	force_reset_sync(gt); /* to be deprecated! */
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  307  	return 0;
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  308  }
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19 @309  DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
2cb38bb0add9b8 Michal Wajdeczko 2025-05-19  310  

:::::: The code at line 255 was first introduced by commit
:::::: 56e6d568854519ed8e3f57444b8073a32d963fe6 drm/xe: Add clearing stats to GT debugfs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
