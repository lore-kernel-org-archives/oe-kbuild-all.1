Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63079EC4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Dec 2024 01:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735435773; cv=none; b=QvzzN+J1Hs6RrM7E/zIujkgpEOqNryVsOEbCp4/pUT5gOniOJTydKbIDoaQwJSCd1zksMjCm+crnLsPWv3PLZZTckPNQwcDXnhlJyaMUCeN6rG/VOr6ATh3tyhQ/Sv6qIgTQzJuMviqPflP5IUzcxCO4ac5urIL+NEgBA8J+eFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735435773; c=relaxed/simple;
	bh=kQgSuz8tHLmbpPDJT5sbZRxNicfNTjYyNP7LALbXdmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9Y03Th/hOZK1AOcTDWOa2J+PChZxf15nkZEDWR0SCn05QuJXFNhbrriQs1caWGqZXpySM6SXZxu4UvUDWuj8akR2TIWZ7ksi/Dxp80lJZ91tjcoSv9nLRhGY/7hrijdn9QWWTANDb1aE3apYDeCrrNZrCnqYbfukVd99nZ0IHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqEvMpBw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqEvMpBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735435771; x=1766971771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kQgSuz8tHLmbpPDJT5sbZRxNicfNTjYyNP7LALbXdmE=;
  b=PqEvMpBwB/yNTpQHIS6TP/VxGc4RffL/eAEe5IRuDL006gg9ecsuBt+U
   z8WCBSt88RN1ffjdb2TQHwJjEe/B4k3CO8T4OUW/VUpZnC+bJ0FGubPc1
   DcpIMFcpcXPlKUh69dE0mXT6XZH3e3qhz+joQDega9TfY4e0t2oRlHPKs
   leoqH8v8KZqRjPf4sOgcPfuvqxTl39ybRJ3nqN/4KRaZ5VXm2ef/wcPjb
   nc6agmtyygIpAcgPu4O302m0p2uVFKJ5VOgl3OhTrrONhAySB1ZD38fsj
   wg0a7ODgOVyPCG3fYLwgaf2aeL9aj7RDORqKMiQ07R4uOGRRELOJ+aV4g
   Q==;
X-CSE-ConnectionGUID: 2XW2yp29Tkij877Gsx7THQ==
X-CSE-MsgGUID: 4NQdEWc3Qaqk/n37ta0nZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35890755"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35890755"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 17:29:31 -0800
X-CSE-ConnectionGUID: aKcrSJpxQ5+znjvbiur1BA==
X-CSE-MsgGUID: itnYIhYSSyCdHsWqONvEtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100216849"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2024 17:29:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRi7T-0004Q0-0s;
	Sun, 29 Dec 2024 01:29:27 +0000
Date: Sun, 29 Dec 2024 09:28:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] kernel/trace/trace_events.o:
 warning: objtool: trace_add_event_call_nolock()+0x20d: unreachable
 instruction
Message-ID: <202412290943.ju9ShqOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 474685382aab1e2263cb1a6161623cd8cbf758ed [1356/1356] tracing: Lock event_mutex before synth_event_mutex
config: x86_64-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290943.ju9ShqOs-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290943.ju9ShqOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290943.ju9ShqOs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.o: warning: objtool: trace_add_event_call_nolock()+0x20d: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
