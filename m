Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7EE7F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679127100; x=1710663100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuQGJQrjhFerOH8f7NAO5YQi1NOmNIpgJJEE8BlISiU=;
  b=ckT5VuQkDYz7JwInpOJKWbZ7p15hMSuTwHsNZchdEZCS0lFk2TuDxLUE
   ddBPm78i3t6P9BPl6lpCkciKqvFWoxu2j6niLwPUphpgdlbBaZOivOo4U
   b+H6o6jmF6RwyzIwMA/cetstg4Okx1PxJIn4ugEN8NUnlgG9tdb5Xm5S7
   OhjwFhZ6xXd4Nj5E48WoIaxETf6Q2vGejNhywd3/KeYzE6f5wyt0NhkGh
   tClYeS9AWfw2/t1X3aZ9Ng6Q7XnU+aKbvlFw7rd6IAkVAAUfBI93LuFyD
   zHN9M3fhtaZZOqrnkzdlOEJUbJXMpR1429fT5J9TfknG/5rPOo2U7h103
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318071586"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318071586"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 01:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657822912"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="657822912"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 01:11:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdRf7-0009v4-2Z;
	Sat, 18 Mar 2023 08:11:37 +0000
Date: Sat, 18 Mar 2023 16:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 3/3] file, epoll: Implement do_replace() and
 eventpoll_replace()
Message-ID: <202303181529.ck2N6fZd-lkp@intel.com>
References: <20230318060248.848099-3-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230318060248.848099-3-aloktiagi@gmail.com>

Hi aloktiagi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on kees/for-next/pstore kees/for-next/kspp linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230318-140457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20230318060248.848099-3-aloktiagi%40gmail.com
patch subject: [RFC v2 3/3] file, epoll: Implement do_replace() and eventpoll_replace()
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230318/202303181529.ck2N6fZd-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1d2d8d35be8559070716cd4dcb1e6c5da2c67cfd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230318-140457
        git checkout 1d2d8d35be8559070716cd4dcb1e6c5da2c67cfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181529.ck2N6fZd-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/file.c: In function 'do_replace':
>> fs/file.c:1176:31: error: 'struct file' has no member named 'f_ep'; did you mean 'f_op'?
    1176 |         if (fdfile && fdfile->f_ep) {
         |                               ^~~~
         |                               f_op
>> fs/file.c:1177:17: error: implicit declaration of function 'eventpoll_replace'; did you mean 'eventpoll_release'? [-Werror=implicit-function-declaration]
    1177 |                 eventpoll_replace(fdfile, file);
         |                 ^~~~~~~~~~~~~~~~~
         |                 eventpoll_release
   cc1: some warnings being treated as errors


vim +1176 fs/file.c

  1159	
  1160	static void do_replace(struct files_struct *files,
  1161	        struct file *file, unsigned fd, struct file *fdfile)
  1162	{
  1163		unsigned n = 0;
  1164		struct replace_filefd ffd = {
  1165			.files = files,
  1166			.fd = fd,
  1167			.fdfile = fdfile,
  1168			.file = file
  1169		};
  1170	
  1171		/*
  1172		 * Check if the file referenced by the fd number is linked to the epoll
  1173		 * interface. If yes, replace the reference with the received file in
  1174		 * the epoll interface.
  1175		 */
> 1176		if (fdfile && fdfile->f_ep) {
> 1177			eventpoll_replace(fdfile, file);
  1178		}
  1179		/*
  1180		 * Install the received file in the file descriptor table for all fd
  1181		 * numbers referencing the same file as the one we are trying to
  1182		 * replace. Do not install it for the fd number received since that is
  1183		 * handled in do_dup2()
  1184		 */
  1185		iterate_fd_locked(files, n, do_replace_fd_array, &ffd);
  1186	}
  1187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
