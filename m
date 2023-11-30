Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738CF51F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFsp8Rqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316563; x=1732852563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FlQQXvhtqKR6h+8yDPyEXyPJbrApH81uyv8Gt8Zk1d4=;
  b=KFsp8RqoOQV5afrsjWpRABAb+9o812TEQuJPhkDmIubuLVPqU4DpV+2+
   oUG3ddz3PmT2lNa5Hioy4UoiAdH33EEJEgJtIhfRFTtRTPZoiDnbf9i6Y
   HBdf0NF/gZ7+V6Jnehwz7sOxlflMCysia3q7feQN1qj9LsIBdORwCyu0o
   +tgGIKum0usCN7r4Sbiq96iEIgPl9HvPyTqQJKoh4LvOJ62806Gr4YJZi
   a5wTQ56IaQEmbHm1IdIL4H5r8dGkQMVaqVzcurUvPyaIWVAyfQ4X/cWdQ
   nbKYqRPLC27jpz6PGrJibBFnrRHUloGhIGM3M8StFhOPAExofldRKIZdO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="163215"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="163215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 19:56:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892678700"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="892678700"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 19:56:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Y9e-0001JS-2E;
	Thu, 30 Nov 2023 03:55:58 +0000
Date: Thu, 30 Nov 2023 11:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-files-fixes 21/23] fs/file.c:817: warning:
 Excess function parameter 'files' description in 'file_close_fd'
Message-ID: <202311300937.RS3wXofz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-files-fixes
head:   4d65958ca3ca38c59eda57f6f37d49a9bc7500fe
commit: 42a009c9d56e156ffb8f93ff36d481cb6b3faf81 [21/23] file: s/close_fd_get_file()/file_close_fd()/g
config: x86_64-randconfig-161-20231130 (https://download.01.org/0day-ci/archive/20231130/202311300937.RS3wXofz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300937.RS3wXofz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300937.RS3wXofz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/file.c:817: warning: Excess function parameter 'files' description in 'file_close_fd'


vim +817 fs/file.c

80cd795630d652 Todd Kjos         2018-12-14  806  
42a009c9d56e15 Christian Brauner 2023-11-29  807  /**
42a009c9d56e15 Christian Brauner 2023-11-29  808   * file_close_fd - return file associated with fd
42a009c9d56e15 Christian Brauner 2023-11-29  809   * @files: file struct to retrieve file from
42a009c9d56e15 Christian Brauner 2023-11-29  810   * @fd: file descriptor to retrieve file for
42a009c9d56e15 Christian Brauner 2023-11-29  811   *
42a009c9d56e15 Christian Brauner 2023-11-29  812   * Doesn't take a separate reference count.
42a009c9d56e15 Christian Brauner 2023-11-29  813   *
42a009c9d56e15 Christian Brauner 2023-11-29  814   * Returns: The file associated with @fd (NULL if @fd is not open)
53dec2ea74f2ef Jens Axboe        2021-01-19  815   */
42a009c9d56e15 Christian Brauner 2023-11-29  816  struct file *file_close_fd(unsigned int fd)
53dec2ea74f2ef Jens Axboe        2021-01-19 @817  {
53dec2ea74f2ef Jens Axboe        2021-01-19  818  	struct files_struct *files = current->files;
6319194ec57b04 Al Viro           2022-05-12  819  	struct file *file;
53dec2ea74f2ef Jens Axboe        2021-01-19  820  
53dec2ea74f2ef Jens Axboe        2021-01-19  821  	spin_lock(&files->file_lock);
6319194ec57b04 Al Viro           2022-05-12  822  	file = pick_file(files, fd);
53dec2ea74f2ef Jens Axboe        2021-01-19  823  	spin_unlock(&files->file_lock);
53dec2ea74f2ef Jens Axboe        2021-01-19  824  
6319194ec57b04 Al Viro           2022-05-12  825  	return file;
53dec2ea74f2ef Jens Axboe        2021-01-19  826  }
53dec2ea74f2ef Jens Axboe        2021-01-19  827  

:::::: The code at line 817 was first introduced by commit
:::::: 53dec2ea74f2ef360e8455439be96a780baa6097 fs: provide locked helper variant of close_fd_get_file()

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
