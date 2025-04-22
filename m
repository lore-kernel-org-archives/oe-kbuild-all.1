Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A247405F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 00:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745282246; cv=none; b=QArLX6By1FDFxkZUV75QLDH1DHMgiu8xlrzAqpLJHZyR0KNPAgI/U72Srda3e8j/mcsUNnIAWjCVCL4BDyJx9iKQVoPYYIm2DnpNt8nakMr8RFprP17K+oacXFYVuZmXnbFweC68GdNaJk9LpdV1BFpB/oRj1SMIQ/CZQWqJJWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745282246; c=relaxed/simple;
	bh=UwtGoZm3xbnkm4Z61JBqZNtCueytCf6+f6BQrQiIBkI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sPkYk+PKhA9GelPdqyPLyrquUB9HWoqy0pOEH3LzjW0BN2x5cdSqi7qyPFMvBrAcuHbLIOIXCqG2iZYY7gDnFNZKNOCjaI1oprRacEnVFdK1FmW56QR449mFmYFCrV5MXBSsKlJ5EAwQypln025oiitBB1FGmMxvG1hLqxfNAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYqR3kt4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYqR3kt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745282244; x=1776818244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UwtGoZm3xbnkm4Z61JBqZNtCueytCf6+f6BQrQiIBkI=;
  b=kYqR3kt4I+mFyxcVnAqFEoQ16Dez9JILMAQXA0L3y1hP5dDtHcB59dAM
   Zbgr0YadM46RMV6eApfXAbLGQiySuo6G+qUD6JW9Vdo/zYd2l7aDfZy7g
   Eq3ukjGZDl/N5Y2GUUxeJ5RAUbjBbnasdc0N341mobNIifiOe5DgTx3bP
   VKaxd+tvh/CAMP72HJ2/0N5++LVumjLJP4xRIK64qCpLxzfydQICic9jT
   sWfwNZBrW0mu8iKckDk8s5GC1caazwpdlMPBT0xBTRMbU2yZODJvzuPec
   A7cPv5pyv6psnoH8ozaQ9T1jLCr+RMvJLVPWSiMAO2GsmsUTneXnKw1M7
   g==;
X-CSE-ConnectionGUID: 6xwZfBkvRrWemJimJ1N/jg==
X-CSE-MsgGUID: m2sWAoLYRNm2SVYnrZk83Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46928845"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46928845"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 17:37:23 -0700
X-CSE-ConnectionGUID: gvbPcfxJRRW6ChUcHQNuBQ==
X-CSE-MsgGUID: QiBxUcRnRpaXvDdVxXHXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="135944522"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Apr 2025 17:37:22 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u71dY-0000UF-1L;
	Tue, 22 Apr 2025 00:37:20 +0000
Date: Tue, 22 Apr 2025 08:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 36/36] arch/x86/kvm/x86.c:593:6:
 warning: variable 'err' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202504220835.nEkDdilC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   2946bf4845169fb329435cea4d04dc21eab6c4c0
commit: 2a6dc030e85ac6934b33251c9550e636783101e0 [36/36] KVM: x86: Utilize the native MSR APIs
config: i386-buildonly-randconfig-002-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220835.nEkDdilC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220835.nEkDdilC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220835.nEkDdilC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:593:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     593 |         if (native_rdmsrq_safe(msr, &val))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:598:9: note: uninitialized use occurs here
     598 |         return err;
         |                ^~~
   arch/x86/kvm/x86.c:593:2: note: remove the 'if' if its condition is always false
     593 |         if (native_rdmsrq_safe(msr, &val))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     594 |                 goto out;
         |                 ~~~~~~~~
   arch/x86/kvm/x86.c:590:9: note: initialize the variable 'err' to silence this warning
     590 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +593 arch/x86/kvm/x86.c

   586	
   587	static int kvm_probe_user_return_msr(u32 msr)
   588	{
   589		u64 val;
   590		int err;
   591	
   592		preempt_disable();
 > 593		if (native_rdmsrq_safe(msr, &val))
   594			goto out;
   595		err = native_wrmsrq_safe(msr, val);
   596	out:
   597		preempt_enable();
   598		return err;
   599	}
   600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
