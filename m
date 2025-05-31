Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FBA225A4F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 04:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748666255; cv=none; b=gZ77Z/Ra7NWNGVkaQm46H0mEKTxU+40viLfIZnDYU88A3EXPH+wtFwLUPA/rQhs7mwvmJMhxkFIkQ1UfjSRCarGc0fDR7NKIkCaMb1mDwelegq/spoxXrumBts10HOLbLKk6catE/YqB2u+WvMYU/HEv39epG77/RgiXq+D7Wew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748666255; c=relaxed/simple;
	bh=BeHgDZcclt/MP6srGjmwfKjWKh7vdoLDUqUnQYl0uMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUz/rZ71BSVDmdcliq+MnHzgiY0ZRyW+KFoB5fSvM80C0xhzLeDiZ5lCbLQFJOBtZYY5pa9285D7XzwhpgX3q6Aq2sCzuIEn0UswBJiALwt1/tBXft0n5upymwuw+llu+BUOWMVnlx8jSaewE9kUkih8p6kqpPuzZrUmorlYkzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHbZVGQ1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHbZVGQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748666253; x=1780202253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BeHgDZcclt/MP6srGjmwfKjWKh7vdoLDUqUnQYl0uMI=;
  b=kHbZVGQ1utOsaO/BNqIMm5RlFklDxru7u1+4Tv+S1h9WolOPlDwO9PLg
   gqgOGqD9CMQNCrFS46QNREsLzgB7mM2KGSXMnRJNgxyjT6XP31WYw2s/x
   HtBQlK1apUohEjoravZCMDdY8aEeswIyEBqjOCYMDZHYB7NujJ9LbVAq3
   tl376zAom3GXVdkFJWTuqP21dnmAtpFNwNKeBiJY6/uNpEOQGi9HcSe9j
   jMRo1LycnEeByzwENHxMl37zfXaDu4eX9hDFVVWvwm6+u+G4vBuB7eJbG
   bObt68+L7p2fYJ2oOE9Ee8ZUgVpiguENYdCwcD+qugBAfA43skx+TW61D
   A==;
X-CSE-ConnectionGUID: Wy3744YXQLW1m5XGC7CP3A==
X-CSE-MsgGUID: ecEuaKPcR6mP7vaAcmWs0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="61384787"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="61384787"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 21:37:32 -0700
X-CSE-ConnectionGUID: ev4hNmXLRw6eiIZi/ccrpw==
X-CSE-MsgGUID: omGOilAPS3eLrm40ROU++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="147935382"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 May 2025 21:37:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLDyL-000YBs-1w;
	Sat, 31 May 2025 04:37:29 +0000
Date: Sat, 31 May 2025 12:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:tdx/dpamt 13/17] arch/x86/kvm/vmx/x86_ops.h:234:1: error:
 expected identifier or '(' before '{' token
Message-ID: <202505311247.XsMQuZH0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git tdx/dpamt
head:   ecf8d6a2a90c373eb46868f243c1a69b343ee98e
commit: f73fc0a88950f8d592d65e7064f7f9d844b9013c [13/17] split_external_spt
config: x86_64-buildonly-randconfig-003-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311247.XsMQuZH0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311247.XsMQuZH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311247.XsMQuZH0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/main.c:4:
>> arch/x86/kvm/vmx/x86_ops.h:234:1: error: expected identifier or '(' before '{' token
     234 | {
         | ^
>> arch/x86/kvm/vmx/x86_ops.h:230:12: warning: 'tdx_sept_split_private_spt' used but never defined
     230 | static int tdx_sept_split_private_spt(struct kvm *kvm, gfn_t gfn,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/kvm/vmx/vmx.c:72:
>> arch/x86/kvm/vmx/x86_ops.h:234:1: error: expected identifier or '(' before '{' token
     234 | {
         | ^
>> arch/x86/kvm/vmx/x86_ops.h:230:12: warning: 'tdx_sept_split_private_spt' declared 'static' but never defined [-Wunused-function]
     230 | static int tdx_sept_split_private_spt(struct kvm *kvm, gfn_t gfn,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +234 arch/x86/kvm/vmx/x86_ops.h

02ab57707bdbc2 Isaku Yamahata     2024-11-12  229  
f73fc0a88950f8 Kirill A. Shutemov 2025-05-29 @230  static int tdx_sept_split_private_spt(struct kvm *kvm, gfn_t gfn,
14324c5411247e Xiaoyao Li         2025-04-13  231  				      enum pg_level level,
f73fc0a88950f8 Kirill A. Shutemov 2025-05-29  232  				      u64 old_spte, u64 new_spte,
f73fc0a88950f8 Kirill A. Shutemov 2025-05-29  233  				      void *private_spt, bool mmu_lock_shared);
14324c5411247e Xiaoyao Li         2025-04-13 @234  {
14324c5411247e Xiaoyao Li         2025-04-13  235  	return -EOPNOTSUPP;
14324c5411247e Xiaoyao Li         2025-04-13  236  }
14324c5411247e Xiaoyao Li         2025-04-13  237  

:::::: The code at line 234 was first introduced by commit
:::::: 14324c5411247e2fac2957def7d35571d9496c5e KVM: TDX: Support huge page splitting with exclusive kvm->mmu_lock

:::::: TO: Xiaoyao Li <xiaoyao.li@intel.com>
:::::: CC: Yan Zhao <yan.y.zhao@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
