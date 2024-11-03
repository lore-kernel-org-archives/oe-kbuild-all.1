Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502192628D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730620943; cv=none; b=ULaeGVf0Xaj8M3pC1KHZ3hxSwAE1DmlyVakfkVL9c2AiFFJWcO0i2NSH0h5mTyWcISR62q9larY9de47D6KLT9P7y8KrjSMjI4P+QPyoVEUlLDCGEeq0o1SA7yIJqTeTUERV8AFl2Gq5SFfEYAK/DXZcRHUO5+C9GFjKkol2Ny0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730620943; c=relaxed/simple;
	bh=6AWpHA6iO9w0MfvJAskhUdpPuHcAifso5X7DRo8ufxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgjhjQcmDPSwSG8RM/1g65foZAa1TecTU8/2fKHY+tkR+JciV3n/ifcM3SGWGTcb3onGGWJQlRUQruHXDrW1cF+271izYEdeGrvEaPa6qtjr4b3ppTN5T1PLeDJsTBDQhQh18UFNLKsvvyql3l3dqXAaaiDGYDEc/6FuVU1RErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyGHyM6B; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyGHyM6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730620940; x=1762156940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6AWpHA6iO9w0MfvJAskhUdpPuHcAifso5X7DRo8ufxE=;
  b=OyGHyM6BiDOVRJJ/IgG5FcenEF3XjvBOGNKSq6AY6Prmz1Pm3Z3oQyeb
   AzlEG1pdoXHWlBqRC+5qAdX0KX94D1xhLCbO5dnAKLie9EDI2ZRWsb3wt
   FFRMN74Zxxbv+/RBJVz4Y98ipHmIcQBoXImbETej5IxHS/OP39e7g68GY
   XmstFjfrzcENnlowplhgFpmp1785BbUdnYfB//tgPzITFtiVVX0R4uk6z
   SPXh2LcUnB/xADk2cP19wwAOaOn+vYJQ7FW1BO6vj4UFneXMs1Tt6tBn1
   HBPsJVs3FWJJu1vzRJmlYdsO7QFqKkooWsFsfAU0hxFig2MNecSSWzT8q
   Q==;
X-CSE-ConnectionGUID: W14HNwVWTPCoK1PdiXs4Tg==
X-CSE-MsgGUID: ir3krZDjQ92gDnY8cbj4sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="41706695"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="41706695"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 01:02:19 -0700
X-CSE-ConnectionGUID: fb3uQtGMSTisHu8oFVixPQ==
X-CSE-MsgGUID: WtUN7VzNR8GmjSwuqLYrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="87869675"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Nov 2024 01:02:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7VYu-000jnh-0p;
	Sun, 03 Nov 2024 08:02:16 +0000
Date: Sun, 3 Nov 2024 16:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1257/1257] drivers/edac/skx_base.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202411031540.xYeDxC2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: e34047f6dc606c123911c6db8fa424bb4a035262 [1257/1257] EDAC, skx_edac: Delete duplicated code
config: x86_64-buildonly-randconfig-003-20241102 (https://download.01.org/0day-ci/archive/20241103/202411031540.xYeDxC2Y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031540.xYeDxC2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031540.xYeDxC2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/skx_base.o: warning: objtool: missing symbol for section .init.text
--
   drivers/edac/skx_common.c:470:8: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     470 |         char *type, *optype;
         |               ^
   1 warning generated.
>> drivers/edac/skx_common.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
