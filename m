Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412A928E11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694702923; x=1726238923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tz+rIxsxx3MDqH1qYBZsjFW4O4ozJi079T7nGCAnSBE=;
  b=ClQIYENEG+tiTD1lCaJvX5ao51FTyZquqpeGEXF+zNdsN2et4H0KbOiA
   9VqkJb8xlqeECFZx31ZpIm0KmWgB9IhGbnucehytkiLgbbDmf9Qcy+1Cv
   /Dki80aVzoKhhsGm4aD7aHDr7IewvZ04NLSxOTnVa1BNn160eQuSctLtX
   ptWlOlYpCgV54T1R0e0vjXvYt4k/5aatMENrVU0+0HZQlnAr3iKlXhILD
   t0wduIetXe/1uVvfwfnskoz1ftJOFqjdjTkL1b5bsbTc4nZ4AzAVZxmt4
   7BEtziIWDHdK3LFZeuMIMkxDsp2gv52KArKB3k+gF64ooatgeNDSt3E1P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="443019721"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="443019721"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 07:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991414623"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="991414623"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2023 07:45:10 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgnae-0001hj-36;
	Thu, 14 Sep 2023 14:45:08 +0000
Date: Thu, 14 Sep 2023 22:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-cleanup 3/13]
 drivers/infiniband/hw/hfi1/file_ops.c:270:18: error: 'struct iov_iter' has
 no member named 'user_backed'
Message-ID: <202309142228.CoyvboON-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-cleanup
head:   bbca19708859dff75c7d28b9cb73f114497d6f60
commit: 4336b89e6c0cbdd1ef25bb321f105f066d462e25 [3/13] iov_iter: Derive user-backedness from the iterator type
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230914/202309142228.CoyvboON-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309142228.CoyvboON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309142228.CoyvboON-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/infiniband/hw/hfi1/file_ops.c: In function 'hfi1_write_iter':
>> drivers/infiniband/hw/hfi1/file_ops.c:270:18: error: 'struct iov_iter' has no member named 'user_backed'
     270 |         if (!from->user_backed)
         |                  ^~
--
   drivers/infiniband/hw/qib/qib_file_ops.c: In function 'qib_write_iter':
>> drivers/infiniband/hw/qib/qib_file_ops.c:2247:18: error: 'struct iov_iter' has no member named 'user_backed'
    2247 |         if (!from->user_backed || !from->nr_segs || !pq)
         |                  ^~


vim +270 drivers/infiniband/hw/hfi1/file_ops.c

8d970cf991a6c3 drivers/staging/rdma/hfi1/file_ops.c  Dennis Dalessandro 2016-05-19  258  
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  259  static ssize_t hfi1_write_iter(struct kiocb *kiocb, struct iov_iter *from)
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  260  {
9e10af4787ac51 drivers/staging/rdma/hfi1/file_ops.c  Ira Weiny          2015-10-30  261  	struct hfi1_filedata *fd = kiocb->ki_filp->private_data;
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  262  	struct hfi1_user_sdma_pkt_q *pq;
9e10af4787ac51 drivers/staging/rdma/hfi1/file_ops.c  Ira Weiny          2015-10-30  263  	struct hfi1_user_sdma_comp_q *cq = fd->cq;
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  264  	int done = 0, reqs = 0;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  265  	unsigned long dim = from->nr_segs;
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  266  	int idx;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  267  
629e052d0c98e4 drivers/infiniband/hw/hfi1/file_ops.c Douglas Miller     2022-05-20  268  	if (!HFI1_CAP_IS_KSET(SDMA))
629e052d0c98e4 drivers/infiniband/hw/hfi1/file_ops.c Douglas Miller     2022-05-20  269  		return -EINVAL;
23ecdcd0c070e2 drivers/infiniband/hw/hfi1/file_ops.c Jens Axboe         2023-03-28 @270  	if (!from->user_backed)
23ecdcd0c070e2 drivers/infiniband/hw/hfi1/file_ops.c Jens Axboe         2023-03-28  271  		return -EINVAL;
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  272  	idx = srcu_read_lock(&fd->pq_srcu);
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  273  	pq = srcu_dereference(fd->pq, &fd->pq_srcu);
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  274  	if (!cq || !pq) {
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  275  		srcu_read_unlock(&fd->pq_srcu, idx);
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  276  		return -EIO;
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  277  	}
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  278  
34ab4de77fe512 drivers/infiniband/hw/hfi1/file_ops.c Michael J. Ruhl    2017-08-28  279  	trace_hfi1_sdma_request(fd->dd, fd->uctxt->ctxt, fd->subctxt, dim);
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  280  
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  281  	if (atomic_read(&pq->n_reqs) == pq->n_max_reqs) {
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  282  		srcu_read_unlock(&fd->pq_srcu, idx);
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  283  		return -ENOSPC;
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  284  	}
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  285  
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  286  	while (dim) {
de4f5fed3f231a drivers/infiniband/hw/hfi1/file_ops.c Jens Axboe         2023-03-29  287  		const struct iovec *iov = iter_iov(from);
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  288  		int ret;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  289  		unsigned long count = 0;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  290  
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  291  		ret = hfi1_user_sdma_process_request(
de4f5fed3f231a drivers/infiniband/hw/hfi1/file_ops.c Jens Axboe         2023-03-29  292  			fd, (struct iovec *)(iov + done),
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  293  			dim, &count);
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  294  		if (ret) {
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  295  			reqs = ret;
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  296  			break;
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  297  		}
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  298  		dim -= count;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  299  		done += count;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  300  		reqs++;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  301  	}
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  302  
be8638344c70bf drivers/infiniband/hw/hfi1/file_ops.c Mike Marciniszyn   2020-02-10  303  	srcu_read_unlock(&fd->pq_srcu, idx);
0904f32796d4bb drivers/infiniband/hw/hfi1/file_ops.c Ira Weiny          2016-07-01  304  	return reqs;
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  305  }
7724105686e718 drivers/staging/rdma/hfi1/file_ops.c  Mike Marciniszyn   2015-07-30  306  

:::::: The code at line 270 was first introduced by commit
:::::: 23ecdcd0c070e200f52b58e131af2b276b3d800e IB/hfi1: check for user backed iterator, not specific iterator type

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
