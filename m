Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7D3A1CF5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 17:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762883347; cv=none; b=cQHH0A5aNuSnDArObJXXQ47m/FWCeOVb9VmZEBUQ1nTwll2pFFrgYpfOvXTG1YKSzFeJeZBmx5AekqHeYYeIJSLkuo1oX6xZWV2bVA8EupuXoX9D4+jCl+irWJIDPS9LZuCTK2cYjs3qpkLx/CXjYmOQIMx+qPvn66dIggSajQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762883347; c=relaxed/simple;
	bh=q5vvgIHX0C0hEBfAOTf1v7Ds0vusdxhu4vMFg/5xW20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=renW1FTYl00i2uVC4mmkt/40rseWq7rFJpJ61If9pIeQFPqmOKRbiGIRJlIM2TGB8oDQFDNHHkDW56wabwI3tY9WuXFjr4jaQK17IsAVwP9BXdB4M7TR02tuoua6QX947NhZqWblWFvJEHDdKe6WrckiQCw7TJcGlWIS7IgEIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFBx+kn2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFBx+kn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762883346; x=1794419346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q5vvgIHX0C0hEBfAOTf1v7Ds0vusdxhu4vMFg/5xW20=;
  b=lFBx+kn2xWDhcGdRINDXSa6y9gHsOelJfPfjl5X5zZpB3GVOHPpFQAlu
   D5TiiUbvsGoY9ClgtuUzyrlWFTO4izsgQXi4fVGyhcK53miFF8wRUgC92
   OnpoMjKEZg44K908jDfVw0Cr7Pbwy4NpyZsRq/YHy8EF6B9MubLsTLhMV
   ri3p7vwcNelGk5P8t2gSRnosTi1OdfzdhAYhAOreVnN6X/B4GRGaSRDuw
   b5/suv6JhPk3JO4ByG/y9meFM51pckdNo/jWTRwyVZznHs67IZ9WpLR3d
   jFMJPjcN45y6RE7jzk8dHsSctoEljX7wBeOPobGz8kBsNmnnfqu27fLdp
   w==;
X-CSE-ConnectionGUID: Clzxg2y7R6yQZsd9HYf5xA==
X-CSE-MsgGUID: wJuN0vtxRnGct8ZE5F+nRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="82581038"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="82581038"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 09:49:05 -0800
X-CSE-ConnectionGUID: pGhMbKVLReGAbOe+mQ/Gyg==
X-CSE-MsgGUID: LdJvw/75SHOk9D//WUlrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188778181"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Nov 2025 09:49:04 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIsUH-0003RT-1Y;
	Tue, 11 Nov 2025 17:49:01 +0000
Date: Wed, 12 Nov 2025 01:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: [jlayton:nfsd-dynathread 7/7] net/sunrpc/svc.c:828 svc_new_thread()
 warn: inconsistent indenting
Message-ID: <202511120149.iOn5Qcys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git nfsd-dynathread
head:   12edd91f83c1140ce0303755316947530b55bf11
commit: 12edd91f83c1140ce0303755316947530b55bf11 [7/7] nfsd: adjust number of running nfsd threads
config: i386-randconfig-141-20251111 (https://download.01.org/0day-ci/archive/20251112/202511120149.iOn5Qcys-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120149.iOn5Qcys-lkp@intel.com/

smatch warnings:
net/sunrpc/svc.c:828 svc_new_thread() warn: inconsistent indenting

vim +828 net/sunrpc/svc.c

a74554429eada8 Greg Banks      2006-10-02  797  
12edd91f83c114 NeilBrown       2024-04-23  798  int svc_new_thread(struct svc_serv *serv, struct svc_pool *pool)
a74554429eada8 Greg Banks      2006-10-02  799  {
9867d76ca16b3f Jeff Layton     2008-06-10  800  	struct svc_rqst	*rqstp;
9867d76ca16b3f Jeff Layton     2008-06-10  801  	struct task_struct *task;
11fd165c68b734 Eric Dumazet    2011-07-28  802  	int node;
3391fc92db8e76 NeilBrown       2024-09-16  803  	int err;
a74554429eada8 Greg Banks      2006-10-02  804  
12edd91f83c114 NeilBrown       2024-04-23  805  	node = svc_pool_map_get_node(pool->sp_id);
9e9ef581726b98 NeilBrown       2024-04-17  806  
12edd91f83c114 NeilBrown       2024-04-23  807  	rqstp = svc_prepare_thread(serv, pool, node);
59f3b138160d37 NeilBrown       2024-07-30  808  	if (!rqstp)
59f3b138160d37 NeilBrown       2024-07-30  809  		return -ENOMEM;
12edd91f83c114 NeilBrown       2024-04-23  810  	set_bit(SP_TASK_STARTING, &pool->sp_flags);
37902c63130902 Chuck Lever     2022-02-16  811  	task = kthread_create_on_node(serv->sv_threadfn, rqstp,
f170168b9a0b61 Kees Cook       2013-07-03  812  				      node, "%s", serv->sv_name);
9867d76ca16b3f Jeff Layton     2008-06-10  813  	if (IS_ERR(task)) {
12edd91f83c114 NeilBrown       2024-04-23  814  		clear_bit(SP_TASK_STARTING, &pool->sp_flags);
9867d76ca16b3f Jeff Layton     2008-06-10  815  		svc_exit_thread(rqstp);
9e0d87680d689f Trond Myklebust 2017-04-26  816  		return PTR_ERR(task);
a74554429eada8 Greg Banks      2006-10-02  817  	}
9e9ef581726b98 NeilBrown       2024-04-17  818  	serv->sv_nractual += 1;
12edd91f83c114 NeilBrown       2024-04-23  819  	pool->sp_nractual += 1;
9867d76ca16b3f Jeff Layton     2008-06-10  820  
9867d76ca16b3f Jeff Layton     2008-06-10  821  	rqstp->rq_task = task;
9867d76ca16b3f Jeff Layton     2008-06-10  822  	if (serv->sv_nrpools > 1)
12edd91f83c114 NeilBrown       2024-04-23  823  		svc_pool_map_set_cpumask(task, pool->sp_id);
9867d76ca16b3f Jeff Layton     2008-06-10  824  
9867d76ca16b3f Jeff Layton     2008-06-10  825  	svc_sock_update_bufs(serv);
9867d76ca16b3f Jeff Layton     2008-06-10  826  	wake_up_process(task);
3391fc92db8e76 NeilBrown       2024-09-16  827  
3391fc92db8e76 NeilBrown       2024-09-16 @828  		wait_var_event(&rqstp->rq_err, rqstp->rq_err != -EAGAIN);
3391fc92db8e76 NeilBrown       2024-09-16  829  		err = rqstp->rq_err;
3391fc92db8e76 NeilBrown       2024-09-16  830  		if (err) {
3391fc92db8e76 NeilBrown       2024-09-16  831  			svc_exit_thread(rqstp);
3391fc92db8e76 NeilBrown       2024-09-16  832  			return err;
3391fc92db8e76 NeilBrown       2024-09-16  833  		}
9e0d87680d689f Trond Myklebust 2017-04-26  834  	return 0;
a74554429eada8 Greg Banks      2006-10-02  835  }
12edd91f83c114 NeilBrown       2024-04-23  836  EXPORT_SYMBOL_GPL(svc_new_thread);
12edd91f83c114 NeilBrown       2024-04-23  837  

:::::: The code at line 828 was first introduced by commit
:::::: 3391fc92db8e761f1a2df5612fcb999dac6bc00a sunrpc: allow svc threads to fail initialisation cleanly

:::::: TO: NeilBrown <neilb@suse.de>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
