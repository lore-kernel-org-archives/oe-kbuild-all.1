Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405101171A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714373855; cv=none; b=fS0ZEMGcQr4oWeDSYh0NrHvLWuasflAAQRZ+Rrphe/OcRfP5UZm5qU+9F6mgKscj8AVSWiLBPrjv+pGRY4rhkyq1J28bqso/IWGhTTot37zkoJIjNR3j21HoWZBrgl5DLX1ZMQ5zxivflEkK5GC5OfcQF6kriY3xOJn1xRGLXIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714373855; c=relaxed/simple;
	bh=xMRGINo9LoWI1jCq210pafAI/33aF5Bo3MtD1pYfcdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HOURu5FlupYB1/9EiqtCBNFiQpyIRoF9X8b42pKGDHaC80tsk1Tfr5uGlqsXxyc0u2X7UUmJ7fvpaZFH8fWYxQjOmYm7lxgkVs8pTm7oDDj4xL/GBP9CKxfyxlj70gZKrV+rZuM0mV/ny6WfE3gfyzRgc30BI2eghWASZiUJqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GoHlgzg3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GoHlgzg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714373853; x=1745909853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMRGINo9LoWI1jCq210pafAI/33aF5Bo3MtD1pYfcdM=;
  b=GoHlgzg3Vnnk+lHbgAIeWkoZkCGgKpLR9oh60DQZ/K9f8lSzXldoi+XB
   Yk1rgmgdagJhdjBbLOGbRtGsJXzb4iormQQrRgLea3fMsrs5sgUhiNBA6
   OZvMmKyWQ7ou0OuxyO32QRthAijEY71yxHExnsVddQmicaVjCAY2y5wHO
   f3FsfXz0a5ZVht2/0pI5uqLfe81dWe9lkADQmPptEm4I38bvQDUP7pK5e
   Hct3768Jvg3NOm36rF6aqJH1GnQhitu85LCiKloN3uOm3fXBkwPBgWjnv
   fdINjK+CSZQOPS3S3F8WtX4Y1D+p0gcBQytQWSt4LH/KTTxhKbfDpQ2o4
   w==;
X-CSE-ConnectionGUID: OPG7hfYvT4uy6TYF0nXA5w==
X-CSE-MsgGUID: hyzouS4YT9+do1b1IiEhxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9876447"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9876447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:57:32 -0700
X-CSE-ConnectionGUID: wG6VIjI2RbeVyxkV0ywt8A==
X-CSE-MsgGUID: k5SycgELTyqb9+yxXVYw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="56911061"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2024 23:57:32 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1Kx7-00071K-04;
	Mon, 29 Apr 2024 06:57:29 +0000
Date: Mon, 29 Apr 2024 14:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3842/29983]
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c:862:28: warning:
 variable 'priv' set but not used
Message-ID: <202404291456.RSoiMIW7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   5134e031114e613cb04858e248af5e65fe1e112f
commit: 0c20f7a8339e5ecf8296af1e8687c50d8a9d29c0 [3842/29983] dpaa2-eth: Add CEETM qdisc support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291456.RSoiMIW7-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291456.RSoiMIW7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291456.RSoiMIW7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c:862:28: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     862 |         struct dpaa2_ceetm_qdisc *priv;
         |                                   ^
   drivers/net/ethernet/freescale/dpaa2/dpaa2-eth-ceetm.c:1150:60: error: too few arguments to function call, expected 5, have 4
    1150 |         while (tcf && (result = tcf_classify(skb, tcf, &res, false)) >= 0) {
         |                                 ~~~~~~~~~~~~                      ^
   include/net/pkt_cls.h:79:5: note: 'tcf_classify' declared here
      79 | int tcf_classify(struct sk_buff *skb,
         |     ^            ~~~~~~~~~~~~~~~~~~~~
      80 |                  const struct tcf_block *block,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      81 |                  const struct tcf_proto *tp, struct tcf_result *res,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      82 |                  bool compat_mode);
         |                  ~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


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
