Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067A3FA5FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 13:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182905; cv=none; b=ud4c43scoV6VPpOu1N7V8HTlWHZnUpZ3iJQ8goH3TVki6ki3tODgYX9mcgXU+3fZtCS2Djay0xx59J2W7LVn0AJREdOVMviCjMkKJfwJy6GDttzS7LOAgTSygCeVAPJFp0N8GTsZbDeKkUq+izQDm04mkwF0dml3BqjlKL5IlCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182905; c=relaxed/simple;
	bh=Fha/ZoCYRxbspNUb8YuuKkW9MqQVJw/JLV8zdgZJTMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LqpdAwV9yDT3mKhNdSAI53pCO73jBx5+RJzvpJv4VorN/TCW6CP2QH1JQzEwyqtkWNvaLZLG6ra/bhkhn+A3He2yLunC18KyHrldHG4eNtUg8Q+qFBfhsgi2H83ZxQX5AUnydMFudmatkiKPyvr16slnotfEma4hEatSo0YONqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haVkfkF2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haVkfkF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781182904; x=1812718904;
  h=date:from:to:cc:subject:message-id;
  bh=Fha/ZoCYRxbspNUb8YuuKkW9MqQVJw/JLV8zdgZJTMQ=;
  b=haVkfkF2URf8UXfmLEcH0uWezC7J7a4xTdT9fLxMg6a+2av9VzOxf052
   4XJCvkXmInP4fBS8nlpALU+1oSSNFGxCgZP9TvyNIT67ufRL+0FB/1VFr
   VBN0XcjzxQopr6ahLSyse7fLhX876EC3rnqYogPygZggsDYTmgfYq4tRy
   1hMY9UMMvfTbKpMmbB0Ozgzfp7oOJF1EaHd26A0zpLML8nwqgUoBfq7RZ
   umXZ1gd//5UUQG/ZjD17yv20AnOzgdMxXz4re9V8rTxGssUFtviii1g32
   n5yba/Dw8dscGZJaa5VqtO4cBPWPSZr1+EwNdFk6Ld9QpB0QU1nIZBRWI
   g==;
X-CSE-ConnectionGUID: i7EAD/BtQ52MNLyQ25ORzw==
X-CSE-MsgGUID: 2qVerUJ9TESktks8dmnYXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93383700"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93383700"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:01:41 -0700
X-CSE-ConnectionGUID: i0Z8a/eBTCyLt9PU16nFzg==
X-CSE-MsgGUID: Y50exHAdQvGnFZQd6RkfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="250760403"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 06:01:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXf2O-00000000N1e-249I;
	Thu, 11 Jun 2026 13:01:36 +0000
Date: Thu, 11 Jun 2026 21:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9745/13443]
 drivers/firmware/thead,th1520-aon.c:173:22: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202606112027.qhD4TWe3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 88c4bd90725557796c15878b7cb70066e9e6b5ab [9745/13443] firmware: thead: Fix buffer overflow and use standard endian macros
config: mips-randconfig-r123-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112027.qhD4TWe3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112027.qhD4TWe3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112027.qhD4TWe3-lkp@intel.com/

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
