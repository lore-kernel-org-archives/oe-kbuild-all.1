Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8483E5597
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786793118; cv=none; b=EaEG+CvsiB8VoL50vEOwHnjrXcrDc7VQMKwccxjRnztBksHNWsZPzM5CjibcvoCe3d8xU6UnPElFYxBBgFtDvNf/4dZpQirePVG+iYYg+s5RrCh/bKDHkmoclcY+FYjy91cNguMqXUX47hju5BrpGdj2W+h7VJYdS+cAWOgGtDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786793118; c=relaxed/simple;
	bh=61a+V9Kist+U+cLdQYqzpEd0zcV4KlLZk8pQTLLK0Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J47esns3CTCDejwK4PjO3S135USyl9mpoVJ4Y567JxJ/vQ08PGcRuzYTgUr7DctVOqx/TCvOXQurBe4NtYoYeOitdnYXzpjwG/HsJoAZ1es/YEJ8Okkfpjun/RK2go7bL1ojbSVI9SsOjJNtkQtk9xRB6HAV6DZZo2q240eDKmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6AX6JZ3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6AX6JZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786793115; x=1818329115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=61a+V9Kist+U+cLdQYqzpEd0zcV4KlLZk8pQTLLK0Rs=;
  b=S6AX6JZ3X3wxiohBqoTXHXdeHmTdhZkXdWiT8GV/TCpnsIXI9XqX7/1o
   FUhy7FkTKCv90Vf6xnHlfWy1uH2qfRPgfZJ/Wfijm8cCeiI2D6n3WKCgp
   7sBJAy9GP6bet2TpQSSZHR6HjPpVO7NLjvQcZCN6QLEwqAPczpDhe/LNZ
   A0sAI5bomsljWI9X7Io8Fr5bFozj/bM1y+kjdZKhES/IP4uWmgSNjFcJ+
   rGHCARtQp9tujNzGyPGOdzupwTRBJQuNTeLibFGhziNVSILL3Rd9+Z6HB
   scjso8Om+hhiPGYUs1CXDkJddSP/yuJKrV1fC7lo5kHZ3DPKVXdfdDtXs
   w==;
X-CSE-ConnectionGUID: 3mQnEuPHQquFtDHGGVx3vQ==
X-CSE-MsgGUID: GrcyvwSwSt2BaUwSq3WIzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87206734"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="87206734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 04:25:12 -0700
X-CSE-ConnectionGUID: VfyMz9tWSDOMy36A+tBVmw==
X-CSE-MsgGUID: oExpnzHETpGLunprpHOXhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="289262190"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Aug 2026 04:25:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvCVf-00000000bqg-0Qto;
	Sat, 15 Aug 2026 11:25:07 +0000
Date: Sat, 15 Aug 2026 19:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Gioh Kim <gi-oh.kim@cloud.ionos.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] RDMA/rtrs-clt: Fix double free on path sysfs failure
Message-ID: <202608151946.R0SOCia4-lkp@intel.com>
References: <20260714142838.1723076-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714142838.1723076-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rdma/for-next]
[also build test WARNING on linus/master v7.2-rc7 next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/RDMA-rtrs-clt-Fix-double-free-on-path-sysfs-failure/20260815-173725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/20260714142838.1723076-1-lgs201920130244%40gmail.com
patch subject: [PATCH] RDMA/rtrs-clt: Fix double free on path sysfs failure
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608151946.R0SOCia4-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151946.R0SOCia4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151946.R0SOCia4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c: In function 'rtrs_clt_create_path_files':
>> drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c:470:1: warning: label 'del_kobj' defined but not used [-Wunused-label]
     470 | del_kobj:
         | ^~~~~~~~


vim +/del_kobj +470 drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c

   424	
   425	int rtrs_clt_create_path_files(struct rtrs_clt_path *clt_path)
   426	{
   427		struct rtrs_clt_sess *clt = clt_path->clt;
   428		char str[NAME_MAX];
   429		int err;
   430		struct rtrs_addr path = {
   431			.src = &clt_path->s.src_addr,
   432			.dst = &clt_path->s.dst_addr,
   433		};
   434	
   435		rtrs_addr_to_str(&path, str, sizeof(str));
   436		err = kobject_init_and_add(&clt_path->kobj, &ktype_sess,
   437					   clt->kobj_paths,
   438					   "%s", str);
   439		if (err) {
   440			pr_err("kobject_init_and_add: %pe\n", ERR_PTR(err));
   441			goto free_stats;
   442		}
   443		err = sysfs_create_group(&clt_path->kobj, &rtrs_clt_path_attr_group);
   444		if (err) {
   445			pr_err("sysfs_create_group(): %pe\n", ERR_PTR(err));
   446			goto del_kobj_free_stats;
   447		}
   448		err = kobject_init_and_add(&clt_path->stats->kobj_stats, &ktype_stats,
   449					   &clt_path->kobj, "stats");
   450		if (err) {
   451			pr_err("kobject_init_and_add: %pe\n", ERR_PTR(err));
   452			kobject_put(&clt_path->stats->kobj_stats);
   453			goto remove_group;
   454		}
   455	
   456		err = sysfs_create_group(&clt_path->stats->kobj_stats,
   457					 &rtrs_clt_stats_attr_group);
   458		if (err) {
   459			pr_err("failed to create stats sysfs group, err: %pe\n", ERR_PTR(err));
   460			goto put_kobj_stats;
   461		}
   462	
   463		return 0;
   464	
   465	put_kobj_stats:
   466		kobject_del(&clt_path->stats->kobj_stats);
   467		kobject_put(&clt_path->stats->kobj_stats);
   468	remove_group:
   469		sysfs_remove_group(&clt_path->kobj, &rtrs_clt_path_attr_group);
 > 470	del_kobj:
   471		kobject_del(&clt_path->kobj);
   472		return err;
   473	
   474	del_kobj_free_stats:
   475		kobject_del(&clt_path->kobj);
   476	free_stats:
   477		free_percpu(clt_path->stats->pcpu_stats);
   478		kfree(clt_path->stats);
   479	
   480		/*
   481		 * Leave the path kobject reference to the caller so it can tear
   482		 * down the connections before rtrs_clt_path_release() frees it.
   483		 */
   484	
   485		return err;
   486	}
   487	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
