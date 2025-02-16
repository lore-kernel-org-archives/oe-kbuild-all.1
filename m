Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB11519A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739694345; cv=none; b=FDw7kN8bI5GtfURiP0nQ2fkbIeKAx0pMDA2ADr/bAJaD2/9DkYImiSQrNmxoqn78gDEU+LW4SBH+3Darf8k+mMJg2/ZQwtfCc/A0rRYkGk5Sk5LULurJC3Umhy6r9eb1QgwhfdI9CcaimffY7PCGDN1JHPOvzRCoOtAjPSFpgUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739694345; c=relaxed/simple;
	bh=wts8HergCMsYfKJVs+jR0HvIviylHGhupswFIadUzec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=At7dZGjj445d+jLqen+o5i/vqgEDbR4At/sN+l5dimAoTeQwIbNY7s0kYLqY2MMDOOFjuxvccODHxRXmolgHei/xlIst49rsW2Q5UnzB3xKn5yfuw5KePJ7qNAKDmG3ccVp7COSW7QGP1qmtIsrpoHORUXs46kz6X+7tBi+CbDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOYoDjL1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOYoDjL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739694343; x=1771230343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wts8HergCMsYfKJVs+jR0HvIviylHGhupswFIadUzec=;
  b=bOYoDjL11ciciwqbXuA/bBsVzB75UYvWQAMKvou/lr5y05bH8bQTLOBY
   kzAsMRJxzYnOx39GKRZfAjwHT4dnJDOPdPss/YFa9Ag09gAB/0SccC3RX
   D8TwVZoaBgj1fWE5JsIuktkQx3YUhMgqqT904keQsTNDFgQSGjV0a3fu3
   2n7ZDws6mFcFvEazQvphH6pxL/uaYqN7/cfqVXqkgJ4f22T17zBiEXaas
   qFpQKGOyIAnLHwy4zfPiq6M8FhYiR0pf5hVDbTGNIudeopnmfvAmONAz4
   tfZukISGyChTZK1KOV3T5nrGGsCffj9VtvQZJI/IJCpWYbi7pUEVeXyvt
   A==;
X-CSE-ConnectionGUID: GHb1TZBRS4CgwWIQetjlYQ==
X-CSE-MsgGUID: k5Y/qB64TFSs+kkTXAL/ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44326431"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; 
   d="scan'208";a="44326431"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 00:25:40 -0800
X-CSE-ConnectionGUID: VESpWSw9TbqwgWrIIR93Cg==
X-CSE-MsgGUID: aO6NChBySLWAtvM+hQKptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144766959"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Feb 2025 00:25:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjZy5-001Bi1-13;
	Sun, 16 Feb 2025 08:25:37 +0000
Date: Sun, 16 Feb 2025 16:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 5/5]
 drivers/firmware/arm_scmi/tinysys.c:180:22: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202502161650.kdbFs608-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0d96e807079196f870dcef51ecf4bd53fb5472c1
commit: f1e104ed61ffbb353b91e2a25e09f96ac805bd4c [5/5] CHROMIUM: firmware: arm_scmi: Porting tinysys_scmi driver
config: arm-randconfig-r123-20250216 (https://download.01.org/0day-ci/archive/20250216/202502161650.kdbFs608-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502161650.kdbFs608-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502161650.kdbFs608-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/tinysys.c:180:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] f_id @@     got unsigned int [usertype] src_id @@
   drivers/firmware/arm_scmi/tinysys.c:180:22: sparse:     expected restricted __le32 [usertype] f_id
   drivers/firmware/arm_scmi/tinysys.c:180:22: sparse:     got unsigned int [usertype] src_id
>> drivers/firmware/arm_scmi/tinysys.c:223:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 const [usertype] f_id @@
   drivers/firmware/arm_scmi/tinysys.c:223:17: sparse:     expected unsigned int [usertype]
   drivers/firmware/arm_scmi/tinysys.c:223:17: sparse:     got restricted __le32 const [usertype] f_id
>> drivers/firmware/arm_scmi/tinysys.c:308:28: sparse: sparse: symbol 'scmi_tinysys_protocol' was not declared. Should it be static?
--
>> drivers/firmware/arm_scmi/tinysys-scmi-drv.c:71:5: sparse: sparse: symbol 'scmi_tinysys_notifier_fn' was not declared. Should it be static?

vim +180 drivers/firmware/arm_scmi/tinysys.c

   166	
   167	static int _scmi_tinysys_request_notify(const struct scmi_protocol_handle *ph,
   168						 u32 src_id, bool enable)
   169	{
   170		int ret;
   171		struct scmi_xfer *t;
   172		struct scmi_tinysys_notify *notify;
   173	
   174		ret = ph->xops->xfer_get_init(ph, TINYSYS_POWER_STATE_NOTIFY,
   175				sizeof(*notify), 0, &t);
   176		if (ret)
   177			return ret;
   178	
   179		notify = t->tx.buf;
 > 180		notify->f_id = src_id;
   181		notify->notify_enable = enable ? cpu_to_le32(BIT(0)) : 0;
   182	
   183		ret = ph->xops->do_xfer(ph, t);
   184	
   185		ph->xops->xfer_put(ph, t);
   186		return ret;
   187	}
   188	
   189	static int _scmi_tinysys_set_notify_enabled(const struct scmi_protocol_handle *ph,
   190						  u8 evt_id, u32 src_id, bool enable)
   191	{
   192		int ret;
   193		struct scmi_tinysys_info_st *t_info;
   194	
   195		ret = _scmi_tinysys_request_notify(ph, src_id, enable);
   196		if (ret) {
   197			t_info = get_scmi_tinysys_info();
   198			dev_dbg(&(t_info->sdev->dev), "FAIL_ENABLE - evt[%X] - ret:%d\n", evt_id, ret);
   199		}
   200	
   201		return ret;
   202	}
   203	
   204	static void *_scmi_tinysys_fill_custom_report(const struct scmi_protocol_handle *ph,
   205							u8 evt_id, ktime_t timestamp,
   206							const void *payld, size_t payld_sz,
   207							void *report, u32 *src_id)
   208	{
   209		const struct scmi_tinysys_notifier_payld *p = payld;
   210		struct scmi_tinysys_notifier_report *r = report;
   211	
   212		if (evt_id != SCMI_EVENT_TINYSYS_NOTIFIER ||
   213			sizeof(*p) != payld_sz)
   214			return NULL;
   215	
   216		r->timestamp = timestamp;
   217		r->f_id = le32_to_cpu(p->f_id);
   218		r->p1_status = le32_to_cpu(p->p1);
   219		r->p2_status = le32_to_cpu(p->p2);
   220		r->p3_status = le32_to_cpu(p->p3);
   221		r->p4_status = le32_to_cpu(p->p4);
   222	
 > 223		*src_id = p->f_id;
   224	
   225		return r;
   226	}
   227	
   228	static int _scmi_tinysys_attributes_get(const struct scmi_protocol_handle *ph,
   229						 struct scmi_tinysys_info *pi)
   230	{
   231		int ret;
   232		struct scmi_xfer *t;
   233		u32 attr;
   234	
   235		ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
   236						  0, sizeof(attr), &t);
   237		if (ret)
   238			return ret;
   239	
   240		ret = ph->xops->do_xfer(ph, t);
   241		if (!ret) {
   242			attr = get_unaligned_le32(t->rx.buf);
   243			pi->num_domains = attr;
   244		}
   245	
   246		ph->xops->xfer_put(ph, t);
   247		return ret;
   248	}
   249	
   250	static int _scmi_tinysys_get_num_sources(const struct scmi_protocol_handle *ph)
   251	{
   252		struct scmi_tinysys_info *pinfo = ph->get_priv(ph);
   253	
   254		if (!pinfo)
   255			return -EINVAL;
   256	
   257		return pinfo->num_domains;
   258	}
   259	
   260	static const struct scmi_event tinysys_events[] = {
   261		{
   262			.id = SCMI_EVENT_TINYSYS_NOTIFIER,
   263			.max_payld_sz =	sizeof(struct scmi_tinysys_notifier_payld),
   264			.max_report_sz = sizeof(struct scmi_tinysys_notifier_report),
   265		},
   266	};
   267	
   268	static const struct scmi_tinysys_proto_ops tinysys_proto_ops = {
   269			.common_set = _scmi_tinysys_common_set,
   270			.common_get = _scmi_tinysys_common_get,
   271			.slbc_ctrl = _scmi_tinysys_slbc_ctrl,
   272	};
   273	
   274	static const struct scmi_event_ops tinysys_event_ops = {
   275		.get_num_sources = _scmi_tinysys_get_num_sources,
   276		.set_notify_enabled = _scmi_tinysys_set_notify_enabled,
   277		.fill_custom_report = _scmi_tinysys_fill_custom_report,
   278	};
   279	
   280	static const struct scmi_protocol_events tinysys_protocol_events = {
   281		.queue_sz = 4 * SCMI_PROTO_QUEUE_SZ,
   282		.ops = &tinysys_event_ops,
   283		.evts = tinysys_events,
   284		.num_events = ARRAY_SIZE(tinysys_events),
   285	};
   286	
   287	static int _scmi_tinysys_protocol_init(const struct scmi_protocol_handle *ph)
   288	{
   289		u32 version;
   290		struct scmi_tinysys_info *pinfo;
   291	
   292		ph->xops->version_get(ph, &version);
   293	
   294		dev_dbg(ph->dev, "Tinysys Protocol Version %d.%d\n",
   295			PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
   296	
   297		pinfo = devm_kzalloc(ph->dev, sizeof(*pinfo), GFP_KERNEL);
   298		if (!pinfo)
   299			return -ENOMEM;
   300	
   301		_scmi_tinysys_attributes_get(ph, pinfo);
   302	
   303		pinfo->version = version;
   304	
   305		return ph->set_priv(ph, pinfo);
   306	}
   307	
 > 308	const struct scmi_protocol scmi_tinysys_protocol = {
   309		.id = SCMI_PROTOCOL_TINYSYS,
   310		.owner = THIS_MODULE,
   311		.instance_init = &_scmi_tinysys_protocol_init,
   312		.ops = &tinysys_proto_ops,
   313		.events = &tinysys_protocol_events,
   314	};
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
