Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8224A0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764224979; cv=none; b=nU6Xsm0VG6U18q0itbqpogXCf8/SHS89+zOdnv7v6J8YF3Ev8Zv5Qin+rfmzFxv4CoXdrnHRgjpMZi1c97m3kBYD7oNTctfOopIVOzMTPLcfteEJc1A2rbgmU/YlETleJ3rFH9If/fNLy43RN1BPz+m9ndiHOqj1u0Hqw16QHsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764224979; c=relaxed/simple;
	bh=sroScjBbZ/Ii18/yVutN/P4uXXLskq0CZprMTjPdEIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZsM12YX82Tjj1bmNKMFXRsKYMNtmsVxsErp+YDzDLCMCnvh8Y+o7ZzFFgXTYLahKLPvK+3q1ug966uO36Q5KX7JYAAYhMTb6eTMRZApsLZkbd0q4bGX5IMzSJSoZvOFuraVMtXnLFPblLmQpLGcZ/yxOo2rrrCH2LwI9JdVStaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eE8UQSft; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eE8UQSft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764224975; x=1795760975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sroScjBbZ/Ii18/yVutN/P4uXXLskq0CZprMTjPdEIE=;
  b=eE8UQSfti8HpFq+XeifxeeXoKXcC9rjyt3hLRKxanOtrHDCeJS29XAO+
   txVPPP8niwPUOiNZ3st3aSJ8c2nrwcJ+CQds+sTGc/0MFmTZ5YwhSJ7vQ
   2d0fk/+MbMEGh1TvMy/P8tw4nD8o91dZmxmEqOd3FQrC1OjhDwdlZvEKJ
   u+fYNIo5/KFja5ej7S00KpovRhfP5O38UJm4vl9r8yxQzfknJ7Clnhxit
   Kt3LLcafAbFxHfab4KmsZXJt85fmSIpoHijea2r45HzlwIKIk7suRQHxm
   +r1HWFx4KT5DdlEBJg1broT8Ncw8CyC7h3afbc6Pua/jyQt3Hr5hdLqvJ
   w==;
X-CSE-ConnectionGUID: VpXBmeL4Siqb9coDY0VEoQ==
X-CSE-MsgGUID: 8fZ/x8pFTV6dk/nDU3VjwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88912562"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="88912562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 22:29:35 -0800
X-CSE-ConnectionGUID: u5SSjd31T46xD+JO2wxQyA==
X-CSE-MsgGUID: NI9w9MKHS5iYs3+fgUKJiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193372052"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 22:29:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOVVV-000000001dN-06SJ;
	Thu, 27 Nov 2025 06:29:33 +0000
Date: Thu, 27 Nov 2025 07:29:06 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan Mu <mufengyan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3392/3392] htmldocs:
 Documentation/networking/ub/ubl.rst:63: WARNING: undefined label:
 'documentation/networking/ub/unic.rst' [ref.ref]
Message-ID: <202511270737.QHfXJWa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ef262ed1914f6af42786e3f0785c3ea16d21e335
commit: 5581b34fafcb3d4c4d1e98b6bf6a543ca47db91b [3392/3392] net: ubl: Add a doc for ubl module
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270737.QHfXJWa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270737.QHfXJWa1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/scsi/sssraid.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/arm/pvsched.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/kvm/arm/pvsgi.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_memfs_info.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/networking/ub/ubl.rst:63: WARNING: undefined label: 'documentation/networking/ub/unic.rst' [ref.ref]


vim +63 Documentation/networking/ub/ubl.rst

    59	
    60	.. kernel-doc:: drivers/net/ub/dev/ubl.c
    61	   :identifiers: alloc_ubldev_mqs ubl_create_header ubl_type_trans
    62	
  > 63	An example of using the above API is the unic driver, see more detail using in
    64	:ref:`Documentation/networking/ub/unic.rst`
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
