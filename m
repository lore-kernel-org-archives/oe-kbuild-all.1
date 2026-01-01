Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D519F115
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767282405; cv=none; b=UXSJZE3LP/QfIfCvmxJVOza9ur1D8l6vc7srUByIrDZ8NQ7U1BMsMbjZ0/zQzjgeNS8gJmHPXy3X3u3xItiDFsunWcM/sJn82rj76Kh073XRSl1r1tDGqPse4iTqTvJX6/jUknvcndXBhXhsTxkpfqkP0gXAPf4EqyIu7GdF7pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767282405; c=relaxed/simple;
	bh=QmcjpK6NOLACU9LGLi+wISBD57tbZe4LchNlpalxktE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LMAxx15BYV19DOHMH7C5cibpSGlCkqXB7XU/OZbx21kxvljYwKbsLXKcnkh6ct+aVDacMbBcZ3+8h+/+0LgkrtdR44IteCaY4nPrPqQdI5Dvbb9BJKYCHy3UgYAiXucxULZRb6I+bUISJjNzJWI3VBhMrGIKkB5ck+4hBkR7GMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIJmnfAU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIJmnfAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767282403; x=1798818403;
  h=date:from:to:cc:subject:message-id;
  bh=QmcjpK6NOLACU9LGLi+wISBD57tbZe4LchNlpalxktE=;
  b=TIJmnfAUz3CFTdJop2Iw2gQIxJTPVwdY1F5ToDpxkaTlHzxsSU83jeYm
   f5AiqbRUO3jrfEXe6XX6EUo9zFCV/Wpg91+q4QMYIeXXDvOczQTZlutMK
   OX7qTFiK8LXKzp53pEwxrwWHz2tPcYkN5hMw7CQnvaejFvAAkCu8/zRx4
   fbI1/QrRSHGVrrgfpfcEW0OQYe85yFdx37i4DwaI9AJcCEC/d4Kr0Nf9G
   tqNN75hBsHVeNnuIFbgkk+r1Zo1l+5I/7mWya39c8V6a1KvL6fFJsjte+
   FiHNp45NXmQ/GiL2xrjDF1X4dDdw4QtVsXwn8BkyO+UyM3JrQJnULj42N
   Q==;
X-CSE-ConnectionGUID: WyWejBgLTjSfX72BxPuDqA==
X-CSE-MsgGUID: JpTZFxLuR2uGjwZw18YT0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68752297"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68752297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 07:46:42 -0800
X-CSE-ConnectionGUID: 19okMbcQTOW0FcMG+6pAuQ==
X-CSE-MsgGUID: 0IoOlLUBSc2wCcWFcIHfJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="225144088"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jan 2026 07:46:40 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbKso-000000001ub-2DcR;
	Thu, 01 Jan 2026 15:46:38 +0000
Date: Thu, 01 Jan 2026 23:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: io_uring/rsrc.c:457:7: error: unexpected token, expected
 comma
Message-ID: <202601012317.QyR84Xo9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 3615e3f7947a3c1cb15d362da921ac46d771e02c io_uring/rsrc: use get/put_user() for integer copy
date:   8 weeks ago
config: mips-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601012317.QyR84Xo9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601012317.QyR84Xo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601012317.QyR84Xo9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/rsrc.c:457:7: error: unexpected token, expected comma
     457 |                 if (get_user(fd, &fds[done])) {
         |                     ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   io_uring/rsrc.c:457:7: error: instruction requires a CPU feature not currently enabled
     457 |                 if (get_user(fd, &fds[done])) {
         |                     ^
   arch/mips/include/asm/uaccess.h:97:33: note: expanded from macro 'get_user'
      97 |         access_ok(__p, sizeof(*__p)) ? __get_user((x), __p) :           \
         |                                        ^
   arch/mips/include/asm/uaccess.h:183:23: note: expanded from macro '__get_user'
     183 |                 __get_data_asm((x), user_lw, __gu_ptr);                 \
         |                                     ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         lwe $4, 0($21)
         |         ^
   io_uring/rsrc.c:471:7: error: unexpected token, expected comma
     471 |                 if (put_user(ret, &fds[done])) {
         |                     ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:3:10: note: instantiated into assembly here
       3 |         .set    eva
         |                    ^
   io_uring/rsrc.c:471:7: error: instruction requires a CPU feature not currently enabled
     471 |                 if (put_user(ret, &fds[done])) {
         |                     ^
   arch/mips/include/asm/uaccess.h:71:33: note: expanded from macro 'put_user'
      71 |         access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
         |                                        ^
   arch/mips/include/asm/uaccess.h:136:18: note: expanded from macro '__put_user'
     136 |                 __put_data_asm(user_sw, __pu_ptr);                      \
         |                                ^
   <inline asm>:4:2: note: instantiated into assembly here
       4 |         swe $17, 0($21)
         |         ^
   4 errors generated.


vim +457 io_uring/rsrc.c

   443	
   444	static int io_files_update_with_index_alloc(struct io_kiocb *req,
   445						    unsigned int issue_flags)
   446	{
   447		struct io_rsrc_update *up = io_kiocb_to_cmd(req, struct io_rsrc_update);
   448		__s32 __user *fds = u64_to_user_ptr(up->arg);
   449		unsigned int done;
   450		struct file *file;
   451		int ret, fd;
   452	
   453		if (!req->ctx->file_table.data.nr)
   454			return -ENXIO;
   455	
   456		for (done = 0; done < up->nr_args; done++) {
 > 457			if (get_user(fd, &fds[done])) {
   458				ret = -EFAULT;
   459				break;
   460			}
   461	
   462			file = fget(fd);
   463			if (!file) {
   464				ret = -EBADF;
   465				break;
   466			}
   467			ret = io_fixed_fd_install(req, issue_flags, file,
   468						  IORING_FILE_INDEX_ALLOC);
   469			if (ret < 0)
   470				break;
   471			if (put_user(ret, &fds[done])) {
   472				__io_close_fixed(req->ctx, issue_flags, ret);
   473				ret = -EFAULT;
   474				break;
   475			}
   476		}
   477	
   478		if (done)
   479			return done;
   480		return ret;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
