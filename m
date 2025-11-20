Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03951A76BB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 00:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763600103; cv=none; b=iW5ChDnJLLgnmby0KXrEJwEVRO784xnDxR3BbJOfwXiaZoJ/cURVcroaiobmEgTyaVSpbRH+5JKGtYy2tSzWKJ3tF16+tLFMGqCHuP+RoV8RLm80XlBeVR8+4f86DH2i0vBlkFHjpYTBbiWa63zZQw/KidB0UeqpL/u/MKhPLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763600103; c=relaxed/simple;
	bh=9gKS6doraVIw+k84pqIay4C+1piOsXTzr2FnT+XF550=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZGEdR+/figpV//1NWN7sQtL+VOq+JXBA606LCM9XwSgLcsnY4fuzuI1tcBKAGdG+4CqbuPeOPiwfe8gQkoFOyjX2CvIFgT08YSo9mNWEk2X1gkcON9YPwkVvh3KOyAozfwj9V9SRGUqSRILp2mUDRDAY1NYx+WKzImjeH8WiCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9lRY1Lo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9lRY1Lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763600101; x=1795136101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9gKS6doraVIw+k84pqIay4C+1piOsXTzr2FnT+XF550=;
  b=H9lRY1Lo1/oN3x48N3tT4Aqv15Zm776NW7uoPZ8PvAKyN7jK2ZVVdaZV
   9R9b7d4u7BOZez68Gjd8qJN8vO1MrsynNe2riTKpwMmd5DolwfgRXMbza
   3TZGE5cMVPDg3CNlhpa9pNP4T8PejVFeFIgyykU8NSSxNga5JkhMfAx0c
   N2XXZJhXUwsrQ1UETQXvhEytUkabeoNyqcaBs9nwltenoKJYNvAkNqaf7
   KGJVmPOBhTau2l52E6hdlTOHWMgKoTARPJYtrIqsgkJzBZ/QuIYUESg4l
   K5D51lLk8WHTclr7dgJd1bfScw1heU2mFC/RH4LzoOOq155ytivy3ZI//
   Q==;
X-CSE-ConnectionGUID: X82SdnqURMSHrftmlyYHOg==
X-CSE-MsgGUID: rTKhkO1aTv6CZ2iQe8NslA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65553036"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="65553036"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 16:55:00 -0800
X-CSE-ConnectionGUID: kjHB3wTaRSqUZNrA9vdRJA==
X-CSE-MsgGUID: WgWLGFFrQcyZ0hJ7DJ8FZA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2025 16:54:59 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLswq-0003Sp-39;
	Thu, 20 Nov 2025 00:54:56 +0000
Date: Thu, 20 Nov 2025 08:54:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/irq_bypass_testing 9/11] ERROR: modpost:
 "amd_iommu_fake_irte" [arch/x86/kvm/kvm-amd.ko] undefined!
Message-ID: <202511200851.chWTL5cd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/irq_bypass_testing
head:   5fb9eccaaee7c3113a4bc735bc4e9d9268322c6e
commit: b9853f693ab5cf50608cafc0fa3548a831b079d7 [9/11] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: x86_64-randconfig-102-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200851.chWTL5cd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200851.chWTL5cd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200851.chWTL5cd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "amd_iommu_fake_irte" [arch/x86/kvm/kvm-amd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
