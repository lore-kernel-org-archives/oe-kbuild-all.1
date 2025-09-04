Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1F2C21D4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990967; cv=none; b=GMj8c8rgpmv1w4V0MsYbAE9LictnKX6ad8tQ+aoav/K/h0PZtfhqETx/3gWNX36zGcxkMhHEdp2sZoVIOw1Emrtp3tLNJ+NUaZOBjpWqcsPan4EI0jLTa61Nhlu8naJh8oNzFSNEBID7UncwVFDVsdeJaoHr+s7o5raZPr4YTRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990967; c=relaxed/simple;
	bh=ZeqVrEHeEE82CwedCgaY6aPUXavAZ7JXEvQ/3KQzbdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm+2On5JUUaAWxG7J9v/6dKl4JE8UkmCkXBX2D1fgFvbT9Dkburi5pK5aR0iaggprbVbcyBpJe92NzDFea6oX0zg7UJ4CVD6+JXucyxhpaVB7xcOjK12ytzuoRTPhCfJdvZUENT7itTAJS9MMpd+YPpcwKpf32VoYJUll/Kbq2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC1s1u0+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC1s1u0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756990965; x=1788526965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZeqVrEHeEE82CwedCgaY6aPUXavAZ7JXEvQ/3KQzbdA=;
  b=LC1s1u0+1I6CR0VPhC3vAvuqa66/HFsq9EVnFJSNjDkZHL0Th/c3xoHc
   27XPV5AxJpnweyT/RN0c59WBoXnKbriEIoZ5jZcn1yew/t8H+YLpr5w8O
   K5WVBPcTXh4+K9JFL1ACgVm2HW5jLUnNagTlGlTa/lHbD9yo8YuujFX7G
   c7b4NgjZCUylgGtYlWPDwjUAiYXW3Wdm0+VFMkW4zl/OsvxcjUl4eS6F7
   TFc3jHgA6VlEarmzVcjLl0owcnQnzp8lyH8su9ojUf4J7v++2jN+7MEK7
   QBJkgAc6O0fx5VMgmv80L2dqeEeqZS9n8dOscRf9th4TRrrQsFYeASum7
   g==;
X-CSE-ConnectionGUID: qDvNZeP4RXCGFyk7KMfWXw==
X-CSE-MsgGUID: 6qTwG998QDCi0RnRP4RnhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59279316"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59279316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 06:02:44 -0700
X-CSE-ConnectionGUID: wjKjug+ISjiV38csdt2oaA==
X-CSE-MsgGUID: z27HVbMAQjWCfKoOC/ObJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="209064790"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2025 06:02:40 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu9ar-0005JX-0v;
	Thu, 04 Sep 2025 13:01:54 +0000
Date: Thu, 4 Sep 2025 21:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Windsor <dave@nullcore.net>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, dwindsor@gmail.com
Subject: Re: [PATCH 1/2] kernel/bpf: Add BPF_MAP_TYPE_CRED_STORAGE map type
 and kfuncs
Message-ID: <202509042029.W1pcuqjU-lkp@intel.com>
References: <20250903175841.232537-1-dwindsor@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903175841.232537-1-dwindsor@gmail.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/net]
[also build test ERROR on bpf-next/master bpf/master linus/master v6.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Windsor/selftests-bpf-Add-cred-local-storage-tests/20250904-015935
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20250903175841.232537-1-dwindsor%40gmail.com
patch subject: [PATCH 1/2] kernel/bpf: Add BPF_MAP_TYPE_CRED_STORAGE map type and kfuncs
config: nios2-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509042029.W1pcuqjU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042029.W1pcuqjU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042029.W1pcuqjU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> nios2-linux-ld: kernel/bpf/syscall.o:(.rodata+0x734): undefined reference to `cred_storage_map_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
