Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959C37F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682157463; x=1713693463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oup839OP6sJqE0y6Hd5BuYfhzd0jrEVlRqGhuUpALbM=;
  b=dqZJWzDbpk+TQUseeh9ugsTXTBscij9y6V7FpBFm8A4ZYuJsGH4yRpCr
   bZi3I1zBD85yQ+mRzfLJrqZDgURPr5/AcQaZ773fyiMGokJecU1U/zM9P
   LOXN+TjD7vO73LTAoxhmeUVODxix68IVby62tBNt8mIZB0aDPXKplvUmL
   yJwqw5IlPnk0YGhmEzAczNZzh5DBE9XZ+rabWpiC1ZOI0/MaBhoVw+R9b
   A00EsFXcbz151XXJc5fzkeB8MZ9er5+2MFXBfccGtc0/wpBysonG2/Ayb
   jsuWzVO14R9V6cd6+25RgBIfbpe/ZqQ7necYrGgVRWfOTb+M86JUE7kpC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432420828"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432420828"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 02:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695190966"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="695190966"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 02:57:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq9zx-000hES-0a;
	Sat, 22 Apr 2023 09:57:41 +0000
Date: Sat, 22 Apr 2023 17:56:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] fs: split off vfs_getdents function of
 getdents64 syscall
Message-ID: <202304221745.9V0c3TYO-lkp@intel.com>
References: <20230422-uring-getdents-v1-1-14c1db36e98c@codewreck.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230422-uring-getdents-v1-1-14c1db36e98c@codewreck.org>

Hi Dominique,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8f57ae2eb07ab39a6f0ccad60c760743051026]

url:    https://github.com/intel-lab-lkp/linux/commits/Dominique-Martinet/fs-split-off-vfs_getdents-function-of-getdents64-syscall/20230422-164240
base:   6a8f57ae2eb07ab39a6f0ccad60c760743051026
patch link:    https://lore.kernel.org/r/20230422-uring-getdents-v1-1-14c1db36e98c%40codewreck.org
patch subject: [PATCH RFC 1/2] fs: split off vfs_getdents function of getdents64 syscall
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230422/202304221745.9V0c3TYO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/467765480454254c23e5e98ee66239af7810fdf6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dominique-Martinet/fs-split-off-vfs_getdents-function-of-getdents64-syscall/20230422-164240
        git checkout 467765480454254c23e5e98ee66239af7810fdf6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221745.9V0c3TYO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/readdir.c:361:5: warning: no previous prototype for 'vfs_getdents' [-Wmissing-prototypes]
     361 | int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
         |     ^~~~~~~~~~~~


vim +/vfs_getdents +361 fs/readdir.c

   353	
   354	
   355	/**
   356	 * vfs_getdents - getdents without fdget
   357	 * @file    : pointer to file struct of directory
   358	 * @dirent  : pointer to user directory structure
   359	 * @count   : size of buffer
   360	 */
 > 361	int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
   362			 unsigned int count)
   363	{
   364		struct getdents_callback64 buf = {
   365			.ctx.actor = filldir64,
   366			.count = count,
   367			.current_dir = dirent
   368		};
   369		int error;
   370	
   371		error = iterate_dir(file, &buf.ctx);
   372		if (error >= 0)
   373			error = buf.error;
   374		if (buf.prev_reclen) {
   375			struct linux_dirent64 __user * lastdirent;
   376			typeof(lastdirent->d_off) d_off = buf.ctx.pos;
   377	
   378			lastdirent = (void __user *) buf.current_dir - buf.prev_reclen;
   379			if (put_user(d_off, &lastdirent->d_off))
   380				error = -EFAULT;
   381			else
   382				error = count - buf.count;
   383		}
   384		return error;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
