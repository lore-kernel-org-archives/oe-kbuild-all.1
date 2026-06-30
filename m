Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F913403F7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 09:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782810863; cv=none; b=NULSgtsRu2+dQ/B3CbOCvHOnJHBrLFmqiuM1Hqds5zdAoFQPUn8FRpB32/QZeK79Ti/y6AnX/AxyuUQlQDQcWv1Oxv8whupw9gslceTefooUrfoSEX1Vm6eVEnc8oXHnFdD9Nn8cAcNwME6vz79WYO6slob09khe8OXjLhPSank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782810863; c=relaxed/simple;
	bh=v75CRjgxFA/pyoEsru7YfSISG9bmd5def/H4rNBDfeQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sLLRGrXSGvvIbhism/U+AKkV5KJChRN9xu6f9gFQF819UUwChmJarBzh0WVvLnTBISGMnVP/FqHmw35vF4RCnFT3zsmCcUZtbYrHGqWMrO9a5vGIilVUwxz7o+ou01DfSJ8F42GLOqXiFo31EBq9dXgskrVUAP1dVNZyvGtdzk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuAvpylI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuAvpylI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782810862; x=1814346862;
  h=date:from:to:cc:subject:message-id;
  bh=v75CRjgxFA/pyoEsru7YfSISG9bmd5def/H4rNBDfeQ=;
  b=HuAvpylItPkph+B0SJfATFsxLEVqKMyp77e4Zre0shEQdHvZ4A00qgVr
   o+YJQKj9kKveuUCUAVYqjJIdf+Ns7wrdtUs5YORpSYmniC492UooAZMIa
   UlwO4sKWQYTcNXFttTzalrx0n3RoUeGngKkWQ2NqpwtWIz6suzVyN+Sd6
   PWAWMn4YJ9oUkBQXAuBhoCwQKIcmS7Ey1X7VugbLY8fFoNw3vmcSyheWL
   5669IayIXw/L7G01eZ1yttOdiY/hRkq31dL+mKR7zndrQTOaLlxUbwp9Q
   73lJR5/R5Cch9U7+6M8DQovc89q04DbvHF6GOJ+MMDZfeJk2X8x2+02ct
   A==;
X-CSE-ConnectionGUID: ng1bAbwARgW85/qA8pMyPg==
X-CSE-MsgGUID: tvelStxUTM+wnT0VG9zRYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82630468"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82630468"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:14:21 -0700
X-CSE-ConnectionGUID: GKN7wfrnS4SYgUAlmS+Zow==
X-CSE-MsgGUID: YpjrdLywTLan7IxxLjDa0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="276484927"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jun 2026 02:14:19 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weUXn-000000000R1-0H4d;
	Tue, 30 Jun 2026 09:14:15 +0000
Date: Tue, 30 Jun 2026 11:13:54 +0200
From: kernel test robot <lkp@intel.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202606301107.ZU8YbyPc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Waqar-Hameed/power-supply-Add-sysfs-entry-for-system-load-control/20260629-235714
head:   7f627c0c3f8b6254753610a05254e70cd6a2032d
commit: 7d5467fb719bb1294f12059ff16ae2faf74cf1de power: supply: rt9467: Use POWER_SUPPLY_PROP_LOAD_SWITCH
date:   17 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260630/202606301107.ZU8YbyPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301107.ZU8YbyPc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ============  ===========================================
   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
>> Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2161: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/devicetree/kernel-api:11: ./drivers/of/base.c:2351: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.


vim +1 Documentation/ABI/testing/sysfs-class-power-rt9467

eedb923279b78c ChiaEn Wu 2023-01-03 @1  What:		/sys/class/power_supply/rt9467-*/sysoff_enable

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
