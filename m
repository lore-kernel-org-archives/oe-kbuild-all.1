Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3EA945
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731866106; cv=none; b=CuApEk/58uRAqjZzWEGSWmCWXjQgJeYNjXg5Y1XLlHs8xIuSJ/KGLJFQfNe84Z02Itnml0kUwViqmtQmGsSO1zN1PxXvVwZBNr+mDtpu5mMitBtAZkIm2P4A++7jYeImTrPiYUc7EaU2kh8In1VJkcJqg1+cpu/FoizLJMqw39o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731866106; c=relaxed/simple;
	bh=Sw65og0GbHB9RRv91p8DbPRdjvBgdtpRnEdhjcYjN9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R1E7IR3gZZ/Z/WJQrlO2zr6s8vbGOIjKlwzXnfY9y4XySwpPjtJBL6f/FcpHhClE+5z405e1maqQvUgvfh9DsxXAC/n3PzVpdCbAxjX7moq2N7zRGw3jaqKbI2MEvDU20P95Hz2h10VqtYE0oE5nN8B/LazRmMClrEKz0Vg9Bkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzLaAxap; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzLaAxap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731866105; x=1763402105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sw65og0GbHB9RRv91p8DbPRdjvBgdtpRnEdhjcYjN9c=;
  b=XzLaAxapQ8JBEST/0/5BbN/40OrsKL2EWQYombbpP1Vmu0RaJnK9Twnr
   TsXzvRIAu4xuE1l4K4CNxJWoScQepfhUSGCd/CWIZcxt4LFretc19Qj6j
   KuDa7FvazBtn7Zz5NSE+jJ8oegt9dCnCpTXVfJ2sl/nQWHLSCwMHTgBP1
   1iPAWHfV6aPuxvLrMSpYbZagkoHXYL5MIow4szmHWW91uu8A35B7FxENY
   BclOd9JMcLLphV+aDa8XX3VxRrmlQ9IyheVaqdTsILMXNAQFqQqNU6DDD
   +MRz0p543BvluiViQQ1OtAKUufTPW5GKr4G+hMEFGHCtC2D0v1Uc0TZMd
   g==;
X-CSE-ConnectionGUID: JHL9TZGaQ5Sqip6eem8gYQ==
X-CSE-MsgGUID: 5EdVQR/IRtKFVE/9zwYw3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35588663"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35588663"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 09:55:05 -0800
X-CSE-ConnectionGUID: rgxx6xlwTryw+WWe7dlGcQ==
X-CSE-MsgGUID: ao1ZnYs+Q5Od7uLJDnH5tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89025073"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Nov 2024 09:55:03 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCjUC-0001yt-1q;
	Sun, 17 Nov 2024 17:55:00 +0000
Date: Mon, 18 Nov 2024 01:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?unknown-8bit?B?Um9ow6Fy?= <pali@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 10/20] fs/smb/client/reparse.c:422:48: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202411180158.TiVIzJVS-lkp@intel.com>
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
config: x86_64-randconfig-122-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180158.TiVIzJVS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180158.TiVIzJVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180158.TiVIzJVS-lkp@intel.com/

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
