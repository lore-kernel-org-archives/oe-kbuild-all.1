Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AE9244668
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758278618; cv=none; b=hZB7s9qB5tsvd/6OKWYWaAae4S1XvOmHr2Vq++wp9yemC7s4OO4DQwvslri3AO2dtiIbEOozhTMcqT4zvv8aCpSr1eXNRBN+ttqlm3SfIZm4FmPBqevSzUq1zLYWQdkbCiVjHrPtubhyQPvFuGg3rHRyuIJ0Y0ofpCuWnRsSZkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758278618; c=relaxed/simple;
	bh=qtHOPxx59TYFrWt9eUIMVdFfXeCwSRo5u3EoAhQDavc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/TgR6xOYeSqRMLQ3iKooAt1dQVU/Um8LC6zeGwBurq4z6b1pfRZZBzhuiBZkwrkc3aK6uFYVN7wdb7ec+uD/93rsy+NiTL3BcyaGdqDL1OHxRsgUa8LwtRzgyGRSt0uI69xU5Ox+hI4+1JlSGWBktHQyHld08nt74+mQnWZpI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HItJ6SME; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HItJ6SME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758278617; x=1789814617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtHOPxx59TYFrWt9eUIMVdFfXeCwSRo5u3EoAhQDavc=;
  b=HItJ6SMEq1WGSp9vsU6hUTFPt2G8YJgiQ0LGM9KV0ZBJo9+0SKFoCtol
   N4shXVr+11UmA3gX8iJNOfjZwivfNQ77qVclfwbkeL4bch3UmgiTciHzk
   e+srdq/w3VxMZhwbH42cYItdSJ3w1h2WEYdj1qa5od5ui+cDi5l5eEJ7E
   WctZdh1H9k1pSIhmtkVTPmCQAi6iSx0EjdXHZsuBD32RlQIOiUTb11VKr
   zFfOMfQMt5lTdGJVHJZyfKes1GkIcfN2ePrUrNjEwF/OnhR5suKkzVKPq
   mF4m4gwtKT2FRAVqhxiEnsdYKS99fu8ZtxY+t+LAIhH5V72H4rSmQjSDj
   Q==;
X-CSE-ConnectionGUID: IkGkTgrdTOufgcMMZNNrew==
X-CSE-MsgGUID: tQfEN64lRDa9p9DTmoIPKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59664051"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="59664051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 03:43:37 -0700
X-CSE-ConnectionGUID: GZf9rnD5T6yv4IMiURWFUg==
X-CSE-MsgGUID: lKQemfmtRnaiyW8ElJgDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="175418974"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2025 03:43:35 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzYaT-000000003Jt-2B42;
	Fri, 19 Sep 2025 10:43:33 +0000
Date: Fri, 19 Sep 2025 12:43:23 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:6.6-velinux 5959/5959] htmldocs:
 Documentation/virt/coco/sev-guest.rst:75: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202509191208.obomOxRR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   267e33ff5e034d9f9222c229e6967b6ceb65e27a
commit: 14e76e4269bba303729abc7345871d31b6a99357 [5959/5959] crypto: ccp: Add the SNP_PLATFORM_STATUS command
reproduce: (https://download.01.org/0day-ci/archive/20250919/202509191208.obomOxRR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191208.obomOxRR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/energy_model.h' failed with return code 2
   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
>> Documentation/virt/coco/sev-guest.rst:75: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/virt/coco/sev-guest.rst:78: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/virt/coco/sev-guest.rst:81: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/virt/coco/sev-guest.rst:83: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]


vim +75 Documentation/virt/coco/sev-guest.rst

    72	
    73	::
    74	        struct sev_issue_cmd {
  > 75	                /* Command ID */
    76	                __u32 cmd;
    77	
    78	                /* Command request structure */
    79	                __u64 data;
    80	
    81	                /* Firmware error code on failure (see psp-sev.h) */
    82	                __u32 error;
  > 83	        };
    84	
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
