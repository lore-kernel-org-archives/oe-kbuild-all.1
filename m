Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABF37F8D7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771510; cv=none; b=mxSrqi73mg8Ibr7OsJlxZnw+p/b6vN1bNNqJuR9xSo7da/EF0anMa1sz4RPACrQxCLtmVuhsQ934V/kpvERCspnKp2VJh01T2uK0mQTStuicsRKCCv2+nLCC/Y9XSopj7X1vxoLgxtpL9CvXVzrXvcH1O0XyoW3gbI08Kdf3Bv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771510; c=relaxed/simple;
	bh=fg32yGe2mdohAI69CbTjZquxppAHQFK69oSiE+SgENw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s1JJFMfVeX1VU4EDPpae/mHjUnhNPMI9v8xzad138biziVtoZWPGVgAIG1ELftEjO2M6ge8gyzyrxdLQU+2U1G5ksYtGBR2WpCpLmVVm9DHJGpHHDztxSVSUWVyB/SbO1NAc71HQwp6Swm6UIpI9P4IinC9kCM7JRrehIinqT3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tt4yoTbb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tt4yoTbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773771508; x=1805307508;
  h=date:from:to:cc:subject:message-id;
  bh=fg32yGe2mdohAI69CbTjZquxppAHQFK69oSiE+SgENw=;
  b=Tt4yoTbbnL1cSAxs+7oBrklwJWFks375Tm5/GRZQfZ8jQQkpwt0wXSbO
   xVRG1ojdyTlBJ8YjzCmvMLBlx6s1tr5aKuqwa58yp0ijy1f2/zvLSSjjV
   Jz6n30lYy0t6cjrxPhrGx0BW2GzQDGULCYxwXsMBhlu0eDnNyZXtW+pll
   FjIHgApiG7GGF7lj5B4bXP/vSebbiDfyeIBj1hwCd8RZC3zLi2Nbo/PM5
   gibQQ8xHbKiXpWHP8DVznnB8HE7JTIPQfg/PEtL1OAgK/ldYgDegmDTRK
   9dX0dHCM0Lx/SOGNdSADfOoTByxEI5Zv65GLgWqDXLDTey1RAEQmtnsgo
   A==;
X-CSE-ConnectionGUID: tv7eNSVeRL26DlGHFb/CSQ==
X-CSE-MsgGUID: ciVdzgVrSyuZkS7wTBpmeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85893685"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85893685"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 11:18:28 -0700
X-CSE-ConnectionGUID: PWMhoSJET6WLe8swr9cTwg==
X-CSE-MsgGUID: QqcAdWy/Q0mPaU7ddZ7ZvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="246977039"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 11:18:26 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Yzn-000000001mh-3eMI;
	Tue, 17 Mar 2026 18:18:23 +0000
Date: Wed, 18 Mar 2026 02:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Dan Williams <dan.j.williams@intel.com>, Chao Gao <chao.gao@intel.com>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 2734/6828] Warning:
 arch/x86/virt/vmx/tdx/tdx.c:141 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202603180202.myb6Tv5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 165e77353831a85caa0444d16f29bd6b111dd2c5 [2734/6828] KVM: x86/tdx: Do VMXON and TDX-Module initialization during subsys init
config: x86_64-randconfig-011-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180202.myb6Tv5N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180202.myb6Tv5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180202.myb6Tv5N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/virt/vmx/tdx/tdx.c:141 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Enable VMXON and then do one-time TDX module per-cpu initialization SEAMCALL

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
