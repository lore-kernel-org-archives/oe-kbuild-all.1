Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC715956C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733007920; cv=none; b=B7Ytsta3UrnVnCp6ndE6KfbjnNAy5fP1mtYoIRPsWjJFpKjSXZfluXF2aqan+5tebOLtliAds5nIUHWi8XRQbO4RFteA1WXZNDNPN26/LViYNOdhuDfLNF9272gItEuWSv/rz7jhQt+OcNeYEWFq0F5YdIOmthH3AjoV8wRI2FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733007920; c=relaxed/simple;
	bh=37dVN4eEkpJ0cucTC6qWf/+oobHjbeTVqQFw5X/OeTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NZgo+ZiqQ1lFegpK9a3wB2DmaSD0XZI6kGbs/5xOpolOZXNbISnSFzdHhSs8PZCLMySzYT7QhJfZ+WhvWhvOXxJVwGX/O36oOrc+BkHxuufH1BkJuJJc9MKx1jsgYUxsKbnRe2e0ukkomb3lgj7Tb/vQkpG3uCIP9BZl8uBnvAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNuZTH7e; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNuZTH7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733007919; x=1764543919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37dVN4eEkpJ0cucTC6qWf/+oobHjbeTVqQFw5X/OeTA=;
  b=BNuZTH7ejDrEKiQ/BtvMyLl7t0kSOVWf92qvtMrjd3334WdrfdSnyxIU
   FAurqzxPFLWTV1IhDdFeIS7XGjLZ8ZYkENm5N6aBXpQ5ZLlEZqV5sIBSr
   /snmznFGw9ch8Uddarl+ndITODAwVpq/eEMhWr2fa9698btlEQdM8gMT3
   KrzKST7jiS2n+kzmolmXbdzCwGxIOWsiZ8VvaaXqsou5byn/AGKFpa0XC
   v7LEn37O2uDgPeD+p0UgXUlSdV3QN63zn2hLqrhW4u9Row+IHr8ugIFRe
   2DJailMgxhLd8R7Rjb8O5Hj5KR/i2rmapYvKhaJsM7qsibGT1IJhP/VLP
   g==;
X-CSE-ConnectionGUID: 6Het5lwkSVyO37i34n3OKw==
X-CSE-MsgGUID: Lk4DUw16QaSbZFMCAles5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33342384"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33342384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 15:05:17 -0800
X-CSE-ConnectionGUID: h0I55G06QFu8rBW/YzDxMg==
X-CSE-MsgGUID: 67VjCfehTpqo1hkLoHd1wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97781196"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Nov 2024 15:05:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHWWX-00012J-1z;
	Sat, 30 Nov 2024 23:05:13 +0000
Date: Sun, 1 Dec 2024 07:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?unknown-8bit?B?Um9ow6Fy?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 12/20] fs/smb/client/reparse.c:545:52: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202412010618.Gl7CfQ4o-lkp@intel.com>
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
commit: 033b03d28f090cc2228c0c6aff225c6ba7c8ce4f [12/20] cifs: Add support for creating WSL-style symlinks
config: x86_64-randconfig-122-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010618.Gl7CfQ4o-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010618.Gl7CfQ4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010618.Gl7CfQ4o-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/smb/client/reparse.c:175:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:175:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:175:25: sparse:     got int
   fs/smb/client/reparse.c:176:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:176:35: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:176:35: sparse:     got int
   fs/smb/client/reparse.c:177:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got int @@
   fs/smb/client/reparse.c:177:25: sparse:     expected restricted __le16 [usertype]
   fs/smb/client/reparse.c:177:25: sparse:     got int
   fs/smb/client/reparse.c:422:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   fs/smb/client/reparse.c:422:48: sparse:     expected restricted __le32 [usertype]
   fs/smb/client/reparse.c:422:48: sparse:     got unsigned int
   fs/smb/client/reparse.c:423:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   fs/smb/client/reparse.c:423:48: sparse:     expected restricted __le32 [usertype]
   fs/smb/client/reparse.c:423:48: sparse:     got unsigned int
>> fs/smb/client/reparse.c:545:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:545:52: sparse:     expected unsigned short const [usertype] *pwcs
   fs/smb/client/reparse.c:545:52: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16
   fs/smb/client/reparse.c:1043:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:1043:45: sparse:     expected unsigned short [usertype] *pwcs
   fs/smb/client/reparse.c:1043:45: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16
   fs/smb/client/reparse.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +545 fs/smb/client/reparse.c

   504	
   505	static int wsl_set_reparse_buf(struct reparse_data_buffer **buf,
   506				       mode_t mode, const char *symname,
   507				       struct cifs_sb_info *cifs_sb,
   508				       struct kvec *iov)
   509	{
   510		struct reparse_wsl_symlink_data_buffer *symlink_buf;
   511		__le16 *symname_utf16;
   512		int symname_utf16_len;
   513		int symname_utf8_maxlen;
   514		int symname_utf8_len;
   515		size_t buf_len;
   516		u32 tag;
   517	
   518		switch ((tag = reparse_mode_wsl_tag(mode))) {
   519		case IO_REPARSE_TAG_LX_BLK:
   520		case IO_REPARSE_TAG_LX_CHR:
   521		case IO_REPARSE_TAG_LX_FIFO:
   522		case IO_REPARSE_TAG_AF_UNIX:
   523			buf_len = sizeof(struct reparse_data_buffer);
   524			*buf = kzalloc(buf_len, GFP_KERNEL);
   525			if (!*buf)
   526				return -ENOMEM;
   527			break;
   528		case IO_REPARSE_TAG_LX_SYMLINK:
   529			symname_utf16 = cifs_strndup_to_utf16(symname, strlen(symname),
   530							      &symname_utf16_len,
   531							      cifs_sb->local_nls,
   532							      NO_MAP_UNI_RSVD);
   533			if (!symname_utf16)
   534				return -ENOMEM;
   535			symname_utf8_maxlen = symname_utf16_len/2*3;
   536			symlink_buf = kzalloc(sizeof(struct reparse_wsl_symlink_data_buffer) +
   537					      symname_utf8_maxlen, GFP_KERNEL);
   538			if (!symlink_buf) {
   539				kfree(symname_utf16);
   540				return -ENOMEM;
   541			}
   542			/* Flag 0x02000000 is unknown, but all wsl symlinks have this value */
   543			symlink_buf->Flags = cpu_to_le32(0x02000000);
   544			/* PathBuffer is in UTF-8 but without trailing null-term byte */
 > 545			symname_utf8_len = utf16s_to_utf8s(symname_utf16, symname_utf16_len/2,
   546							   UTF16_LITTLE_ENDIAN,
   547							   symlink_buf->PathBuffer,
   548							   symname_utf8_maxlen);
   549			*buf = (struct reparse_data_buffer *)symlink_buf;
   550			buf_len = sizeof(struct reparse_wsl_symlink_data_buffer) + symname_utf8_len;
   551			kfree(symname_utf16);
   552			break;
   553		default:
   554			return -EOPNOTSUPP;
   555		}
   556	
   557		(*buf)->ReparseTag = cpu_to_le32(tag);
   558		(*buf)->Reserved = 0;
   559		(*buf)->ReparseDataLength = cpu_to_le16(buf_len - sizeof(struct reparse_data_buffer));
   560		iov->iov_base = *buf;
   561		iov->iov_len = buf_len;
   562		return 0;
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
