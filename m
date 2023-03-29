Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A71102
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680073541; x=1711609541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tE6c5Pm/viNR3yVp5iUk6UwSEKL4/YfApYgOPmHPtn4=;
  b=TkMuItfhOzP2MGEjvyi874LDvjprCeWopk2QEatFvKN3xuSaoUv/mOX+
   OlQPyRor+fiM0ALkmtr7p+Hk3yus/OviWYWtAZyD0nWZC35T/+lOCWx0l
   VNiZp3I/jLBxuaLWrytPbN+dR1HvVukpX0rQSzp8zsd2Uay+CqUXUvQy+
   BTYvxT44/nL7Y2/TgOvBJ4q0Ww9ilVeim8V80zWcSg4kRrFqTu9eRHf6M
   jBqLFsY/TxDl1URv7hq6adw8v5otDFAb7RlZ0iAHhJymWVv+bPYfcnb0O
   w9d8JGeBUl7A05MuB0Meq+NixtML+Eq45Qis+B4MXeLqJulZTyXnL8dE1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="320450621"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="320450621"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 00:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="795111016"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="795111016"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2023 00:05:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phPsJ-000JIE-1W;
	Wed, 29 Mar 2023 07:05:39 +0000
Date: Wed, 29 Mar 2023 15:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v3 3/3] file, epoll: Implement do_replace() and
 eventpoll_replace()
Message-ID: <202303291455.2Aemmr0V-lkp@intel.com>
References: <20230324051526.963702-3-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324051526.963702-3-aloktiagi@gmail.com>

Hi aloktiagi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on vfs-idmapping/for-next kees/for-next/pstore kees/for-next/kspp linus/master v6.3-rc4 next-20230329]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230324-131704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20230324051526.963702-3-aloktiagi%40gmail.com
patch subject: [RFC v3 3/3] file, epoll: Implement do_replace() and eventpoll_replace()
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20230329/202303291455.2Aemmr0V-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/42c4f34040dfc73e03bb3649290748120de7db60
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230324-131704
        git checkout 42c4f34040dfc73e03bb3649290748120de7db60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291455.2Aemmr0V-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/file.c: In function 'do_replace':
>> fs/file.c:1178:31: error: 'struct file' has no member named 'f_ep'; did you mean 'f_op'?
    1178 |         if (fdfile && fdfile->f_ep) {
         |                               ^~~~
         |                               f_op
>> fs/file.c:1179:17: error: implicit declaration of function 'eventpoll_replace'; did you mean 'eventpoll_release'? [-Werror=implicit-function-declaration]
    1179 |                 eventpoll_replace(fdfile, file);
         |                 ^~~~~~~~~~~~~~~~~
         |                 eventpoll_release
   cc1: some warnings being treated as errors


vim +1178 fs/file.c

  1161	
  1162	static void do_replace(struct files_struct *files,
  1163	        struct file *file, unsigned fd, struct file *fdfile)
  1164	{
  1165		unsigned n = 0;
  1166		struct replace_filefd ffd = {
  1167			.files = files,
  1168			.fd = fd,
  1169			.fdfile = fdfile,
  1170			.file = file
  1171		};
  1172	
  1173		/*
  1174		 * Check if the file referenced by the fd number is linked to the epoll
  1175		 * interface. If yes, replace the reference with the received file in
  1176		 * the epoll interface.
  1177		 */
> 1178		if (fdfile && fdfile->f_ep) {
> 1179			eventpoll_replace(fdfile, file);
  1180		}
  1181		/*
  1182		 * Install the received file in the file descriptor table for all fd
  1183		 * numbers referencing the same file as the one we are trying to
  1184		 * replace. Do not install it for the fd number received since that is
  1185		 * handled in do_dup2()
  1186		 */
  1187		iterate_fd(files, n, do_replace_fd_array, &ffd);
  1188	}
  1189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
