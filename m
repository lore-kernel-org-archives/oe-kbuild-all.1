Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2BA2FDC29
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758269590; cv=none; b=o1/JDiLC2M1XIIH/K466vj2EVn7Axm8FQq9s/46x6nSkyDtldmxuU/eKJxLFLps4OjPRGvhNGVOv8VOydkMGYVoekMHZvHid2Sffoet9+VcroRNF7dCg/L3L1O6EV1HkIF6svFqU59mfhAbRHxjm0qHDcmWv8l/gU1UtM3BlQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758269590; c=relaxed/simple;
	bh=egCllgGhRn+Y0LEFlgI5gM0QylP7UCHkcLKct8D+cIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdMoo0vz5tm5zIwFA7+QYyNnIZr5FQS+VFDlGEBJ7CRW++PvHnTBRqqqkGPaQCKLuFl60hiXbQ0qAcQ0sURXceZ8ALVr8CKwQKeX1SafVLoWE4xl5ybFzhn2Ed1+dFCWiJ0LMhxDTe7sZ1UmdK2KIT8KIubHbEcu+Ua4Qk8XGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0/aGbNg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0/aGbNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758269588; x=1789805588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=egCllgGhRn+Y0LEFlgI5gM0QylP7UCHkcLKct8D+cIc=;
  b=k0/aGbNg4iIKkjOyYjNembt9bwn+xfAvgYjQxTFwy9h/gQJD5DUI8cdX
   qe51T0DnAEtEH9z76mVemF2gHaFOHycoqjjXan5npf5QaujLTuR2mmzsH
   oCJwJZ7koU3zbsHhK/cZsuauk7MrJrZ/oaFn1baulk3deqqXPLRYegqxO
   RZr6R1RkRSVt15RofHRjGLwWDCKYoz04ATcDfIL9mgwHaV5HMt8OcQzoo
   vCoZ6uKsk3D8GTIkuA0vmk/z0/zzpFL4W61b6wc08BWDYryaJAiTjBVH6
   y5sYJx847AEIkz0Pq8T8aQWYeBhNKVzv7gVJvLECTphSbIcS1l7ejWCkX
   w==;
X-CSE-ConnectionGUID: 1DuApHVASb2SbhbROV9D7Q==
X-CSE-MsgGUID: mxWQezDmS5y3qU+VWKsD1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83213244"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="83213244"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 01:13:08 -0700
X-CSE-ConnectionGUID: mED/pODfS3y4iLIjBNRN/A==
X-CSE-MsgGUID: +XZ3rmRFQRO0g13JUWH8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="180031444"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Sep 2025 01:13:06 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzWEq-00047H-0f;
	Fri, 19 Sep 2025 08:13:04 +0000
Date: Fri, 19 Sep 2025 16:12:55 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 9767/10654]
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb:
 clock-controller@82800 (marvell,pxa1908-apmu): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202509191658.sW38JXMq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
commit: 5bcf9e1d0a5da750ff180e7385b0bd4041686516 [9767/10654] dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
config: arm64-randconfig-052-20250919 (https://download.01.org/0day-ci/archive/20250919/202509191658.sW38JXMq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191658.sW38JXMq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191658.sW38JXMq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dtb: clock-controller@82800 (marvell,pxa1908-apmu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,pxa1908-apmu'] is too short
   	'marvell,pxa1908-apmu' is not one of ['marvell,pxa1908-apbc', 'marvell,pxa1908-apbcp', 'marvell,pxa1908-mpmu']
   	from schema $id: http://devicetree.org/schemas/clock/marvell,pxa1908.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
