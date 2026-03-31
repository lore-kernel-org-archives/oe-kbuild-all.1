Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A553E95BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946977; cv=none; b=jV32Cfdog1eTrumWVEUuwHf7EfmT2n1oLx5lXtXcQQzwDdooW9sWam6cKwhb+sOcAws3SVOTCUmYJJiJX7sQWv54DEl4MDTuToUqWMzWfjNl6k+j7S17K4UY/6refbGyVtetnv978wt2HjfL7KTP7jyOhB7tDS01/LfEptg1iMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946977; c=relaxed/simple;
	bh=XRyoxdM1/kZV4dB6RYj1dsS9O/Zzf/R4+PZ3VA29BmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lCiZWbeXD1jTj04s77NelQOW7wQFtmQ1EMocjrVUanjUIcxh1gIeppe5yeeY3T1usDXrYp4S7PRHIVdoQs2IWPcL9YwPl0QNtHfWnsck7imRoYQgDLTfTDfCmt+xHO42dd9RTdBrCEHdeDq+9mnICGmbCi/4OAy2zYxMQMZj9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEgtqKPz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEgtqKPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774946977; x=1806482977;
  h=date:from:to:cc:subject:message-id;
  bh=XRyoxdM1/kZV4dB6RYj1dsS9O/Zzf/R4+PZ3VA29BmA=;
  b=eEgtqKPzrA8wwiGKRr4bFnAFSXvDfuxH/8nzm3i0yZX52D5+Dtwr8p4L
   H7sQEzqYK38u35RSxgKzkNcxgiGWL8zPIPBoMuN1bwFFigXaUbyXnojwq
   HOWllredL2LtMBihjMNovdGL6yJyTxdv1WOEzTTrkprfdWtfL01XYybJK
   Q3krC+vt8d1mhY57H9A8Zl7IG/rnnGyBY54OqHWSJMD5m+EaqTxDBfXhb
   1YEPaH+nFF8Qy29fAdBWd+gkFLwMXicuiuMxDsX4taQmcBSHyC40UpxuN
   AtjnJORMBMoPADi36WnglUJowi0x74SVzzAnvYaDmwb7N4NG44yD0kDD7
   A==;
X-CSE-ConnectionGUID: 5LI2GrSTQCKv/MK/Gbam/g==
X-CSE-MsgGUID: p+PTAWYZTD68TUX3Mqj3fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="98562395"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="98562395"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 01:49:35 -0700
X-CSE-ConnectionGUID: rJ0oT66UQXOmGMaQzXwKYA==
X-CSE-MsgGUID: eauXSfhWROuet30qwIMZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226551879"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 01:49:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Umx-000000002RD-0lvK;
	Tue, 31 Mar 2026 08:49:31 +0000
Date: Tue, 31 Mar 2026 16:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-04 6/6]
 arch/arm64/kvm/hyp_trace.c:709:37: warning: unused variable
 'hyp_trace_raw_fops'
Message-ID: <202603311653.JxcIsUpn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-04
head:   ce562c94afca04439e69f19959cb6198e0776d45
commit: 8ae140fc839f2739df17942add206b1dc938c85c [6/6] ANDROID: KVM: arm64: Add raw interface to nVHE hyp tracing
config: arm64-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311653.JxcIsUpn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311653.JxcIsUpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311653.JxcIsUpn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:709:37: warning: unused variable 'hyp_trace_raw_fops' [-Wunused-const-variable]
     709 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/hyp_trace_raw_fops +709 arch/arm64/kvm/hyp_trace.c

   708	
 > 709	static const struct file_operations hyp_trace_raw_fops = {
   710		.open           = hyp_trace_raw_open,
   711		.read           = hyp_trace_raw_read,
   712		.release        = hyp_trace_raw_release,
   713		.llseek         = no_llseek,
   714	};
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
