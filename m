Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB991A7AE3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765472513; cv=none; b=NQThRTAZ7XGsscNIOOF0JEujI3149Ilu/JrjpljyxIyQWTFvIWwPOCn12O3ZxWKefsn2iBR+sF61b3JhVnjAKnF3OJrifUuDwNjkspeVKTSn189/k/XIuk3t51CV/acJ7oxavJZIcdCdYjUlRJOCBydXZm9RiHNW31JqanTALrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765472513; c=relaxed/simple;
	bh=fmwe+ZU8Y8oAC3NDxPTwDexqDomt37RSbdXI6Zf7/Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CAiLLTAzHLX/Cr5+uOrY0m+hoxoHSEW6aYMhi07PHTXeQqHr3KGeLI3jzO8XDXXpuf0xsEcuqAA154MnHU9bfQgI0T2rkend59LMVZ5Cp6BfBqqdYtiFw9MeDGaHomluYK7hyEvcM6oW44NhEa4ChnRhlMc/Ny3lvUEEF42ZEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fGZV4Shg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGZV4Shg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765472511; x=1797008511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fmwe+ZU8Y8oAC3NDxPTwDexqDomt37RSbdXI6Zf7/Nc=;
  b=fGZV4Shgi1qjyrovBermt9eSuba6TNx+fmQL/1KUZC07XJofPufeQjwo
   koBKt9sCMjViNz8SUnQ8T7gQ6MIbLlrHCvRYBrYpQgLLgAah9+rewqJDR
   4RHsqfFvry943L2Za/l8anF/FM3Evh0IscJAJXByvDNvp07+HD6ckMMDL
   pFehjJUKziZm3RjcRv1tdG7G92neKdUexMeSAxEVKATvwoa0o0W6t42rv
   QeolO/7Qjy9IGzVr+iUB9fcc4nQZbKEv5FUJzjvi6h37eGUsERBDbMurX
   K6cvD3TVVDVJIxhyU9MOVS3DZRie6rm/Rapq+tu4h7YPtWBo7NggOzYX+
   Q==;
X-CSE-ConnectionGUID: Dj6late7TfCjr+t5UKcKkw==
X-CSE-MsgGUID: Dp92bJi9T6SkuQlgWlSjAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66642899"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="66642899"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 09:01:50 -0800
X-CSE-ConnectionGUID: 7TRAMtOeSCKuz64VlQVepQ==
X-CSE-MsgGUID: wh2yLBCkRHm7j+j9vQK5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197321466"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Dec 2025 09:01:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTk31-0000000019Q-2K2M;
	Thu, 11 Dec 2025 17:01:47 +0000
Date: Thu, 11 Dec 2025 18:01:19 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included
 in any toctree [toc.not_included]
Message-ID: <202512111850.SYDnXP6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: d2b16a7a1e3de38a78a0873178e4e65214260a49 [0/25] anolis: mm, memcg: Provide users the ability to reap zombie memcgs
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512111850.SYDnXP6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111850.SYDnXP6q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/gpu/hydcu-fixup-header.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
