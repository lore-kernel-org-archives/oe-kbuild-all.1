Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2AE32825E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 07:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765955540; cv=none; b=pD9Rimrfu//ktUfbWLSWCFzGaPEtrtXzaTzcbmSW1kks73vAC54KhRtYVlG3ofZO9cUDwndA36cby9TuvbYni5zy7WJNOwJvBuUxz8a5NmK6M8S+qTgGt4bfQm8xEsUHk41VL82VkdQbZ2dMsFnAJgmRRzHaJ8AJ2FiTv81cDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765955540; c=relaxed/simple;
	bh=MqRwG7WOuEq2yhZmp+3x6A+uVCStfg7hA3I1wIEtA28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NsuK8c9VaY4WLpB7QFFAQ9G4qPMQc+0pQKt9EcMgcnF//UGJYneR79WQrbLL1Rs9I/wwxFszzUGRmcMnVS/kRv38mUdB8UcyFe/iJtbwhhn2Gh+RpcR7y9Euk9pDMJdGAiC3xICF2cEJdUD903x8DkjHF1WFiiu3GsjT93NKcUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNecbgxu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNecbgxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765955538; x=1797491538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MqRwG7WOuEq2yhZmp+3x6A+uVCStfg7hA3I1wIEtA28=;
  b=ZNecbgxuty3ZoI7Iq5RB7W5HWqpnNfMijGJUL7MVm4yJ8NgVSag5l9aa
   F6TfqnwGFWO9+pOT+a3NoOdk8w/q9q/c7uqErYVGAjOB3WAPDxFfZvkP2
   JN6FsywUBB+tCxJInwggOlDIh0stPoCR2cBlUhGAQ3Jp/mLO1lcY40DON
   KVmC93d8FHl7MXYBRRTNUNi+PzYW2GHH9ZCs0wsAror7Tqf38amo+hNNS
   uuJLRQU5fo7Ih6hPfabRqErERgipvAD8NsPwC2tpBWJW2JWGA9aEZvfyg
   vDlMZHNuyXkfpbq/lb5Du3qje4Rf0uYmxqHL8LGKN9otEL47uhQZX0E+h
   g==;
X-CSE-ConnectionGUID: KrA4FmZrTWu3XBZKRUue9w==
X-CSE-MsgGUID: 0beGzhxmRQKsowfig81uHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="85476399"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="85476399"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:12:18 -0800
X-CSE-ConnectionGUID: vsZEpFLQQo6v2RSVK30WlQ==
X-CSE-MsgGUID: a+P11hExQguU88sCFpZhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="235626349"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 23:12:17 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVlhm-0000000008d-0ZvE;
	Wed, 17 Dec 2025 07:12:14 +0000
Date: Wed, 17 Dec 2025 15:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 1/1]
 arch/arm64/kvm/hyp_trace.c:719:37: warning: unused variable
 'hyp_trace_raw_fops'
Message-ID: <202512171542.tP7y9YLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mostafa,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   adfcc1116ee5759e1bf9628f25f61398f9d17a0e
commit: 09de45521bacc85848722d3b15c846e584e51846 [1/1] ANDROID: KVM: arm64: Fix build issue without CONFIG_ARM64_LSE_ATOMICS
config: arm64-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171542.tP7y9YLx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171542.tP7y9YLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171542.tP7y9YLx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_trace.c:9:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2191:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kvm/hyp_trace.c:719:37: warning: unused variable 'hyp_trace_raw_fops' [-Wunused-const-variable]
     719 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/hyp_trace_raw_fops +719 arch/arm64/kvm/hyp_trace.c

8ae140fc839f27 Vincent Donnefort 2023-06-13  718  
8ae140fc839f27 Vincent Donnefort 2023-06-13 @719  static const struct file_operations hyp_trace_raw_fops = {
8ae140fc839f27 Vincent Donnefort 2023-06-13  720  	.open           = hyp_trace_raw_open,
8ae140fc839f27 Vincent Donnefort 2023-06-13  721  	.read           = hyp_trace_raw_read,
8ae140fc839f27 Vincent Donnefort 2023-06-13  722  	.release        = hyp_trace_raw_release,
8ae140fc839f27 Vincent Donnefort 2023-06-13  723  	.llseek         = no_llseek,
8ae140fc839f27 Vincent Donnefort 2023-06-13  724  };
8ae140fc839f27 Vincent Donnefort 2023-06-13  725  

:::::: The code at line 719 was first introduced by commit
:::::: 8ae140fc839f2739df17942add206b1dc938c85c ANDROID: KVM: arm64: Add raw interface to nVHE hyp tracing

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
