Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298871AE877
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769930851; cv=none; b=Sc6mkVWgLMRXSoDasijbrF8mpglm8kmh/rnkB6hl8JN2RmFt6MEru8qPpp6yKz1dGYzQ4q/f5mXaw3z26Wxnob98JLd7XBZTrZaNlQGmt7qAcnVJIrsOTSwc+W7ecaPwm3cIsF56Ih9+QvJrkf6juHrksRrvacLLMtE9u7/C21w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769930851; c=relaxed/simple;
	bh=WLbqxVPVmp+8QUCGaF9BAfhQqQWinfl9Lb4AZNhVDCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L4mJ2jlEwRZM7es10Cf38Uq7OOnTiSISR9meG+Z02ziZfmS9mUg7Fh8UZV3zjymp0L8sA11ExKYuBQXNUVCxxgI0oDtRD3oqS+rJTcH0q4vSIFFNOa0jgJPaChQlUzWjM6OBHyWmHCtmXHDCtVW8Dwb8felFe3eBGM7hd9YHdjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/7DM4w0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/7DM4w0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769930848; x=1801466848;
  h=date:from:to:cc:subject:message-id;
  bh=WLbqxVPVmp+8QUCGaF9BAfhQqQWinfl9Lb4AZNhVDCE=;
  b=i/7DM4w0mZkR66SHDFhoSVNz1P+u7AzS0/7NDyookpXJUTSxWgkWZrar
   dBM64acsdgHiwi13dB2Dq9vUnQu8hYEArFHfqgo7hVa1dWjwx4hEZIjMw
   Sp2OkX/xsdLXCXv/QzCdCIWH2m4bEGgoq/vQWTWjavzik3PbvWrnKxzQP
   OrXSf8yyvVYgTZk+6fE8UquVK5veQO0nrGwIoCaA7W6UxatnXWrjqya5F
   hM1PBguvOE3w+zOUtG+FO51IR7OFE/CVl+Q8VwznoLBHRo7VHV8scq92u
   t9sZv8pJK6bcC4oFZwFvzN9+4SlNA3ILFpLm3sxJmHRTO+UdukWUoAyGb
   Q==;
X-CSE-ConnectionGUID: 9NSKun+eSw+NI0wy5XiJkw==
X-CSE-MsgGUID: OpKVSSNdQaWINyDxmwBleg==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71285220"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71285220"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 23:27:28 -0800
X-CSE-ConnectionGUID: lVL/Dp2GRYibYHc0W1ftaA==
X-CSE-MsgGUID: 2sa8WqZjRzG2JNNmeGFqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209195648"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2026 23:27:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmRrg-000000002vR-0Rz1;
	Sun, 01 Feb 2026 07:27:24 +0000
Date: Sun, 01 Feb 2026 08:26:45 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 Documentation/vm/coldpgs.rst:29: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202602010816.9PN2Mjy3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Xunlei,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: 09eda23b41866c7de32e6ad4f84c34f66afeed02 [0/3] anolis: mm: coldpgs: support reclaiming cold pages
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010816.9PN2Mjy3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010816.9PN2Mjy3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
   Documentation/scheduler/sched-bwc.rst:127: ERROR: Unexpected indentation. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
>> Documentation/vm/coldpgs.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:29: ERROR: Malformed table.
--
   +----------+----------+
   |          |          | [docutils]
>> Documentation/vm/coldpgs.rst:31: WARNING: Blank line required after table. [docutils]
   Documentation/vm/coldpgs.rst:31: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/vm/coldpgs.rst:32: WARNING: Enumerated list ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:33: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:35: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:190: ERROR: Unexpected indentation. [docutils]
   Documentation/vm/coldpgs.rst:192: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:194: ERROR: Unexpected indentation. [docutils]
--
   Documentation/vm/coldpgs.rst:374: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:402: ERROR: Unexpected indentation. [docutils]
   Documentation/vm/coldpgs.rst:403: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:433: ERROR: Unexpected indentation. [docutils]
   Documentation/vm/coldpgs.rst:434: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/vm/coldpgs.rst:454: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/coldpgs.rst:456: ERROR: Unexpected indentation. [docutils]
   Documentation/vm/coldpgs.rst:457: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/kidled.rst:51: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/kidled.rst:90: ERROR: Unexpected indentation. [docutils]
   Documentation/vm/kidled.rst:106: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/device_drivers/ethernet/nebula-matrix/m18120.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/vm/coldpgs.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/kidled.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +29 Documentation/vm/coldpgs.rst

    25	
    26	
    27	                                  (root)
    28	                                    |
  > 29	                         +----------+----------+
    30	                         |          |          |
  > 31	                        (A)        (B)        (C)
  > 32	                         |          |          |
    33	                    +----+----+     +     +----+----+
    34	                    |    |    |     |     |    |    |
    35	                   (A1) (A2) (A3)  (B1)  (C1) (C2) (C3)
    36	
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
