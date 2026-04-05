Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EBE2749ED
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775393056; cv=none; b=MawVws3AV9o8s8h66G7GVGQ3BcgV654qpUpzFsFnbL/y7xqgbAUtOgSVQ618d7Sczgt91/na8P4ilZgMGTkYUBaP3aeAMNnwpsvgEy1ZaVD080ue3gQRqo5sNzveCkqpZZdqd4Dg369Le+lY2GdirHwtJCuo2ctSaEdKWoBIkhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775393056; c=relaxed/simple;
	bh=6LOxCu+th6U/3RZcU2+/XQRunMK4cTlCM/P4hiKo5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6FCUHGW2GpcNzEuDZlKeBSMs2RP5NszUgn9DblvkuQvn2Ec3QhZ750xK/MGvaSS1DCAvcBvFPqp3HLqCI82kQe6iWgCuIMYaP7QOrKkY3wMa4i0wSNV+Fzo9UawTXpaixgxCHtcloJvGoSRgguPufrzN8ZNSOSCYc7lNni/szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNxmV2QE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNxmV2QE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775393053; x=1806929053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6LOxCu+th6U/3RZcU2+/XQRunMK4cTlCM/P4hiKo5cI=;
  b=RNxmV2QEgiwoCAXz5ij/toWv5IuDkUKE41wtrIBq1YMgqCpiFSURMI/k
   lBlDIHCCuNadICqMQo2HISXP+8nkhnY2E24byQKAO0Mk75HDpmzCsGMvA
   KNd1eYDRE+08bc7znbrWZwi0fYzpjD53XYp3ocJyEGCX7iJr+I9F3OdCN
   F1zQRLu5wBw+MrRT2UQTtcPH5pzlMF19kdMbapvE3MwglWBjTupdRVd32
   xUwzfJ+eFR4mIPfJeObPDBLiSwW/Xe0wktBaog6YkjMC8nC2K+VP+i2Od
   +9kIDNWCZAOxcqdovXVg3OeY/x5C+X/0+XUqvUmrMeyChBwtv7LUw/3ED
   w==;
X-CSE-ConnectionGUID: xa2SIs5gT/S5lmoiFW7fOg==
X-CSE-MsgGUID: ATW7VsHDQpGqAi7YJeKU4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="86678088"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="86678088"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 05:44:13 -0700
X-CSE-ConnectionGUID: x+7k2VhXTDGAT4ll6gv4Jg==
X-CSE-MsgGUID: 7SH0CJqMQaqEW3qgOjQcpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="250770470"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Apr 2026 05:44:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9Mpk-000000009rV-3b5u;
	Sun, 05 Apr 2026 12:44:08 +0000
Date: Sun, 5 Apr 2026 14:43:50 +0200
From: kernel test robot <lkp@intel.com>
To: Rito Rhymes <rito@ritovision.com>, corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v3 2/2] docs: add advanced search benchmark harness and
 instrumentation
Message-ID: <202604051424.8oinrnwW-lkp@intel.com>
References: <20260404073413.32309-3-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404073413.32309-3-rito@ritovision.com>

Hi Rito,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lwn/docs-next]
[also build test WARNING on linus/master v7.0-rc6 next-20260403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rito-Rhymes/docs-add-advanced-search-for-kernel-documentation/20260405-132032
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/20260404073413.32309-3-rito%40ritovision.com
patch subject: [PATCH v3 2/2] docs: add advanced search benchmark harness and instrumentation
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260405/202604051424.8oinrnwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051424.8oinrnwW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
>> Warning: Documentation/sphinx-static/kernel-search.js references a file that doesn't exist: Documentation/search.html
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
