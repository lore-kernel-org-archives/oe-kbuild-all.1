Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4001226CE11
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 05:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777874063; cv=none; b=XaNDZj5n043bZSurznnyHqrJWLVsCAXuIeug64q0cQdxXMYqIJb1W1lR4pHC9NQXNhpUsJFLJcdgrQQ8yxhcYXuODpNatYKL49jwZ8J9Yxw+X5jB28u21kEK5jCpW0DdUDU7FY0d6/ulH9f3ba0Sluf/uc1Nss1DHcHheYksMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777874063; c=relaxed/simple;
	bh=G9sV6WS9y1WaxoreWJt3dl9M0USZgnNKFz4wveR7QPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kSaIgcLPXa7Z0ZYApc+PRK339IsvqZ/fvk3sldANshRbk4rWCn67GAGU4pzU23zbb0X1CKnfqzvQBACCRUXaa6fAVnpJboxzgwaX7zKH5xKYuKuvLLh0W3AMgVbkpDOO8EsFeSTmMt8i+5Pph96sRxT7a++X0DLveb3g60ps1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDNRCPmJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDNRCPmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777874061; x=1809410061;
  h=date:from:to:cc:subject:message-id;
  bh=G9sV6WS9y1WaxoreWJt3dl9M0USZgnNKFz4wveR7QPk=;
  b=CDNRCPmJzPZlPxQbRS+p7Sh7RZ8YY6swyfqr0xgFjlB6eqrFdSuvEUAp
   b67Oi76t4hiZvJCo4l4VmZ9ZDhOiNqEmRxgsS5BcCYh5GC8JL9Ye0L3ub
   aOTgUKsq5ip5jck+s5NdasTCqYy1hJoEYGHtQNmRik9RoelV3DBiG6l5D
   57ProNYcS1+fRLME6lEBKIMeB6PdTXv6TjxkFhtSc7W59oSr03rl2Play
   xDuZYHcDo5rPe7lP/hognFGau85A4aEnHo+KQa7CXSp+C4tTvRgXfC86J
   h9rdJhKHErrH2wfftVBE2xlX/vLpsN0DhGy/DwX558Wcf7Kgpfb8bjVTf
   A==;
X-CSE-ConnectionGUID: wCxAraj1RnqCO/ymq+KmYw==
X-CSE-MsgGUID: SSPpGn9ITOORWKbk7l5bWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90106126"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="90106126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 22:54:20 -0700
X-CSE-ConnectionGUID: ExEC3OOaRwK5U0e8zBNoyQ==
X-CSE-MsgGUID: Cus5PVTpTWK2IXdAoAgZdA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 May 2026 22:54:19 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJmFv-000000003Wr-3UO8;
	Mon, 04 May 2026 05:54:13 +0000
Date: Mon, 04 May 2026 13:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9745/13443]
 drivers/firmware/thead,th1520-aon.c:173:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202605041356.5wYoNdzy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 88c4bd90725557796c15878b7cb70066e9e6b5ab [9745/13443] firmware: thead: Fix buffer overflow and use standard endian macros
config: openrisc-randconfig-r111-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041356.5wYoNdzy-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041356.5wYoNdzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041356.5wYoNdzy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/thead,th1520-aon.c:173:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [usertype] resource @@     got restricted __be16 [usertype] @@
   drivers/firmware/thead,th1520-aon.c:173:22: sparse:     expected unsigned short [addressable] [usertype] resource
   drivers/firmware/thead,th1520-aon.c:173:22: sparse:     got restricted __be16 [usertype]
>> drivers/firmware/thead,th1520-aon.c:174:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [usertype] mode @@     got restricted __be16 [usertype] @@
   drivers/firmware/thead,th1520-aon.c:174:18: sparse:     expected unsigned short [addressable] [usertype] mode
   drivers/firmware/thead,th1520-aon.c:174:18: sparse:     got restricted __be16 [usertype]

vim +173 drivers/firmware/thead,th1520-aon.c

   143	
   144	/**
   145	 * th1520_aon_power_update() - Change power state of a resource via TH1520 AON
   146	 * @aon_chan: Pointer to the AON channel structure
   147	 * @rsrc: Resource ID whose power state needs to be updated
   148	 * @power_on: Boolean indicating whether the resource should be powered on (true)
   149	 *            or powered off (false)
   150	 *
   151	 * This function requests the TH1520 AON subsystem to set the power mode of the
   152	 * given resource (@rsrc) to either on or off. It constructs the message in
   153	 * `struct th1520_aon_msg_req_set_resource_power_mode` and then invokes
   154	 * th1520_aon_call_rpc() to make the request. If the AON call fails, an error
   155	 * message is logged along with the specific return code.
   156	 *
   157	 * Return:
   158	 * * 0 on success
   159	 * * A negative error code in case of failures (propagated from
   160	 *   th1520_aon_call_rpc()).
   161	 */
   162	int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
   163				    bool power_on)
   164	{
   165		struct th1520_aon_msg_req_set_resource_power_mode msg = {};
   166		struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
   167		int ret;
   168	
   169		hdr->svc = TH1520_AON_RPC_SVC_PM;
   170		hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
   171		hdr->size = TH1520_AON_RPC_MSG_NUM;
   172	
 > 173		msg.resource = cpu_to_be16(rsrc);
 > 174		msg.mode = cpu_to_be16(power_on ? TH1520_AON_PM_PW_MODE_ON :
   175						  TH1520_AON_PM_PW_MODE_OFF);
   176	
   177		ret = th1520_aon_call_rpc(aon_chan, &msg);
   178		if (ret)
   179			dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
   180				power_on ? "up" : "off", rsrc, ret);
   181	
   182		return ret;
   183	}
   184	EXPORT_SYMBOL_GPL(th1520_aon_power_update);
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
