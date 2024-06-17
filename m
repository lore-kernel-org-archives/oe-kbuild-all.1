Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2686A33B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718638405; cv=none; b=q3/vS1pKzOhQpQzkHV9sOlLZyR+knm5p0g+Xuf4UZtCsYpVO80v6xyzUpz+8/PI9mM5/WvJUkb8GoUuGnPGNQgFqnXy19qs6QavRGodSbec4QJGcVny1/a6y5OpFpezL+k6d0XiT+NjsFaot3oQFG4GGigb0KTLbjVBVfEiRUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718638405; c=relaxed/simple;
	bh=NTVjHnYWRMGVG5F42I2SkAxmVTKUEXXnZmefxERR4/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tiyJKkpRhtQ9SeyqLvLfzLbsucTXwPKxn3CFJEA90vTGrr/9iYtx4OdqBW3plLPL/ReL5VrPwIYyeTyb1vl/76XV4HB/4UW4UPHGMbkrNDfZDlZOHaWJ7/xsIk0l1iKPp2o7Mjxmscan7g4pgqWU8iS+xuFh1PrurafwHxYB7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2jiEVHq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2jiEVHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718638403; x=1750174403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTVjHnYWRMGVG5F42I2SkAxmVTKUEXXnZmefxERR4/0=;
  b=A2jiEVHq50dFw/N0dUNQEd34a+6qlPjqxFAx2b2sGKM8+22PP/XN0sR6
   6W6mIkFBMSTaMZpQXm28fN5xaG3jGnn/A8IJJkXs2NNCwX7QJcP49S8k6
   l12EB2Bha1bDPfzwriWUVb+ylREwfwYeVbP1ICsqC5YJ6CT1QqPZIaezK
   JXFZ8I60WT50ItmlBSHDol+rhJBvzAw6ouzKv1uz7tQyE/tQAF6EuFXx0
   Sg/uGQsZUEW6qIZpuaTmZSOe43K41/1JqHJezTxLJEDHaKE/AlWHXunOJ
   XgY9YOFSjTo0iRREm6mhA/mr775vHkHgOnPS89fdse+k4Goopyg8vv7i5
   w==;
X-CSE-ConnectionGUID: LhjkBXleS+6yaW/qoqlGWQ==
X-CSE-MsgGUID: h71SpnnDTnGW9SPxgYVRcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15595144"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15595144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:33:16 -0700
X-CSE-ConnectionGUID: vrAB6pNXRKSHOP8qD1OkKw==
X-CSE-MsgGUID: pqlQ5ip1Ts25YMUkvnEWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41347141"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2024 08:33:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJEM4-0004d3-2t;
	Mon, 17 Jun 2024 15:33:12 +0000
Date: Mon, 17 Jun 2024 23:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Akiva Goldberger <agoldberger@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 26/31] drivers/infiniband/sw/rdmavt/cq.c:158:5:
 error: conflicting types for 'rvt_create_cq'
Message-ID: <202406172356.mX9RgIdb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   228d5e264b157f2582dfb178d5d3eead8e54bac8
commit: 4bb8d69af71cfb0981ff3d7b19882b030d000d5f [26/31] RDMA: Pass entire uverbs attr bundle to create cq function
config: x86_64-randconfig-002-20240617 (https://download.01.org/0day-ci/archive/20240617/202406172356.mX9RgIdb-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406172356.mX9RgIdb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406172356.mX9RgIdb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/sw/rdmavt/cq.c:158:5: error: conflicting types for 'rvt_create_cq'
    int rvt_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
        ^~~~~~~~~~~~~
   In file included from drivers/infiniband/sw/rdmavt/cq.c:8:
   drivers/infiniband/sw/rdmavt/cq.h:12:5: note: previous declaration of 'rvt_create_cq' was here
    int rvt_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
        ^~~~~~~~~~~~~
   drivers/infiniband/sw/rdmavt/cq.c: In function 'rvt_create_cq':
>> drivers/infiniband/sw/rdmavt/cq.c:161:33: error: dereferencing pointer to incomplete type 'struct uverbs_attr_bundle'
     struct ib_udata *udata = &attrs->driver_udata;
                                    ^~


vim +/rvt_create_cq +158 drivers/infiniband/sw/rdmavt/cq.c

cf16335a0ccf5a Dennis Dalessandro 2016-01-06  147  
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  148  /**
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  149   * rvt_create_cq - create a completion queue
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  150   * @ibcq: Allocated CQ
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  151   * @attr: creation attributes
4bb8d69af71cfb Akiva Goldberger   2024-05-15  152   * @attrs: uverbs bundle
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  153   *
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  154   * Called by ib_create_cq() in the generic verbs code.
90793f7179478d Dennis Dalessandro 2016-02-14  155   *
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  156   * Return: 0 on success
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  157   */
e39afe3d6dbd90 Leon Romanovsky    2019-05-28 @158  int rvt_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
4bb8d69af71cfb Akiva Goldberger   2024-05-15  159  		  struct uverbs_attr_bundle *attrs)
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  160  {
4bb8d69af71cfb Akiva Goldberger   2024-05-15 @161  	struct ib_udata *udata = &attrs->driver_udata;
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  162  	struct ib_device *ibdev = ibcq->device;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  163  	struct rvt_dev_info *rdi = ib_to_rvt(ibdev);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  164  	struct rvt_cq *cq = ibcq_to_rvtcq(ibcq);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  165  	struct rvt_cq_wc *u_wc = NULL;
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  166  	struct rvt_k_cq_wc *k_wc = NULL;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  167  	u32 sz;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  168  	unsigned int entries = attr->cqe;
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  169  	int comp_vector = attr->comp_vector;
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  170  	int err;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  171  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  172  	if (attr->flags)
1c407cb5d70568 Jason Gunthorpe    2020-10-03  173  		return -EOPNOTSUPP;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  174  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  175  	if (entries < 1 || entries > rdi->dparms.props.max_cqe)
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  176  		return -EINVAL;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  177  
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  178  	if (comp_vector < 0)
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  179  		comp_vector = 0;
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  180  
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  181  	comp_vector = comp_vector % rdi->ibdev.num_comp_vectors;
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  182  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  183  	/*
6f6387ae75c149 Dennis Dalessandro 2016-01-22  184  	 * Allocate the completion queue entries and head/tail pointers.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  185  	 * This is allocated separately so that it can be resized and
6f6387ae75c149 Dennis Dalessandro 2016-01-22  186  	 * also mapped into user space.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  187  	 * We need to use vmalloc() in order to support mmap and large
6f6387ae75c149 Dennis Dalessandro 2016-01-22  188  	 * numbers of entries.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  189  	 */
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  190  	if (udata && udata->outlen >= sizeof(__u64)) {
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  191  		sz = sizeof(struct ib_uverbs_wc) * (entries + 1);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  192  		sz += sizeof(*u_wc);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  193  		u_wc = vmalloc_user(sz);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  194  		if (!u_wc)
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  195  			return -ENOMEM;
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  196  	} else {
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  197  		sz = sizeof(struct ib_wc) * (entries + 1);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  198  		sz += sizeof(*k_wc);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  199  		k_wc = vzalloc_node(sz, rdi->dparms.node);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  200  		if (!k_wc)
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  201  			return -ENOMEM;
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  202  	}
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  203  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  204  	/*
6f6387ae75c149 Dennis Dalessandro 2016-01-22  205  	 * Return the address of the WC as the offset to mmap.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  206  	 * See rvt_mmap() for details.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  207  	 */
6f6387ae75c149 Dennis Dalessandro 2016-01-22  208  	if (udata && udata->outlen >= sizeof(__u64)) {
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  209  		cq->ip = rvt_create_mmap_info(rdi, sz, udata, u_wc);
47c370c1a5eea9 Sudip Mukherjee    2020-04-24  210  		if (IS_ERR(cq->ip)) {
47c370c1a5eea9 Sudip Mukherjee    2020-04-24  211  			err = PTR_ERR(cq->ip);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  212  			goto bail_wc;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  213  		}
6f6387ae75c149 Dennis Dalessandro 2016-01-22  214  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  215  		err = ib_copy_to_udata(udata, &cq->ip->offset,
6f6387ae75c149 Dennis Dalessandro 2016-01-22  216  				       sizeof(cq->ip->offset));
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  217  		if (err)
6f6387ae75c149 Dennis Dalessandro 2016-01-22  218  			goto bail_ip;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  219  	}
6f6387ae75c149 Dennis Dalessandro 2016-01-22  220  
6efaf10f163d9a Petr Mladek        2016-10-19  221  	spin_lock_irq(&rdi->n_cqs_lock);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  222  	if (rdi->n_cqs_allocated == rdi->dparms.props.max_cq) {
6efaf10f163d9a Petr Mladek        2016-10-19  223  		spin_unlock_irq(&rdi->n_cqs_lock);
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  224  		err = -ENOMEM;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  225  		goto bail_ip;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  226  	}
6f6387ae75c149 Dennis Dalessandro 2016-01-22  227  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  228  	rdi->n_cqs_allocated++;
6efaf10f163d9a Petr Mladek        2016-10-19  229  	spin_unlock_irq(&rdi->n_cqs_lock);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  230  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  231  	if (cq->ip) {
6f6387ae75c149 Dennis Dalessandro 2016-01-22  232  		spin_lock_irq(&rdi->pending_lock);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  233  		list_add(&cq->ip->pending_mmaps, &rdi->pending_mmaps);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  234  		spin_unlock_irq(&rdi->pending_lock);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  235  	}
6f6387ae75c149 Dennis Dalessandro 2016-01-22  236  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  237  	/*
6f6387ae75c149 Dennis Dalessandro 2016-01-22  238  	 * ib_create_cq() will initialize cq->ibcq except for cq->ibcq.cqe.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  239  	 * The number of entries should be >= the number requested or return
6f6387ae75c149 Dennis Dalessandro 2016-01-22  240  	 * an error.
6f6387ae75c149 Dennis Dalessandro 2016-01-22  241  	 */
6f6387ae75c149 Dennis Dalessandro 2016-01-22  242  	cq->rdi = rdi;
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  243  	if (rdi->driver_f.comp_vect_cpu_lookup)
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  244  		cq->comp_vector_cpu =
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  245  			rdi->driver_f.comp_vect_cpu_lookup(rdi, comp_vector);
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  246  	else
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  247  		cq->comp_vector_cpu =
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  248  			cpumask_first(cpumask_of_node(rdi->dparms.node));
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  249  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  250  	cq->ibcq.cqe = entries;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  251  	cq->notify = RVT_CQ_NONE;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  252  	spin_lock_init(&cq->lock);
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  253  	INIT_WORK(&cq->comptask, send_complete);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  254  	if (u_wc)
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  255  		cq->queue = u_wc;
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  256  	else
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  257  		cq->kqueue = k_wc;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  258  
5d18ee67d4c173 Sebastian Sanchez  2018-05-02  259  	trace_rvt_create_cq(cq, attr);
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  260  	return 0;
6f6387ae75c149 Dennis Dalessandro 2016-01-22  261  
6f6387ae75c149 Dennis Dalessandro 2016-01-22  262  bail_ip:
6f6387ae75c149 Dennis Dalessandro 2016-01-22  263  	kfree(cq->ip);
6f6387ae75c149 Dennis Dalessandro 2016-01-22  264  bail_wc:
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  265  	vfree(u_wc);
239b0e52d8aa64 Kamenee Arumugam   2019-06-28  266  	vfree(k_wc);
e39afe3d6dbd90 Leon Romanovsky    2019-05-28  267  	return err;
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  268  }
cf16335a0ccf5a Dennis Dalessandro 2016-01-06  269  

:::::: The code at line 158 was first introduced by commit
:::::: e39afe3d6dbd908d8fd189571a3c1561088a86c2 RDMA: Convert CQ allocations to be under core responsibility

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
