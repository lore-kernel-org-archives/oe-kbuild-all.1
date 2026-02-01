Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68F212554
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769961393; cv=none; b=WwspcNy9w4GE1HzWpVq/pvWJp52IPJGmG2wYTZIYezvYivFN8aQgCtT/9SUDZcmZSXbPsMSu9NF4kIrHMb+PFVq98l+jQsx1O5czqrNRnwRGjrBaLJ7M0hH0ADOt28jmvLXYtLUcvDPQVpUeeVeKF7JnkRfTs8CVcZOoPPFiqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769961393; c=relaxed/simple;
	bh=l811jADIX/dY2visYhGQcFS/PIqod1TIVe9E6D6O+9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HZTZLTc0gZKS4Q1oEjtHrqcK6L/yZvkJkQruJKl/6JYzksPG3UASB1v6P7/xf7fgUDYWvjrLe3nQs9biURlCZtkpzmag/DLvaAxTsOT9dvO+mOlF8cGv51HiTKK75hruasseAj77zVdHGF3c6YxIhH84NaEsQqz+RRzUqv19sYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDS6bV/a; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDS6bV/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769961391; x=1801497391;
  h=date:from:to:cc:subject:message-id;
  bh=l811jADIX/dY2visYhGQcFS/PIqod1TIVe9E6D6O+9M=;
  b=HDS6bV/aqLcPjAKT5y31lD1jLLyHTyUIO2oksoRgE8NOnMMWM321UmzN
   dewdYrsmK5pza5RDpKKfRyKb60acFfXpiNAAFjYLdEg7/drBsM0B2zOir
   q2x8LHciKxgBjN2qwdqdIMw/xKlyWH9aISYkJMkt3KOrDasb9E7aIAJEH
   B6M6aKrIJfsaX8g3UUAJspM6aYRUnyfrjoz6fRQ4/stCiEPOsYQzunLM5
   6Q+BoPOH7CUHcTSV5ktLGqjEW8QngkUfnzV6eEYL6ye91rHCL90PZwUur
   5FQy+RH1Uw/QTwqXZCrJT2JapLSmJ+maH+Y/xC1VdVzrzLTHmTfso9Hj5
   A==;
X-CSE-ConnectionGUID: Y+iWnU4yQZGzNLtiaLfdmQ==
X-CSE-MsgGUID: 4CtBgGe8QBWaJ/11Ks1VBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71177782"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71177782"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 07:56:30 -0800
X-CSE-ConnectionGUID: Ur9ID/fWSvKjPpIWzGkHrQ==
X-CSE-MsgGUID: +Uv72vGyTkuijHreR4Er8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="208854747"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Feb 2026 07:56:28 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmZoI-000000002xt-1fex;
	Sun, 01 Feb 2026 15:56:26 +0000
Date: Sun, 01 Feb 2026 16:55:29 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 Documentation/admin-guide/hw-vuln/srso.rst:124: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202602011601.Q24iyvTK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: 5495294788f667bd4c8799b7b0709d5a75c0711a [0/3] anolis: cpu vulnerabilities: support to flush all types of branches rather than indirect branches type only in the Branch Target Buffer with the IBPB command.
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602011601.Q24iyvTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011601.Q24iyvTK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   percentage of max limit, default is 50 or 0.5% of max limit.
   The max value is 1000 or 10% of max limit.
   ==================================== ========================================== [docutils]
   Documentation/admin-guide/hw-vuln/srso.rst:119: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/hw-vuln/srso.rst:122: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/hw-vuln/srso.rst:124: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/media/ipu3.rst:592: WARNING: Footnote [#] is not referenced. [ref.footnote]
   Documentation/admin-guide/media/ipu3.rst:598: WARNING: Footnote [#] is not referenced. [ref.footnote]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_zone.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_blk.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/rio_drv.h' failed with return code 2


vim +124 Documentation/admin-guide/hw-vuln/srso.rst

    58	
    59	   The processor is vulnerable and no mitigations have been applied.
    60	
    61	 * 'Vulnerable: No microcode':
    62	
    63	   The processor is vulnerable, no microcode extending IBPB
    64	   functionality to address the vulnerability has been applied.
    65	
    66	 * 'Vulnerable: Safe RET, no microcode':
    67	
    68	   The "Safe RET" mitigation (see below) has been applied to protect the
    69	   kernel, but the IBPB-extending microcode has not been applied.  User
    70	   space tasks may still be vulnerable.
    71	
    72	 * 'Vulnerable: Microcode, no safe RET':
    73	
    74	   Extended IBPB functionality microcode patch has been applied. It does
    75	   not address User->Kernel and Guest->Host transitions protection but it
    76	   does address User->User and VM->VM attack vectors.
    77	
    78	   Note that User->User mitigation is controlled by how the IBPB aspect in
    79	   the Spectre v2 mitigation is selected:
    80	
    81	    * conditional IBPB:
    82	
    83	      where each process can select whether it needs an IBPB issued
    84	      around it PR_SPEC_DISABLE/_ENABLE etc, see :doc:`spectre`
    85	
    86	    * strict:
    87	
    88	      i.e., always on - by supplying spectre_v2_user=on on the kernel
    89	      command line
    90	
    91	   (spec_rstack_overflow=microcode)
    92	
    93	 * 'Mitigation: Safe RET':
    94	
    95	   Combined microcode/software mitigation. It complements the
    96	   extended IBPB microcode patch functionality by addressing
    97	   User->Kernel and Guest->Host transitions protection.
    98	
    99	   Selected by default or by spec_rstack_overflow=safe-ret
   100	
   101	 * 'Mitigation: IBPB':
   102	
   103	   Similar protection as "safe RET" above but employs an IBPB barrier on
   104	   privilege domain crossings (User->Kernel, Guest->Host).
   105	
   106	  (spec_rstack_overflow=ibpb)
   107	
   108	 * 'Mitigation: IBPB on VMEXIT':
   109	
   110	   Mitigation addressing the cloud provider scenario - the Guest->Host
   111	   transitions only.
   112	
   113	   (spec_rstack_overflow=ibpb-vmexit)
   114	
   115	In order to mitigate the attacks to the user space tasks,
   116	IBPB must be set to flush all types of branches by setting kernel parameter ibpb_brtype.
   117	The description of kernel parameter ibpb_brtype is as follows:
   118	ibpb_brtype=     [X86, HYGON only]
 > 119	                IBPB action control flag
   120	                Format: { ibpb-all | ibpb-ind }
   121	                ibpb-all -- IBPB flushes all types of branches,
   122	                            this is the default value if the command line
   123	                            does not specify the ibpb_brtype value.
 > 124	                ibpb-ind -- IBPB flushes only indirect branches.
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
