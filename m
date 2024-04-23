Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD07E765
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713876515; cv=none; b=DP1WvBNy5ofGhIFMZYNFPvy+hsnsaJ4yyreMTpjDK+1/CaxFrCPwqyQ9AExnHOWLq1PVyoIxdqWXHrzCbEe0jBtG3f4IzbSjboS4aqVfo2JZ9o2HN7UnDywb69ISusATjLvT5Zf+EAZ5U5maG6bHB7udK06EwVbDbF+ZCDZvnO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713876515; c=relaxed/simple;
	bh=MQE+2PwVXaGspJViQALvr6MgCMBRo6D/E79239hwQgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6uvZ7yhk15ywOpz14Rr7+JYVya6tlkWzS+mc7dB9zjRvCQ7P0mExRh6Dyyy509kkHB16hZDLQ1PsGeoZr7AAjSlhGWlAVWN3pLVm5FCV+kseyE1UIx/iIay/W/Ny6htPcZDZs/lagACM9M65JVqy8XuvbspNYWC2A5AFdqr6MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3bK0Lx0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3bK0Lx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713876513; x=1745412513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MQE+2PwVXaGspJViQALvr6MgCMBRo6D/E79239hwQgs=;
  b=I3bK0Lx0/K+soeWZafDKxKdM5NXJZDq+OHdec8Wxzx7Pn6qhMMadqm6Y
   Ipyo2mH9mp5EN8RgNVZfA94Q6/X0uAckRdtlB9r5x01BQj7VRxnCAuaPE
   AqvFDZydSAwrmqYzkTPqcjdMcqUMPX68+AlItPlJQ6VZEVVgw2T8myeE6
   ic52m1al+l2SjOLicC5IlYZHTL0kfaSgJyQULlcX51/AbE/shXmNwAfLr
   kL6s5+k6X8mI8m9zUXGMlfVSuQuQ0skEdk8ta9c7nTYFZ1MAmTGxy5loM
   ne+NHk29hY3CeE83WPISB3bKkRqulMdskkLMGNlZB6mHN24Eesi8I7Kdj
   A==;
X-CSE-ConnectionGUID: klPlFjniSoGbdrJ4lnTtvA==
X-CSE-MsgGUID: H484MtujQ9G39sr3ZmL9Og==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9676743"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9676743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 05:48:32 -0700
X-CSE-ConnectionGUID: 3WxueUBWSbeEvKbq3UzpjA==
X-CSE-MsgGUID: oAJzxsT3Q3i6MtdEy1YqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24865440"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2024 05:48:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzFZT-0000BU-37;
	Tue, 23 Apr 2024 12:48:27 +0000
Date: Tue, 23 Apr 2024 20:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/parse-functions 10/15] ld.lld: error: undefined
 symbol: sdca_alloc
Message-ID: <202404232020.GS36iDN6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/parse-functions
head:   20eb0aa7af2a59e59ec8b609fcffa06c8a464e59
commit: 628b3c5a642f91b7354cfa7f6398217dde193714 [10/15] soundwire: add SDCA alloc/parsing
config: x86_64-randconfig-073-20240423 (https://download.01.org/0day-ci/archive/20240423/202404232020.GS36iDN6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404232020.GS36iDN6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404232020.GS36iDN6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sdca_alloc
   >>> referenced by bus_type.c:108 (drivers/soundwire/bus_type.c:108)
   >>>               vmlinux.o:(sdw_drv_probe)
--
>> ld.lld: error: undefined symbol: sdca_find_functions
   >>> referenced by bus_type.c:114 (drivers/soundwire/bus_type.c:114)
   >>>               vmlinux.o:(sdw_drv_probe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
