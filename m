Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537DB36D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 03:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206089; cv=none; b=GCQUZeVzjnlsfGozmjgZe1/vZgvaYTCgDnjvE/a9vghcPcf8lGMRTIU45Fk05oN/VbaDa3ivdPUuZnzhhBRqtGGUrbw2+NwChi9XcFzof2cG4UOPm4snz7mlwYnxS0gdqeBLtxEXae6KFC223j2itLIn07OxAa0n+wzNK8I853g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206089; c=relaxed/simple;
	bh=fsW3cbiiT7W0XnYfOSovGcu2F+ScuTAvtVjG1Jkoy4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQDFC8ewmUC8H4vpAk8k51N5vVD05uvOUeP9cAqgC6wwe0cL6z64H7BPvGrcnv1autn9YY8Xkvee5vBPeSqDUsp4RuvWEBPlAgOZXDzClo/WwQMTqlvT1m/faVUfatl90/T/xCmLW8wQjw6AE9uf6pW+Kv1aZOomXhn9u30ZNFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnbo1+CI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnbo1+CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745206087; x=1776742087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fsW3cbiiT7W0XnYfOSovGcu2F+ScuTAvtVjG1Jkoy4k=;
  b=mnbo1+CIPXScgLWJL303flUf9/ikiMHX11wC40M0huS2Tuy1TX/NN0Sc
   czLzlJ7V/mHr3LKJyClY0IhnaAXOq4DHRTPr+RZRTYGNjlIwMoN1psY5Q
   zRZmhFPOH2ay6Lw64M1YdRoglR2JqCySKKh/a0Jml98h3j+fbHWB3ODZT
   7OR/Mpv1VHJVZAcbV1nw8/VWshMXRNy0FVhC/v8onVgJ3C4f1WYNfgmpB
   X7rJ0MGo86xp9Y4gmMTAQSCAFpxKztdBiMyT9cBGhDnB66ovfQwKZJaSc
   4G+lsaH2SsiivvITUbLIoA8kGS3MUYGNSl2QbqraRPUG8D1srCwL+XD3w
   Q==;
X-CSE-ConnectionGUID: mmsR1oKUSda0vZIO/zXeTA==
X-CSE-MsgGUID: Wb9HRArXTTivV6jLqo35Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="58113616"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="58113616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 20:28:04 -0700
X-CSE-ConnectionGUID: DHc5Q7z+ReClQRipOew+fQ==
X-CSE-MsgGUID: SW3MMzRQS5SB/qJUbcC1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="132129426"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Apr 2025 20:28:02 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6hp9-00005P-3D;
	Mon, 21 Apr 2025 03:27:59 +0000
Date: Mon, 21 Apr 2025 11:27:09 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 12/19] famfs_fuse: Plumb the GET_FMAP message/response
Message-ID: <202504211139.nywCKgmL-lkp@intel.com>
References: <20250421013346.32530-13-john@groves.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421013346.32530-13-john@groves.net>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dev_dax_iomap-Move-dax_pgoff_to_phys-from-device-c-to-bus-c/20250421-094020
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250421013346.32530-13-john%40groves.net
patch subject: [RFC PATCH 12/19] famfs_fuse: Plumb the GET_FMAP message/response
config: csky-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211139.nywCKgmL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211139.nywCKgmL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211139.nywCKgmL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/fuse/fuse_i.h:17,
                    from fs/fuse/dir.c:9:
   fs/fuse/dir.c: In function 'fuse_get_fmap':
>> fs/fuse/dir.c:392:27: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     392 |                   nodeid, (u64)inode);
         |                           ^
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   fs/fuse/dir.c:391:9: note: in expansion of macro 'pr_notice'
     391 |         pr_notice("%s: nodeid=%lld, inode=%llx\n", __func__,
         |         ^~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:473:25: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:13:25: note: in expansion of macro 'KERN_SOH'
      13 | #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant condition */
         |                         ^~~~~~~~
   include/linux/printk.h:564:16: note: in expansion of macro 'KERN_NOTICE'
     564 |         printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~
   fs/fuse/dir.c:406:9: note: in expansion of macro 'pr_notice'
     406 |         pr_notice("%s: nodei=%lld fmap_size=%ld\n", __func__, nodeid, fmap_size);
         |         ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEV_DAX_IOMAP
   Depends on [n]: DEV_DAX [=n] && DAX [=y]
   Selected by [y]:
   - FUSE_FAMFS_DAX [=y] && FUSE_FS [=y]


vim +392 fs/fuse/dir.c

   383	
   384	static int
   385	fuse_get_fmap(struct fuse_mount *fm, struct inode *inode, u64 nodeid)
   386	{
   387		size_t fmap_size;
   388		void *fmap_buf;
   389		int err;
   390	
   391		pr_notice("%s: nodeid=%lld, inode=%llx\n", __func__,
 > 392			  nodeid, (u64)inode);
   393		fmap_buf = kcalloc(1, FMAP_BUFSIZE, GFP_KERNEL);
   394		FUSE_ARGS(args);
   395		fuse_get_fmap_init(fm->fc, &args, nodeid, fmap_buf, FMAP_BUFSIZE);
   396	
   397		/* Send GET_FMAP command */
   398		err = fuse_simple_request(fm, &args);
   399		if (err) {
   400			pr_err("%s: err=%d from fuse_simple_request()\n",
   401			       __func__, err);
   402			return err;
   403		}
   404	
   405		fmap_size = args.out_args[0].size;
   406		pr_notice("%s: nodei=%lld fmap_size=%ld\n", __func__, nodeid, fmap_size);
   407	
   408		return 0;
   409	}
   410	#endif
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
