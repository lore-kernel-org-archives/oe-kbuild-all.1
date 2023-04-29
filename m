Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDEE17CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682764861; x=1714300861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+q9FZXJ7gPCVQw+YgrKg/IsmBO+eUlZ4kOimpA5IC6M=;
  b=lG4Xaz47iBjZwhfloJ2PsjjxJO8qOEhD0aP5mkH1az4EUcnQ9wHUpm3U
   Cxr8DgA/RwIbnXaFWwBYZgXqFtezQhLH6t8g+lIfTCc5f3hOihlltv5n3
   uMHjfRPah+my4gSEKFlVlwQnjbgPOUlEVX+hAYhUYPH/wQqD+NHoLw4c8
   0n9MbPV4Kt61/yJEa7cfYlbS4Ze6KL1IoXtc7BsaZgFY4Gt5Z38/qKb2r
   IWZ6zVh1ZyWWQahb+3WFIvVEF+YlhxxVbpuSoJU9+lcmuXLOF/ltS0w5D
   ksDr1thSVm++ASVZuOF1Ks58vhiNe6cPwJuhV8TSt8FRTJ/SaIewn2f2+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="434223007"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="434223007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 03:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="727889432"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="727889432"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Apr 2023 03:41:00 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psi0h-00014E-1i;
	Sat, 29 Apr 2023 10:40:59 +0000
Date: Sat, 29 Apr 2023 18:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v5 2/2] seccomp: replace existing file in the epoll
 interface by a new file injected by the syscall supervisor.
Message-ID: <202304291853.pjDgClcJ-lkp@intel.com>
References: <20230429054955.1957024-2-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429054955.1957024-2-aloktiagi@gmail.com>

Hi aloktiagi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on v6.3 next-20230428]
[cannot apply to linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/seccomp-replace-existing-file-in-the-epoll-interface-by-a-new-file-injected-by-the-syscall-supervisor/20230429-135145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20230429054955.1957024-2-aloktiagi%40gmail.com
patch subject: [RFC v5 2/2] seccomp: replace existing file in the epoll interface by a new file injected by the syscall supervisor.
config: loongarch-randconfig-r034-20230428 (https://download.01.org/0day-ci/archive/20230429/202304291853.pjDgClcJ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d24cecb8cc9ebb6aa145e17f070abe3a2dab364d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/seccomp-replace-existing-file-in-the-epoll-interface-by-a-new-file-injected-by-the-syscall-supervisor/20230429-135145
        git checkout d24cecb8cc9ebb6aa145e17f070abe3a2dab364d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291853.pjDgClcJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/seccomp.c: In function 'seccomp_handle_addfd':
>> kernel/seccomp.c:1077:31: error: implicit declaration of function 'eventpoll_replace_file'; did you mean 'eventpoll_release'? [-Werror=implicit-function-declaration]
    1077 |                         ret = eventpoll_replace_file(old_file, addfd->file, addfd->fd);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
         |                               eventpoll_release
   cc1: some warnings being treated as errors


vim +1077 kernel/seccomp.c

  1056	
  1057	static void seccomp_handle_addfd(struct seccomp_kaddfd *addfd, struct seccomp_knotif *n)
  1058	{
  1059		int fd;
  1060		struct file *old_file = NULL;
  1061	
  1062		/*
  1063		 * Remove the notification, and reset the list pointers, indicating
  1064		 * that it has been handled.
  1065		 */
  1066		list_del_init(&addfd->list);
  1067		if (!addfd->setfd)
  1068			fd = receive_fd(addfd->file, addfd->flags);
  1069		else {
  1070			int ret = 0;
  1071			if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_REPLACE_REF) {
  1072				old_file = fget(addfd->fd);
  1073				if (!old_file) {
  1074					fd = -EBADF;
  1075					goto error;
  1076				}
> 1077				ret = eventpoll_replace_file(old_file, addfd->file, addfd->fd);
  1078				if (ret < 0) {
  1079					fd = ret;
  1080					goto error;
  1081				}
  1082			}
  1083			fd = receive_fd_replace(addfd->fd, addfd->file, addfd->flags);
  1084			/* In case of error restore all references */
  1085			if (fd < 0 && addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_REPLACE_REF) {
  1086				ret = eventpoll_replace_file(addfd->file, old_file, addfd->fd);
  1087				if (ret < 0) {
  1088					fd = ret;
  1089				}
  1090			}
  1091		}
  1092	error:
  1093		addfd->ret = fd;
  1094	
  1095		if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_SEND) {
  1096			/* If we fail reset and return an error to the notifier */
  1097			if (fd < 0) {
  1098				n->state = SECCOMP_NOTIFY_SENT;
  1099			} else {
  1100				/* Return the FD we just added */
  1101				n->flags = 0;
  1102				n->error = 0;
  1103				n->val = fd;
  1104			}
  1105		}
  1106	
  1107		if (old_file)
  1108			fput(old_file);
  1109	
  1110		/*
  1111		 * Mark the notification as completed. From this point, addfd mem
  1112		 * might be invalidated and we can't safely read it anymore.
  1113		 */
  1114		complete(&addfd->completion);
  1115	}
  1116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
