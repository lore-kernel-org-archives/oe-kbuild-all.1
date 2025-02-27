Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E243272928
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 22:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740696049; cv=none; b=t+ZW28tFWs/REkPm0XMrcVa2XJGozgRRjaO/d1Z8OXKDKPQTdO/CNYIMcKQYnRI1NZAkF4b8ubw7MNDiOG5vFzx/a3kkf2nbO5lJ4W+EXZszS7vv7NkpfxMsIrtQUwvpwurGH65DPlrk1lrd8WqAw3uxZMVLmwtoQ1Ns+KDN594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740696049; c=relaxed/simple;
	bh=bHnFFCzRQslep5weH0HOFmUYCm8FsYyPXMPtT7Y5aow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWN/GSTIAJIoDkYvHS8qa233IPIa7AIJwDfs9hbCV8ALrjpIFN16v9DQVTKbzYGFA5Jl83AUYv8v5QPe3Nc9Vb3uTmyRWOYJmU7l6edINyYMwrLSKR6jP04UjFghsmuAV+n1DcOPQqqEsWS4d/VDGiutS7P3B/umeCZuRKHZ4+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5pgjbR3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5pgjbR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740696048; x=1772232048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bHnFFCzRQslep5weH0HOFmUYCm8FsYyPXMPtT7Y5aow=;
  b=D5pgjbR3dmohzNXH/D/qeT9dQ0+hHxnKLXJsKYiGvW9EqGVbCsz7I/e3
   wazwZ/PMhqB93UZH4HPYsv6PFXkq07eXFjr/aH2SAna2GzFuTwZNiaqRn
   D2TzRUHes0t+WN1GLR2SkKLioeK+ucjCGBUTFOc1+nt+EyOJTJTRYfGXG
   nkF5JwpWiItL28ibFMt4knA79dx1GKb3MufdwIbLv6/F+kq0GOaz4iAh3
   EJdNsyxtIN3ufIYBuzI4bYjmzTSHVh7X3LD2Q9RvkpHdAIjHhtLrrJvSN
   7jbGkYYh0kS3gqhIjl4RV1bBZJa8Dn+lqFS0gj4fs148c+HxCoOBZgbhc
   g==;
X-CSE-ConnectionGUID: E4lDxNvoSPmpADp5lwqosQ==
X-CSE-MsgGUID: j7TsTENDR2C7nmurQNjLeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="51816555"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="51816555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 14:40:48 -0800
X-CSE-ConnectionGUID: ekT+XHZnT7+PZRV9PtbatA==
X-CSE-MsgGUID: nOV56OgMQs6YOYXiU57qbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122386344"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2025 14:40:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnmYc-000E7W-2s;
	Thu, 27 Feb 2025 22:40:43 +0000
Date: Fri, 28 Feb 2025 06:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2]
 drivers/infiniband/hw/erdma/compat/sw_recv.c:179:13: warning: variable
 'index' set but not used
Message-ID: <202502280637.ezaqxyu1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   6def91bb25065620cbae9daa9c1f1063d281c5be
commit: cad361b634f5968cae43cf0d3be6b629e814aa86 [2/2] anolis: RDMA/erdma: Update erdma driver
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250228/202502280637.ezaqxyu1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280637.ezaqxyu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280637.ezaqxyu1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/erdma/compat/sw_recv.c: In function 'hdr_check':
>> drivers/infiniband/hw/erdma/compat/sw_recv.c:179:13: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     179 |         int index;
         |             ^~~~~


vim +/index +179 drivers/infiniband/hw/erdma/compat/sw_recv.c

   171	
   172	static int hdr_check(struct sw_pkt_info *pkt)
   173	{
   174		struct sw_dev *sw = pkt->sw;
   175		struct sw_port *port = &sw->port;
   176		struct erdma_qp *master_qp;
   177		struct sw_qp *qp = NULL;
   178		u32 qpn = bth_qpn(pkt);
 > 179		int index;
   180		int err;
   181	
   182		if (unlikely(bth_tver(pkt) != BTH_TVER)) {
   183			pr_warn_ratelimited("bad tver\n");
   184			goto err1;
   185		}
   186	
   187		if (unlikely(qpn == 0)) {
   188			pr_warn_once("QP 0 not supported");
   189			goto err1;
   190		}
   191	
   192		if (qpn != IB_MULTICAST_QPN) {
   193			index = (qpn == 1) ? port->qp_gsi_index : qpn;
   194	
   195			master_qp = find_qp_by_qpn(sw->master, qpn);/* gsi qpn pr_info -----*/
   196			if (unlikely(!master_qp || master_qp->attrs.flags & ERDMA_QP_IN_DESTROY)) {
   197				pr_warn_ratelimited("no qp matches qpn 0x%x\n", qpn);
   198				goto err1;
   199			}
   200	
   201			//qp = sw_pool_get_index(&sw->qp_pool, index);
   202			qp = master_qp->sw_qp;
   203			if (unlikely(!qp)) {
   204				pr_warn_ratelimited("no qp matches qpn 0x%x\n", qpn);
   205				goto err1;
   206			}
   207			sw_add_ref(qp);
   208	
   209			err = check_type_state(sw, pkt, qp);
   210			if (unlikely(err))
   211				goto err2;
   212	
   213			err = check_addr(sw, pkt, qp);
   214			if (unlikely(err))
   215				goto err2;
   216	
   217			err = check_keys(sw, pkt, qpn, qp);
   218			if (unlikely(err))
   219				goto err2;
   220		} else {
   221			if (unlikely((pkt->mask & SW_GRH_MASK) == 0)) {
   222				pr_warn_ratelimited("no grh for mcast qpn\n");
   223				goto err1;
   224			}
   225		}
   226	
   227		pkt->qp = qp;
   228		return 0;
   229	
   230	err2:
   231		sw_drop_ref(qp);
   232	err1:
   233		return -EINVAL;
   234	}
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
