Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE823CC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaOYX35b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699096309; x=1730632309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0rXNeuYC+8yh7DDgAASLLQPPagP/9JxT7uPMvsHfY04=;
  b=MaOYX35bWQhPYsGAMPW7NnUP36KkHQ68xaSotw4faNWncIWSKh4g3jnQ
   XNEX3ndJYHsA6hJZlJD6dv3SIZhhC+dkdo0rPD1TZEAWpiLJGqtCPXuXV
   DrEAveG+qsI7Xzc0EoMO0gCSmkf2s7Hy4/PClmPrREaHfmcJD7UQ2lJuG
   m2FvPJ4DgekZj1UQdfMlviv5baLayO7piAh1MXze8yqxBFDH0iTCKp2vd
   8paOGM9GUJefssLxAOW0gGE3sTv09LyPUZ+Xv6fQsitl14aB2v48VVvaG
   alkBB7CLlHCE2640nuvUjAEhNJ2khk3ncziYhybPfGxiMGZC5qdO7GSE4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="453379689"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="453379689"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832273060"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="832273060"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2023 04:11:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzEZ7-0003wa-15;
	Sat, 04 Nov 2023 11:11:45 +0000
Date: Sat, 4 Nov 2023 19:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 799/30000]
 drivers/md/dm-default-key.c:51: warning: Function parameter or member
 'is_hw_wrapped' not described in 'default_key_c'
Message-ID: <202311041821.x3OWxrg4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   d4e78df6f2fc1f0d9d21c3602b0e435118a5f909
commit: 9dcd66af6bfa5c00853cb2b90b0f080f3f350055 [799/30000] ANDROID: dm: Add wrapped key support in dm-default-key
config: i386-buildonly-randconfig-004-20231101 (https://download.01.org/0day-ci/archive/20231104/202311041821.x3OWxrg4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041821.x3OWxrg4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041821.x3OWxrg4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-default-key.c:51: warning: Function parameter or member 'is_hw_wrapped' not described in 'default_key_c'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +51 drivers/md/dm-default-key.c

cb39ec0c1040e8 Eric Biggers        2020-01-21  29  
cb39ec0c1040e8 Eric Biggers        2020-01-21  30  /**
cb39ec0c1040e8 Eric Biggers        2020-01-21  31   * struct dm_default_c - private data of a default-key target
cb39ec0c1040e8 Eric Biggers        2020-01-21  32   * @dev: the underlying device
cb39ec0c1040e8 Eric Biggers        2020-01-21  33   * @start: starting sector of the range of @dev which this target actually maps.
cb39ec0c1040e8 Eric Biggers        2020-01-21  34   *	   For this purpose a "sector" is 512 bytes.
cb39ec0c1040e8 Eric Biggers        2020-01-21  35   * @cipher_string: the name of the encryption algorithm being used
cb39ec0c1040e8 Eric Biggers        2020-01-21  36   * @iv_offset: starting offset for IVs.  IVs are generated as if the target were
cb39ec0c1040e8 Eric Biggers        2020-01-21  37   *	       preceded by @iv_offset 512-byte sectors.
cb39ec0c1040e8 Eric Biggers        2020-01-21  38   * @sector_size: crypto sector size in bytes (usually 4096)
cb39ec0c1040e8 Eric Biggers        2020-01-21  39   * @sector_bits: log2(sector_size)
cb39ec0c1040e8 Eric Biggers        2020-01-21  40   * @key: the encryption key to use
cb39ec0c1040e8 Eric Biggers        2020-01-21  41   */
cb39ec0c1040e8 Eric Biggers        2020-01-21  42  struct default_key_c {
cb39ec0c1040e8 Eric Biggers        2020-01-21  43  	struct dm_dev *dev;
cb39ec0c1040e8 Eric Biggers        2020-01-21  44  	sector_t start;
cb39ec0c1040e8 Eric Biggers        2020-01-21  45  	const char *cipher_string;
cb39ec0c1040e8 Eric Biggers        2020-01-21  46  	u64 iv_offset;
cb39ec0c1040e8 Eric Biggers        2020-01-21  47  	unsigned int sector_size;
cb39ec0c1040e8 Eric Biggers        2020-01-21  48  	unsigned int sector_bits;
cb39ec0c1040e8 Eric Biggers        2020-01-21  49  	struct blk_crypto_key key;
9dcd66af6bfa5c Barani Muthukumaran 2020-02-06  50  	bool is_hw_wrapped;
cb39ec0c1040e8 Eric Biggers        2020-01-21 @51  };
cb39ec0c1040e8 Eric Biggers        2020-01-21  52  

:::::: The code at line 51 was first introduced by commit
:::::: cb39ec0c1040e89d14ae0852454f8fd64a704118 ANDROID: dm: add dm-default-key target for metadata encryption

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
