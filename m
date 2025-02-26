Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0B2745E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 21:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740606148; cv=none; b=WfOa5iROJJEIpGG0JltYW8he4Z/u/G5MIrQjrbBXFBd6NIw0aep5jKFbUYAY7bkIQTlhcn1tCV2AIMM0yNI/sDIH/JLU6rgaAlUah4g+MpTkeLdMniHCry+rkBl8yUJ8DM5BLNGzlFfLv50iSuT6nZYY2t17t+6/GtMCPQ/88u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740606148; c=relaxed/simple;
	bh=bU+vvLl6eLs0VihP3P+CVQKAK2gXtOrm1YpzSgdNxys=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgTVtJmmTls/ufs/0bIxEYZP5/PG+sjyNGeOk6LMJvrhLHevFPLib8nsCcsrlDpee+AT8Q4loO2YG6LAf+ct+9yEDhnkeDX2poEvyXbiPbp+VCkQyOcAR4/dmhLfLFrGexPCBrwXB3vn/5reM5SVnpYGKuYUY8bDWfcw9mN8teM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsoxP3H1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsoxP3H1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740606146; x=1772142146;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bU+vvLl6eLs0VihP3P+CVQKAK2gXtOrm1YpzSgdNxys=;
  b=bsoxP3H1WDZ4cQChDq4sw8A7esrlWUYRKVJdBBToIfWW6J/Z8ERTe5ni
   t12iVBcEUTwb6umMYUcQslDIfM9ADn4nfrjksRj32ilpLPJ3nZj9BKvWc
   jFemNSOn5pChBQ3Jk3Dl/ZJyBq+ntk9qWpCxt2GIqtX1eHKSrXNjogd8B
   D9OMQNP6Tgokwh/NfA0xNmJGGcIw5Ga4L62JPRc2THkNXY1Z9txkt/btB
   fx4lKCGMgnP9Bwa1UBo6kjAx1QuSjSe3lm80+BtAelUajWx2XwW9HWHsY
   HpaIexkwyTJWnoDOLsCqX3qqhlKN1HYowAQWbyQtezmeaFhU4bX+GUNl7
   A==;
X-CSE-ConnectionGUID: JLIKX0biROic0AEDU1ztaA==
X-CSE-MsgGUID: usWsl89HTG+saRJkcAXvYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41497986"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="41497986"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 13:42:26 -0800
X-CSE-ConnectionGUID: j1HG73vCSX+HZiNBYxeh/Q==
X-CSE-MsgGUID: hvO36g0NQQGQTm6iMKOKLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117331097"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Feb 2025 13:42:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnPAV-000CUc-1k
	for oe-kbuild-all@lists.linux.dev;
	Wed, 26 Feb 2025 21:42:17 +0000
Date: Thu, 27 Feb 2025 05:41:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/iio/accel/st_accel_core.c:931:44:
 warning: 'mount_matrix_ext_info' defined but not used
Message-ID: <202502270543.dYaFY9Ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: f38ab20b749da84e3df1f8c9240ddc791b0d5983 [1/1] iio: st_accel: use ACPI orientation data
config: riscv-randconfig-002-20250217 (https://download.01.org/0day-ci/archive/20250227/202502270543.dYaFY9Ft-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270543.dYaFY9Ft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270543.dYaFY9Ft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/st_accel_core.c:931:44: warning: 'mount_matrix_ext_info' defined but not used [-Wunused-const-variable=]
     931 | static const struct iio_chan_spec_ext_info mount_matrix_ext_info[] = {
         |                                            ^~~~~~~~~~~~~~~~~~~~~


vim +/mount_matrix_ext_info +931 drivers/iio/accel/st_accel_core.c

   930	
 > 931	static const struct iio_chan_spec_ext_info mount_matrix_ext_info[] = {
   932		IIO_MOUNT_MATRIX(IIO_SHARED_BY_ALL, get_mount_matrix),
   933		{ },
   934	};
   935	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
