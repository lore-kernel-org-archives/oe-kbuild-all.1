Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDE2FD1D7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009485; cv=none; b=uWVxgl27SDr0BH1XtUpE2VMo8AknSLk5x/fVppIOeW3SgGPfVjwXZsvsO1hwRnZdtCkRKxIdL3oWTYDsD9SNgB6rc3Uwhi2I7kUBgfhvsIUgWElunwB+ExUiiO98vaDmU6Fz6fgxDBURYL8Kv0fhMsTT+0sv4Hh1X2c/9V693BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009485; c=relaxed/simple;
	bh=aKWsTkPKiurXSCoAZbcQRakZWSnBubFXrNcOj+bWS8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Op5ZuzmA4TYSo0bFjkL18pD5TpC7zz5Jc4iwGgplaZMMVgsHnNtyiYPvBjy/zAC3me/mZeyJeknQoaJGSKlehmFYt/tiM67Iiw9hUPAd7a4MPV09u9H3a0wEV3c5seelRP7USBY1Sri5gx4Bzc8mncIXVEuztRrePCGxkTQ3IPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0S7qsNg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0S7qsNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009483; x=1794545483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aKWsTkPKiurXSCoAZbcQRakZWSnBubFXrNcOj+bWS8A=;
  b=T0S7qsNg4XxxhS840EFbGwNDlwVlqYweEB7xiIHIh+sxkwiE4kjEeeiQ
   YwybT7Xa4/OVkGEcaXt37plDm6SLEww+LtaFOpqMuRs5dahdTWIPf3dBl
   Woj/0LOHJJhGKDLPrZ/MBNswupSRVK/6es1/5puWRJINncto4yiQ6N8Xe
   f/tlWT86DVjL8L3KnvfoQSn9ovkQgQlvO1tM/d+5Dut2jrxHkLOudZj7q
   pzF1hmJr74m8zSVVjlyFoqsQFzxk6Y/4xLA2H91eHO7NloXSWF0qkiDbm
   zhIcA7c54wn8ierrfTAZPf5f7l1wIgV9RrswkZOVhEK8Xo6Eux3GFX+GE
   A==;
X-CSE-ConnectionGUID: eZRD6R9tRPWXHi0IsHg5sg==
X-CSE-MsgGUID: uCoE+otsTPmeEkvXrDCOQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008591"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65008591"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:51:22 -0800
X-CSE-ConnectionGUID: br0/CHWlReK169qDg9JhXQ==
X-CSE-MsgGUID: 6iXMIHI+QQG91uq/7OyZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220161050"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPIl-0004tV-0L;
	Thu, 13 Nov 2025 04:51:19 +0000
Date: Thu, 13 Nov 2025 12:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_memfd_decrypted 1/1] mm/shmem.c:5236:5: error:
 redefinition of 'shmem_decrypt_folio'
Message-ID: <202511130155.AGXwncQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw wip_memfd_decrypted
head:   dcdd295fca26e98165b1ddd584bf29a2fdc22f03
commit: dcdd295fca26e98165b1ddd584bf29a2fdc22f03 [1/1] mm/memfd: add a flag allowing user to specify need for decrypted memory
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511130155.AGXwncQi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130155.AGXwncQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130155.AGXwncQi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/shmem.c:5236:5: error: redefinition of 'shmem_decrypt_folio'
    5236 | int shmem_decrypt_folio(struct inode *inode, struct folio *folio)
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from mm/shmem.c:36:
   include/linux/shmem_fs.h:165:19: note: previous definition of 'shmem_decrypt_folio' with type 'int(struct inode *, struct folio *)'
     165 | static inline int shmem_decrypt_folio(struct inode *inode, struct folio *folio)
         |                   ^~~~~~~~~~~~~~~~~~~
>> mm/shmem.c:5272:5: error: redefinition of 'shmem_encrypt_folio'
    5272 | int shmem_encrypt_folio(struct inode *inode, struct folio *folio)
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/shmem_fs.h:169:19: note: previous definition of 'shmem_encrypt_folio' with type 'int(struct inode *, struct folio *)'
     169 | static inline int shmem_encrypt_folio(struct inode *inode, struct folio *folio)
         |                   ^~~~~~~~~~~~~~~~~~~


vim +/shmem_decrypt_folio +5236 mm/shmem.c

  5225	
  5226	/**
  5227	 * shmem_decrypt_folio - Decrypt a folio if the inode requires it
  5228	 * @inode: The inode associated with the folio
  5229	 * @folio: The folio to decrypt
  5230	 *
  5231	 * This function decrypts the folio if the inode has the decrypted flag set.
  5232	 * It should be called after a folio is allocated and added to the page cache.
  5233	 *
  5234	 * Return: 0 on success, negative error code on failure
  5235	 */
> 5236	int shmem_decrypt_folio(struct inode *inode, struct folio *folio)
  5237	{
  5238		unsigned long addr;
  5239		int nr_pages;
  5240		int err;
  5241	
  5242		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT))
  5243			return 0;
  5244	
  5245		if (!mapping_decrypted(inode->i_mapping))
  5246			return 0;
  5247	
  5248		nr_pages = folio_nr_pages(folio);
  5249		addr = (unsigned long)folio_address(folio);
  5250		if (!addr)
  5251			return 0;
  5252	
  5253		err = set_memory_decrypted(addr, nr_pages);
  5254		if (err)
  5255			pr_warn_ratelimited("failed to decrypt folio at %p for inode %lu, error %d\n",
  5256					    folio_address(folio), inode->i_ino, err);
  5257	
  5258		return err;
  5259	}
  5260	EXPORT_SYMBOL_GPL(shmem_decrypt_folio);
  5261	
  5262	/**
  5263	 * shmem_encrypt_folio - Encrypt a folio if it was decrypted
  5264	 * @inode: The inode associated with the folio
  5265	 * @folio: The folio to encrypt
  5266	 *
  5267	 * This function encrypts the folio if the inode has the decrypted flag set.
  5268	 * It should be called when a folio is being released or removed from cache.
  5269	 *
  5270	 * Return: 0 on success, negative error code on failure
  5271	 */
> 5272	int shmem_encrypt_folio(struct inode *inode, struct folio *folio)
  5273	{
  5274		unsigned long addr;
  5275		int nr_pages;
  5276		int err;
  5277	
  5278		if (!IS_ENABLED(CONFIG_ARCH_HAS_MEM_ENCRYPT))
  5279			return 0;
  5280	
  5281		if (!mapping_decrypted(inode->i_mapping))
  5282			return 0;
  5283	
  5284		nr_pages = folio_nr_pages(folio);
  5285		addr = (unsigned long)folio_address(folio);
  5286		if (!addr)
  5287			return 0;
  5288	
  5289		err = set_memory_encrypted(addr, nr_pages);
  5290		if (err)
  5291			pr_warn_ratelimited("failed to encrypt folio at %p for inode %lu, error %d\n",
  5292					    folio_address(folio), inode->i_ino, err);
  5293	
  5294		return err;
  5295	}
  5296	EXPORT_SYMBOL_GPL(shmem_encrypt_folio);
  5297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
