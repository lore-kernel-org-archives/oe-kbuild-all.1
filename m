Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8750BA4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6Z/Cj2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697860430; x=1729396430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KSNO7vOH2xYOL/+j22XGMf283vnlJoT1CRb7A5owLFQ=;
  b=V6Z/Cj2wJai/JzMkPhAAuC79d9PyGhI8LsQmTw0p7DpXiJEzmc41zIp2
   5U+PH5xGG/aVe5vSmtKWR46VOyxcqfVRXXD0jdnwc593zg2TnQ+RXocUx
   N36r/IpIXgogOWsBF65kcx1tD3EhXJVYqCs8JDsCnQ34d0AABf//0Fo8C
   OCZ2QsRq7CFpCwbta544yVufhXQLjx9MINlBhqYmqkeRPtOO4xYh6rz03
   0Gp4u7K20Y2sNZylS9DIpBH+WH6qbX6XTe5VUsw+c8LdKqAe9xDxxei3f
   ihf4DyOdM4XUomFOIMUqARN9EbDhGpCbzXrU9RabnM0eu2v4eBAjRfqPU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="366836729"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="366836729"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 20:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823451798"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823451798"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 20:53:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu33Y-0004Na-2Z;
	Sat, 21 Oct 2023 03:53:44 +0000
Date: Sat, 21 Oct 2023 11:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, io-uring@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, axboe@kernel.dk, hch@lst.de,
	joshi.k@samsung.com, martin.petersen@oracle.com,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 1/4] block: bio-integrity: add support for user buffers
Message-ID: <202310211117.qmDPOVfI-lkp@intel.com>
References: <20231018151843.3542335-2-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018151843.3542335-2-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc6 next-20231020]
[cannot apply to axboe-block/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-bio-integrity-add-support-for-user-buffers/20231018-232704
base:   linus/master
patch link:    https://lore.kernel.org/r/20231018151843.3542335-2-kbusch%40meta.com
patch subject: [PATCH 1/4] block: bio-integrity: add support for user buffers
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231021/202310211117.qmDPOVfI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211117.qmDPOVfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211117.qmDPOVfI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blkdev.h:17:0,
                    from init/main.c:85:
   include/linux/bio.h: In function 'bio_integrity_map_user':
>> include/linux/bio.h:798:1: error: expected ';' before '}' token
    }
    ^
--
   In file included from include/linux/blkdev.h:17:0,
                    from lib/vsprintf.c:47:
   include/linux/bio.h: In function 'bio_integrity_map_user':
>> include/linux/bio.h:798:1: error: expected ';' before '}' token
    }
    ^
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1682:2: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
     ^~~


vim +798 include/linux/bio.h

   793	
   794	static inline int bio_integrity_map_user(struct bio *bio, void __user *ubuf,
   795						 unsigned int len, u32 seed, u32 maxvecs)
   796	{
   797		return -EINVAL
 > 798	}
   799	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
