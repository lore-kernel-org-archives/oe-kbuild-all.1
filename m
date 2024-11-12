Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052761EBFFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 06:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731391846; cv=none; b=oDLqJEvzbtIx+NXtTJhM6eLPwubvDVZbgNCRB09cHhDefuMWkmBN4YJ/w3ilcG6IU2tC71oXLUMYfNyO+C7g8y/CT18hjCED3ysf7FgyKthKw96p7pYqdxrf9C6CMB61sQqEDnPmk4ZfnbTHlE9dgvWUpB+reMPr4aI62RJBq70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731391846; c=relaxed/simple;
	bh=0b0wMaI8/pSwBLqAjxvutPuHZSHMJVkbpiByn7Yl9bI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WrgMbKTH9p5ueabi726B3KWYw1J4A1j8VGKRYF7yPqNw4bXBKbTl06OreUYfrOoggfUYTcY5JyCMcjV4wduBcRjr5ojuCUqW3Bz7WyxH2GM3Xj/Z4i8wErAM5mYmxQ2b15/DC1lZxfJnsEbZHoHX4daO361KpYAOpRh+I77dtMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYj5iisW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYj5iisW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731391845; x=1762927845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0b0wMaI8/pSwBLqAjxvutPuHZSHMJVkbpiByn7Yl9bI=;
  b=bYj5iisWxK4eTbVGzkGS6awh/ZJ5CCZ+CjgFp0PnQ3FXryScSBoSGJeb
   FGbSk/BaZo1aoVaGuMjvBCIOeyarg+XvafXoXhDmQV+hvHEMNMpyVAfxc
   UlerswxJ0z8OHXg2HNezORR6pm3yANyPY/89oYbB0YLhUqXzbF8H6C3W2
   K+LlxV/V+F0777pcz313qpmhzArkA4wit8LiobPXFWV1lM5ybi+s5JKy4
   SBAnYn5NW67wHYCEVl2EGPGaR+Q6oaj5GumrNf+gTY4FRlP6N+0t/z1UE
   EAer6EeKRQPdUdRB5oRTDKlAW6QiU754sU1GsMMvaWON+Gq8a0q8uMRvY
   Q==;
X-CSE-ConnectionGUID: ZrXHH5z6TM+4NZBidChOtg==
X-CSE-MsgGUID: mQ/9/tktSA6prvOZc46AgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="41836040"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="41836040"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 22:10:44 -0800
X-CSE-ConnectionGUID: 2vgypRnoTkalQogDbSwfwQ==
X-CSE-MsgGUID: +PtiTFxhRvOMrHBra64t8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="91787270"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2024 22:10:44 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAk6r-0000XB-10;
	Tue, 12 Nov 2024 06:10:41 +0000
Date: Tue, 12 Nov 2024 14:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 199/30000]
 drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for
 function 'ufshcd_blk_crypto_mode_num_for_alg_dusize'
Message-ID: <202411121414.03kz4oGx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Satya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   7e62fa505ac29c320cb5f59527c9ba13421454f0
commit: b7b3af961465d23a733bb44d4a49bb78d4d5b08f [199/30000] BACKPORT: FROMLIST: Update Inline Encryption from v5 to v6 of patch series
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241112/202411121414.03kz4oGx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411121414.03kz4oGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121414.03kz4oGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd-crypto.c:250:26: warning: no previous prototype for function 'ufshcd_blk_crypto_mode_num_for_alg_dusize' [-Wmissing-prototypes]
     250 | enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
         |                          ^
   drivers/scsi/ufs/ufshcd-crypto.c:250:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     250 | enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
         | ^
         | static 
   1 warning generated.


vim +/ufshcd_blk_crypto_mode_num_for_alg_dusize +250 drivers/scsi/ufs/ufshcd-crypto.c

   249	
 > 250	enum blk_crypto_mode_num ufshcd_blk_crypto_mode_num_for_alg_dusize(
   251						enum ufs_crypto_alg ufs_crypto_alg,
   252						enum ufs_crypto_key_size key_size)
   253	{
   254		/*
   255		 * This is currently the only mode that UFS and blk-crypto both support.
   256		 */
   257		if (ufs_crypto_alg == UFS_CRYPTO_ALG_AES_XTS &&
   258			key_size == UFS_CRYPTO_KEY_SIZE_256)
   259			return BLK_ENCRYPTION_MODE_AES_256_XTS;
   260	
   261		return BLK_ENCRYPTION_MODE_INVALID;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
