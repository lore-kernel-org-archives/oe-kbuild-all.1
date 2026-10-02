Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD83DDDAA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 06:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921513; cv=none; b=FWJ9VhhnbkdfmX+Rqu/3beZuUq4lFcO3kaFIo2Th+P68uA7tI7yygb9O9SfA0nigzPgT3PoaPYd0Bll6aebtMUXfm9PiB/ImAEzegKmV3Z4mSixLPSRMX0tiYTNHwuuyP4GVfaWFo26oeL624WWnkX+8OPqFv28w6+Wr/cXp/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921513; c=relaxed/simple;
	bh=cmdHLNcr1tFcNKyOAg2hZQMdcp6AikiXY0Dyf/pG2U0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k0fy+wTio9ASiB1pzX7PI6cSQUSUcS0S2oQA1ySAyAWWVnorhdHqO2I+mSMuWwHHKSRFP6si1oGlebldGPfie1zghfcPwc1e2YIwXLiEISVjfS3MZM0PyiA2zcSzt6cM3FJs+Fk+0dHm/F+8HsCz7e+/tmvAmXKnp8+JZ3UkalM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGFwU4hz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGFwU4hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790921512; x=1822457512;
  h=date:from:to:cc:subject:message-id;
  bh=cmdHLNcr1tFcNKyOAg2hZQMdcp6AikiXY0Dyf/pG2U0=;
  b=YGFwU4hz82/QRCft/JTc6gcdKJONSuTJqcSXfeNv10ZsIlLLuSMW5d0G
   IfiIWoi+e7yDtfBDU6hE7OjTpF6cUHYtuZAeD2ezSEWPau/+KIyHnpfwp
   Zx52LRSVUD+QlGk42sVVjSFYkPq3H4AlHPTRcadaj9lQaIxEuDMTpbxcb
   VwhTgMvL2k1aC74TgI1StYar2wNY63HpNjdCQMQqow54gIeICoVhOZotw
   HUA/GcZW3Xc1hDahPgXj5jwIq9pCyDzxSg9hVe8r+Jpn2bMd6GfPfXkz1
   EAalammDnFfuo1qZS11PfId5962hOv4AFCqagfO72eQnOpfn3bUIWrz1g
   w==;
X-CSE-ConnectionGUID: VQ+PRFN4SHCB2Xp2B626Iw==
X-CSE-MsgGUID: RXPDZAAjQ4uURBm/t9lepg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="113471938"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="113471938"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 23:11:51 -0700
X-CSE-ConnectionGUID: jCRS235xRnqXFF7Ka2raKg==
X-CSE-MsgGUID: 37ba4arYR7e76OSNutUNgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="302437923"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 23:11:49 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCWUi-000000000Qu-45Y0;
	Fri, 02 Oct 2026 06:11:44 +0000
Date: Fri, 02 Oct 2026 08:11:31 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:dev/selfref 28/49] warning: redundant field names
 in struct initialization
Message-ID: <202610020846.GRtyKnT4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux dev/selfref
head:   63b01fa5c495532c8f631cce076471a89c78001e
commit: 0b46f815974745cca7b3df19d4dc53e18fb26fda [28/49] rust: pin-init: internal: pin_data: parse into `StructInfo` before generating
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261002/202610020846.GRtyKnT4-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020846.GRtyKnT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020846.GRtyKnT4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: redundant field names in struct initialization
   --> rust/pin-init/internal/src/pin_data.rs:181:9
   |
   181 |         fields: fields,
   |         ^^^^^^^^^^^^^^ help: replace it with: `fields`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#redundant_field_names
   = note: `-W clippy::redundant-field-names` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::redundant_field_names)]`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
