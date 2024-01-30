Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38456BB3D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706623041; cv=none; b=LyfgVnHBOkLngAY4lETnlH2U4/PrqRSKq1Co2KK6jYVvlJni+Q2Gip03tgGH10T0h2tEG1+gCY/q/ns+WcgmRuYX2aNF1XqdqLzQ4uiDod/uj1w1WLL0JphOXgcPKCQ9pyLr0lPMeESdurRmDh5snUisZc4/2SZmMmwO/oLRA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706623041; c=relaxed/simple;
	bh=vJZVVgqlZqw/VIwZy2zEXJCAinPH/puOSn0tsCIt+qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WciOqcmaatTd1vlT76kzToBSsACnSaPvDYXKR8JZu3iXCKs7Qh0MP+O6JQkCmnrBa8JXouPVt5yCk/ANwKOWPGbLl3G1tGLLahY5wityHcgYFPdb86Dl1i7Ud6UDwU/V6qGSIiRFSGDWJBrApqNFMY7PBRtoANih+LrrALWCM+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1X5zQy2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1X5zQy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706623039; x=1738159039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJZVVgqlZqw/VIwZy2zEXJCAinPH/puOSn0tsCIt+qk=;
  b=U1X5zQy2n4xWGNJFb5Y8opLYjjAHfQvOUVz20Yh73AVKZw81ZZ7Xjo8O
   zxh6JHsZiXCE6fa9uNJ6/Q3Lnkm1sIl5q12DnBd5gbsrZr2ZGlrfTUQz0
   pDpctAWHD1kGJ6rkgituehzIV+i9Ms78/oujOcnnMf59aQ+weGQ63rZIV
   34x/vF07BS+qHM81HI+OlIYRgkO53sOfpLxvED8rDq/t/phurMO1V5NzD
   cYOhkhNayk55AC7ty1HUhtAxz7J6EPKPekBZvchyW626tYD3Xt78pqcNq
   2YdgTGXcT/DcVONpWi44tDatSWiDSGlYY1byaftHubaAYqZ8AdpHeyG/e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16812948"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="16812948"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 05:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="1119280716"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="1119280716"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2024 05:57:16 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUobz-0000Lu-0F;
	Tue, 30 Jan 2024 13:57:15 +0000
Date: Tue, 30 Jan 2024 21:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2432/2827] fs/ntfs3/fslog.c:520:27: sparse:
 sparse: restricted __le32 degrades to integer
Message-ID: <202401302158.oKXhk0gV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: 1b7dd28e14c4728ae1a815605ca33ffb4ce1b309 [2432/2827] fs/ntfs3: Correct function is_rst_area_valid
config: x86_64-randconfig-121-20240130 (https://download.01.org/0day-ci/archive/20240130/202401302158.oKXhk0gV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401302158.oKXhk0gV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401302158.oKXhk0gV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/fslog.c:520:27: sparse: sparse: restricted __le32 degrades to integer

vim +520 fs/ntfs3/fslog.c

   463	
   464	static inline bool is_rst_area_valid(const struct RESTART_HDR *rhdr)
   465	{
   466		const struct RESTART_AREA *ra;
   467		u16 cl, fl, ul;
   468		u32 off, l_size, seq_bits;
   469		u16 ro = le16_to_cpu(rhdr->ra_off);
   470		u32 sys_page = le32_to_cpu(rhdr->sys_page_size);
   471	
   472		if (ro + offsetof(struct RESTART_AREA, l_size) >
   473		    SECTOR_SIZE - sizeof(short))
   474			return false;
   475	
   476		ra = Add2Ptr(rhdr, ro);
   477		cl = le16_to_cpu(ra->log_clients);
   478	
   479		if (cl > 1)
   480			return false;
   481	
   482		off = le16_to_cpu(ra->client_off);
   483	
   484		if (!IS_ALIGNED(off, 8) || ro + off > SECTOR_SIZE - sizeof(short))
   485			return false;
   486	
   487		off += cl * sizeof(struct CLIENT_REC);
   488	
   489		if (off > sys_page)
   490			return false;
   491	
   492		/*
   493		 * Check the restart length field and whether the entire
   494		 * restart area is contained that length.
   495		 */
   496		if (le16_to_cpu(rhdr->ra_off) + le16_to_cpu(ra->ra_len) > sys_page ||
   497		    off > le16_to_cpu(ra->ra_len)) {
   498			return false;
   499		}
   500	
   501		/*
   502		 * As a final check make sure that the use list and the free list
   503		 * are either empty or point to a valid client.
   504		 */
   505		fl = le16_to_cpu(ra->client_idx[0]);
   506		ul = le16_to_cpu(ra->client_idx[1]);
   507		if ((fl != LFS_NO_CLIENT && fl >= cl) ||
   508		    (ul != LFS_NO_CLIENT && ul >= cl))
   509			return false;
   510	
   511		/* Make sure the sequence number bits match the log file size. */
   512		l_size = le64_to_cpu(ra->l_size);
   513	
   514		seq_bits = sizeof(u64) * 8 + 3;
   515		while (l_size) {
   516			l_size >>= 1;
   517			seq_bits -= 1;
   518		}
   519	
 > 520		if (seq_bits != ra->seq_num_bits)
   521			return false;
   522	
   523		/* The log page data offset and record header length must be quad-aligned. */
   524		if (!IS_ALIGNED(le16_to_cpu(ra->data_off), 8) ||
   525		    !IS_ALIGNED(le16_to_cpu(ra->rec_hdr_len), 8))
   526			return false;
   527	
   528		return true;
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
