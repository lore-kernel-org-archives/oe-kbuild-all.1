Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCABBA57
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675462283; x=1706998283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ri+6trqWrGO9FpKX3vOAcmBQPzepGLw5hNd4peqwtMI=;
  b=OVrhmm0GEsAyaK2pgSiUnvV41zToAIw7e/MK51rYFI95cS0JQRujCb90
   kNdA5WIEHQwGtLMdvM39Kz4ZfwQUw/PmMckUANJt/B8/2hQ/NwElxhAgq
   8tJk3QjSflQ6a25VeLt9pk7pxAshH8VUVpKug65s4h4K05yPD6lwro4km
   Gh1j4uDbN3opu1DMowrvB14HtDIRZ1/KOoRhheUcNHqVIVXGBcx2gVw1w
   BUPuLhMzP5mH1/esJ+O5Ovf2MRxFWAnOjRw2/aXkV0FG91qKxR/qiyCah
   UonR5MCzuAf1PD1OvUExpovMwmr4umlnFtwp1JQsCWaQ03VTZdjzmo3dK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330158922"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="330158922"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 14:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729401023"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="729401023"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Feb 2023 14:11:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO4H8-0000nF-0g;
	Fri, 03 Feb 2023 22:11:18 +0000
Date: Sat, 4 Feb 2023 06:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, hannes@cmpxchg.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bfoster@redhat.com,
	willy@infradead.org, linux-api@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v9 2/3] cachestat: implement cachestat syscall
Message-ID: <202302040546.JHm5vnYB-lkp@intel.com>
References: <20230203190413.2559707-3-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203190413.2559707-3-nphamcs@gmail.com>

Hi Nhat,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1440f576022887004f719883acb094e7e0dd4944]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230204-030455
base:   1440f576022887004f719883acb094e7e0dd4944
patch link:    https://lore.kernel.org/r/20230203190413.2559707-3-nphamcs%40gmail.com
patch subject: [PATCH v9 2/3] cachestat: implement cachestat syscall
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230204/202302040546.JHm5vnYB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/49a57ed71ac2c005231660c85c3f30c4b47d8b7b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nhat-Pham/workingset-refactor-LRU-refault-to-expose-refault-recency-check/20230204-030455
        git checkout 49a57ed71ac2c005231660c85c3f30c4b47d8b7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/filemap.c:4035:6: warning: no previous prototype for 'ksys_cachestat' [-Wmissing-prototypes]
    4035 | long ksys_cachestat(unsigned int fd, loff_t off, size_t len,
         |      ^~~~~~~~~~~~~~


vim +/ksys_cachestat +4035 mm/filemap.c

  4033	
  4034	#ifdef CONFIG_CACHESTAT_SYSCALL
> 4035	long ksys_cachestat(unsigned int fd, loff_t off, size_t len,
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
