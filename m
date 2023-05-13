Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE2AA55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 01:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683942843; x=1715478843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hZ0HF4MQ8FWDenmFLucN7dkb4rez8mrH2bU0cgnVDyw=;
  b=AQhGRfs1H22ws07aYSplmiUtd7BBz6ZCHDVpBbDUVXIeEXiKkcHhnp5N
   B3PlNsvPh5ZEf9MlGb9yj+DLxnGcohzRnPzNs42G5C+0/VN/HczlPzETP
   IMaaiWVwzxoHkuuUlWcBklzaM9PR9RGnWMs/fq58j1u4ROGpGF3v/PSpo
   04hLIYYF/G9okSC0Bwt21Rg6mIRSIxA/9BZc7o+F6zjtGHvj73YZ9to/J
   xnBl8bo1z7UqZIgpH9dajvuaPcTRuJAe5jcUBEj29UpjcVSGcQ8DH+Fer
   jVXUoftN40vobuE4q2xaKyAeiFaI213IiV5h91X/7uOb7brNqdgxUpdTh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="348407801"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="348407801"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 18:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694438128"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="694438128"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 May 2023 18:54:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxeSO-0005Em-1U;
	Sat, 13 May 2023 01:54:00 +0000
Date: Sat, 13 May 2023 09:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: [linux-next:master 1574/2056]
 drivers/infiniband/sw/rxe/rxe_verbs.c:1359:21: error: macro "kfree_rcu"
 requires 2 arguments, but only 1 given
Message-ID: <202305130903.yugzGgvD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e922ba281a8d84f640d8c8e18a385d032c19e185
commit: 7e3f926bf4538cb4988b3e3f8bc1cb4a603b2ef6 [1574/2056] rcu/kvfree: Eliminate k[v]free_rcu() single argument macro
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230513/202305130903.yugzGgvD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7e3f926bf4538cb4988b3e3f8bc1cb4a603b2ef6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7e3f926bf4538cb4988b3e3f8bc1cb4a603b2ef6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/sw/rxe/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130903.yugzGgvD-lkp@intel.com/

Note: the linux-next/master HEAD e922ba281a8d84f640d8c8e18a385d032c19e185 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/infiniband/sw/rxe/rxe_verbs.c: In function 'rxe_dereg_mr':
>> drivers/infiniband/sw/rxe/rxe_verbs.c:1359:21: error: macro "kfree_rcu" requires 2 arguments, but only 1 given
    1359 |         kfree_rcu(mr);
         |                     ^
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/infiniband/sw/rxe/rxe_verbs.c:7:
   include/linux/rcupdate.h:986: note: macro "kfree_rcu" defined here
     986 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         | 
>> drivers/infiniband/sw/rxe/rxe_verbs.c:1359:9: error: 'kfree_rcu' undeclared (first use in this function); did you mean 'kfree_skb'?
    1359 |         kfree_rcu(mr);
         |         ^~~~~~~~~
         |         kfree_skb
   drivers/infiniband/sw/rxe/rxe_verbs.c:1359:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/kfree_rcu +1359 drivers/infiniband/sw/rxe/rxe_verbs.c

8700e3e7c4857d2 Moni Shoua  2016-06-16  1342  
5bf944f24129cbc Bob Pearson 2023-03-03  1343  static int rxe_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
5bf944f24129cbc Bob Pearson 2023-03-03  1344  {
5bf944f24129cbc Bob Pearson 2023-03-03  1345  	struct rxe_mr *mr = to_rmr(ibmr);
5bf944f24129cbc Bob Pearson 2023-03-03  1346  	int err, cleanup_err;
5bf944f24129cbc Bob Pearson 2023-03-03  1347  
5bf944f24129cbc Bob Pearson 2023-03-03  1348  	/* See IBA 10.6.7.2.6 */
5bf944f24129cbc Bob Pearson 2023-03-03  1349  	if (atomic_read(&mr->num_mw) > 0) {
5bf944f24129cbc Bob Pearson 2023-03-03  1350  		err = -EINVAL;
5bf944f24129cbc Bob Pearson 2023-03-03  1351  		rxe_dbg_mr(mr, "mr has mw's bound");
5bf944f24129cbc Bob Pearson 2023-03-03  1352  		goto err_out;
5bf944f24129cbc Bob Pearson 2023-03-03  1353  	}
5bf944f24129cbc Bob Pearson 2023-03-03  1354  
5bf944f24129cbc Bob Pearson 2023-03-03  1355  	cleanup_err = rxe_cleanup(mr);
5bf944f24129cbc Bob Pearson 2023-03-03  1356  	if (cleanup_err)
5bf944f24129cbc Bob Pearson 2023-03-03  1357  		rxe_err_mr(mr, "cleanup failed, err = %d", cleanup_err);
5bf944f24129cbc Bob Pearson 2023-03-03  1358  
5bf944f24129cbc Bob Pearson 2023-03-03 @1359  	kfree_rcu(mr);
5bf944f24129cbc Bob Pearson 2023-03-03  1360  	return 0;
5bf944f24129cbc Bob Pearson 2023-03-03  1361  
5bf944f24129cbc Bob Pearson 2023-03-03  1362  err_out:
5bf944f24129cbc Bob Pearson 2023-03-03  1363  	rxe_err_mr(mr, "returned err = %d", err);
5bf944f24129cbc Bob Pearson 2023-03-03  1364  	return err;
5bf944f24129cbc Bob Pearson 2023-03-03  1365  }
5bf944f24129cbc Bob Pearson 2023-03-03  1366  

:::::: The code at line 1359 was first introduced by commit
:::::: 5bf944f24129cbc4b5828348bdce2db94ca9fbd6 RDMA/rxe: Add error messages

:::::: TO: Bob Pearson <rpearsonhpe@gmail.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
