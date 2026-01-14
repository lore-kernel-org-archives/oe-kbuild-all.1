Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2809378D79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374827; cv=none; b=igsWzrupo5kGOdwPla/k0N65qXBF+IFbPeOmIcyo0XxkGUKzCbAUe9jLPybL6ZHnMR+zrCYjvepyyKnQz1dYvAyXbvOC46eBA4uluZSKYE7p7VOQ2RJbwEJFL6lAMmb7/CfMa9ahKXtTKn4FlUrXjVH6ilVy0MReZxPJuclLEw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374827; c=relaxed/simple;
	bh=hS8Nd12LdPbWmKjkDXTkYHNjZEeKyXjt1SlFCHAXxAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fih2mCNc0bXG+NJqTl+zWJ272WwUptI40+sKiyRz3iBpcMG7e34uDfJfsFRo0FSSlEQOB2HHPEYCmgHcfzUokuS6+L67NogcDFaGlWBAPLrvMYJZB1s00BcDowNQVUnQNflMEYMMECAM6IbmYW2byq9wkeOcHWE7URP/hzKgoHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGu5Y0mK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGu5Y0mK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374813; x=1799910813;
  h=date:from:to:cc:subject:message-id;
  bh=hS8Nd12LdPbWmKjkDXTkYHNjZEeKyXjt1SlFCHAXxAM=;
  b=TGu5Y0mKNTLMybaM8uRCs73ypJrnitIchPxKdHUQksdlB141r+2hDm1N
   fYVvcYjw4vPJ3BP3ETRrGxK7g98gbgKli64qKKa9C8X0WU7Sj3dhs6IDv
   +OXjOvR8YbU1mJkd4wIbACMd747bhrB5CaX5N04Qk/sj0jI2LvzcIxqa3
   YiIxKK+lr257v80eo0FpQNDKG+r7boIwygGU9sMvD0JoQfgaqeAj6ZVLe
   2iOjpcbtX38e3b36YAlyAhVc7mFYQzdLZC/9KzTiouNODJTq/OSVPg63K
   12GoBP7b04ZWrNtMKnAdTBjpEgcftDdMYrJIvppILrRn3CUKJDhIG/JcU
   A==;
X-CSE-ConnectionGUID: z1yBU0zjQcWr2t4uKSM/dg==
X-CSE-MsgGUID: +mj2o8FpQ5aLkXZaIPw1qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69403877"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69403877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:13:22 -0800
X-CSE-ConnectionGUID: gPFjhuMXSmyh7OM3Q4LhGg==
X-CSE-MsgGUID: l2pY3wTIT4qfh93MEdk1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235851872"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 23:13:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfv4A-00000000Fye-08cb;
	Wed, 14 Jan 2026 07:13:18 +0000
Date: Wed, 14 Jan 2026 15:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 12/14] net/rds/ib_cm.c:96:35: sparse:
 sparse: incorrect type in argument 1 (different modifiers)
Message-ID: <202601141546.GCQHsj5y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   576d8a7a985dde4f51a4561dddc0d8734494d3de
commit: e04a494143bab7ea804fe1ebe286701ee8288e4a [12/14] vdso: Switch get/put_unaligned() from packed struct to memcpy()
config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141546.GCQHsj5y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141546.GCQHsj5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141546.GCQHsj5y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/rds/ib_cm.c:96:35: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   net/rds/ib_cm.c:96:35: sparse:     expected void *
   net/rds/ib_cm.c:96:35: sparse:     got restricted __be64 const *
   net/rds/ib_cm.c:103:27: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   net/rds/ib_cm.c:103:27: sparse:     expected void *
   net/rds/ib_cm.c:103:27: sparse:     got restricted __be64 const *

vim +96 net/rds/ib_cm.c

ec16227e14141e4 Andy Grover                  2009-02-24   69  
ec16227e14141e4 Andy Grover                  2009-02-24   70  /*
ec16227e14141e4 Andy Grover                  2009-02-24   71   * Connection established.
ec16227e14141e4 Andy Grover                  2009-02-24   72   * We get here for both outgoing and incoming connection.
ec16227e14141e4 Andy Grover                  2009-02-24   73   */
ec16227e14141e4 Andy Grover                  2009-02-24   74  void rds_ib_cm_connect_complete(struct rds_connection *conn, struct rdma_cm_event *event)
ec16227e14141e4 Andy Grover                  2009-02-24   75  {
ec16227e14141e4 Andy Grover                  2009-02-24   76  	struct rds_ib_connection *ic = conn->c_transport_data;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   77  	const union rds_ib_conn_priv *dp = NULL;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   78  	__be64 ack_seq = 0;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   79  	__be32 credit = 0;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   80  	u8 major = 0;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   81  	u8 minor = 0;
ec16227e14141e4 Andy Grover                  2009-02-24   82  	int err;
ec16227e14141e4 Andy Grover                  2009-02-24   83  
ec16227e14141e4 Andy Grover                  2009-02-24   84  	dp = event->param.conn.private_data;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   85  	if (conn->c_isv6) {
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   86  		if (event->param.conn.private_data_len >=
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   87  		    sizeof(struct rds6_ib_connect_private)) {
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   88  			major = dp->ricp_v6.dp_protocol_major;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   89  			minor = dp->ricp_v6.dp_protocol_minor;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   90  			credit = dp->ricp_v6.dp_credit;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   91  			/* dp structure start is not guaranteed to be 8 bytes
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   92  			 * aligned.  Since dp_ack_seq is 64-bit extended load
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   93  			 * operations can be used so go through get_unaligned
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   94  			 * to avoid unaligned errors.
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   95  			 */
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  @96  			ack_seq = get_unaligned(&dp->ricp_v6.dp_ack_seq);
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   97  		}
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   98  	} else if (event->param.conn.private_data_len >=
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23   99  		   sizeof(struct rds_ib_connect_private)) {
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  100  		major = dp->ricp_v4.dp_protocol_major;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  101  		minor = dp->ricp_v4.dp_protocol_minor;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  102  		credit = dp->ricp_v4.dp_credit;
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  103  		ack_seq = get_unaligned(&dp->ricp_v4.dp_ack_seq);
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  104  	}
ec16227e14141e4 Andy Grover                  2009-02-24  105  
02a6a2592e41d27 Andy Grover                  2009-07-17  106  	/* make sure it isn't empty data */
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  107  	if (major) {
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  108  		rds_ib_set_protocol(conn, RDS_PROTOCOL(major, minor));
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  109  		rds_ib_set_flow_control(conn, be32_to_cpu(credit));
02a6a2592e41d27 Andy Grover                  2009-07-17  110  	}
ec16227e14141e4 Andy Grover                  2009-02-24  111  
cdc306a5c9cd360 Santosh Shilimkar            2018-10-13  112  	if (conn->c_version < RDS_PROTOCOL_VERSION) {
cdc306a5c9cd360 Santosh Shilimkar            2018-10-13  113  		if (conn->c_version != RDS_PROTOCOL_COMPAT_VERSION) {
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  114  			pr_notice("RDS/IB: Connection <%pI6c,%pI6c> version %u.%u no longer supported\n",
ff3f19a2f608ee4 Santosh Shilimkar            2016-03-14  115  				  &conn->c_laddr, &conn->c_faddr,
f147dd9ecabf23f Andy Grover                  2010-01-13  116  				  RDS_PROTOCOL_MAJOR(conn->c_version),
f147dd9ecabf23f Andy Grover                  2010-01-13  117  				  RDS_PROTOCOL_MINOR(conn->c_version));
f147dd9ecabf23f Andy Grover                  2010-01-13  118  			rds_conn_destroy(conn);
f147dd9ecabf23f Andy Grover                  2010-01-13  119  			return;
cdc306a5c9cd360 Santosh Shilimkar            2018-10-13  120  		}
cdc306a5c9cd360 Santosh Shilimkar            2018-10-13  121  	}
cdc306a5c9cd360 Santosh Shilimkar            2018-10-13  122  
fd261ce6a30e01a Santosh Shilimkar            2018-10-13  123  	pr_notice("RDS/IB: %s conn connected <%pI6c,%pI6c,%d> version %u.%u%s\n",
581d53c91cbf7b3 Santosh Shilimkar            2016-07-09  124  		  ic->i_active_side ? "Active" : "Passive",
fd261ce6a30e01a Santosh Shilimkar            2018-10-13  125  		  &conn->c_laddr, &conn->c_faddr, conn->c_tos,
ec16227e14141e4 Andy Grover                  2009-02-24  126  		  RDS_PROTOCOL_MAJOR(conn->c_version),
ec16227e14141e4 Andy Grover                  2009-02-24  127  		  RDS_PROTOCOL_MINOR(conn->c_version),
ec16227e14141e4 Andy Grover                  2009-02-24  128  		  ic->i_flowctl ? ", flow control" : "");
ec16227e14141e4 Andy Grover                  2009-02-24  129  
e0e6d062822529d Zhu Yanjun                   2019-08-23  130  	/* receive sl from the peer */
e0e6d062822529d Zhu Yanjun                   2019-08-23  131  	ic->i_sl = ic->i_cm_id->route.path_rec->sl;
e0e6d062822529d Zhu Yanjun                   2019-08-23  132  
cf657269d311d57 Santosh Shilimkar            2016-09-29  133  	atomic_set(&ic->i_cq_quiesce, 0);
cf657269d311d57 Santosh Shilimkar            2016-09-29  134  
581d53c91cbf7b3 Santosh Shilimkar            2016-07-09  135  	/* Init rings and fill recv. this needs to wait until protocol
581d53c91cbf7b3 Santosh Shilimkar            2016-07-09  136  	 * negotiation is complete, since ring layout is different
581d53c91cbf7b3 Santosh Shilimkar            2016-07-09  137  	 * from 3.1 to 4.1.
e11d912a7dd4dfe Andy Grover                  2009-07-17  138  	 */
e11d912a7dd4dfe Andy Grover                  2009-07-17  139  	rds_ib_send_init_ring(ic);
e11d912a7dd4dfe Andy Grover                  2009-07-17  140  	rds_ib_recv_init_ring(ic);
e11d912a7dd4dfe Andy Grover                  2009-07-17  141  	/* Post receive buffers - as a side effect, this will update
e11d912a7dd4dfe Andy Grover                  2009-07-17  142  	 * the posted credit count. */
73ce4317bf98328 santosh.shilimkar@oracle.com 2015-08-22  143  	rds_ib_recv_refill(conn, 1, GFP_KERNEL);
e11d912a7dd4dfe Andy Grover                  2009-07-17  144  
3e0249f9c05cb77 Zach Brown                   2010-05-18  145  	/* update ib_device with this local ipaddr */
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  146  	err = rds_ib_update_ipaddr(ic->rds_ibdev, &conn->c_laddr);
ec16227e14141e4 Andy Grover                  2009-02-24  147  	if (err)
3e0249f9c05cb77 Zach Brown                   2010-05-18  148  		printk(KERN_ERR "rds_ib_update_ipaddr failed (%d)\n",
3e0249f9c05cb77 Zach Brown                   2010-05-18  149  			err);
ec16227e14141e4 Andy Grover                  2009-02-24  150  
ec16227e14141e4 Andy Grover                  2009-02-24  151  	/* If the peer gave us the last packet it saw, process this as if
ec16227e14141e4 Andy Grover                  2009-02-24  152  	 * we had received a regular ACK. */
c0adf54a10903b5 shamir rabinovitch           2015-04-30  153  	if (dp) {
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  154  		if (ack_seq)
eee2fa6ab322519 Ka-Cheong Poon               2018-07-23  155  			rds_send_drop_acked(conn, be64_to_cpu(ack_seq),
c0adf54a10903b5 shamir rabinovitch           2015-04-30  156  					    NULL);
c0adf54a10903b5 shamir rabinovitch           2015-04-30  157  	}
ec16227e14141e4 Andy Grover                  2009-02-24  158  
cdc306a5c9cd360 Santosh Shilimkar            2018-10-13  159  	conn->c_proposed_version = conn->c_version;
ec16227e14141e4 Andy Grover                  2009-02-24  160  	rds_connect_complete(conn);
ec16227e14141e4 Andy Grover                  2009-02-24  161  }
ec16227e14141e4 Andy Grover                  2009-02-24  162  

:::::: The code at line 96 was first introduced by commit
:::::: eee2fa6ab3225192d6d894c54a6fb02ac9efdff6 rds: Changing IP address internal representation to struct in6_addr

:::::: TO: Ka-Cheong Poon <ka-cheong.poon@oracle.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
