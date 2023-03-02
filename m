Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD5D524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677791437; x=1709327437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+xfW8DTsfYCVhMZOlQfVHBF3sb2wHhwvn7jgK7UZoVk=;
  b=lJotaVM/NggqG7TNgjXm/vfLwcEiuhEVV5ApHNXKbj8tpT+hWOf9azz0
   clyD8H7y/aViO0SYOWL9vnqsMRf40fMdgwVlRTj79DgOMX2nUeGfTY4gc
   sp2Y7mJZR7XZKcCMnNI7ZIzCXYpYfeLMfUbMbL3Og80R+S3rPoYv9vZXy
   cWKIHZ4fBrZpFU0dxMNeghXWW9iPmvQw9rQk1Fa2S6C35ZHJZ3VB/DeQ5
   t2yTQBd8LMAnqawUpBWK9Jtaw3qPKn2K6TREibKxgoTXb6z2X0BsZraBo
   O9RATK2mQHRYZfy4BdjooNFWN2BAckifH8jH9706IX24OTy119EEQDpPs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="315266352"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="315266352"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 13:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="849236474"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="849236474"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Mar 2023 13:10:34 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXqC9-0000t0-1s;
	Thu, 02 Mar 2023 21:10:33 +0000
Date: Fri, 3 Mar 2023 05:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/3] file, epoll: Implement do_replace() and
 eventpoll_replace()
Message-ID: <202303030421.mIGU1Otw-lkp@intel.com>
References: <20230302182207.456311-3-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302182207.456311-3-aloktiagi@gmail.com>

Hi aloktiagi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on kees/for-next/pstore kees/for-next/kspp linus/master v6.2 next-20230302]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230303-022310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20230302182207.456311-3-aloktiagi%40gmail.com
patch subject: [RFC 3/3] file, epoll: Implement do_replace() and eventpoll_replace()
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230303/202303030421.mIGU1Otw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/047f007e8195cfe7ed4191b97cf8d2c4ef309f08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/file-allow-callers-to-free-the-old-file-descriptor-after-dup2/20230303-022310
        git checkout 047f007e8195cfe7ed4191b97cf8d2c4ef309f08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030421.mIGU1Otw-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/file.c: In function 'do_replace':
>> fs/file.c:1172:31: error: 'struct file' has no member named 'f_ep'; did you mean 'f_op'?
    1172 |         if (fdfile && fdfile->f_ep) {
         |                               ^~~~
         |                               f_op
>> fs/file.c:1173:17: error: implicit declaration of function 'eventpoll_replace'; did you mean 'eventpoll_release'? [-Werror=implicit-function-declaration]
    1173 |                 eventpoll_replace(fdfile, file);
         |                 ^~~~~~~~~~~~~~~~~
         |                 eventpoll_release
   cc1: some warnings being treated as errors


vim +1172 fs/file.c

  1155	
  1156	static void do_replace(struct files_struct *files,
  1157	        struct file *file, unsigned fd, struct file *fdfile)
  1158	{
  1159		unsigned n = 0;
  1160		struct replace_filefd ffd = {
  1161			.files = files,
  1162			.fd = fd,
  1163			.fdfile = fdfile,
  1164			.file = file
  1165		};
  1166	
  1167		/*
  1168		 * Check if the file referenced by the fd number is linked to the epoll
  1169		 * interface. If yes, replace the reference with the received file in
  1170		 * the epoll interface.
  1171		 */
> 1172		if (fdfile && fdfile->f_ep) {
> 1173			eventpoll_replace(fdfile, file);
  1174		}
  1175		/*
  1176		 * Install the received file in the file descriptor table for all fd
  1177		 * numbers referencing the same file as the one we are trying to
  1178		 * replace. Do not install it for the fd number received since that is
  1179		 * handled in do_dup2()
  1180		 */
  1181		iterate_fd_locked(files, n, do_replace_fd_array, &ffd);
  1182	}
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
