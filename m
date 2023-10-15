Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789328C08
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tx1J7kPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697386044; x=1728922044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2KftknxEdf+p5tOcH30v5XYxhB2PZUpR0QAcDASEZs=;
  b=Tx1J7kPnZYwgM75rc70+S5Zhn8QKhklC5b0isEILsAW+hXKmBcvOjrnO
   eL+qWHkxDmpqTiEMRRQTY9j9uQVwSqdnU33MX2FFgEuX4Aj+5UYOgn9vd
   OKTGPW7kpCVms6owsIcq18EtT4hJH6VNagioMgDBV0JzUM6tbO6XVqW7g
   430zYQUhqtI1UAQDwb8OIeieYO2vHx0RiN6ALNRp3y86MC8zVIA4VcP16
   Qx/pSDg0+zPzhp4ovTAbmbBkVI9rMCFSwdDZ3I4KmTddzr3/5I/Rajv99
   bY4MOFq6LGVdCEXxG0Yir84dDbdcXDj/ugaDHKKiK0ljhXrQjzvqCa/XB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375764414"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375764414"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749010142"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="749010142"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2023 09:07:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs3e9-0007XN-1g;
	Sun, 15 Oct 2023 16:07:17 +0000
Date: Mon, 16 Oct 2023 00:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2551/30000]
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c:862:35: warning:
 variable 'priv' set but not used
Message-ID: <202310160015.ISbc2F2e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 923d6a315bae4a484f78b73375c7737165c5f518 [2551/30000] dpaa2-eth: Add CEETM qdisc support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231016/202310160015.ISbc2F2e-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160015.ISbc2F2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160015.ISbc2F2e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c: In function 'dpaa2_ceetm_cls_change':
>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c:862:35: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     862 |         struct dpaa2_ceetm_qdisc *priv;
         |                                   ^~~~


vim +/priv +862 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c

   856	
   857	/* Add or configure a ceetm class */
   858	static int dpaa2_ceetm_cls_change(struct Qdisc *sch, u32 classid, u32 parentid,
   859					  struct nlattr **tca, unsigned long *arg,
   860					  struct netlink_ext_ack *extack)
   861	{
 > 862		struct dpaa2_ceetm_qdisc *priv;
   863		struct dpaa2_ceetm_class *cl = (struct dpaa2_ceetm_class *)*arg;
   864		struct nlattr *opt = tca[TCA_OPTIONS];
   865		struct nlattr *tb[DPAA2_CEETM_TCA_MAX];
   866		struct dpaa2_ceetm_tc_copt *copt;
   867		struct net_device *dev = qdisc_dev(sch);
   868		int err;
   869	
   870		pr_debug(KBUILD_BASENAME " : %s : classid %X under qdisc %X\n",
   871			 __func__, classid, sch->handle);
   872	
   873		if (strcmp(sch->ops->id, dpaa2_ceetm_qdisc_ops.id)) {
   874			pr_err("CEETM: a ceetm class can not be attached to other qdisc/class types\n");
   875			return -EINVAL;
   876		}
   877	
   878		priv = qdisc_priv(sch);
   879	
   880		if (!opt) {
   881			pr_err(KBUILD_BASENAME " : %s : tc error NULL opt\n", __func__);
   882			return -EINVAL;
   883		}
   884	
   885		err = nla_parse_nested_deprecated(tb, DPAA2_CEETM_TCA_COPT, opt,
   886						  dpaa2_ceetm_policy, extack);
   887		if (err < 0) {
   888			pr_err(KBUILD_BASENAME " : %s : tc error in %s\n", __func__,
   889			       "nla_parse_nested_deprecated");
   890			return -EINVAL;
   891		}
   892	
   893		if (!tb[DPAA2_CEETM_TCA_COPT]) {
   894			pr_err(KBUILD_BASENAME " : %s : tc error in %s\n", __func__,
   895			       "tb");
   896			return -EINVAL;
   897		}
   898	
   899		copt = nla_data(tb[DPAA2_CEETM_TCA_COPT]);
   900	
   901		/* Configure an existing ceetm class */
   902		if (cl) {
   903			if (copt->type != cl->type) {
   904				pr_err("CEETM: class %X is not of the provided type\n",
   905				       cl->common.classid);
   906				return -EINVAL;
   907			}
   908	
   909			switch (copt->type) {
   910			case CEETM_ROOT:
   911				return dpaa2_ceetm_cls_change_root(cl, copt, dev);
   912			case CEETM_PRIO:
   913				return dpaa2_ceetm_cls_change_prio(cl, copt, dev);
   914	
   915			default:
   916				pr_err(KBUILD_BASENAME " : %s : invalid class\n",
   917				       __func__);
   918				return -EINVAL;
   919			}
   920		}
   921	
   922		return dpaa2_ceetm_cls_add(sch, classid, copt, arg, extack);
   923	}
   924	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
