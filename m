Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A64D31618B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571720; cv=none; b=iwrSgak4TuEQPlBeA0oH/S5/Xn3/NAtZiJOj0umy0l2LMGavdP1L+HvKHvHRTzx6aIvWGSavRUn29A/JDaTHTs9wYlMdPgAzYht5k8kayywkszgnxe+Nm1Y/VVtmr2cX87As+WciJ55qWrx+mjR6LBjBQPJOfUbwwNDsLVzlHH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571720; c=relaxed/simple;
	bh=GUmPP+i4gbDuwKV6OVd/GwRcsoCn1Dc/Qzaoh4/Llhg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IAKHlvy8kyqJYAkYMLQXSK4VX/BvRUTfbJC3NdPZdZA+CofBwL/L3cfPuZkLMqk5uNJH1iZbfwtznJZ3RCiYMw3j8IIMlXRgeDjUUqVowsgcEW7qtKLbvtb2If4412hBLVfLgAYZuH1z5LDnNKhMNgiR9irBGaDN1MVeBidvQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt+7oyLH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt+7oyLH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766571719; x=1798107719;
  h=date:from:to:cc:subject:message-id;
  bh=GUmPP+i4gbDuwKV6OVd/GwRcsoCn1Dc/Qzaoh4/Llhg=;
  b=gt+7oyLHwMztnTprZ3AwIO4d/L/tR/NMC41dUjrReQqUKRvfsQAbOe/B
   DKpwRUWNN8y5cG7ViTJStXaIDeIzDzGR3e6x1eUI1cnOkDB5e3CpUPxHE
   nLFX8SLTK8Z04I1IaLFqjSN2O6LLZRMNEMbb4oVLhCJs5KZzKTwb6FmVF
   oh5m8A9eUgg+sSXZN66wgf7wAAusj/eTuHDLRgF3dvJj1cuS2agMZT6Ed
   Cdbj7TpIjo2S3dXTHT/MO0fJ4St3id+c/InC5IHncGyVe1hb647aEkMaF
   HXBSeUHmG7sbOH838oNLcgBCt8a+/ZCj/6TLkSCTNNBk7n/PzwIwoluvE
   g==;
X-CSE-ConnectionGUID: NHYs935YRHGWq8KdsrEnNg==
X-CSE-MsgGUID: Dllsm82qTkmyTJXwROC6BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79773874"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79773874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 02:21:57 -0800
X-CSE-ConnectionGUID: vuUvwK19TuS2O50AXNh9EA==
X-CSE-MsgGUID: FMG680irQxuxG8hLe1qelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="223478064"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2025 02:21:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYM09-000000002w1-3MiG;
	Wed, 24 Dec 2025 10:21:53 +0000
Date: Wed, 24 Dec 2025 18:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Finn Thain <fthain@linux-m68k.org>
Subject: [akpm-mm:mm-nonmm-unstable 68/96] arm-linux-gnueabi-ld:
 error: zImage file size is incorrect
Message-ID: <202512241835.avmTEP6X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   c40f0b9f72a08d208c7793090ae98faaf6a58719
commit: 613bf373e660523dbb3f2567fceb6cbd8bc2a469 [68/96] atomic: add alignment check to instrumented atomic operations
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512241835.avmTEP6X-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241835.avmTEP6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241835.avmTEP6X-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: warning: orphan section `.data..once' from `drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.data..once'
>> arm-linux-gnueabi-ld: error: zImage file size is incorrect
   arm-linux-gnueabi-ld: drivers/firmware/efi/libstub/efi-stub.stub.o: in function `efi_stub_common':
>> efi-stub.c:(.text.efi_stub_common+0x190): undefined reference to `warn_slowpath_fmt'
   arm-linux-gnueabi-ld: arch/arm/boot/compressed/vmlinux: hidden symbol `warn_slowpath_fmt' isn't defined
   arm-linux-gnueabi-ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
