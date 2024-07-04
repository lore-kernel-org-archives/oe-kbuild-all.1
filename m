Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123A1DFF8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720095790; cv=none; b=mXZIgWHg4WJ55jCgqEzCJran6/LS3ouuySZxA7qwcO4wxI0C8edc9PKBzndpR6bRX3WXXnx4ZgSTzipZtWOeg2pUmhz7vuhMa0/g9zZFems0QHw/ZnkUEYlbzAGp4FI9nElHutLou3xK1x3lwJ0c+voii9D/npxXHXjYn0j1tAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720095790; c=relaxed/simple;
	bh=9GUJpp14JZsOODLeofP84qo0qKtlloBUBha3BXJMVtU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+XtiGDlrxdTIoTUoiGZVVfraav9lthep6M2ELn/pojuiQr3wQACzHjNJCFB4HXgQSepZ6rfCUVJL9csptnO8X/UW4+KxpNFEbi1AuAyBSU32UcXjuYh95c/JXU7mde0kC8zhfhJNLrALnUbrnc58BiDLjQXt+CvnN0nuRI+kuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyYCm8Zs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyYCm8Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720095788; x=1751631788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9GUJpp14JZsOODLeofP84qo0qKtlloBUBha3BXJMVtU=;
  b=CyYCm8Zsj2kC25Mt3zGNtcatN+Om+b117RILm+Cw5rzoeMw4eomRQa18
   v/GCwMGlJjYhN1a+n9aeXyq1gw/J3VxHrTv1RlF9QCTTZ6roRNTsH7vjB
   VcxShKF1QwhEpV/HnlO+nB94XjDLudPbF6g1VvcYrOt5f+qYTQ/3ecbkw
   qZtwg5grq9g0uOQact4bsSJgcYVbgICInTuf0+ohkQ+uBD3XSdhLNN7D4
   FZF4X77T38znorrxc5gwBlQwJAwI5reau6yukbcoM3raOwD3bHOQgcS0+
   FgomePGY5feFvCdMCYsSc8LQtV15572dMw7ceXmGeuBQBi8ChnG3amnVs
   A==;
X-CSE-ConnectionGUID: JNhNTSOtTYOOJ0KeJRcYQw==
X-CSE-MsgGUID: s4zXIOAzRzuk7V9C6cMm3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17583042"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17583042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 05:23:07 -0700
X-CSE-ConnectionGUID: ZPw75TOjShiOI/jf5zdPQA==
X-CSE-MsgGUID: jnf+IEnQTFiWes7fDYq7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51169475"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2024 05:23:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPLUO-000QyM-2s;
	Thu, 04 Jul 2024 12:23:04 +0000
Date: Thu, 4 Jul 2024 20:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fsnotify_for_lkp 9/9] fs/notify/fsnotify.c:193:5: warning:
 no previous prototype for function 'fsnotify_path'
Message-ID: <202407042010.hggWFBMR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fsnotify_for_lkp
head:   388baed2ddef701fe2f07ea0360228c60532ed22
commit: 388baed2ddef701fe2f07ea0360228c60532ed22 [9/9] fsnotify: un-inline fsnotify helpers
config: x86_64-buildonly-randconfig-001-20240704 (https://download.01.org/0day-ci/archive/20240704/202407042010.hggWFBMR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042010.hggWFBMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042010.hggWFBMR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/notify/fsnotify.c:193:5: warning: no previous prototype for function 'fsnotify_path' [-Wmissing-prototypes]
     193 | int fsnotify_path(const struct path *path, __u32 mask)
         |     ^
   fs/notify/fsnotify.c:193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     193 | int fsnotify_path(const struct path *path, __u32 mask)
         | ^
         | static 
>> fs/notify/fsnotify.c:199:5: warning: no previous prototype for function 'fsnotify_file_range' [-Wmissing-prototypes]
     199 | int fsnotify_file_range(struct file *file, __u32 mask, const loff_t *ppos,
         |     ^
   fs/notify/fsnotify.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     199 | int fsnotify_file_range(struct file *file, __u32 mask, const loff_t *ppos,
         | ^
         | static 
   2 warnings generated.


vim +/fsnotify_path +193 fs/notify/fsnotify.c

   192	
 > 193	int fsnotify_path(const struct path *path, __u32 mask)
   194	{
   195		return fsnotify_parent(path->dentry, mask, path, FSNOTIFY_EVENT_PATH);
   196	}
   197	EXPORT_SYMBOL_GPL(fsnotify_path);
   198	
 > 199	int fsnotify_file_range(struct file *file, __u32 mask, const loff_t *ppos,
   200				size_t count)
   201	{
   202		struct file_range range;
   203	
   204		range.path = &file->f_path;
   205		range.ppos = ppos;
   206		range.count = count;
   207	
   208		return fsnotify_parent(range.path->dentry, mask, &range,
   209				       FSNOTIFY_EVENT_FILE_RANGE);
   210	}
   211	EXPORT_SYMBOL_GPL(fsnotify_file_range);
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
