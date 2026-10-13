Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE55616A7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928857; cv=none; b=UPq4sBpvIKMvQQIeGza8uYUQAvIhXK/Srn38bGzN2LRWrcm4e27kU1eR8ZWS1DnKMzEIMw9fthM1JTag4OuRTB/4yic00Z5vQ1nZiXUjqiHu/QcdlYQjv1T/d3M+V2JBin8xmwKV6vAOJ+5VwEC6gnEwyCM7VfaVuTrw1ZD2hJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928857; c=relaxed/simple;
	bh=aFVl47WyyGUDitXiDlf5PZpEnW/kMup32CqumXUMu6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bkOyIW9+q9H5c9Y9kupN6xpWS53DIC4egWCEzzEB+xZPguYFLgHRQl9arhSvMwEHhxvIZlynfl5/jqahW9YXYM+wz5M8W0TBjgPkMMHr9/BfzCUPK4SUzMyl6dxUdxSYojyWy+Xep3zQPgre6Y6zeEUoGGgsMoT/pOfRARx0U3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsRryvxJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsRryvxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928848; x=1823464848;
  h=date:from:to:cc:subject:message-id;
  bh=aFVl47WyyGUDitXiDlf5PZpEnW/kMup32CqumXUMu6M=;
  b=CsRryvxJKIt71OYUydDHDjmPw8Ua9oRBJg0SvLUKyjkwiDCPgdb4Ab5Z
   0jgBzRV4ViGLhKtC5GgDfWgF5zWfPDYBNbhM2cQXiAWtkzFj4Lr1DQkE4
   1TKyQw9Cw1mD52kHRBNGW8Oa1Oqk1mrTXJTdXNI2qyVUMxLqG69FvuXhu
   50KlRA+Gd2bmYrAMyhic3IJ5LPHbdcxpr35is7hTgpewKYcXI5R2suFah
   ykX2te1cEuOPBkOptbh5pZb4uu0Jor8wN121Ohq5uPCo5yFaymVpv3bno
   o4zDOYtYOZoT3BN7cWWHGELIQ8D0WAjBet6Qewav4Gdy6UfTsx+i78yCK
   g==;
X-CSE-ConnectionGUID: jgGM5WmDQXa6lSSktJTsog==
X-CSE-MsgGUID: MIFTKEYtSRmUVvvQLM6+bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="686674"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="686674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 15:00:47 -0700
X-CSE-ConnectionGUID: X+FxsfuOTcKJdDnpwpGqVw==
X-CSE-MsgGUID: AWUEXuknR9qpXyLpEUv5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1614812"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Oct 2026 15:00:45 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGkY7-00000000AgR-2tXB;
	Tue, 13 Oct 2026 22:00:43 +0000
Date: Wed, 14 Oct 2026 00:00:40 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-sp 3/3]
 fs/ntfs3/fslog.c:520:27: sparse: sparse: restricted __le32 degrades to
 integer
Message-ID: <202610140004.iYk0oDgd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-sp
head:   7275f8d02a81f6b1706a1b0470601f019f86a746
commit: 32a3974b26dfbb059d15ab8d5683d8b9de647468 [3/3] fs/ntfs3: Correct function is_rst_area_valid
config: x86_64-randconfig-2302-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140004.iYk0oDgd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610140004.iYk0oDgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140004.iYk0oDgd-lkp@intel.com/

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
