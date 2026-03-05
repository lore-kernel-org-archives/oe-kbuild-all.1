Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989A27A916
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 17:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772733459; cv=none; b=u5VciV4hykdbj4x/RStgIGxLVTRX/aMmHzDSyFlxfRpdSQ432E2flOXp6Q0W4rC+AExpqQItdtNOHuxq0AbIEzQgCgN0HBLONxYhvUZb5cxBA3n+ygjyT51h81VyyjKIBGtJUhGuXkLKI/x75OellMwHXKoQuH9vvDErPR4nW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772733459; c=relaxed/simple;
	bh=VwEPsbr0wj3PG5nzEvZBxpNDkABEHSaktwP+5HpA2zU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pnaikLmPKHAmNM4/lAwSwA/6Z/I3X/n/8p9lIN1DpdJfXN8+ChiscuQpTvYXHeTVSjLT0y2MZslHSl4hYBltfgHkN79IVl7KtnyrIqY1YUG0vfSR1rQxLp0teI5Gi/Fp1qCV1uIfJ8/qfT6GSe8WoNSzJWXroRXKSnZOjeqkcGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e30IjNBe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e30IjNBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772733458; x=1804269458;
  h=date:from:to:cc:subject:message-id;
  bh=VwEPsbr0wj3PG5nzEvZBxpNDkABEHSaktwP+5HpA2zU=;
  b=e30IjNBeR4V5p1P2GCLuN6x5okhJYSUfaZbhx8EnPQ99xowM406z8NNY
   IxYGHUsOQXqfpznPI1kFeLK0XO0MQAIpoo0hSU3v712x4ZUb88p0f0vO8
   2mlZ76JIOq1yJ8RvbyNf5B0C4I68IwOYAy+eh6gRaIA6Gv0i3hf3LtvgF
   exLhZ7gav0L0K3LM5laKAsRMnHFsZP6eUuotE5kwBmFcNA0kdT4toQT2C
   j4a3mXB4lEShznoDty8j2whmg1SI9o9vwhh8SIVwLcJsUeej00aRxSvM7
   kaGOviXZDwXlqEMLnqIvmOmmixtsXbMLwrtM9lilEV4UitPlTMw/FAkpV
   A==;
X-CSE-ConnectionGUID: HvrPLu21QaKxlqVE2bQcLA==
X-CSE-MsgGUID: D5XcGRSWQNeU9u8HUykZ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="77433046"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="77433046"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:57:37 -0800
X-CSE-ConnectionGUID: sz/rzspdRwmpgTizR98xRw==
X-CSE-MsgGUID: wI798/rETRKORqrHJ6WWOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223451981"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Mar 2026 09:57:35 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCx3-0000000012u-0VzA;
	Thu, 05 Mar 2026 17:57:33 +0000
Date: Fri, 06 Mar 2026 01:57:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 429/467]
 drivers/gpu/drm/xe/xe_eu_stall.c:597:49: error: 'file' undeclared
Message-ID: <202603060127.lK7z0zrR-lkp@intel.com>
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
commit: f2be1c24253b3040ac7bf2310cd195bb10af6c99 [429/467] drm: convert remaining fops to read/write iterators
config: arc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060127.lK7z0zrR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060127.lK7z0zrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060127.lK7z0zrR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_eu_stall.c: In function 'xe_eu_stall_stream_read':
>> drivers/gpu/drm/xe/xe_eu_stall.c:597:49: error: 'file' undeclared (first use in this function)
       ret = xe_eu_stall_stream_read_locked(stream, file, buf, aligned_count);
                                                    ^~~~
   drivers/gpu/drm/xe/xe_eu_stall.c:597:49: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/xe/xe_eu_stall.c:597:55: error: 'buf' undeclared (first use in this function); did you mean 'btf'?
       ret = xe_eu_stall_stream_read_locked(stream, file, buf, aligned_count);
                                                          ^~~
                                                          btf
--
   In file included from include/linux/debugfs.h:16,
                    from drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:6:
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:98:24: error: 'restore_auto_provisioning_write_iter' undeclared here (not in a function); did you mean 'restore_auto_provisioning_write'?
    DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:98:1: note: in expansion of macro 'DEFINE_SRIOV_ATTRIBUTE'
    DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:245:29: error: 'pause_vf_write_iter' undeclared here (not in a function); did you mean 'pause_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
                                ^~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:245:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:246:29: error: 'resume_vf_write_iter' undeclared here (not in a function); did you mean 'resume_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
                                ^~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:246:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:247:29: error: 'stop_vf_write_iter' undeclared here (not in a function); did you mean 'stop_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
                                ^~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:247:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:248:29: error: 'reset_vf_write_iter' undeclared here (not in a function); did you mean 'reset_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
                                ^~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:248:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:249:32: error: 'save_vf_write_iter' undeclared here (not in a function); did you mean 'save_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
                                   ^~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:249:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:250:32: error: 'restore_vf_write_iter' undeclared here (not in a function); did you mean 'restore_vf_write'?
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
                                   ^~~~~~~~~~
   include/linux/seq_file.h:230:16: note: in definition of macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     .write_iter = __name ## _write_iter,   \
                   ^~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:250:1: note: in expansion of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c: In function 'data_write':
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:254:36: error: 'file' undeclared (first use in this function)
     struct dentry *dent = file_dentry(file)->d_parent;
                                       ^~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:254:36: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:261:47: error: 'buf' undeclared (first use in this function); did you mean 'btf'?
     return xe_sriov_pf_migration_write(xe, vfid, buf, count);
                                                  ^~~
                                                  btf
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c: In function 'data_read':
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:266:36: error: 'file' undeclared (first use in this function)
     struct dentry *dent = file_dentry(file)->d_parent;
                                       ^~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:273:46: error: 'buf' undeclared (first use in this function); did you mean 'btf'?
     return xe_sriov_pf_migration_read(xe, vfid, buf, count);
                                                 ^~~
                                                 btf
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c: In function 'size_read':
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:285:36: error: 'file' undeclared (first use in this function)
     struct dentry *dent = file_dentry(file)->d_parent;
                                       ^~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c: In function 'data_write':
>> drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:262:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c: In function 'data_read':
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:274:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   At top level:
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:250:32: warning: 'restore_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(restore_vf);
                                   ^~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:237:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:249:32: warning: 'save_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE_RW(save_vf);
                                   ^~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:237:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE_RW'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:248:29: warning: 'reset_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
                                ^~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:247:29: warning: 'stop_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
                                ^~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:246:29: warning: 'resume_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
                                ^~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:245:29: warning: 'pause_vf_write' defined but not used [-Wunused-function]
    DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
                                ^~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:223:16: note: in definition of macro 'DEFINE_VF_CONTROL_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:98:24: warning: 'restore_auto_provisioning_write' defined but not used [-Wunused-function]
    DEFINE_SRIOV_ATTRIBUTE(restore_auto_provisioning);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c:85:16: note: in definition of macro 'DEFINE_SRIOV_ATTRIBUTE'
    static ssize_t OP##_write(struct file *file, const char __user *userbuf, \
                   ^~


vim +/file +597 drivers/gpu/drm/xe/xe_eu_stall.c

760edec9396851 Harish Chegondi 2025-02-25  567  
1537ec85ebd7d7 Harish Chegondi 2025-02-25  568  /*
1537ec85ebd7d7 Harish Chegondi 2025-02-25  569   * Userspace must enable the EU stall stream with DRM_XE_OBSERVATION_IOCTL_ENABLE
1537ec85ebd7d7 Harish Chegondi 2025-02-25  570   * before calling read().
9e0590eedede7b Harish Chegondi 2025-02-25  571   *
9e0590eedede7b Harish Chegondi 2025-02-25  572   * Returns: The number of bytes copied or a negative error code on failure.
9e0590eedede7b Harish Chegondi 2025-02-25  573   *	    -EIO if HW drops any EU stall data when the buffer is full.
1537ec85ebd7d7 Harish Chegondi 2025-02-25  574   */
f2be1c24253b30 Jens Axboe      2026-03-04  575  static ssize_t xe_eu_stall_stream_read(struct kiocb *iocb, struct iov_iter *to){
f2be1c24253b30 Jens Axboe      2026-03-04  576  	size_t count = iov_iter_count(to);
f2be1c24253b30 Jens Axboe      2026-03-04  577  	struct xe_eu_stall_data_stream *stream = iocb->ki_filp->private_data;
760edec9396851 Harish Chegondi 2025-02-25  578  	struct xe_gt *gt = stream->gt;
760edec9396851 Harish Chegondi 2025-02-25  579  	ssize_t ret, aligned_count;
760edec9396851 Harish Chegondi 2025-02-25  580  
760edec9396851 Harish Chegondi 2025-02-25  581  	aligned_count = ALIGN_DOWN(count, stream->data_record_size);
760edec9396851 Harish Chegondi 2025-02-25  582  	if (aligned_count == 0)
760edec9396851 Harish Chegondi 2025-02-25  583  		return -EINVAL;
760edec9396851 Harish Chegondi 2025-02-25  584  
760edec9396851 Harish Chegondi 2025-02-25  585  	if (!stream->enabled) {
760edec9396851 Harish Chegondi 2025-02-25  586  		xe_gt_dbg(gt, "EU stall data stream not enabled to read\n");
760edec9396851 Harish Chegondi 2025-02-25  587  		return -EINVAL;
760edec9396851 Harish Chegondi 2025-02-25  588  	}
760edec9396851 Harish Chegondi 2025-02-25  589  
f2be1c24253b30 Jens Axboe      2026-03-04  590  	if (!(iocb->ki_filp->f_flags & O_NONBLOCK)) {
760edec9396851 Harish Chegondi 2025-02-25  591  		do {
760edec9396851 Harish Chegondi 2025-02-25  592  			ret = wait_event_interruptible(stream->poll_wq, stream->pollin);
760edec9396851 Harish Chegondi 2025-02-25  593  			if (ret)
760edec9396851 Harish Chegondi 2025-02-25  594  				return -EINTR;
760edec9396851 Harish Chegondi 2025-02-25  595  
760edec9396851 Harish Chegondi 2025-02-25  596  			mutex_lock(&gt->eu_stall->stream_lock);
760edec9396851 Harish Chegondi 2025-02-25 @597  			ret = xe_eu_stall_stream_read_locked(stream, file, buf, aligned_count);
760edec9396851 Harish Chegondi 2025-02-25  598  			mutex_unlock(&gt->eu_stall->stream_lock);
760edec9396851 Harish Chegondi 2025-02-25  599  		} while (ret == -EAGAIN);
760edec9396851 Harish Chegondi 2025-02-25  600  	} else {
760edec9396851 Harish Chegondi 2025-02-25  601  		mutex_lock(&gt->eu_stall->stream_lock);
760edec9396851 Harish Chegondi 2025-02-25  602  		ret = xe_eu_stall_stream_read_locked(stream, file, buf, aligned_count);
760edec9396851 Harish Chegondi 2025-02-25  603  		mutex_unlock(&gt->eu_stall->stream_lock);
760edec9396851 Harish Chegondi 2025-02-25  604  	}
760edec9396851 Harish Chegondi 2025-02-25  605  
760edec9396851 Harish Chegondi 2025-02-25  606  	/*
760edec9396851 Harish Chegondi 2025-02-25  607  	 * This may not work correctly if the user buffer is very small.
760edec9396851 Harish Chegondi 2025-02-25  608  	 * We don't want to block the next read() when there is data in the buffer
760edec9396851 Harish Chegondi 2025-02-25  609  	 * now, but couldn't be accommodated in the small user buffer.
760edec9396851 Harish Chegondi 2025-02-25  610  	 */
760edec9396851 Harish Chegondi 2025-02-25  611  	stream->pollin = false;
1537ec85ebd7d7 Harish Chegondi 2025-02-25  612  
1537ec85ebd7d7 Harish Chegondi 2025-02-25  613  	return ret;
1537ec85ebd7d7 Harish Chegondi 2025-02-25  614  }
1537ec85ebd7d7 Harish Chegondi 2025-02-25  615  

:::::: The code at line 597 was first introduced by commit
:::::: 760edec9396851935c20914f5ffdff94dd9d8f8c drm/xe/eustall: Add support to read() and poll() EU stall data

:::::: TO: Harish Chegondi <harish.chegondi@intel.com>
:::::: CC: Ashutosh Dixit <ashutosh.dixit@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
