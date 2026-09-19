Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A22652B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789855561; cv=none; b=lZl7FVn1g1c/t4C9E4pWUFbW9CzugPWuOvdd0XdOlRhaU+bz6d65YOH4a0MDZCaRcdFT3ei86ZNZQvDpar6K/g9LSyJI2qaDqhAAD0LAiC4qlSqiP8xgTuLDfeZCJloKy7Lfl+JYa0S573lSidnEDHg5gp8MRiT1MjSzR2VwxCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789855561; c=relaxed/simple;
	bh=42aqRJGbhXV052wkPWxRJfnjiRxGqReFIe7bVnt1mIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sZfOKPpxqYn9X1q2lUzVmcOQ/1O+8Gjad1exSQ/lTHllS69FL3X652ol0QF4xgp1gtlA2vky94WQ59ydPaaYryQNZY5GtTX15P2vdYd6jdDkznCzuvyVryDFWJJs9sTA8eqH/0C6sUR98NsDuOnuEUGnKwMav7FIPVKR/N+cGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTHvgwAB; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTHvgwAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789855560; x=1821391560;
  h=date:from:to:cc:subject:message-id;
  bh=42aqRJGbhXV052wkPWxRJfnjiRxGqReFIe7bVnt1mIk=;
  b=DTHvgwABF7iKXQi294v2MFlBSQCupny5V9bOAKbCdNl6+9vXmVD8gBuy
   ybtx9YQKw3ODjlvVvjA93JPqtlw4bmxLqVOHtT3WYk67vZTxWnJMJ1OJ5
   1wBGzRa0W0K3GBBT+V9C2NUEQmLWIPM8BpCMGvG5qyIFBIVEaEPAFb3K8
   4ZPUFiDWeo9q4lCc3YrRkT5HjkIchyLfPA74fzwPJAbkIT6ax8lvvbsDv
   63hUcHRBsFJybgCRO5RSREaX/D4+JUiE8zMULv6Sl3EOU81zH4P1iYBG4
   /ZnjBk9Dl0OmWV42N19TF4C0IxPZkU0g4/vkCDqP67TGLubHwTRR55PU6
   g==;
X-CSE-ConnectionGUID: TUu2PeYxQQePVtCWr3O2Gw==
X-CSE-MsgGUID: TEkfpfDLQI68Tk83GJ1zkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="883656"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="883656"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 15:05:59 -0700
X-CSE-ConnectionGUID: /iVlCLt1QuKW/rWFca5gig==
X-CSE-MsgGUID: Wh440y90TiCNTLFZVj9/lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="271223270"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2026 15:05:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x83Bv-00000000BRP-1w5U;
	Sat, 19 Sep 2026 22:05:51 +0000
Date: Sun, 20 Sep 2026 06:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202609200530.Q5EHu1wd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb15c16e04b24c94825fe17e483d325c4ac239a8
commit: 1e1a0f8ef58c0f6c4b6a091a786db123cf5c4610 [1/1] FROMLIST: KVM: arm64: Add tracing support for the pKVM hyp
config: arm64-randconfig-r1301-20260919 (https://download.01.org/0day-ci/archive/20260920/202609200530.Q5EHu1wd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609200530.Q5EHu1wd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609200530.Q5EHu1wd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp/nvhe/trace.c:37:1: sparse: sparse: symbol '__pcpu_scope_trace_rb' was not declared. Should it be static?
   arch/arm64/kvm/hyp/nvhe/trace.c:38:1: sparse: sparse: symbol 'trace_rb_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/trace.c:336:30: sparse: sparse: Using plain integer as NULL pointer

vim +336 arch/arm64/kvm/hyp/nvhe/trace.c

   313	
   314	static void rb_cpu_teardown(struct hyp_rb_per_cpu *cpu_buffer)
   315	{
   316		int i;
   317	
   318		if (!rb_cpu_loaded(cpu_buffer))
   319			return;
   320	
   321		rb_cpu_disable_writing(cpu_buffer);
   322	
   323		hyp_unpin_shared_mem((void *)cpu_buffer->meta,
   324				     (void *)(cpu_buffer->meta) + PAGE_SIZE);
   325	
   326		for (i = 0; i < cpu_buffer->nr_pages; i++) {
   327			struct hyp_buffer_page *bpage = &cpu_buffer->bpages[i];
   328	
   329			if (!bpage->page)
   330				continue;
   331	
   332			hyp_unpin_shared_mem((void *)bpage->page,
   333					     (void *)bpage->page + PAGE_SIZE);
   334		}
   335	
 > 336		cpu_buffer->bpages = 0;
   337	}
   338	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
