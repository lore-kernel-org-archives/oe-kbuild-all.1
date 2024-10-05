Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E51F9FE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728125589; cv=none; b=Fmj+d+JgQu9ZdnIcGB9w+yv4RsCMTXdKZE6Us2A/CROR76oRoRpxHNt4dX5S1cCZM9SjKGjodOm15xfLi1bW8ycGox8cnHANUNLygzxoXULBrVxs3OTcbbhIIAoOKTdY1f0H+S4vn92TIyGdOJeBzsYCjQLqzDg58b6qzch1NY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728125589; c=relaxed/simple;
	bh=22FmkcpO6Mfaz6Zzm38JRninpbSfZz/Xz/ZCEklOSjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/P0ry0MPdbe3kt6kMN9ooUsJGt+yv/FGcgPVROXrLCtUX2xkZWNN4+VpxzirbEnWbFLJYMwtg+IvFgY7WGxcl6esmI+6XcTXBT0O39HO8ag9ByC5u39B23WAJF3FVf1sDIB7g+8Z3DoajyIsYsdvIBV2Y9HDtVIJiO+vwQ0wXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWeHzs3B; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWeHzs3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728125588; x=1759661588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22FmkcpO6Mfaz6Zzm38JRninpbSfZz/Xz/ZCEklOSjk=;
  b=GWeHzs3B/Bdp+xJz5ZbxP3xLxrSrOuwluQ6Of2Ldd7H4hKLLH8xH8QIt
   VEvDskwhNnTMh7XpN8/GnYNRJ0D9HwntOolp5k27m+qUN0uDlIrVvmogA
   w1YERx6nv2ghqSBjTZ9HjKx0mA6v3xuDun64+TnI0axJlteQu8yhbRBTF
   vAP7ZS40fLertVtEi86QCrkTU7J3Kxi65h2EorWFjXOvcGtY+SrGhcud9
   yUYMk31zPrCeIrjQ6jgpJPdTsxuyuJRUpma2ze9qXw/nEFxTOxrrM0Uqc
   1Qo3J8G+Pmr+P176AjRRXoUtlSThcQU78nDcJoRbOWEH9Fk3xglHjduIG
   A==;
X-CSE-ConnectionGUID: mZqzp3UjS76TtNSWeInewA==
X-CSE-MsgGUID: rszaZR2lSGmijo5JK/Xd/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38702619"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="38702619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 03:53:08 -0700
X-CSE-ConnectionGUID: ENi+A/R0TJ66NVxErMOzYA==
X-CSE-MsgGUID: jR7jBbRSRO+SBdS18XcD4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="79728707"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Oct 2024 03:53:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx2PI-0002s2-0J;
	Sat, 05 Oct 2024 10:53:04 +0000
Date: Sat, 5 Oct 2024 18:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_real_file 4/4] fs/overlayfs/file.c:599:6: warning:
 variable 'err' is used uninitialized whenever 'if' condition is false
Message-ID: <202410051806.8yiMTqnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_real_file
head:   2e6c8d603136baf0de510ba069ad78a449012807
commit: 2e6c8d603136baf0de510ba069ad78a449012807 [4/4] ovl: convert ovl_real_fdget() callers to ovl_real_file()
config: x86_64-buildonly-randconfig-001-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051806.8yiMTqnM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051806.8yiMTqnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051806.8yiMTqnM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/file.c:599:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     599 |         if (realfile->f_op->flush) {
         |             ^~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/file.c:605:9: note: uninitialized use occurs here
     605 |         return err;
         |                ^~~
   fs/overlayfs/file.c:599:2: note: remove the 'if' if its condition is always true
     599 |         if (realfile->f_op->flush) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/file.c:593:9: note: initialize the variable 'err' to silence this warning
     593 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +599 fs/overlayfs/file.c

   588	
   589	static int ovl_flush(struct file *file, fl_owner_t id)
   590	{
   591		struct file *realfile;
   592		const struct cred *old_cred;
   593		int err;
   594	
   595		realfile = ovl_real_file(file);
   596		if (IS_ERR(realfile))
   597			return PTR_ERR(realfile);
   598	
 > 599		if (realfile->f_op->flush) {
   600			old_cred = ovl_override_creds(file_inode(file)->i_sb);
   601			err = realfile->f_op->flush(realfile, id);
   602			revert_creds(old_cred);
   603		}
   604	
   605		return err;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
