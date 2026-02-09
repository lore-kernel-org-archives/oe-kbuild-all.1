Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22245371063
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641993; cv=none; b=BS4AINSybKi42sbVcMSirzbbEEJvXs6qrLq+wkZTMv1Tsm1u0qVGHHUO8ScE6Zef+xATWejHvFMI1ONSXKl9WCpU6yToQqHOGGHHdh7AeNnNkXIDAZkpohXP+LSYBD2ZgH9C1qOYujevTM6+Gddq7R0q67eSi63IqPDrJcL8bdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641993; c=relaxed/simple;
	bh=+TrEZRZp7lrcavMR/h3FMeUf05gkmp5zueJwUFOMCF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tustYnpK+/nBhg+PRsJwcPzrN4wFp8AJYZokVVzeumSaHaSUAujo9x9IRk6iSo1EZNSCetF640oFiZkE4y1dI71dFD425esuPKDAhDGa4uylxAoZt6qdhJZlq/pz0sxUpaLOyep/lnjSJH/8VE/AStZY0vRoyR1zxuyG5P6Z0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTuTkjM4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTuTkjM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770641993; x=1802177993;
  h=date:from:to:cc:subject:message-id;
  bh=+TrEZRZp7lrcavMR/h3FMeUf05gkmp5zueJwUFOMCF4=;
  b=lTuTkjM4XqEkgCFHPhR5QIXTVlVvRogPEnwrqjz76apYBBLH3mWBLiAq
   5UQwIpgCOEM9PchwAErPfVJrzuQlRU03HQYFDP1pa8SBRR9Nqn3S6p+lv
   9XnenAGsxiM/6OPdkUKw9j+PbzThBZARXZV36hPZwmPCcUYfYHxzwDebh
   KE5Cl2oYr+qsL2gALRrP3G+LZJJibsQb5VSKzRAiHz/Z70rv06RHpPQ1O
   w3pWWcgjGDvAzCP76u5cnM9UNJz7TrZtZPthq8AJubZ3z/DgUl/hdEa4I
   FkUiCpE6Y3mlz39+6EAJIUVVk4FQY3RCHwDzTKd6kOseMaGFBMCWYeXRe
   g==;
X-CSE-ConnectionGUID: wkkAo8gCRp+VRQGg6WrTOA==
X-CSE-MsgGUID: XcQGl2RpSjWyu13TqImfng==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82392862"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82392862"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 04:59:52 -0800
X-CSE-ConnectionGUID: 0vAAKfzQQF+RTr0DOHXvuA==
X-CSE-MsgGUID: LGlz7HN9T4yrnKDH4B4Qig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215758114"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 04:59:51 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpQrk-000000000Dn-1LyU;
	Mon, 09 Feb 2026 12:59:48 +0000
Date: Mon, 09 Feb 2026 13:59:22 +0100
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:rdma_uapi 18/30]
 drivers/infiniband/hw/mlx4/qp.c:1058:24: warning: variable 'copy_len' set but
 not used
Message-ID: <202602091349.4IKM7MZq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux rdma_uapi
head:   261da2f1083ebea7794aa93ff7534b5cde499e7e
commit: 0cf9c65ecb684df137060cb8179949c1ccffacab [18/30] RDMA/mlx4: Use ib_copy_validate_udata_in()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260209/202602091349.4IKM7MZq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091349.4IKM7MZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091349.4IKM7MZq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/mlx4/qp.c: In function 'create_qp_common':
>> drivers/infiniband/hw/mlx4/qp.c:1058:24: warning: variable 'copy_len' set but not used [-Wunused-but-set-variable]
    1058 |                 size_t copy_len;
         |                        ^~~~~~~~


vim +/copy_len +1058 drivers/infiniband/hw/mlx4/qp.c

089b645d19b2de7 Leon Romanovsky    2019-07-04   980  
089b645d19b2de7 Leon Romanovsky    2019-07-04   981  static int create_qp_common(struct ib_pd *pd, struct ib_qp_init_attr *init_attr,
8900b894e769dd8 Leon Romanovsky    2017-05-23   982  			    struct ib_udata *udata, int sqpn,
8fd3cd2ae5a09ca Leon Romanovsky    2020-09-26   983  			    struct mlx4_ib_qp *qp)
225c7b1feef1b41 Roland Dreier      2007-05-08   984  {
089b645d19b2de7 Leon Romanovsky    2019-07-04   985  	struct mlx4_ib_dev *dev = to_mdev(pd->device);
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10   986  	int qpn;
225c7b1feef1b41 Roland Dreier      2007-05-08   987  	int err;
89944450547334a Shamir Rabinovitch 2019-02-07   988  	struct mlx4_ib_ucontext *context = rdma_udata_to_drv_context(
89944450547334a Shamir Rabinovitch 2019-02-07   989  		udata, struct mlx4_ib_ucontext, ibucontext);
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   990  	enum mlx4_ib_qp_type qp_type = (enum mlx4_ib_qp_type) init_attr->qp_type;
35f05dabf95ac3e Yishai Hadas       2015-02-08   991  	struct mlx4_ib_cq *mcq;
35f05dabf95ac3e Yishai Hadas       2015-02-08   992  	unsigned long flags;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   993  
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   994  	/* When tunneling special qps, we use a plain UD qp */
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   995  	if (sqpn) {
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   996  		if (mlx4_is_mfunc(dev->dev) &&
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   997  		    (!mlx4_is_master(dev->dev) ||
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   998  		     !(init_attr->create_flags & MLX4_IB_SRIOV_SQP))) {
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03   999  			if (init_attr->qp_type == IB_QPT_GSI)
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1000  				qp_type = MLX4_IB_QPT_PROXY_GSI;
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1001  			else {
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1002  				if (mlx4_is_master(dev->dev) ||
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1003  				    qp0_enabled_vf(dev->dev, sqpn))
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1004  					qp_type = MLX4_IB_QPT_PROXY_SMI_OWNER;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1005  				else
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1006  					qp_type = MLX4_IB_QPT_PROXY_SMI;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1007  			}
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1008  		}
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1009  		qpn = sqpn;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1010  		/* add extra sg entry for tunneling */
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1011  		init_attr->cap.max_recv_sge++;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1012  	} else if (init_attr->create_flags & MLX4_IB_SRIOV_TUNNEL_QP) {
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1013  		struct mlx4_ib_qp_tunnel_init_attr *tnl_init =
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1014  			container_of(init_attr,
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1015  				     struct mlx4_ib_qp_tunnel_init_attr, init_attr);
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1016  		if ((tnl_init->proxy_qp_type != IB_QPT_SMI &&
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1017  		     tnl_init->proxy_qp_type != IB_QPT_GSI)   ||
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1018  		    !mlx4_is_master(dev->dev))
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1019  			return -EINVAL;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1020  		if (tnl_init->proxy_qp_type == IB_QPT_GSI)
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1021  			qp_type = MLX4_IB_QPT_TUN_GSI;
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1022  		else if (tnl_init->slave == mlx4_master_func_num(dev->dev) ||
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1023  			 mlx4_vf_smi_enabled(dev->dev, tnl_init->slave,
99ec41d0a48cb6d Jack Morgenstein   2014-05-29  1024  					     tnl_init->port))
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1025  			qp_type = MLX4_IB_QPT_TUN_SMI_OWNER;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1026  		else
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1027  			qp_type = MLX4_IB_QPT_TUN_SMI;
47605df953985c2 Jack Morgenstein   2012-08-03  1028  		/* we are definitely in the PPF here, since we are creating
47605df953985c2 Jack Morgenstein   2012-08-03  1029  		 * tunnel QPs. base_tunnel_sqpn is therefore valid. */
47605df953985c2 Jack Morgenstein   2012-08-03  1030  		qpn = dev->dev->phys_caps.base_tunnel_sqpn + 8 * tnl_init->slave
47605df953985c2 Jack Morgenstein   2012-08-03  1031  			+ tnl_init->proxy_qp_type * 2 + tnl_init->port - 1;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1032  		sqpn = qpn;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1033  	}
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1034  
8fd3cd2ae5a09ca Leon Romanovsky    2020-09-26  1035  	if (init_attr->qp_type == IB_QPT_SMI ||
8fd3cd2ae5a09ca Leon Romanovsky    2020-09-26  1036  	    init_attr->qp_type == IB_QPT_GSI || qp_type == MLX4_IB_QPT_SMI ||
8fd3cd2ae5a09ca Leon Romanovsky    2020-09-26  1037  	    qp_type == MLX4_IB_QPT_GSI ||
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1038  	    (qp_type & (MLX4_IB_QPT_PROXY_SMI | MLX4_IB_QPT_PROXY_SMI_OWNER |
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1039  			MLX4_IB_QPT_PROXY_GSI | MLX4_IB_QPT_TUN_SMI_OWNER))) {
915ec7ed911493c Leon Romanovsky    2020-09-26  1040  		qp->sqp = kzalloc(sizeof(struct mlx4_ib_sqp), GFP_KERNEL);
8fd3cd2ae5a09ca Leon Romanovsky    2020-09-26  1041  		if (!qp->sqp)
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1042  			return -ENOMEM;
089b645d19b2de7 Leon Romanovsky    2019-07-04  1043  	}
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1044  
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1045  	qp->mlx4_ib_qp_type = qp_type;
225c7b1feef1b41 Roland Dreier      2007-05-08  1046  
225c7b1feef1b41 Roland Dreier      2007-05-08  1047  	spin_lock_init(&qp->sq.lock);
225c7b1feef1b41 Roland Dreier      2007-05-08  1048  	spin_lock_init(&qp->rq.lock);
fa417f7b520ee60 Eli Cohen          2010-10-24  1049  	INIT_LIST_HEAD(&qp->gid_list);
0ff1fb654bec0cf Hadar Hen Zion     2012-07-05  1050  	INIT_LIST_HEAD(&qp->steering_rules);
225c7b1feef1b41 Roland Dreier      2007-05-08  1051  
225c7b1feef1b41 Roland Dreier      2007-05-08  1052  	qp->state = IB_QPS_RESET;
ea54b10c7773007 Jack Morgenstein   2008-01-28  1053  	if (init_attr->sq_sig_type == IB_SIGNAL_ALL_WR)
ea54b10c7773007 Jack Morgenstein   2008-01-28  1054  		qp->sq_signal_bits = cpu_to_be32(MLX4_WQE_CTRL_CQ_UPDATE);
225c7b1feef1b41 Roland Dreier      2007-05-08  1055  
e00b64f7c54c4cb Shamir Rabinovitch 2018-12-17  1056  	if (udata) {
089b645d19b2de7 Leon Romanovsky    2019-07-04  1057  		struct mlx4_ib_create_qp ucmd;
400b1ebcfe31279 Guy Levi           2017-07-04 @1058  		size_t copy_len;
ed8637d3615b38b Guy Levi           2017-11-02  1059  		int shift;
ed8637d3615b38b Guy Levi           2017-11-02  1060  		int n;
400b1ebcfe31279 Guy Levi           2017-07-04  1061  
089b645d19b2de7 Leon Romanovsky    2019-07-04  1062  		copy_len = sizeof(struct mlx4_ib_create_qp);
225c7b1feef1b41 Roland Dreier      2007-05-08  1063  
0cf9c65ecb684df Jason Gunthorpe    2026-02-04  1064  		if (ib_copy_validate_udata_in(udata, ucmd, sq_no_prefetch)) {
225c7b1feef1b41 Roland Dreier      2007-05-08  1065  			err = -EFAULT;
225c7b1feef1b41 Roland Dreier      2007-05-08  1066  			goto err;
225c7b1feef1b41 Roland Dreier      2007-05-08  1067  		}
225c7b1feef1b41 Roland Dreier      2007-05-08  1068  
089b645d19b2de7 Leon Romanovsky    2019-07-04  1069  		qp->inl_recv_sz = ucmd.inl_recv_sz;
400b1ebcfe31279 Guy Levi           2017-07-04  1070  
6d06c9aa3816c26 Guy Levi           2018-03-15  1071  		if (init_attr->create_flags & IB_QP_CREATE_SCATTER_FCS) {
6d06c9aa3816c26 Guy Levi           2018-03-15  1072  			if (!(dev->dev->caps.flags &
6d06c9aa3816c26 Guy Levi           2018-03-15  1073  			      MLX4_DEV_CAP_FLAG_FCS_KEEP)) {
6d06c9aa3816c26 Guy Levi           2018-03-15  1074  				pr_debug("scatter FCS is unsupported\n");
6d06c9aa3816c26 Guy Levi           2018-03-15  1075  				err = -EOPNOTSUPP;
6d06c9aa3816c26 Guy Levi           2018-03-15  1076  				goto err;
6d06c9aa3816c26 Guy Levi           2018-03-15  1077  			}
6d06c9aa3816c26 Guy Levi           2018-03-15  1078  
6d06c9aa3816c26 Guy Levi           2018-03-15  1079  			qp->flags |= MLX4_IB_QP_SCATTER_FCS;
6d06c9aa3816c26 Guy Levi           2018-03-15  1080  		}
6d06c9aa3816c26 Guy Levi           2018-03-15  1081  
e00b64f7c54c4cb Shamir Rabinovitch 2018-12-17  1082  		err = set_rq_size(dev, &init_attr->cap, udata,
400b1ebcfe31279 Guy Levi           2017-07-04  1083  				  qp_has_rq(init_attr), qp, qp->inl_recv_sz);
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1084  		if (err)
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1085  			goto err;
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1086  
089b645d19b2de7 Leon Romanovsky    2019-07-04  1087  		qp->sq_no_prefetch = ucmd.sq_no_prefetch;
0e6e74162164d90 Roland Dreier      2007-06-18  1088  
089b645d19b2de7 Leon Romanovsky    2019-07-04  1089  		err = set_user_sq_size(dev, qp, &ucmd);
2446304dd687488 Eli Cohen          2007-05-17  1090  		if (err)
2446304dd687488 Eli Cohen          2007-05-17  1091  			goto err;
2446304dd687488 Eli Cohen          2007-05-17  1092  
c320e527e154830 Moni Shoua         2020-01-15  1093  		qp->umem =
c320e527e154830 Moni Shoua         2020-01-15  1094  			ib_umem_get(pd->device, ucmd.buf_addr, qp->buf_size, 0);
225c7b1feef1b41 Roland Dreier      2007-05-08  1095  		if (IS_ERR(qp->umem)) {
225c7b1feef1b41 Roland Dreier      2007-05-08  1096  			err = PTR_ERR(qp->umem);
225c7b1feef1b41 Roland Dreier      2007-05-08  1097  			goto err;
225c7b1feef1b41 Roland Dreier      2007-05-08  1098  		}
225c7b1feef1b41 Roland Dreier      2007-05-08  1099  
ed8637d3615b38b Guy Levi           2017-11-02  1100  		shift = mlx4_ib_umem_calc_optimal_mtt_size(qp->umem, 0, &n);
d31ba16c4331d1f Leon Romanovsky    2024-12-03  1101  		if (shift < 0) {
d31ba16c4331d1f Leon Romanovsky    2024-12-03  1102  			err = shift;
d31ba16c4331d1f Leon Romanovsky    2024-12-03  1103  			goto err_buf;
d31ba16c4331d1f Leon Romanovsky    2024-12-03  1104  		}
ed8637d3615b38b Guy Levi           2017-11-02  1105  
d31ba16c4331d1f Leon Romanovsky    2024-12-03  1106  		err = mlx4_mtt_init(dev->dev, n, shift, &qp->mtt);
225c7b1feef1b41 Roland Dreier      2007-05-08  1107  		if (err)
225c7b1feef1b41 Roland Dreier      2007-05-08  1108  			goto err_buf;
225c7b1feef1b41 Roland Dreier      2007-05-08  1109  
225c7b1feef1b41 Roland Dreier      2007-05-08  1110  		err = mlx4_ib_umem_write_mtt(dev, &qp->mtt, qp->umem);
225c7b1feef1b41 Roland Dreier      2007-05-08  1111  		if (err)
225c7b1feef1b41 Roland Dreier      2007-05-08  1112  			goto err_mtt;
225c7b1feef1b41 Roland Dreier      2007-05-08  1113  
0a1405da9952a72 Sean Hefty         2011-06-02  1114  		if (qp_has_rq(init_attr)) {
089b645d19b2de7 Leon Romanovsky    2019-07-04  1115  			err = mlx4_ib_db_map_user(udata, ucmd.db_addr, &qp->db);
225c7b1feef1b41 Roland Dreier      2007-05-08  1116  			if (err)
225c7b1feef1b41 Roland Dreier      2007-05-08  1117  				goto err_mtt;
02d89b87081f516 Roland Dreier      2007-05-23  1118  		}
f3301870161ca29 Moshe Shemesh      2017-06-21  1119  		qp->mqp.usage = MLX4_RES_USAGE_USER_VERBS;
225c7b1feef1b41 Roland Dreier      2007-05-08  1120  	} else {
e00b64f7c54c4cb Shamir Rabinovitch 2018-12-17  1121  		err = set_rq_size(dev, &init_attr->cap, udata,
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1122  				  qp_has_rq(init_attr), qp, 0);
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1123  		if (err)
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1124  			goto err;
ea30b966f7dd6bc Maor Gottlieb      2017-06-21  1125  
0e6e74162164d90 Roland Dreier      2007-06-18  1126  		qp->sq_no_prefetch = 0;
0e6e74162164d90 Roland Dreier      2007-06-18  1127  
b832be1e4007f4a Eli Cohen          2008-04-16  1128  		if (init_attr->create_flags & IB_QP_CREATE_IPOIB_UD_LSO)
b832be1e4007f4a Eli Cohen          2008-04-16  1129  			qp->flags |= MLX4_IB_QP_LSO;
b832be1e4007f4a Eli Cohen          2008-04-16  1130  
c1c98501121eefa Matan Barak        2013-11-07  1131  		if (init_attr->create_flags & IB_QP_CREATE_NETIF_QP) {
c1c98501121eefa Matan Barak        2013-11-07  1132  			if (dev->steering_support ==
c1c98501121eefa Matan Barak        2013-11-07  1133  			    MLX4_STEERING_MODE_DEVICE_MANAGED)
c1c98501121eefa Matan Barak        2013-11-07  1134  				qp->flags |= MLX4_IB_QP_NETIF;
f4e56ec4452f48b Leon Romanovsky    2021-10-12  1135  			else {
f4e56ec4452f48b Leon Romanovsky    2021-10-12  1136  				err = -EINVAL;
c1c98501121eefa Matan Barak        2013-11-07  1137  				goto err;
c1c98501121eefa Matan Barak        2013-11-07  1138  			}
f4e56ec4452f48b Leon Romanovsky    2021-10-12  1139  		}
c1c98501121eefa Matan Barak        2013-11-07  1140  
f95ccffc715bf0f Jack Morgenstein   2018-07-26  1141  		err = set_kernel_sq_size(dev, &init_attr->cap, qp_type, qp);
2446304dd687488 Eli Cohen          2007-05-17  1142  		if (err)
2446304dd687488 Eli Cohen          2007-05-17  1143  			goto err;
2446304dd687488 Eli Cohen          2007-05-17  1144  
0a1405da9952a72 Sean Hefty         2011-06-02  1145  		if (qp_has_rq(init_attr)) {
8900b894e769dd8 Leon Romanovsky    2017-05-23  1146  			err = mlx4_db_alloc(dev->dev, &qp->db, 0);
225c7b1feef1b41 Roland Dreier      2007-05-08  1147  			if (err)
225c7b1feef1b41 Roland Dreier      2007-05-08  1148  				goto err;
225c7b1feef1b41 Roland Dreier      2007-05-08  1149  
225c7b1feef1b41 Roland Dreier      2007-05-08  1150  			*qp->db.db = 0;
02d89b87081f516 Roland Dreier      2007-05-23  1151  		}
225c7b1feef1b41 Roland Dreier      2007-05-08  1152  
f95ccffc715bf0f Jack Morgenstein   2018-07-26  1153  		if (mlx4_buf_alloc(dev->dev, qp->buf_size,  PAGE_SIZE * 2,
8900b894e769dd8 Leon Romanovsky    2017-05-23  1154  				   &qp->buf)) {
225c7b1feef1b41 Roland Dreier      2007-05-08  1155  			err = -ENOMEM;
225c7b1feef1b41 Roland Dreier      2007-05-08  1156  			goto err_db;
225c7b1feef1b41 Roland Dreier      2007-05-08  1157  		}
225c7b1feef1b41 Roland Dreier      2007-05-08  1158  
225c7b1feef1b41 Roland Dreier      2007-05-08  1159  		err = mlx4_mtt_init(dev->dev, qp->buf.npages, qp->buf.page_shift,
225c7b1feef1b41 Roland Dreier      2007-05-08  1160  				    &qp->mtt);
225c7b1feef1b41 Roland Dreier      2007-05-08  1161  		if (err)
225c7b1feef1b41 Roland Dreier      2007-05-08  1162  			goto err_buf;
225c7b1feef1b41 Roland Dreier      2007-05-08  1163  
8900b894e769dd8 Leon Romanovsky    2017-05-23  1164  		err = mlx4_buf_write_mtt(dev->dev, &qp->mtt, &qp->buf);
225c7b1feef1b41 Roland Dreier      2007-05-08  1165  		if (err)
225c7b1feef1b41 Roland Dreier      2007-05-08  1166  			goto err_mtt;
225c7b1feef1b41 Roland Dreier      2007-05-08  1167  
e9105cdefbf64cd Li Dongyang        2017-08-16  1168  		qp->sq.wrid = kvmalloc_array(qp->sq.wqe_cnt,
e9105cdefbf64cd Li Dongyang        2017-08-16  1169  					     sizeof(u64), GFP_KERNEL);
e9105cdefbf64cd Li Dongyang        2017-08-16  1170  		qp->rq.wrid = kvmalloc_array(qp->rq.wqe_cnt,
e9105cdefbf64cd Li Dongyang        2017-08-16  1171  					     sizeof(u64), GFP_KERNEL);
225c7b1feef1b41 Roland Dreier      2007-05-08  1172  		if (!qp->sq.wrid || !qp->rq.wrid) {
225c7b1feef1b41 Roland Dreier      2007-05-08  1173  			err = -ENOMEM;
225c7b1feef1b41 Roland Dreier      2007-05-08  1174  			goto err_wrid;
225c7b1feef1b41 Roland Dreier      2007-05-08  1175  		}
f3301870161ca29 Moshe Shemesh      2017-06-21  1176  		qp->mqp.usage = MLX4_RES_USAGE_DRIVER;
225c7b1feef1b41 Roland Dreier      2007-05-08  1177  	}
225c7b1feef1b41 Roland Dreier      2007-05-08  1178  
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1179  	if (sqpn) {
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1180  		if (qp->mlx4_ib_qp_type & (MLX4_IB_QPT_PROXY_SMI_OWNER |
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1181  		    MLX4_IB_QPT_PROXY_SMI | MLX4_IB_QPT_PROXY_GSI)) {
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1182  			if (alloc_proxy_bufs(pd->device, qp)) {
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1183  				err = -ENOMEM;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1184  				goto err_wrid;
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1185  			}
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1186  		}
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1187  	} else {
ddae0349fdb78bc Eugenia Emantayev  2014-12-11  1188  		/* Raw packet QPNs may not have bits 6,7 set in their qp_num;
ddae0349fdb78bc Eugenia Emantayev  2014-12-11  1189  		 * otherwise, the WQE BlueFlame setup flow wrongly causes
ddae0349fdb78bc Eugenia Emantayev  2014-12-11  1190  		 * VLAN insertion. */
3987a2d3193cf26 Or Gerlitz         2012-01-17  1191  		if (init_attr->qp_type == IB_QPT_RAW_PACKET)
ddae0349fdb78bc Eugenia Emantayev  2014-12-11  1192  			err = mlx4_qp_reserve_range(dev->dev, 1, 1, &qpn,
d57febe1a47801e Matan Barak        2014-12-11  1193  						    (init_attr->cap.max_send_wr ?
d57febe1a47801e Matan Barak        2014-12-11  1194  						     MLX4_RESERVE_ETH_BF_QP : 0) |
d57febe1a47801e Matan Barak        2014-12-11  1195  						    (init_attr->cap.max_recv_wr ?
f3301870161ca29 Moshe Shemesh      2017-06-21  1196  						     MLX4_RESERVE_A0_QP : 0),
f3301870161ca29 Moshe Shemesh      2017-06-21  1197  						    qp->mqp.usage);
3987a2d3193cf26 Or Gerlitz         2012-01-17  1198  		else
c1c98501121eefa Matan Barak        2013-11-07  1199  			if (qp->flags & MLX4_IB_QP_NETIF)
c1c98501121eefa Matan Barak        2013-11-07  1200  				err = mlx4_ib_steer_qp_alloc(dev, 1, &qpn);
c1c98501121eefa Matan Barak        2013-11-07  1201  			else
c1c98501121eefa Matan Barak        2013-11-07  1202  				err = mlx4_qp_reserve_range(dev->dev, 1, 1,
f3301870161ca29 Moshe Shemesh      2017-06-21  1203  							    &qpn, 0, qp->mqp.usage);
225c7b1feef1b41 Roland Dreier      2007-05-08  1204  		if (err)
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1205  			goto err_proxy;
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1206  	}
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1207  
fbfb6625ea2d1bd Eran Ben Elisha    2015-10-15  1208  	if (init_attr->create_flags & IB_QP_CREATE_BLOCK_MULTICAST_LOOPBACK)
fbfb6625ea2d1bd Eran Ben Elisha    2015-10-15  1209  		qp->flags |= MLX4_IB_QP_BLOCK_MULTICAST_LOOPBACK;
fbfb6625ea2d1bd Eran Ben Elisha    2015-10-15  1210  
8900b894e769dd8 Leon Romanovsky    2017-05-23  1211  	err = mlx4_qp_alloc(dev->dev, qpn, &qp->mqp);
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1212  	if (err)
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1213  		goto err_qpn;
225c7b1feef1b41 Roland Dreier      2007-05-08  1214  
0a1405da9952a72 Sean Hefty         2011-06-02  1215  	if (init_attr->qp_type == IB_QPT_XRC_TGT)
0a1405da9952a72 Sean Hefty         2011-06-02  1216  		qp->mqp.qpn |= (1 << 23);
0a1405da9952a72 Sean Hefty         2011-06-02  1217  
225c7b1feef1b41 Roland Dreier      2007-05-08  1218  	/*
225c7b1feef1b41 Roland Dreier      2007-05-08  1219  	 * Hardware wants QPN written in big-endian order (after
225c7b1feef1b41 Roland Dreier      2007-05-08  1220  	 * shifting) for send doorbell.  Precompute this value to save
225c7b1feef1b41 Roland Dreier      2007-05-08  1221  	 * a little bit when posting sends.
225c7b1feef1b41 Roland Dreier      2007-05-08  1222  	 */
225c7b1feef1b41 Roland Dreier      2007-05-08  1223  	qp->doorbell_qpn = swab32(qp->mqp.qpn << 8);
225c7b1feef1b41 Roland Dreier      2007-05-08  1224  
089b645d19b2de7 Leon Romanovsky    2019-07-04  1225  	qp->mqp.event = mlx4_ib_qp_event;
400b1ebcfe31279 Guy Levi           2017-07-04  1226  
35f05dabf95ac3e Yishai Hadas       2015-02-08  1227  	spin_lock_irqsave(&dev->reset_flow_resource_lock, flags);
35f05dabf95ac3e Yishai Hadas       2015-02-08  1228  	mlx4_ib_lock_cqs(to_mcq(init_attr->send_cq),
35f05dabf95ac3e Yishai Hadas       2015-02-08  1229  			 to_mcq(init_attr->recv_cq));
35f05dabf95ac3e Yishai Hadas       2015-02-08  1230  	/* Maintain device to QPs access, needed for further handling
35f05dabf95ac3e Yishai Hadas       2015-02-08  1231  	 * via reset flow
35f05dabf95ac3e Yishai Hadas       2015-02-08  1232  	 */
35f05dabf95ac3e Yishai Hadas       2015-02-08  1233  	list_add_tail(&qp->qps_list, &dev->qp_list);
35f05dabf95ac3e Yishai Hadas       2015-02-08  1234  	/* Maintain CQ to QPs access, needed for further handling
35f05dabf95ac3e Yishai Hadas       2015-02-08  1235  	 * via reset flow
35f05dabf95ac3e Yishai Hadas       2015-02-08  1236  	 */
35f05dabf95ac3e Yishai Hadas       2015-02-08  1237  	mcq = to_mcq(init_attr->send_cq);
35f05dabf95ac3e Yishai Hadas       2015-02-08  1238  	list_add_tail(&qp->cq_send_list, &mcq->send_qp_list);
35f05dabf95ac3e Yishai Hadas       2015-02-08  1239  	mcq = to_mcq(init_attr->recv_cq);
35f05dabf95ac3e Yishai Hadas       2015-02-08  1240  	list_add_tail(&qp->cq_recv_list, &mcq->recv_qp_list);
35f05dabf95ac3e Yishai Hadas       2015-02-08  1241  	mlx4_ib_unlock_cqs(to_mcq(init_attr->send_cq),
35f05dabf95ac3e Yishai Hadas       2015-02-08  1242  			   to_mcq(init_attr->recv_cq));
35f05dabf95ac3e Yishai Hadas       2015-02-08  1243  	spin_unlock_irqrestore(&dev->reset_flow_resource_lock, flags);
225c7b1feef1b41 Roland Dreier      2007-05-08  1244  	return 0;
225c7b1feef1b41 Roland Dreier      2007-05-08  1245  
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1246  err_qpn:
c1c98501121eefa Matan Barak        2013-11-07  1247  	if (!sqpn) {
c1c98501121eefa Matan Barak        2013-11-07  1248  		if (qp->flags & MLX4_IB_QP_NETIF)
c1c98501121eefa Matan Barak        2013-11-07  1249  			mlx4_ib_steer_qp_free(dev, qpn, 1);
c1c98501121eefa Matan Barak        2013-11-07  1250  		else
a3cdcbfa8fb1fcc Yevgeny Petrilin   2008-10-10  1251  			mlx4_qp_release_range(dev->dev, qpn, 1);
c1c98501121eefa Matan Barak        2013-11-07  1252  	}
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1253  err_proxy:
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1254  	if (qp->mlx4_ib_qp_type == MLX4_IB_QPT_PROXY_GSI)
1ffeb2eb8be9936 Jack Morgenstein   2012-08-03  1255  		free_proxy_bufs(pd->device, qp);
225c7b1feef1b41 Roland Dreier      2007-05-08  1256  err_wrid:
e00b64f7c54c4cb Shamir Rabinovitch 2018-12-17  1257  	if (udata) {
0a1405da9952a72 Sean Hefty         2011-06-02  1258  		if (qp_has_rq(init_attr))
89944450547334a Shamir Rabinovitch 2019-02-07  1259  			mlx4_ib_db_unmap_user(context, &qp->db);
23f1b38481596ad Roland Dreier      2007-07-20  1260  	} else {
0ef2f05c7e02ff9 Wengang Wang       2015-10-08  1261  		kvfree(qp->sq.wrid);
0ef2f05c7e02ff9 Wengang Wang       2015-10-08  1262  		kvfree(qp->rq.wrid);
225c7b1feef1b41 Roland Dreier      2007-05-08  1263  	}
225c7b1feef1b41 Roland Dreier      2007-05-08  1264  
225c7b1feef1b41 Roland Dreier      2007-05-08  1265  err_mtt:
225c7b1feef1b41 Roland Dreier      2007-05-08  1266  	mlx4_mtt_cleanup(dev->dev, &qp->mtt);
225c7b1feef1b41 Roland Dreier      2007-05-08  1267  
225c7b1feef1b41 Roland Dreier      2007-05-08  1268  err_buf:
836a0fbb3e76f70 Leon Romanovsky    2019-06-16  1269  	if (!qp->umem)
225c7b1feef1b41 Roland Dreier      2007-05-08  1270  		mlx4_buf_free(dev->dev, qp->buf_size, &qp->buf);
836a0fbb3e76f70 Leon Romanovsky    2019-06-16  1271  	ib_umem_release(qp->umem);
225c7b1feef1b41 Roland Dreier      2007-05-08  1272  
225c7b1feef1b41 Roland Dreier      2007-05-08  1273  err_db:
e00b64f7c54c4cb Shamir Rabinovitch 2018-12-17  1274  	if (!udata && qp_has_rq(init_attr))
6296883ca4cd52d Yevgeny Petrilin   2008-04-23  1275  		mlx4_db_free(dev->dev, &qp->db);
225c7b1feef1b41 Roland Dreier      2007-05-08  1276  
225c7b1feef1b41 Roland Dreier      2007-05-08  1277  err:
915ec7ed911493c Leon Romanovsky    2020-09-26  1278  	kfree(qp->sqp);
225c7b1feef1b41 Roland Dreier      2007-05-08  1279  	return err;
225c7b1feef1b41 Roland Dreier      2007-05-08  1280  }
225c7b1feef1b41 Roland Dreier      2007-05-08  1281  

:::::: The code at line 1058 was first introduced by commit
:::::: 400b1ebcfe31279895f1baa8ecaa390d9a4a0eef IB/mlx4: Add support for WQ related verbs

:::::: TO: Guy Levi <guyle@mellanox.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
