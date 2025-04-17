Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364804A1D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894164; cv=none; b=FnFMQriyRQW0iWfHiuHp2O+XZU4Mjcj6Hb7gOvyDQ6grAho8nq2MWN8VJaSP6fK00JyCCSSi6Rm6BFe59nxXjzTJnvhJA/dKW6SgFsTWNzi829OF3ze2HLTxSS8AyuXwFzGTu2dErLPqtguTZmXi0bjJTZjcdVbv6gLg8LpwdCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894164; c=relaxed/simple;
	bh=CU8DbeQ8Jv4OI568B/Jr3ZnKmQwGvtVEiOeQ8qbkCCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jO3+UgXUUTGiEq85/f83KerjaZVP3copYk4cnk84rv0hruoZs0MedSubix7NQjS1prsklPiTNEGvUc2iwwVWJ66EvsDnmKKa8SPfdOx6TwBBMhVy06K/2KlvIwmILvffkVejw2ox0vMZLX8IwuTFHLZ3QnDFw9+NgGwvpY2gEdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7lVbyUx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7lVbyUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744894163; x=1776430163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CU8DbeQ8Jv4OI568B/Jr3ZnKmQwGvtVEiOeQ8qbkCCk=;
  b=N7lVbyUxzsHM7IbD/F/cJGRl4nAWxoSh+j7Dd95LZADCUNWbgbQObOfl
   XKRd3kOaYbcIKHX51mMXhuJGUHXagnLt0VxqJlhhPKfMjkJBc6waaxT5Z
   bq2mDpFXy1NOyRsyXMLsavITnCPKQKzdF/BPkF+piiyPg/lTVnjSqKo6R
   kN26dIx1L3Lxg88qiZIiZiBw5Uw2tA3H5QsppI66E0T8OrO/IHF3g12e6
   Yvp1MibL+W568qZNwoIom1qpa5HSQbM9XW22tm7nkyVwfaNhnCbjQ43sl
   ZdZqrKJKjG+WF3cYFGzJ3Q5OEMCFZIkqk2nqGcLBfdQZKz5POCGOWs5A4
   w==;
X-CSE-ConnectionGUID: xH2LhbWmRCmJ3RLX9Q8ifA==
X-CSE-MsgGUID: yNsb894RQiyBmGM5t8fX/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50298713"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50298713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:49:23 -0700
X-CSE-ConnectionGUID: Y2QEBB2cQqO6+PXzYYqy/A==
X-CSE-MsgGUID: bduMF14HRvKfno1kDun6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131105134"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Apr 2025 05:49:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5OgB-000Mk8-1I;
	Thu, 17 Apr 2025 12:49:19 +0000
Date: Thu, 17 Apr 2025 20:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 5/33] ld:
 vmlinux.o:(.altinstr_replacement+0x211): undefined reference to
 `asm_xen_read_pmc'
Message-ID: <202504172038.3hShjRUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   140acd0d1aabb49e359a0419fa7dcb5fe73d7448
commit: eb32db0c69ecb6dbd2de3ce457265f87dabb4390 [5/33] x86/msr: Use the alternatives mechanism to read PMC
config: x86_64-buildonly-randconfig-003-20250417 (https://download.01.org/0day-ci/archive/20250417/202504172038.3hShjRUE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504172038.3hShjRUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504172038.3hShjRUE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o:(.altinstr_replacement+0x211): undefined reference to `asm_xen_read_pmc'
   ld: vmlinux.o:(.altinstr_replacement+0x257): undefined reference to `asm_xen_read_pmc'
   ld: vmlinux.o:(.altinstr_replacement+0x26d): undefined reference to `asm_xen_read_pmc'
   ld: vmlinux.o:(.altinstr_replacement+0x272): undefined reference to `asm_xen_read_pmc'
   ld: vmlinux.o:(.altinstr_replacement+0x2a7): undefined reference to `asm_xen_read_pmc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
