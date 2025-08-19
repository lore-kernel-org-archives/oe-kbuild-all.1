Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03C3101AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755638463; cv=none; b=lnK5Wa7W3WN5IVThBshpxbUJWWQRIxgaDpO4H05UrjbJtj5M6Eag+JorpySe7Spxth3KUl8TAkV2Lr1jUE2QIOSZRSHroJevh/o5VueUCJMfNI9WwQ5OTsuvxlBPN9QjevrlqfiwMKofF261ZfxWPnao545C1z2ZZJzxlPN10Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755638463; c=relaxed/simple;
	bh=OTAiCO+1+V1cK52vHjg/Yjxwnw5E+FVXq4uuanHeXNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcwyS+JEB8HQBOgE/FhlRvurCtfa4zWQbZ1quLz7sLoz3ZRyb/bdnOlyxW9MFAxBbCkbi+k9iYfxHh/1wEvhTE58zt0Vyly/TmjecRCWg0mX51F07r/mDVFjo4P3Cx8kYgbzB1SCvmwIUT+Zyk3NHFDAWpSb/78zSVKKFqV8ivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0yTSdK/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0yTSdK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755638462; x=1787174462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTAiCO+1+V1cK52vHjg/Yjxwnw5E+FVXq4uuanHeXNM=;
  b=N0yTSdK/AjMHDFLnYvnX519Vay8rQlbvENBdhRiftiB9FwSPD5TtoBFO
   3quIi8b5iNHxnFh9dncIzfrrWt6qK+c55m0R7v5LZtSe6I+Bn8I1QalAh
   uneKbT6oDQGsfyZx0zMDrbvqD/ncKpVdQBttsBOyricPmp4aRnI9jpQ/B
   yCd92CjgthzIOREcYNo1dVHp8fS6SvHE2XJFU+q5MT6VtQIJTCy1wuWtI
   ySE9sQzn0jg05xF7lWZJibKAwD4hEGk8tkLWJ4Ud4mLxFa5AYyYNFaI8x
   Rwm8UyXsK0N9p73O82L2SQ482is0+7d6bUXfbnlKo0Cxkpqnp2Y/+/Cjv
   g==;
X-CSE-ConnectionGUID: DVERnUTeQr+hls+v4r83sA==
X-CSE-MsgGUID: fy+P9VEmQAG5rCclaBhYIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="60526039"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="60526039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 14:21:01 -0700
X-CSE-ConnectionGUID: F4R76j82SPWrpGrJY2M/Ng==
X-CSE-MsgGUID: hrc6g9O2RhW+tNcxgz+mxg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2025 14:20:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoTky-000HWN-2G;
	Tue, 19 Aug 2025 21:20:39 +0000
Date: Wed, 20 Aug 2025 05:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, linux-hyperv@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Tianyu Lan <tiala@microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>, Li Tian <litian@redhat.com>,
	Philipp Rudo <prudo@redhat.com>
Subject: Re: [PATCH v2] x86/hyperv: Fix kdump on Azure CVMs
Message-ID: <202508200507.78h11riS-lkp@intel.com>
References: <20250818095400.1610209-1-vkuznets@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818095400.1610209-1-vkuznets@redhat.com>

Hi Vitaly,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on arm64/for-next/core tip/master linus/master v6.17-rc2]
[cannot apply to tip/auto-latest next-20250819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/x86-hyperv-Fix-kdump-on-Azure-CVMs/20250818-175830
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250818095400.1610209-1-vkuznets%40redhat.com
patch subject: [PATCH v2] x86/hyperv: Fix kdump on Azure CVMs
config: x86_64-randconfig-101-20250819 (https://download.01.org/0day-ci/archive/20250820/202508200507.78h11riS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508200507.78h11riS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/hyperv/ivm.c:601:2-3: Unneeded semicolon
   arch/x86/hyperv/ivm.c:504:3-4: Unneeded semicolon
   arch/x86/hyperv/ivm.c:561:3-4: Unneeded semicolon

vim +601 arch/x86/hyperv/ivm.c

   565	
   566	void hv_ivm_clear_host_access(void)
   567	{
   568		struct hv_gpa_range_for_visibility *input;
   569		struct hv_enc_pfn_region *ent;
   570		unsigned long flags;
   571		u64 hv_status;
   572		int cur, i;
   573	
   574		if (!hv_is_isolation_supported())
   575			return;
   576	
   577		raw_spin_lock_irqsave(&hv_list_enc_lock, flags);
   578	
   579		input = *this_cpu_ptr(hyperv_pcpu_input_arg);
   580		if (!input)
   581			goto unlock;
   582	
   583		list_for_each_entry(ent, &hv_list_enc, list) {
   584			for (i = 0, cur = 0; i < ent->count; i++) {
   585				input->gpa_page_list[cur] = ent->pfn + i;
   586				cur++;
   587	
   588				if (cur == HV_MAX_MODIFY_GPA_REP_COUNT || i == ent->count - 1) {
   589					input->partition_id = HV_PARTITION_ID_SELF;
   590					input->host_visibility = VMBUS_PAGE_NOT_VISIBLE;
   591					input->reserved0 = 0;
   592					input->reserved1 = 0;
   593					hv_status = hv_do_rep_hypercall(
   594						HVCALL_MODIFY_SPARSE_GPA_PAGE_HOST_VISIBILITY,
   595						cur, 0, input, NULL);
   596					WARN_ON_ONCE(!hv_result_success(hv_status));
   597					cur = 0;
   598				}
   599			}
   600	
 > 601		};
   602	
   603	unlock:
   604		raw_spin_unlock_irqrestore(&hv_list_enc_lock, flags);
   605	}
   606	EXPORT_SYMBOL_GPL(hv_ivm_clear_host_access);
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
