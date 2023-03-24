Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811382F2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679648649; x=1711184649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r/C2TLpuTZ/5O98xfb36vuLqGKcU8eT7JPkiAxu0Yfc=;
  b=h1BDUR/2XvCKvDWNvmDqk2unWvFUB98vIwPzo+Zb965Ob2/kM4Mgiq4X
   cYioWG72V+j7yfanVG6UaqdsIRSE7fktwJxMODgtM8mCg4R1Y56oB3Mse
   ZyAAMCo9XSSTZsBzSuAhs5lv7zAVCkGQSplzsSG9Pg0579uGrJd2FBdyl
   R5gPXGdOfR4yW+MuXM6NWlvRQLq9A4gGrgyvBKNP/0xC/whHgPpfBg9Cw
   Lt7V15BXMFYndjSMZuWJxc90tPocsy1ZOHnNHaOT3VBqy2aDA+wwzuQNC
   2pgnsuO0IKq9ivkmNCF6bbaBkZUfKBR0MPpWmE2EWI7Vytq9SODtmhkcl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319385466"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="319385466"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 02:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="793371939"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="793371939"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 02:04:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfdLD-000F9q-1N;
	Fri, 24 Mar 2023 09:04:07 +0000
Date: Fri, 24 Mar 2023 17:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v4 2/2] file, epoll: Implement do_replace() and
 eventpoll_replace()
Message-ID: <202303241601.tE7CEyMq-lkp@intel.com>
References: <20230324063422.1031181-2-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324063422.1031181-2-aloktiagi@gmail.com>

Hi aloktiagi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on vfs-idmapping/for-next linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/file-epoll-Implement-do_replace-and-eventpoll_replace/20230324-143628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20230324063422.1031181-2-aloktiagi%40gmail.com
patch subject: [RFC v4 2/2] file, epoll: Implement do_replace() and eventpoll_replace()
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230324/202303241601.tE7CEyMq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/16224b0d75bd4532819c7f65b407877237fcaf31
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/file-epoll-Implement-do_replace-and-eventpoll_replace/20230324-143628
        git checkout 16224b0d75bd4532819c7f65b407877237fcaf31
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241601.tE7CEyMq-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/file.c: In function 'do_replace':
   fs/file.c:1176:31: error: 'struct file' has no member named 'f_ep'; did you mean 'f_op'?
    1176 |         if (fdfile && fdfile->f_ep) {
         |                               ^~~~
         |                               f_op
>> fs/file.c:1177:17: error: implicit declaration of function 'eventpoll_replace_file'; did you mean 'eventpoll_release'? [-Werror=implicit-function-declaration]
    1177 |                 eventpoll_replace_file(fdfile, file);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 eventpoll_release
   cc1: some warnings being treated as errors


vim +1177 fs/file.c

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
  1176		if (fdfile && fdfile->f_ep) {
> 1177			eventpoll_replace_file(fdfile, file);
  1178		}
  1179		/*
  1180		 * Install the received file in the file descriptor table for all fd
  1181		 * numbers referencing the same file as the one we are trying to
  1182		 * replace. Do not install it for the fd number received since that is
  1183		 * handled in do_dup2()
  1184		 */
  1185		iterate_fd(files, n, do_replace_fd_array, &ffd);
  1186	}
  1187	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
