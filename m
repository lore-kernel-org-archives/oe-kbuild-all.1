Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE02578289
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 21:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003598; cv=none; b=AT95iPIblPTGfYFSGWoCkqi8LsiJC/195fbOkhlN72aHWyEqrYoos9qdZC/DIBgGf/KhqaUlmshADashnqesikw/x4n1CyKkDVvr324tfRi3Ui4fsvJeWQnaNcKmkhQxs5emUKmbx/FUgQcYibS+Fj1+lWQ7K5LkjWGLx3BAmRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003598; c=relaxed/simple;
	bh=uPDIEQ8Kac3+svZ3KJisLzUjSdSx2B/hnR5LQ2v3UUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ar7NvPorqxafiaVcyyqkPjiZftz9LLobyNaj0wK1iyuEWU2iTCUf/dY9kByFZJZHUhUvuQtxagYwcmApP0WvAmheLs7WdVr3/dL8px7wBjFVNzY4vvc3Hq0LngFPnnnV2vvrOCtJ10Mh8tUE7dRv1OUBfBtcBiK5hERdc1+Tv5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh6iuc4n; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh6iuc4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733003596; x=1764539596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPDIEQ8Kac3+svZ3KJisLzUjSdSx2B/hnR5LQ2v3UUI=;
  b=eh6iuc4nGCM3PJWAwkX2mXszcXfmN6Pg+fsj6coBFxa/q4o/k2YRqPov
   Pl3K4UpbfIXBUSATdHXMD3uX7Se7Q/ET8Gs7tS9iHSoLqbEyKC6trymwl
   EyOmmaYDCknX3Qfh9B7xcKWUuYPYrWmHDMzu6dUxySYoXjVfVcK9QfDvJ
   iAdg7SCG3f436IPnsrTuKQf+/eGXs50ykVVmhZSVAPlCbketijwaxy3Y4
   jmsAYR1d/5ZWPAcYznFhBKQMkenp8oFWGVvrVR7rEBKj7uXH7+ny2qNFY
   WugI9HMoy+jBTC9J6TkWSHOAtQkNUMv3nTKZyDE9ctOvFFWtRh/5q/hh8
   A==;
X-CSE-ConnectionGUID: QR1S2+KLR0ucUvrpGDeJUQ==
X-CSE-MsgGUID: KDLuhb4fRLK4GU6jJsx67Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44241471"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44241471"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 13:53:16 -0800
X-CSE-ConnectionGUID: hZ67pE9iTyWArsQGWP26iQ==
X-CSE-MsgGUID: ss6dsDnyQc+DYTz5DmGzeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97517594"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Nov 2024 13:53:14 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHVOZ-0000zz-2K;
	Sat, 30 Nov 2024 21:52:59 +0000
Date: Sun, 1 Dec 2024 05:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?unknown-8bit?B?Um9ow6Fy?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 10/20] fs/smb/client/reparse.c:422:48: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202412010530.bPsafPIv-lkp@intel.com>
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
commit: 65b590a114d82083b7dd4df1ef39791906441813 [10/20] cifs: Add support for creating NFS-style symlinks
config: x86_64-randconfig-122-20241117 (https://download.01.org/0day-ci/archive/20241201/202412010530.bPsafPIv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010530.bPsafPIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010530.bPsafPIv-lkp@intel.com/

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
>> fs/smb/client/reparse.c:422:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   fs/smb/client/reparse.c:422:48: sparse:     expected restricted __le32 [usertype]
   fs/smb/client/reparse.c:422:48: sparse:     got unsigned int
   fs/smb/client/reparse.c:423:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   fs/smb/client/reparse.c:423:48: sparse:     expected restricted __le32 [usertype]
   fs/smb/client/reparse.c:423:48: sparse:     got unsigned int
   fs/smb/client/reparse.c:1002:45: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned short [usertype] *pwcs @@     got restricted __le16 [usertype] *[assigned] symname_utf16 @@
   fs/smb/client/reparse.c:1002:45: sparse:     expected unsigned short [usertype] *pwcs
   fs/smb/client/reparse.c:1002:45: sparse:     got restricted __le16 [usertype] *[assigned] symname_utf16
   fs/smb/client/reparse.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +422 fs/smb/client/reparse.c

   406	
   407	static int nfs_set_reparse_buf(struct reparse_posix_data *buf,
   408				       mode_t mode, dev_t dev,
   409				       __le16 *symname_utf16,
   410				       int symname_utf16_len,
   411				       struct kvec *iov)
   412	{
   413		u64 type;
   414		u16 len, dlen;
   415	
   416		len = sizeof(*buf);
   417	
   418		switch ((type = reparse_mode_nfs_type(mode))) {
   419		case NFS_SPECFILE_BLK:
   420		case NFS_SPECFILE_CHR:
   421			dlen = 2 * sizeof(__le32);
 > 422			((__le32 *)buf->DataBuffer)[0] = MAJOR(dev);
   423			((__le32 *)buf->DataBuffer)[1] = MINOR(dev);
   424			break;
   425		case NFS_SPECFILE_LNK:
   426			dlen = symname_utf16_len;
   427			memcpy(buf->DataBuffer, symname_utf16, symname_utf16_len);
   428			break;
   429		case NFS_SPECFILE_FIFO:
   430		case NFS_SPECFILE_SOCK:
   431			dlen = 0;
   432			break;
   433		default:
   434			return -EOPNOTSUPP;
   435		}
   436	
   437		buf->ReparseTag = cpu_to_le32(IO_REPARSE_TAG_NFS);
   438		buf->Reserved = 0;
   439		buf->InodeType = cpu_to_le64(type);
   440		buf->ReparseDataLength = cpu_to_le16(len + dlen -
   441						     sizeof(struct reparse_data_buffer));
   442		iov->iov_base = buf;
   443		iov->iov_len = len + dlen;
   444		return 0;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
