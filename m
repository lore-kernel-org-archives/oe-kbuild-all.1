Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680026F073
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888300; cv=none; b=g2F5hfkCeO2HGAZtofaB10l1hMuss7QzyqOpHZGQ6SRY+mMk2qVUr4ivSaIwb7Ad4qq0w4qZDNgTNkNV4W8F4mLGCBTddkLSzmVKPS0OkAT9knPRpwrMSQC6QTPycWjbR8GpwVRZLcLyjFiix8SrrktESYDreVbWdGF6I5ofN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888300; c=relaxed/simple;
	bh=yNSz3LH6w43J97yfGvLLd3YVEtyETO93i4s9hrMBLwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF5bS9V6IK0zFz4KxOHyKtXYDBigGjpLWklS8auF+uSUely2kXK5ud1J/ZvQsBLcuxXKd3Jct8MNm2nAg8bVABLDQVlHtiCiSzHdACtKHTg1+sIVD8KIQboIvDPze3NWLbuQbJ7UMTTAa7z56Da64L0gYTQw5P472m5LMAhhXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJCvj8/B; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJCvj8/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733888297; x=1765424297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNSz3LH6w43J97yfGvLLd3YVEtyETO93i4s9hrMBLwU=;
  b=KJCvj8/BOWNJ47Zuf57fRL8ia34aYroRoD520uE+POcFhIMywwFW5mCO
   8KZboiLrVv8xkwf0pYtVo3H0oJL3HpVG7Mdy8BsmKW0Qcs30aopRSF97u
   FMNxMV2q+kaEB3tisP4y7cP7pjavQDhUydrYnM3QOWHLRKx/RUWlZR7/p
   JohwMsKJYh5mf1UGyGsDmr/JCR6JGRgO5VYOaq9srGfenHRAuHijxgHwk
   e5Ca7VejhOi1GIvYsfKYZxEEezP2LLeMzKJ4Y10mQ4FIV/hhBLqotdn+y
   5w3fFdBuWNiDSLX+gfsLGlc72ovQ/sNxzy+N6ICq11RuYQP3vzegKJkom
   Q==;
X-CSE-ConnectionGUID: tlsxnIs7RKCWRD+BSGK7Ew==
X-CSE-MsgGUID: DBKdQyB1RYe+/Od9whJw2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34396681"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34396681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 19:38:16 -0800
X-CSE-ConnectionGUID: 8znPvsiBTaO3eEr8yOiXVQ==
X-CSE-MsgGUID: gE3NetipTKugkhET/i7mKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126541239"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Dec 2024 19:38:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLDYD-0006ER-0Q;
	Wed, 11 Dec 2024 03:38:13 +0000
Date: Wed, 11 Dec 2024 11:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 7/12] fs/smb/client/reparse.c:548:52: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202412111133.dmadBekC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   6b60f4097777d1dbb8aebed5881c9db31ea13bec
commit: 449505c9c9358a248e45fe3121c0db4e744e813c [7/12] cifs: Add support for creating WSL-style symlinks
config: sparc64-randconfig-r111-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111133.dmadBekC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241211/202412111133.dmadBekC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111133.dmadBekC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/smb/client/reparse.c:548:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short const [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:548:52: sparse:     expected unsigned short const [usertype] *pwcs
   fs/smb/client/reparse.c:548:52: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16
   fs/smb/client/reparse.c:1046:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:1046:45: sparse:     expected unsigned short [usertype] *pwcs
   fs/smb/client/reparse.c:1046:45: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16

vim +548 fs/smb/client/reparse.c

   507	
   508	static int wsl_set_reparse_buf(struct reparse_data_buffer **buf,
   509				       mode_t mode, const char *symname,
   510				       struct cifs_sb_info *cifs_sb,
   511				       struct kvec *iov)
   512	{
   513		struct reparse_wsl_symlink_data_buffer *symlink_buf;
   514		__le16 *symname_utf16;
   515		int symname_utf16_len;
   516		int symname_utf8_maxlen;
   517		int symname_utf8_len;
   518		size_t buf_len;
   519		u32 tag;
   520	
   521		switch ((tag = reparse_mode_wsl_tag(mode))) {
   522		case IO_REPARSE_TAG_LX_BLK:
   523		case IO_REPARSE_TAG_LX_CHR:
   524		case IO_REPARSE_TAG_LX_FIFO:
   525		case IO_REPARSE_TAG_AF_UNIX:
   526			buf_len = sizeof(struct reparse_data_buffer);
   527			*buf = kzalloc(buf_len, GFP_KERNEL);
   528			if (!*buf)
   529				return -ENOMEM;
   530			break;
   531		case IO_REPARSE_TAG_LX_SYMLINK:
   532			symname_utf16 = cifs_strndup_to_utf16(symname, strlen(symname),
   533							      &symname_utf16_len,
   534							      cifs_sb->local_nls,
   535							      NO_MAP_UNI_RSVD);
   536			if (!symname_utf16)
   537				return -ENOMEM;
   538			symname_utf8_maxlen = symname_utf16_len/2*3;
   539			symlink_buf = kzalloc(sizeof(struct reparse_wsl_symlink_data_buffer) +
   540					      symname_utf8_maxlen, GFP_KERNEL);
   541			if (!symlink_buf) {
   542				kfree(symname_utf16);
   543				return -ENOMEM;
   544			}
   545			/* Flag 0x02000000 is unknown, but all wsl symlinks have this value */
   546			symlink_buf->Flags = cpu_to_le32(0x02000000);
   547			/* PathBuffer is in UTF-8 but without trailing null-term byte */
 > 548			symname_utf8_len = utf16s_to_utf8s(symname_utf16, symname_utf16_len/2,
   549							   UTF16_LITTLE_ENDIAN,
   550							   symlink_buf->PathBuffer,
   551							   symname_utf8_maxlen);
   552			*buf = (struct reparse_data_buffer *)symlink_buf;
   553			buf_len = sizeof(struct reparse_wsl_symlink_data_buffer) + symname_utf8_len;
   554			kfree(symname_utf16);
   555			break;
   556		default:
   557			return -EOPNOTSUPP;
   558		}
   559	
   560		(*buf)->ReparseTag = cpu_to_le32(tag);
   561		(*buf)->Reserved = 0;
   562		(*buf)->ReparseDataLength = cpu_to_le16(buf_len - sizeof(struct reparse_data_buffer));
   563		iov->iov_base = *buf;
   564		iov->iov_len = buf_len;
   565		return 0;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
