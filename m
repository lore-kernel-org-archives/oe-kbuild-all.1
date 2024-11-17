Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCFB1863F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731861718; cv=none; b=F/dfFCzzauqiYXPAWP26rx/1jvVnaYOmQdMm7NkfkqMww2XKOi8p5+neoRtb8s3LUon7OXy0ZQJcrPYGNDNdCV8dhXn6sk/juHQG5Rb9Tf9w1NT0oQKk1ncBrbs//H1isvUNT0d9E+okR5LsEDZGfUO4WiaqYzOpxO9r2mVdQmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731861718; c=relaxed/simple;
	bh=M/WaTIe8YIVB1LmOSZw2YtZhZQMTJ9xxcBuigUbh+jM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ndt1rWnVSzFgmkns3qIluCZJ6G5CCcb2Aw/M6Az5d9Q5m8EhGBiYrmpT94DKLgaFvdG/vp/4++5L3VlBl9BegsqiZ90Y6ztm+GlzttahepJumTCQTvlJnGl1dJ+9zxyNwrj3gMRHWusygXxwlJAjBS494mDEUpDA+5Jl4nu+K3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwETCWrb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwETCWrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731861717; x=1763397717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M/WaTIe8YIVB1LmOSZw2YtZhZQMTJ9xxcBuigUbh+jM=;
  b=VwETCWrb07PO3w/TJhBP1m6jgK3dFMJcQLMT0BwE7UBqKly/s8fG8fFE
   e7WZ/4wtl8fXN3GXqC0l01vTX3KVsJnVsofBqj1VYRqKUUBpJZOVLzoz9
   oZezdoNRbAWB3aYBN27IEfiCBtPdmvBrQIerFqo17e/O6nbJldA3ZaOdB
   yVONynzBwh1uXaisAESvSfyup6/LjadE4BmVU3LLSUiy2lqlv2N+1zRIX
   79M6F3SvCElHtGf3GQ7riXDAjW7plsOlkqEYVzHS/c+oNQRUk8ySWdL7s
   aLYe4FFhrnGWVIvgupuevT0KD39GB15nGaE5jIAQXbaoDSh9UBDizL588
   Q==;
X-CSE-ConnectionGUID: Zh5Lt3nNSoqVxzLeETBxug==
X-CSE-MsgGUID: dbvyc5i/SdSJv61EsXhJSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43202935"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="43202935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 08:41:56 -0800
X-CSE-ConnectionGUID: MK/UA1jbRBa0IEG/CIpZYg==
X-CSE-MsgGUID: PhYZeF2bTji3w/xUOl1gyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="94103678"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2024 08:41:55 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCiLQ-0001vR-1G;
	Sun, 17 Nov 2024 16:41:52 +0000
Date: Mon, 18 Nov 2024 00:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?unknown-8bit?B?Um9ow6Fy?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 6/20] fs/smb/client/reparse.c:907:45: sparse: sparse:
 incorrect type in argument 4 (different base types)
Message-ID: <202411180006.3iKq7hY8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   f36b8c5bb788de2feea99660389db8e290cb36c5
commit: 811d283b82113b5c52ed723a5565c365a713f054 [6/20] cifs: Add support for parsing WSL-style symlinks
config: x86_64-randconfig-122-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180006.3iKq7hY8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180006.3iKq7hY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180006.3iKq7hY8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/reparse.c:145:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:145:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:145:25: sparse:     got int
   fs/smb/client/reparse.c:146:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:146:35: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:146:35: sparse:     got int
   fs/smb/client/reparse.c:147:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:147:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:147:25: sparse:     got int
>> fs/smb/client/reparse.c:907:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:907:45: sparse:     expected unsigned short [usertype] *pwcs
   fs/smb/client/reparse.c:907:45: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16
   fs/smb/client/reparse.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +907 fs/smb/client/reparse.c

   877	
   878	static int parse_reparse_wsl_symlink(struct reparse_wsl_symlink_data_buffer *buf,
   879					     struct cifs_sb_info *cifs_sb,
   880					     struct cifs_open_info_data *data)
   881	{
   882		int len = le16_to_cpu(buf->ReparseDataLength);
   883		int symname_utf8_len;
   884		__le16 *symname_utf16;
   885		int symname_utf16_len;
   886	
   887		if (len <= sizeof(buf->Flags)) {
   888			cifs_dbg(VFS, "srv returned malformed wsl symlink buffer\n");
   889			return -EIO;
   890		}
   891	
   892		/* PathBuffer is in UTF-8 but without trailing null-term byte */
   893		symname_utf8_len = len - sizeof(buf->Flags);
   894		/*
   895		 * Check that buffer does not contain null byte
   896		 * because Linux cannot process symlink with null byte.
   897		 */
   898		if (strnlen(buf->PathBuffer, symname_utf8_len) != symname_utf8_len) {
   899			cifs_dbg(VFS, "srv returned null byte in wsl symlink target location\n");
   900			return -EIO;
   901		}
   902		symname_utf16 = kzalloc(symname_utf8_len * 2, GFP_KERNEL);
   903		if (!symname_utf16)
   904			return -ENOMEM;
   905		symname_utf16_len = utf8s_to_utf16s(buf->PathBuffer, symname_utf8_len,
   906						    UTF16_LITTLE_ENDIAN,
 > 907						    symname_utf16, symname_utf8_len * 2);
   908		if (symname_utf16_len < 0) {
   909			kfree(symname_utf16);
   910			return symname_utf16_len;
   911		}
   912		symname_utf16_len *= 2; /* utf8s_to_utf16s() returns number of u16 items, not byte length */
   913	
   914		data->symlink_target = cifs_strndup_from_utf16((u8 *)symname_utf16,
   915							       symname_utf16_len, true,
   916							       cifs_sb->local_nls);
   917		kfree(symname_utf16);
   918		if (!data->symlink_target)
   919			return -ENOMEM;
   920	
   921		return 0;
   922	}
   923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
