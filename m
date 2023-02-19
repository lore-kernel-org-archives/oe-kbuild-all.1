Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94DEC1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676802998; x=1708338998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qbLHLtD/0bNS3M8cyuH2XfUlQG96Y4U83b1gNrTeMic=;
  b=DnlyNqmce4sLp50YFC9QgGGZ+PfBqXk7wOhdClLT6GxqUbSVe5CKOvHC
   Yl8wFWIHbceBZ6JxhI+gkZQU0/tIj6nq0dhkKtqbvAm2knhJIeAZQYVfK
   7q6kYTGqV8DwLXeFpR5s0+TPPQWT27yxy6nB/4AeYPTnIQSXxRXGD2BcF
   QJyerrduG7cFRBd3b3tNAF/Dkl+NIMQyl0hqcn5XwAPdo5fIMWVf1hdMJ
   YmgmFd6Bw8q+0DIKAS7hEVzvsdGgu0fmugtjtMjmsk6Jat8O+y64vBmC1
   rU1PB424WYtuUiTkNzLrGuvAGhtvaw/bswdZQe7KF3uQnpi3m5Etua2Yv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="329954720"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="329954720"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 02:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="794888526"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="794888526"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Feb 2023 02:36:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTh3Z-000DFN-2U;
	Sun, 19 Feb 2023 10:36:33 +0000
Date: Sun, 19 Feb 2023 18:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bfoster@redhat.com,
	willy@infradead.org, arnd@arndb.de, linux-api@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v10 2/3] cachestat: implement cachestat syscall
Message-ID: <202302191804.5m2GB1PU-lkp@intel.com>
References: <20230219073318.366189-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230219073318.366189-3-nphamcs@gmail.com>

Hi Nhat,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1440f576022887004f719883acb094e7e0dd4944]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230219-153500
base:   1440f576022887004f719883acb094e7e0dd4944
patch link:    https://lore.kernel.org/r/20230219073318.366189-3-nphamcs%40gmail.com
patch subject: [PATCH v10 2/3] cachestat: implement cachestat syscall
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230219/202302191804.5m2GB1PU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d691a3b4a696ab20c9c5fe86c624e9e36814523c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230219-153500
        git checkout d691a3b4a696ab20c9c5fe86c624e9e36814523c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302191804.5m2GB1PU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/filemap.c:4035:6: warning: no previous prototype for 'ksys_cachestat' [-Wmissing-prototypes]
    4035 | long ksys_cachestat(unsigned int fd, size_t len, loff_t off,
         |      ^~~~~~~~~~~~~~


vim +/ksys_cachestat +4035 mm/filemap.c

  4033	
  4034	#ifdef CONFIG_CACHESTAT_SYSCALL
> 4035	long ksys_cachestat(unsigned int fd, size_t len, loff_t off,
  4036			struct cachestat __user *cstat, unsigned int flags)
  4037	{
  4038		struct fd f = fdget(fd);
  4039		struct address_space *mapping;
  4040		struct cachestat cs;
  4041		pgoff_t first_index = off >> PAGE_SHIFT;
  4042		pgoff_t last_index =
  4043			len == 0 ? ULONG_MAX : (off + len - 1) >> PAGE_SHIFT;
  4044	
  4045		if (!f.file)
  4046			return -EBADF;
  4047	
  4048		if (off < 0 || flags != 0) {
  4049			fdput(f);
  4050			return -EINVAL;
  4051		}
  4052	
  4053		memset(&cs, 0, sizeof(struct cachestat));
  4054		mapping = f.file->f_mapping;
  4055		filemap_cachestat(mapping, first_index, last_index, &cs);
  4056		fdput(f);
  4057	
  4058		if (copy_to_user(cstat, &cs, sizeof(struct cachestat)))
  4059			return -EFAULT;
  4060	
  4061		return 0;
  4062	}
  4063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
