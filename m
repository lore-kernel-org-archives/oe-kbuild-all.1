Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432053D76
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765104580; cv=none; b=jrPXFdQDRJDznDZmQmfudhkOmNWtCXuLPEf4oI9h5+zVgAG6BuPA5nbzXqQNvaEcxIfCfmc1r64X4TuVLeIUp/yLkjGyCvNyKjSfgta3HLtyM8ZhPJhodKgGR1HHNuCDQMtitPqiQm4wwJNVp2GrmrgV+Oul9+RmW18qZp/dh0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765104580; c=relaxed/simple;
	bh=BuxNIYPgrPXZyjNvQZP44qAwk4lUXqjE8U+E/lY3Pyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KEj7QsJNzP+OPzuiTmyRK+F/UxPnx7S705J2/sw+emKufM2Ov4X2wYqfzt1YTPuG4L6iM0PfV270zK/naaaRlooyALzaKsfdC3nWhasvGEZtaHO6YBGUVPMTutqsxpCdcRogcWQYz9SB9W3pA5/bkXwnJdmEdy5k+QmzS1NYxYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDa5F/s+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDa5F/s+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765104578; x=1796640578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BuxNIYPgrPXZyjNvQZP44qAwk4lUXqjE8U+E/lY3Pyo=;
  b=kDa5F/s+TFhCRN1YCyrPXHlKjszsAuHWYIGF6G6el3FNqCTUlsgxZWXz
   oLEwk7Y7fqNMJuEeRWWm6ZmfIEihcmW7KMkVqjdd6Qcj8R5+P0YRFODyv
   WsWfWtcBovjPA2U8SS+qzcH7CdIQ67rS9ul4m/kcWffJ3IgL/f5heZ3jZ
   qF7zIvoK5CGSaKi5qb/NrrI0n/dUXzaRV4IpkRGto75FHsXthw/1RrrE2
   Ly3gQS5TnTOiziMQiH8JsgoAWYYGAcDH7BDX9FQdoqhL8Tgz2IkMrxJS4
   wBzo7eKOb3S3n0l7shYTbZXLEaaYbgvFImrDzax/TgQEi/1/N9yOBEH0T
   Q==;
X-CSE-ConnectionGUID: seOTyCprTtS8m+U6AdnnDw==
X-CSE-MsgGUID: R9gcO5IqQziDy8XoCsCGfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="77693358"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="77693358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 02:49:37 -0800
X-CSE-ConnectionGUID: b2puqmDtSn2C42xPJ0Ozjw==
X-CSE-MsgGUID: a/Y2iqoSQcaEMHPl+1II8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="196454974"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Dec 2025 02:49:37 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSCKc-00000000JCD-3mD9;
	Sun, 07 Dec 2025 10:49:34 +0000
Date: Sun, 7 Dec 2025 18:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3482/3482]
 drivers/crypto/ccp/hygon/ccp-mdev.c:243:23: sparse: sparse: cast to
 restricted __le32
Message-ID: <202512071819.8VAvTIH6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: 592817a30ddc0ef43c7f5b5fe906ae37cf3bea3b [3482/3482] crypto: ccp: add ccp-mdev functionality to the ccp module.
config: arm64-randconfig-r111-20251206 (https://download.01.org/0day-ci/archive/20251207/202512071819.8VAvTIH6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071819.8VAvTIH6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071819.8VAvTIH6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/hygon/ccp-mdev.c:243:23: sparse: sparse: cast to restricted __le32
>> drivers/crypto/ccp/hygon/ccp-mdev.c:1144:13: sparse: sparse: symbol 'ccp_pin_memory' was not declared. Should it be static?

vim +243 drivers/crypto/ccp/hygon/ccp-mdev.c

   239	
   240	static int handle_pci_cfg_write(struct mdev_state *mdev_state, u16 offset,
   241					 u8 *buf, u32 count)
   242	{
 > 243		u32 tmp_val = le32_to_cpu(*(u32 *)buf);
   244		struct pci_dev *pdev = NULL;
   245		int ret = -EINVAL;
   246	
   247		if (!mdev_state || !mdev_state->iommu) {
   248			pr_err("ccp: invalid mdev_state.\n");
   249			return ret;
   250		}
   251	
   252		pdev = mdev_state->iommu->pdev;
   253	
   254		if (count == 1)
   255			ret = pci_user_write_config_byte(pdev, offset, tmp_val);
   256		else if (count == 2)
   257			ret = pci_user_write_config_word(pdev, offset, tmp_val);
   258		else if (count == 4)
   259			ret = pci_user_write_config_dword(pdev, offset, tmp_val);
   260	
   261		return ret;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
