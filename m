Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C142EC553
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765876151; cv=none; b=qFqh6zGMDPInddVMrV2KDScxpPj6wMxU12rlUFwDQgwlGe2jwyQeZIxx3fhYTh7T+0lqXHfnAI8f2dwpgIP3cpzKonDHhXQh0s/UzXp+1OtU414nvg+lagqQPsVfpS0IB8UXYQc6jmmY5PfYajRMLaP5sY8OK9kuPiEqUapP5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765876151; c=relaxed/simple;
	bh=ibJtAZUIWOcimxr0lxylRTSFfOuzo/PmDZiYiXRFk/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhbDLrxDsizOHuKoUvN2kGuJn2Rix5cTBpTn8QFVTEiMyJfeOQOOW7W4i8nkmbufARWC6JDhDK0lwWRoDuA+jkivYJ9NwFIWiiUzBoqorgiqEmGeipmvqv39UOvhir3fomFAhp4NnJI9tUf42UdeSNeNBxT9FsAksM+xCigLOYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwILaHKl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwILaHKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765876150; x=1797412150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ibJtAZUIWOcimxr0lxylRTSFfOuzo/PmDZiYiXRFk/U=;
  b=EwILaHKl8tsPjdQ4AyYp1zwP6Cx3WmHhNdpfPXV80bxx6ZSbjiZXzqqK
   G9m2SvVau+vTD6pgViUw0XG4pmJTh7zkzWGw8uDtFhiyHMoKjkdSIiv7L
   SG3Rjf7384eMAkjNxTn57d1An8ISz15pio0InK9dxhwVpBI+wfK1STkQz
   FlUxSjDOZbpOUFDr/gxkQmYbm7d1ku2Ie2CDq4KZh7SxA+zgM0OXrKXuy
   bh7uCMDbwVa76urHVDD9xpeZHuHMJ1EnXgstltRzwHDDtbGUFaO16ltrq
   GTtwoob4k5j43hiRKkwbPjXZ4SL9d8Dmx4wHnmQgSyREvwqY7M7Q/iW/6
   Q==;
X-CSE-ConnectionGUID: B+7M/SfwQwuPVf9Hbc7rDQ==
X-CSE-MsgGUID: +Hv41nvrST+rwSRSknYwGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67671483"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67671483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 01:09:10 -0800
X-CSE-ConnectionGUID: 8J7fQLmJSQKaq0pil3vcrA==
X-CSE-MsgGUID: k1RYtp8ETSyl/qGQ2Uzhkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197713433"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 01:09:09 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVR3H-000000001QE-2o25;
	Tue, 16 Dec 2025 09:09:05 +0000
Date: Tue, 16 Dec 2025 17:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 drivers/infiniband/hw/erdma/compat/sw_recv.c:179:13: warning: variable
 'index' set but not used
Message-ID: <202512161704.cycX5nqZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 0d8609d9a6aaf8a7453a39d152afdacef8201ef1 [25/25] anolis: RDMA/erdma: Update erdma driver
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251216/202512161704.cycX5nqZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161704.cycX5nqZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161704.cycX5nqZ-lkp@intel.com/

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
