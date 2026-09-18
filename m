Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA03BA236
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719497; cv=none; b=CX49QKWUK2NWIBlPB0Oqlx3h2BpSETgaEclB4piffK7Mus3eQlO0ay/YHaMNZO4GkBke4JQix8jGYYC0v8jzvFm/NKndcJP1AXJGCz8SgxHFl5fc/uBGRqVazifksU4xySSpUQ/I/MsefFNz/QDTe9hKuQXgoS1P6z3p1YTUS0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719497; c=relaxed/simple;
	bh=Wi+KYplf38lHgGBlLNWvCsPDgQPHa+7gBEJRIOq+lww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gi5iPVUUxj1cZUTs6XFLL4cr2YazlSYbndwjG5FRoCJOR8TM0ig6UkmjDgirlBMJzXexNzJ1gZ0Z8bgPjKr6pXb2qb0NDlmhhMLiQpOISDOvvWCPEQnFroKV8CEOCnIi4J+ncfznBMxgGNvUrDqgK75Y8f99dI8zwBcB8CuugdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bxpfggyv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bxpfggyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789719496; x=1821255496;
  h=date:from:to:cc:subject:message-id;
  bh=Wi+KYplf38lHgGBlLNWvCsPDgQPHa+7gBEJRIOq+lww=;
  b=Bxpfggyv83yGbzrd+mnm9DSALyP/DelDEg748YLJU/GF6tgWyIHvUxUH
   e9CSOvCUMw/1nifxF4JbFQnNAHY0YZbie2w0cXbkquyOgNgCR4kKTvvF/
   KGb4dj9LbVWL81FklBZLROpyea6TK3kul5SmyfDBhINKrqcSa8nCf4lda
   ohs8HxdskdI/KNQTA6l68ctz6xrGOeeHsyZ3ikkq1jS4/T/hWaiwJOJ4y
   8XawkcdcABCPtrUi7y8DGAOx7fAbXyTZKdjt1IQCbPXOcZ9WBUqZnevsu
   H+7qTMtqxPaqYL+gQFIp3q37E8pUQpYDKfizg7VVf5vBB9NJH0/IifWpn
   Q==;
X-CSE-ConnectionGUID: D0Vmji75QmuRJP7A/N4uaQ==
X-CSE-MsgGUID: CFMSomS+RkaDmBQuUprCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100807385"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100807385"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:18:15 -0700
X-CSE-ConnectionGUID: jglGBKirT6Gdj2lTIZsFSg==
X-CSE-MsgGUID: W+RYeooATtqlmyBJsr/m4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2511355"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 18 Sep 2026 01:18:13 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7TnO-000000009R9-3LcM;
	Fri, 18 Sep 2026 08:18:10 +0000
Date: Fri, 18 Sep 2026 16:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-06 2/2]
 arch/arm64/kvm/hyp/nvhe/trace.c:190:15: sparse: sparse: symbol
 'rb_event_size' was not declared. Should it be static?
Message-ID: <202609181649.I2HiI8Nh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-06
head:   ed0303bb8a7aa4268a4835431712e1304c5ea78a
commit: 4c095252cfa95e2d7850c70ec055de1b2284cc76 [2/2] ANDROID: KVM: arm64: Add tracing support for the nVHE hyp
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181649.I2HiI8Nh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181649.I2HiI8Nh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181649.I2HiI8Nh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/trace.c:17:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:190:15: sparse: sparse: symbol 'rb_event_size' was not declared. Should it be static?

vim +/rb_event_size +190 arch/arm64/kvm/hyp/nvhe/trace.c

   189	
 > 190	unsigned long rb_event_size(unsigned long length)
   191	{
   192		struct ring_buffer_event *event;
   193	
   194		return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
   195	}
   196	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
