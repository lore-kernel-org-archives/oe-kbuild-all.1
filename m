Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A928EB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 02:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727836846; cv=none; b=S7yC3x9KWYYByQeflakJpvcTB2I1uTTZ09H6fSY2f9aFm5JL9Ur4Rb8vcfUXTF3hPdR1JuS1O5tG2+vPbbz5nZk5RtveLtFcSSTakNZpfJQr5JFD3G1QxQXUqpVpMQ4nuNq6noxIzUMuERZqXDPN0pdQvMBVc9atRBOpdBJQKZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727836846; c=relaxed/simple;
	bh=n/zd9ShzTVRpkEmeOgMcm3MjEfafFpBQDA0jdhRGiec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afLETWLNqOiY6HQU9vKFriXIEah8yR1O6LHBGlc2X6jrZtdS8SG7OTLJlpxuj0hVtNlZzZ+UwllAhT9u/2oqEKZW2oN8kKQSI38i518oz6JnyqjFr31FQDNapzKqnx909BS/lCsl/LalU8hElu97tyR917Bz5UVD+AKMdv2Zpqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0FXUj0h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0FXUj0h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727836845; x=1759372845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/zd9ShzTVRpkEmeOgMcm3MjEfafFpBQDA0jdhRGiec=;
  b=l0FXUj0hqX5O/dasT8gdB5tOf7Tpj06LTteHFNbGaPAZBsRu7DjhGE45
   y2CJhKQIdxl0iO2wB+eo8bVvGYe0h5QEJ7OBY+nAwV2GS/+1b/iN1fqhK
   u04GFVkg8PS2CMm9n1pW8dxk6v4WHQf3poxUHw7kDT1/K84jb5oBILf7g
   8t8DAIIDF1ZmWx29IbsL21Av59khD0WMxYaRXmkytF9aInQKlUBL3Z7CD
   73G85lnCvaMajc2Pe8AUBmHTExA8+rKbrwxdWpibbIWj1krVnW88GJp/Y
   ty7chEsKTNDTR0i2CtVLickD2skx+E/wtRJPvLbdAmw17Nxf0KdMNFNnE
   Q==;
X-CSE-ConnectionGUID: jtEZlLEnQoeSGF85waBnOg==
X-CSE-MsgGUID: BuUHQneEQqqaqqQ4mqbbRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="37554434"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="37554434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 19:40:45 -0700
X-CSE-ConnectionGUID: FE0sKO25TV+bHVibnHGkcA==
X-CSE-MsgGUID: /BSYO3EvTka9cEdwLlopvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73890776"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Oct 2024 19:40:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svpI8-000RS7-38;
	Wed, 02 Oct 2024 02:40:40 +0000
Date: Wed, 2 Oct 2024 10:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1259/1491]
 sound/soc/intel/avs/skl.c:73:5: warning: no previous prototype for function
 'skl_log_buffer_offset'
Message-ID: <202410021034.wSjxzEk1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 7a0ad4bad1c6b21f2858d9321c81f0370dce225a [1259/1491] UPSTREAM: ASoC: Intel: avs: Abstract IRQ handling
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241002/202410021034.wSjxzEk1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410021034.wSjxzEk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410021034.wSjxzEk1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/skl.c:73:5: warning: no previous prototype for function 'skl_log_buffer_offset' [-Wmissing-prototypes]
      73 | int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
         |     ^
   sound/soc/intel/avs/skl.c:73:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      73 | int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
         | ^
         | static 
   1 warning generated.


vim +/skl_log_buffer_offset +73 sound/soc/intel/avs/skl.c

b3e29075b23465 Cezary Rojewski 2022-05-16  72  
b397f142f47498 Debi sahoo      2024-04-25 @73  int skl_log_buffer_offset(struct avs_dev *adev, u32 core)
b3e29075b23465 Cezary Rojewski 2022-05-16  74  {
b3e29075b23465 Cezary Rojewski 2022-05-16  75  	return core * avs_log_buffer_size(adev);
b3e29075b23465 Cezary Rojewski 2022-05-16  76  }
b3e29075b23465 Cezary Rojewski 2022-05-16  77  

:::::: The code at line 73 was first introduced by commit
:::::: b397f142f4749886f861dab3a3cf60174ec547b4 Revert "UPSTREAM: ASoC: Intel: avs: Prefix SKL/APL-specific members"

:::::: TO: Debi sahoo <debix.prasad.sahoo@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
