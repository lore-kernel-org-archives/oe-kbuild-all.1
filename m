Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239F2E419
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716379690; cv=none; b=cILherG5v7DX3jVfkn1rZ3LJxM39a315CioTuZ30W+WhTBDGre9FjQ7wHuKmU+hAkcA77UmrRodXEKyIoqVO+FTLSYBMgW52Z1nJy6V3EnnfsHQbY9d8mFp09Eily6fondfw86nG01L+hti8dBqlm7z7Tqf96RuIKNdoGCyK8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716379690; c=relaxed/simple;
	bh=HkkSYn35h6+p0Gxqisfe3IJeHGBsAyjB3/ScX5yak8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GtLuC1Y2JOXsG9FIkQkpOKpb+RH1650n27lAZ8ESmUFZbNRxBZN7Uth9Ce7Fya1t5kixk+oJdyfiUccXh+8p3Qq7B3eqY2nW9JiFmxUxuaMw+W5WISz0VIasNRNIV7Dk3U042LyH2Ui0zZF5YRAZFPR2WGGutX0CWRDXmZP+4Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9AtrAe4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9AtrAe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716379688; x=1747915688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HkkSYn35h6+p0Gxqisfe3IJeHGBsAyjB3/ScX5yak8c=;
  b=W9AtrAe4niQTMIIUSKxjHMr+IqXx43X5857HCiICajgotCXvzg4IVO1t
   fsrVNlxqEe8AwAJV0jmC7q/xxjvfVaUAGzYV57zglgLhw+uyblOv+k9RQ
   ZtSSFWjk8Nu0fXK3nhgZNX1Uzn/9ljRwPEbOZHxGj5uDOtRyc0R9C23E3
   fuq6r5ig10+NaPpXIkURbxy2qNC9gqELb4WAFasHqWsKtBOkD5vb9fRhZ
   MjgQkedOaSZMSqFwK+xd/aF+2FOY66177wcc7yzPNxq+Ty9JxAelADajQ
   Y2QbttlDwzQlezNT6cX1VIh1RMBhFQa5U7Aj0jUkry4ZH9m2uPOKVOJ/V
   Q==;
X-CSE-ConnectionGUID: stedT2wfQryZ25/Rtf2ViQ==
X-CSE-MsgGUID: Cu3yOvGDSQqK1/eXRCaUDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12470611"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12470611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 05:08:08 -0700
X-CSE-ConnectionGUID: TP/YVvaLRbGA917LmRAnug==
X-CSE-MsgGUID: I7gPfuDURX+xrhpbgKZDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="70672190"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 May 2024 05:08:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9klI-0001Wf-1r;
	Wed, 22 May 2024 12:08:04 +0000
Date: Wed, 22 May 2024 20:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/sdca-function-devices 25/26]
 sound/soc/sdca/sdca_function_uaj.c:37:19: warning: initializer-string for
 array of 'char' is too long
Message-ID: <202405222043.WIb43U9B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/sdca-function-devices
head:   f46b8e859911a824897639b737e4df43e17e1f42
commit: 2ac8e1bbf1ec8eeb41f02e27879939321999656b [25/26] ASoC: SDCA: add function devices
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20240522/202405222043.WIb43U9B-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405222043.WIb43U9B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405222043.WIb43U9B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sdca/sdca_function_uaj.c:37:19: warning: initializer-string for array of 'char' is too long
      37 |         { .name = "snd_soc_sdca.SDCA_FUNCTION_TYPE_UAJ_NAME" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sdca/sdca_function_uaj.c:37:19: note: (near initialization for 'sdca_uaj_id_table[0].name')


vim +/char +37 sound/soc/sdca/sdca_function_uaj.c

    35	
    36	static const struct auxiliary_device_id sdca_uaj_id_table[] = {
  > 37		{ .name = "snd_soc_sdca.SDCA_FUNCTION_TYPE_UAJ_NAME" },
    38		{},
    39	};
    40	MODULE_DEVICE_TABLE(auxiliary, sdca_uaj_id_table);
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
