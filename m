Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64AB537E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759201885; cv=none; b=m8SkGE1Qxg2193tffGI2F0RVnOBWDnJfSXbCcJ/vEUvQRg+lH4x96msD/cQB8z6lFkDeOf9ydFLvzVDO6BLbpwDyG9SkPbObGYLUuHYz27A269Zgti4aSBU8yLgAwUxOoJCDVA+qHkYf+YznNgDNq94Wfs70O14Ao0cvN2yXlBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759201885; c=relaxed/simple;
	bh=zIjUkhV461tuERn5K0qdQmlTxA1O++mbvnN5ncU1xEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iwoYmkTEfmUlC+styAh3rnD0imATEn0xWbzYSIP1+l9v7+g83yf5xnhYKf70IoN55a32+f2wO4dbPzOfKy74nLg55GluTV97UpzKK6Qk+Gsb3E2RgvKsSMyX6YGjSKBim/ITQ1svCvkNZs6LeIHz72dFc/SqtGU4c2vOr7tzrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PHwKGc5W; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHwKGc5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759201884; x=1790737884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zIjUkhV461tuERn5K0qdQmlTxA1O++mbvnN5ncU1xEs=;
  b=PHwKGc5WD5JeeBEtuEbDK2vUtR883aP46UjoLQK5/pSqnBIQeJx1iraS
   amy80ZDt71tPi+HILIEGCWSJ4dtttPW6iFfdQa/BCH6nXV/rIQVC24MKv
   6x9Ig5WbfJro+ZPXr0HGMYy47Z0FUUBXKZQNmz0cxhmVFNnIHrsi81HRt
   WJZzma5LOPV0mODik4V+fmPMquCUOhELU43DwFSHU+8cJhugpTghRN0pb
   oXX91nD63/Ukj/1hKk8sfJlKjiwJ60qgCLoqAQ1Me3vlaGPKlwfRIBWut
   4vLfCUOr2L292fBBkSceVaDrKN7b5h2ch6d+JLuQXNNVygJjQmowi20fj
   w==;
X-CSE-ConnectionGUID: JAuNdkXpScOnGjgWahzSRg==
X-CSE-MsgGUID: nRolV2HHSHS6hayq2ONWMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="84064993"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="84064993"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 20:11:23 -0700
X-CSE-ConnectionGUID: n6Za/oEIRA2HBJZPz4ui8g==
X-CSE-MsgGUID: I/uxiN8kSXuRimwsij6rFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="178359335"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2025 20:11:22 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3Qls-00000000689-0U7O;
	Tue, 30 Sep 2025 03:11:20 +0000
Date: Tue, 30 Sep 2025 05:11:19 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sean-jc:x86/gmem_default_shared 1/10] htmldocs:
 Documentation/virt/kvm/api.rst:6424: WARNING: Literal block expected; none
 found. [docutils]
Message-ID: <202509300514.P2rZBVjM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_default_shared
head:   71c8199c17c4609d842dc94e6d225156d8574d82
commit: f844b9053e048ebcebbedf37c72d6084a41fa773 [1/10] KVM: Rework KVM_CAP_GUEST_MEMFD_MMAP into KVM_CAP_GUEST_MEMFD_FLAGS
reproduce: (https://download.01.org/0day-ci/archive/20250930/202509300514.P2rZBVjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300514.P2rZBVjM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/virt/kvm/api.rst:6424: WARNING: Literal block expected; none found. [docutils]


vim +6424 Documentation/virt/kvm/api.rst

3d3a04fad25a66 Fuad Tabba 2025-07-29  6423  
3d3a04fad25a66 Fuad Tabba 2025-07-29 @6424  When the KVM MMU performs a PFN lookup to service a guest fault and the backing
3d3a04fad25a66 Fuad Tabba 2025-07-29  6425  guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
3d3a04fad25a66 Fuad Tabba 2025-07-29  6426  consumed from guest_memfd, regardless of whether it is a shared or a private
3d3a04fad25a66 Fuad Tabba 2025-07-29  6427  fault.
3d3a04fad25a66 Fuad Tabba 2025-07-29  6428  

:::::: The code at line 6424 was first introduced by commit
:::::: 3d3a04fad25a6621828518a2abe536142d2c1a7d KVM: Allow and advertise support for host mmap() on guest_memfd files

:::::: TO: Fuad Tabba <tabba@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
