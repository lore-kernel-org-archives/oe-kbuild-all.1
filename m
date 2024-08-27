Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0738C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 01:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724721765; cv=none; b=cEQI4OVBYChxeWCVEHTqGoaYEegd3hBQtyEgajIFy/8Sew0Mi2chZfvfzUkSsKt0KUjtU/VKdQStZ2fCGl5MGdMgLUUS7Wgj1nX78qJO3Q14T0P2kM9va7bUh8qTbybHH51PsAs6d+ZYdiOrV+3L3/YvQDKeDH903MXOf/TGiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724721765; c=relaxed/simple;
	bh=2tm4eAGulofN1TygDeizIcl0qZmMe4ZHTzx4zG4Th3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7xp3Ow3Zqpcm/kdchJ4seuUIUvB/nknF90VUB5VWsRHDFRzt9EcHzaF+FCe5GNR+ed9ollvWRPmPavWNCMTqqxl69GpLZKK3OeAt6Nz9F16WPgLabfZqv/cKdMfVr5X/ahhGS0CmTGnXVT4ewhjpTUfAseWBYkmF3XV27Q/jmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWSfWjNt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWSfWjNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724721762; x=1756257762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tm4eAGulofN1TygDeizIcl0qZmMe4ZHTzx4zG4Th3w=;
  b=dWSfWjNtHEX8FkVDCa9VVIFh3A4LWF6qjW9i2l5nhFGeJVT1pGXrFej9
   KFkKESwi+MOViOyhmIQNhd3Qf70aAGG7nOjo2YYBLwIen/vH4Vzwi804t
   8I/PYiW1vclWVbYq+rZi2VgjECsgqK9qytOOkYkorXciXEbX+XH1qYxpF
   7YMQZbhmr7QL8kVIBWGax04RJqv6c8d51EEJ+MpdWHeWxiasnFSlvkMXY
   6Dn1t+F99NEMg1O3adYFGzQLtw4s4obI6ZETK/TBEtJ5+ZeeWfLqZoX05
   QpR4NIDwIUdG/QqAH1U9zDz3WnYbAUsp0tljCFR7bqQzruH16b2RQshKR
   Q==;
X-CSE-ConnectionGUID: RY7+nxCZTxKS2qPBtLdqxA==
X-CSE-MsgGUID: 7q+WDvXlQzaNUdN8D+mHDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26969610"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="26969610"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:22:41 -0700
X-CSE-ConnectionGUID: 58MjAPV5SQynF+CNsJemsg==
X-CSE-MsgGUID: IuCilfLwSheteLP8NQ5UCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63209038"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Aug 2024 18:22:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sikus-000Hkg-03;
	Tue, 27 Aug 2024 01:22:38 +0000
Date: Tue, 27 Aug 2024 09:21:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10069/23560] net/mac80211/.tmp_mlme.o:
 warning: objtool: ieee80211_sta_rx_queued_mgmt()+0x21c3: unreachable
 instruction
Message-ID: <202408270942.wU6VgBgJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cbbc4774e41c354f5b0f9fc7a9be442fcee74b3f
commit: 3d9b47cc5bf272c32ac3004c433a102db71407c2 [10069/23560] mac80211: Reject malformed SSID elements
config: x86_64-buildonly-randconfig-004-20240825 (https://download.01.org/0day-ci/archive/20240827/202408270942.wU6VgBgJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270942.wU6VgBgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270942.wU6VgBgJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mac80211/.tmp_mlme.o: warning: objtool: ieee80211_sta_rx_queued_mgmt()+0x21c3: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
