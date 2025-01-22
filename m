Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B02153D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737568641; cv=none; b=exxvRyTKXYJexnY3XjM4zb49lDYxJrkN1ETr2Fy4If/wzckkMw2/IXAXTiaB2O2mWIoIOCzC6evq2zOGmV6X+ECmH65bfgE1bYQOxwc+mydrSPMBik1KIhAYb7cFEXPGRrVsK2Np2O8GdWzI1hNXY3GCqtVSzuB7fYaVNIstesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737568641; c=relaxed/simple;
	bh=9BVd+5PBNiZt1wFJzVxen3/cX3AJaX585ygqWLO1w4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qz8Hg53Dt/aNva26MaSRVLPOU7xc2hw6tjHKBdFFiyGpN17p3GRLcGI2Dw6NgUretc6YYe6W+eho81nxjP0+QrNYdsU8DbofHmEU6R/xCDTPFrfpEWD7n/8czTUZgNB6QqOQ/nUlOhZkcb+mIE0K+QjJ4giLGA8Q4JDYUq2kzTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYgLR6YN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYgLR6YN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737568640; x=1769104640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BVd+5PBNiZt1wFJzVxen3/cX3AJaX585ygqWLO1w4k=;
  b=ZYgLR6YNVeJ9wzYKA07UA6IsdYhf0akx8Spw/2WKMHemBF4BqWjNLm0g
   EZh/V495X37k5Mfk7KZbEPoEBSvKJzaihP5af+La8P4y4wJ76+vB9s2yE
   xpk9gEhmsHTz52sP+BVOcgvSPAUxyoOrGDYkq8gU0MJQrCYbCQDZ+imc+
   CcS+xro8E55MOpBHpsMaunorWJXsKf4qGN3f1fpJTmeDVGmzQUEboNdkA
   VwNazpmLTUKXG/xaoBUKeJP2VRNECdL01WnBT5qjcKoxb9HQm8nWpgZms
   MThJpTP98GMjiqqkz0hOTf82q/U3NMT18d//gkidsRqDl72o2ziV2zv44
   g==;
X-CSE-ConnectionGUID: VK+KQm+oQgWHa6/vjESQVw==
X-CSE-MsgGUID: ltXlLYWuTLeJc1Etx3Yg0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38142753"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38142753"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:57:19 -0800
X-CSE-ConnectionGUID: CDsNFe4MSsybhEOTUCLmeg==
X-CSE-MsgGUID: WoDwSGUBQw+dBDbsvm+vyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144469090"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2025 09:57:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taeya-000aBz-0H;
	Wed, 22 Jan 2025 17:57:16 +0000
Date: Thu, 23 Jan 2025 01:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1411/1411] sound/pci/rme32.o: warning:
 objtool: snd_rme32_playback_spdif_open()+0x2f0: can't find switch jump table
Message-ID: <202501230126.3VPcPXBh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   797ab005d487202cbf361ae3eae41cf56f289789
commit: 3ca17b1f3628f916f79e0ab62f1bf0e45ec9ba92 [1411/1411] lib/ubsan: remove null-pointer checks
config: x86_64-randconfig-101-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230126.3VPcPXBh-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230126.3VPcPXBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230126.3VPcPXBh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/rme32.c:896:2: warning: array index 0 is past the end of the array (that has type 'struct snd_kcontrol_volatile[0]') [-Warray-bounds]
     896 |         rme32->spdif_ctl->vd[0].access &= ~SNDRV_CTL_ELEM_ACCESS_INACTIVE;
         |         ^                    ~
   include/sound/control.h:83:2: note: array 'vd' declared here
      83 |         struct snd_kcontrol_volatile vd[0];     /* volatile data */
         |         ^
   sound/pci/rme32.c:1020:3: warning: array index 0 is past the end of the array (that has type 'struct snd_kcontrol_volatile[0]') [-Warray-bounds]
    1020 |                 rme32->spdif_ctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
         |                 ^                    ~
   include/sound/control.h:83:2: note: array 'vd' declared here
      83 |         struct snd_kcontrol_volatile vd[0];     /* volatile data */
         |         ^
   2 warnings generated.
>> sound/pci/rme32.o: warning: objtool: snd_rme32_playback_spdif_open()+0x2f0: can't find switch jump table
--
>> sound/pci/ice1712/delta.o: warning: objtool: snd_cs8403_decode_spdif_bits()+0xa7: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
