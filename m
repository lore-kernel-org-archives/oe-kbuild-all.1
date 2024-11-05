Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E033225D7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 00:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730768277; cv=none; b=CkM8PExL43BKXeAaKxDDomSSbIPhZh+qwUspr5+N29lbutrgFTgP+q5judqDrz0khlsP0LRcrpURfDbaWZ5RRTOqntKtGQwE5Ed4AMLTfHevBu/SU6Ei7WRdHj9pwMwIdyI13Hsux9xj8l8mh1o/Gx/ci1wbllXBqncE9xzVt1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730768277; c=relaxed/simple;
	bh=nLJOM45py4xZ+BaOiINfQxngIUWKbwQDILk0SVr+ngM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SnCH0oXKnFbRW9liLr+WnrD8FrOglsZ3B7O/+sGeHfp/oqDXtnTe0TVc5A4L6+I6pu0IhrtKpKDU8TCmbSPtQI9HXMyYWInNQ8Yk1Ue9XSYQKP4ldCKkXj21GmIgxVqHFzyTyh53NqKftt8qRaMw98+XmZj7ImYsBVHpxVs/5i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwT3Jga2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwT3Jga2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730768275; x=1762304275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nLJOM45py4xZ+BaOiINfQxngIUWKbwQDILk0SVr+ngM=;
  b=dwT3Jga2qgySyC+QF9Er8fJeXWUOOJ5ohnrXoAeEk2TZ4uSi8wGcop4v
   UBT7TQzbq26HZ5jrOAA473IxFqZBjEO73w7huqz7ZDuySirWoDKyU7QCM
   9H2syL58QbmVlqEdqQL2XV1YenlmScaO+kTxzeKh4vJVOQYmWPIP/h+dz
   5F/3JVpU9WHAkHVAFKysxaZgM68Ljms6oGWAi+GzJmxbz91x7koAIP8yt
   Ii+1f0xb6NCskhcC/ToNG1pYo7RQmgh9+LfJuvcOajhMdfyPY1p8OUeDw
   MIt1H1fSsgkMcPzL4dThM6CnsnlY9jL8HkURmOXGiUFH7ecgMQY95xvTr
   w==;
X-CSE-ConnectionGUID: lXIwe/9ZRiePLR/hRcuYbA==
X-CSE-MsgGUID: a6RXy3VARy+dWIulnx400w==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34423049"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="34423049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 16:57:54 -0800
X-CSE-ConnectionGUID: wKVc9m2tTzqb2hc+3PAutQ==
X-CSE-MsgGUID: l3Q0CDeIR2KejweZYE/VgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88641672"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2024 16:57:54 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t87tH-000lSI-1F;
	Tue, 05 Nov 2024 00:57:51 +0000
Date: Tue, 5 Nov 2024 08:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 12/12] ERROR: modpost: "tpm_buf_read"
 [crypto/asymmetric_keys/tpm2_key_ecc.ko] undefined!
Message-ID: <202411050842.7OIIlnIK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   70a2627b8284f6c04ea99db77b2365c83179e7cf
commit: 3ca44efc8f37aa7aeada1dd406ec273f92859022 [12/12] KEYS: asymmetric: Add tpm2_key_ecdsa signer
config: openrisc-randconfig-r113-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050842.7OIIlnIK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411050842.7OIIlnIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050842.7OIIlnIK-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
>> ERROR: modpost: "tpm_buf_read" [crypto/asymmetric_keys/tpm2_key_ecc.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
