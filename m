Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8DC8F0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770671461; cv=none; b=rtx9qviauuiygl6D0pd16lNfvqTSixW49A/EiUaUWzQeit32963plZqq4uMtgloUZ1QpoIm0ZYErqGowY+Tufp/hcLc9rBkZc3wSp1v3V6saObi2suQykrpAx64K8v3A8tTmnH7YdnWyMAKmk7VOxPN0oDFtXmIAO0XbPmyOFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770671461; c=relaxed/simple;
	bh=jw24xzjfBjgJg9youdctYJsyweFseYlheiAedT8q3l0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dj8IQo2vV2LY/b8aMlDOztXIQsaCKwGq1beRDbjqN3XNAYHxoXhurblOHOsnL3VMY671BA65bDSjaXF3KLEYprLzY700g4LM8Erx+RmTiiGGMhTbujxVB2Qg19+LwN8FUQJ1Z/S4HPw5AgMU8i+q3f3ZIUHUFPsTjQKWrpRMexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0l5J87u; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0l5J87u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770671460; x=1802207460;
  h=date:from:to:cc:subject:message-id;
  bh=jw24xzjfBjgJg9youdctYJsyweFseYlheiAedT8q3l0=;
  b=m0l5J87uwhsp54gdjURRDuV1yav2sLlAEO4iyEjKwTjlUelnyx9ZIC07
   nr8qboARvIIlCPRPBBpp4fR4/GPVkwGeDTG4+D1Xf1jQY7zmKRn7xwDp0
   RLr5X2UgJ509nCtqNipedMChi72hiRJGTB6JD3baTOT/bIDgmgbaF7o7D
   w9vaLBuHJdZRmN5eno7c+iD5imodnNvdqpF2y6Kd2xeqf10sP6VXXHu3f
   VdHjJvTcuq+OSq2rQ3r5CUWU0dMEiFdVfe/e1gdWHrHjgc3dKIHMwTx5u
   sK2enQDJcTXVMjSz+rb3amn8tXCmqfzN1g1PQpo5k5IZTqCJ3ROUqGmWz
   g==;
X-CSE-ConnectionGUID: IktVigsuRQmQv0hrJvcmtQ==
X-CSE-MsgGUID: Tdu3uqMCSSOfnqykEgBt9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71893942"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71893942"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:11:00 -0800
X-CSE-ConnectionGUID: ZX/ygkpPR1OXj/B3xuKjMQ==
X-CSE-MsgGUID: 801ftyokSr+NHLhwJIFGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="210837348"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2026 13:10:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpYX2-00000000oKi-3hDs;
	Mon, 09 Feb 2026 21:10:56 +0000
Date: Tue, 10 Feb 2026 05:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 4/12]
 arch/arm64/net/bpf_jit_comp.c:2511:1: warning: control reaches end of
 non-void function
Message-ID: <202602100403.46Kcz73f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   95bf1a3ff57efabf9b7c50b8a0d3583a6714f5d8
commit: 839b12f2dd3dd0be0a7321691ec25efca4132668 [4/12] bpf: Add struct bpf_tramp_node object
config: arm64-randconfig-r112-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100403.46Kcz73f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100403.46Kcz73f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100403.46Kcz73f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/net/bpf_jit_comp.c: In function 'is_struct_ops_tramp':
   arch/arm64/net/bpf_jit_comp.c:2510:45: error: '((struct bpf_tramp_node *)fentry_nodes->nodes[0])->link' is a pointer; did you mean to use '->'?
    2510 |                 fentry_nodes->nodes[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
         |                                             ^
         |                                             ->
>> arch/arm64/net/bpf_jit_comp.c:2511:1: warning: control reaches end of non-void function [-Wreturn-type]
    2511 | }
         | ^


vim +2511 arch/arm64/net/bpf_jit_comp.c

efc9909fdce00a Xu Kuohai 2022-07-11  2506  
839b12f2dd3dd0 Jiri Olsa 2024-10-17  2507  static bool is_struct_ops_tramp(const struct bpf_tramp_nodes *fentry_nodes)
87cb58aebdf700 Xu Kuohai 2024-10-25  2508  {
839b12f2dd3dd0 Jiri Olsa 2024-10-17  2509  	return fentry_nodes->nr_nodes == 1 &&
839b12f2dd3dd0 Jiri Olsa 2024-10-17  2510  		fentry_nodes->nodes[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
87cb58aebdf700 Xu Kuohai 2024-10-25 @2511  }
87cb58aebdf700 Xu Kuohai 2024-10-25  2512  

:::::: The code at line 2511 was first introduced by commit
:::::: 87cb58aebdf7005661a07e9fd5a900f924d48c75 bpf, arm64: Remove garbage frame for struct_ops trampoline

:::::: TO: Xu Kuohai <xukuohai@huawei.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
