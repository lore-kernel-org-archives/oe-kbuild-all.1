Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BA8221D82
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 16:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440412; cv=none; b=G4iL0WgtcSjTqwIig2yzrePzHp1AJiej+acEpCqAanYl9z2FQMitxKDL2s5Up4ZZHsh+9YwrZADmoBvXiB7E4ZO9+TUltKgochQwVo/jyYApjb/qmYHR3Mbwl7XrB67Vtfbrh+QFWQskYqZ6qKOmIPWyyBqZVIRU7W6oEDmZPWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440412; c=relaxed/simple;
	bh=/lcnNqhNbRvXFbf7xisZ7JSLfOgLMR0j+LiM0kQJMMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOjDFCmMubOMjeRQpMCmb4LQEEuFJTiiJtcmftBtcUnSkp52pZUhey0Fxn/JLWXy1Wyp1HAkQ3Z4PMwdjuihnTLqni4bXoEvCZraqe1uc7vnF6rXvl75wB7JBMNRwYSDvKMwH+nz+AAfxFWwXanRbD/10TzUIKf6a/NjUETNgyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGUdQ8HJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGUdQ8HJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736440410; x=1767976410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lcnNqhNbRvXFbf7xisZ7JSLfOgLMR0j+LiM0kQJMMU=;
  b=bGUdQ8HJH4xrdqc9AEBAO6bR1hX4psKgsdwwzPPL9Q3PLSid4xZwNYNw
   xyA/SRjetbz0O8N5bog9/cY5OBD4m3xYfsGjq8hYuKhlDIVfbE6sUVIyM
   6tgkoQxLtM+KnNPo8n4d4yy36Pj5eAbPizw6lKmplfdcE6PSftrqyM0Ak
   QN9PqNSTLiZaoYAVxhEtg3RQsJcsqKLD7qMLYhKDDRRkTP932e2gM8MRm
   10EHyhH30AulO8RKRpjmsvlTkYYW4ZV/cfht3+EJCVIFiT3M2Mkb6rFjE
   3Okp/lq/XTWb54XQ9ChipxYUK3GTMGa/9LAEFdMQGaOxcottovnoBOoRo
   Q==;
X-CSE-ConnectionGUID: aE0lVRcsSf6q8RDpH5vbqg==
X-CSE-MsgGUID: XJpFemZKQzawyOQkqpsG1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36598522"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36598522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:33:30 -0800
X-CSE-ConnectionGUID: G1bXEgu/TA24FLMM9RKUNg==
X-CSE-MsgGUID: tKsn9ciHSaypNzyTCr1i5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103335188"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2025 08:33:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVvTK-000Hpw-2X;
	Thu, 09 Jan 2025 16:33:26 +0000
Date: Fri, 10 Jan 2025 00:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/ctl_table_const 1/1]
 drivers/infiniband/core/iwcm.c:1190:50: warning: passing argument 3 of
 'register_net_sysctl_sz' discards 'const' qualifier from pointer target type
Message-ID: <202501100052.hcOUgMi7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/ctl_table_const
head:   3eed56785bcc57cb6f3184f24a22a4b79692ea5c
commit: 3eed56785bcc57cb6f3184f24a22a4b79692ea5c [1/1] treewide: const qualify ctl_tables where applicable
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250110/202501100052.hcOUgMi7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100052.hcOUgMi7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100052.hcOUgMi7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:102,
                    from include/net/ipv6.h:12,
                    from include/rdma/ib_verbs.h:25,
                    from include/rdma/ib_mad.h:15,
                    from include/rdma/ib_cm.h:13,
                    from include/rdma/iw_cm.h:11,
                    from drivers/infiniband/core/iwcm.c:51:
   drivers/infiniband/core/iwcm.c: In function 'iw_cm_init':
>> drivers/infiniband/core/iwcm.c:1190:50: warning: passing argument 3 of 'register_net_sysctl_sz' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1190 |                                                  iwcm_ctl_table);
         |                                                  ^~~~~~~~~~~~~~
   include/net/net_namespace.h:495:43: note: in definition of macro 'register_net_sysctl'
     495 |         register_net_sysctl_sz(net, path, table, ARRAY_SIZE(table))
         |                                           ^~~~~
   include/net/net_namespace.h:499:64: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
     499 |                                              struct ctl_table *table, size_t table_size);
         |                                              ~~~~~~~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:102,
                    from include/net/ipv6.h:12,
                    from include/rdma/ib_verbs.h:25,
                    from include/rdma/ib_marshall.h:9,
                    from drivers/infiniband/core/ucma.c:50:
   drivers/infiniband/core/ucma.c: In function 'ucma_init':
>> drivers/infiniband/core/ucma.c:1857:77: warning: passing argument 3 of 'register_net_sysctl_sz' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1857 |         ucma_ctl_table_hdr = register_net_sysctl(&init_net, "net/rdma_ucm", ucma_ctl_table);
         |                                                                             ^~~~~~~~~~~~~~
   include/net/net_namespace.h:495:43: note: in definition of macro 'register_net_sysctl'
     495 |         register_net_sysctl_sz(net, path, table, ARRAY_SIZE(table))
         |                                           ^~~~~
   include/net/net_namespace.h:499:64: note: expected 'struct ctl_table *' but argument is of type 'const struct ctl_table *'
     499 |                                              struct ctl_table *table, size_t table_size);
         |                                              ~~~~~~~~~~~~~~~~~~^~~~~


vim +1190 drivers/infiniband/core/iwcm.c

922a8e9fb2e071 Tom Tucker      2006-08-03  1176  
922a8e9fb2e071 Tom Tucker      2006-08-03  1177  static int __init iw_cm_init(void)
922a8e9fb2e071 Tom Tucker      2006-08-03  1178  {
b493d91d333e86 Faisal Latif    2016-02-26  1179  	int ret;
b493d91d333e86 Faisal Latif    2016-02-26  1180  
b493d91d333e86 Faisal Latif    2016-02-26  1181  	ret = iwpm_init(RDMA_NL_IWCM);
b493d91d333e86 Faisal Latif    2016-02-26  1182  	if (ret)
e677b72a064724 Leon Romanovsky 2021-07-23  1183  		return ret;
e677b72a064724 Leon Romanovsky 2021-07-23  1184  
86dfdd8288907f Zhu Yanjun      2024-08-20  1185  	iwcm_wq = alloc_ordered_workqueue("iw_cm_wq", WQ_MEM_RECLAIM);
922a8e9fb2e071 Tom Tucker      2006-08-03  1186  	if (!iwcm_wq)
e677b72a064724 Leon Romanovsky 2021-07-23  1187  		goto err_alloc;
922a8e9fb2e071 Tom Tucker      2006-08-03  1188  
2f0304d2186747 Steve Wise      2014-07-25  1189  	iwcm_ctl_table_hdr = register_net_sysctl(&init_net, "net/iw_cm",
2f0304d2186747 Steve Wise      2014-07-25 @1190  						 iwcm_ctl_table);
2f0304d2186747 Steve Wise      2014-07-25  1191  	if (!iwcm_ctl_table_hdr) {
2f0304d2186747 Steve Wise      2014-07-25  1192  		pr_err("iw_cm: couldn't register sysctl paths\n");
e677b72a064724 Leon Romanovsky 2021-07-23  1193  		goto err_sysctl;
2f0304d2186747 Steve Wise      2014-07-25  1194  	}
2f0304d2186747 Steve Wise      2014-07-25  1195  
e677b72a064724 Leon Romanovsky 2021-07-23  1196  	rdma_nl_register(RDMA_NL_IWCM, iwcm_nl_cb_table);
922a8e9fb2e071 Tom Tucker      2006-08-03  1197  	return 0;
e677b72a064724 Leon Romanovsky 2021-07-23  1198  
e677b72a064724 Leon Romanovsky 2021-07-23  1199  err_sysctl:
e677b72a064724 Leon Romanovsky 2021-07-23  1200  	destroy_workqueue(iwcm_wq);
e677b72a064724 Leon Romanovsky 2021-07-23  1201  err_alloc:
e677b72a064724 Leon Romanovsky 2021-07-23  1202  	iwpm_exit(RDMA_NL_IWCM);
e677b72a064724 Leon Romanovsky 2021-07-23  1203  	return -ENOMEM;
922a8e9fb2e071 Tom Tucker      2006-08-03  1204  }
922a8e9fb2e071 Tom Tucker      2006-08-03  1205  

:::::: The code at line 1190 was first introduced by commit
:::::: 2f0304d21867476394cd51a54e97f7273d112261 RDMA/iwcm: Use a default listen backlog if needed

:::::: TO: Steve Wise <swise@opengridcomputing.com>
:::::: CC: Roland Dreier <roland@purestorage.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
