Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636561C6FF6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758734067; cv=none; b=D8VgYad90GIyrEKcy0+Hae83qaRpflgycQhTvk29zrWfz8GyS2yxmepHKLjYsuMY/EVa7i8VGXK5Fw+7liEeeRbFQJ+DqVnsJEuptDycfYb4i9JvVfwKKueKoHE18QBZQ5ll7WG/2uwilhK9DjS6guw0RcWs/ZQ+CTKYPC1I5rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758734067; c=relaxed/simple;
	bh=SyCCfzObpARbQE6fF7NA4AvEvSLyJuU4o9Ul96Ir2UU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HURhVo+RmZviBWL+mcXq+NUdgPhtbuUyJpCCxYfI0+Wv502evuubKHHD54xXwmr69CUDY3W37vwBnCTjKxfC40jA3y+ybTil/UrQ8gX7Cizol4w57rC8BkUWUMnmX/2p1RBOiAI2SnrF7URoxP0ErxlByws4YXzJOPtGXL/yzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DAjHSXKp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DAjHSXKp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758734066; x=1790270066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyCCfzObpARbQE6fF7NA4AvEvSLyJuU4o9Ul96Ir2UU=;
  b=DAjHSXKpYm+n1+kEOlPcQN0193YyIdu5gjdLHU6xwqASDqz03TGRbG89
   UB0IrAhsDNsFvdF1M83jFLRD+L6D0UssSZJc7sBXlZ4zQGH8FhxJbPEQq
   X41JvRjJXA23c1az4zFeRH9PgVkOvclr3cIjGSMy3CFzq9extde2bgHwG
   JCmCNmj4K2fxhTecrakS2dQZOoJIpT0yXoJ4TfA8O1nCJEVJu9vOO6BCZ
   THesCE9CmgJ7Qp0ezfovIk9jHFWX+AytaYomaVG6RKKCMcBZG6KK2qp69
   b/XCCXkBCBK31+IXvDYWbFXpsxCO4/sz12+Qc78OdcZJJqS84dKPS12yT
   w==;
X-CSE-ConnectionGUID: OtdZlG2OS+KJ491+H66Mhw==
X-CSE-MsgGUID: 3dAwqjZTRPCPQNPE5i7YMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60930991"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60930991"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 10:14:26 -0700
X-CSE-ConnectionGUID: ogD4rKAbRiqp1yb14bs3Gw==
X-CSE-MsgGUID: 0zYudOMwRK+VZw/1Mc0wXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177485233"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 24 Sep 2025 10:14:25 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1T4Q-000000004bl-3jdu;
	Wed, 24 Sep 2025 17:14:22 +0000
Date: Wed, 24 Sep 2025 19:13:36 +0200
From: kernel test robot <lkp@intel.com>
To: Traian Schiau <traianx.schiau@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:5.15/android_u 3/3] htmldocs:
 Documentation/ABI/testing/sysfs-bus-dvctrace:9: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202509241919.xP9wHyJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   038b979913cc03833b6d6cc18d3a50f11d1040b6
commit: 17ccf44f150e31edea9558b43221c0778e36fa22 [3/3] dvctrace-bus: DvC-Trace bus driver
reproduce: (https://download.01.org/0day-ci/archive/20250924/202509241919.xP9wHyJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241919.xP9wHyJY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   p_volume_max    playback volume control max value (in 1/256 dB)
   p_volume_res    playback volume control resolution (in 1/256 dB)
   =========  ============================ [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:9: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:9: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-bus-dvctrace:9: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-platform-dptf:130: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-platform-dptf:130: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-platform-dptf:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi:35: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi:2: ERROR: Unexpected indentation. [docutils]


vim +9 Documentation/ABI/testing/sysfs-bus-dvctrace

   > 9	Date:		May 2015
    10	KernelVersion:	4.0
    11	Contact:	Traian Schiau <traianx.schiau@intel.com>
    12	Description:	(R) The status of a dvc-trace source device with
    13			respect to an USB function driver.
    14			  Free - The device is free
    15			  Reserved - The device is reserved by an USB
    16				function but not in use.
    17			  In use - The device is used by an USB function.
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
