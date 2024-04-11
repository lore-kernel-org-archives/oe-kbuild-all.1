Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FC1757D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849265; cv=none; b=tsi4qgbCN6m+Fe3px1G34Ohal3yVj5EcAwScams3s+6KuXvE/iaqT1KStb4EGP/z6p311oDONuDkveNFRSKbgE22imFfTT+/TZw5t9C4KsPaKiaGkmQy7i5YgWdUcxlPyp8u8k/x8UBWqzh8fxJYUSO+bCRIR+gdCT2OnTLbM/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849265; c=relaxed/simple;
	bh=KUVRASwjSgC97ogog/xvEQ5Uwol/x7BLJZCiYJ83ZCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZLfEce/jy1/zUO4TOoQWhTSjRfl9+IdkYLzVeRpSCJao36yYwOIxx/yBhjoIDexb19pg+Oo03AjNrbL6XNgTyyU3LX+pOwvUZbIb4YWK6zutbMLbtLRlWMiPFqsJWbrq3j8egMJ0YQDrxBNmowWDUD2840BWT3dyiYITTcpt2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4OZ6/iK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4OZ6/iK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712849263; x=1744385263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KUVRASwjSgC97ogog/xvEQ5Uwol/x7BLJZCiYJ83ZCQ=;
  b=V4OZ6/iKxOUFw1zXCcsFGDMPmqNwqw4vUPYKEkLNmTh17KOlsBLg1FSl
   r145hvvTJaxYsfHdklURu+aTY+5Mn9RX+2rsgMAa8eyRNOWYy2VO4TVX+
   ZQi9Vm0R4BjQ8QgZ7ovHmzKC8SM5xG5o+wyFidvYhLF4pSpQAL0tmGHn/
   GCR3HzDQYZT+mVK4a4z+iP0k6i3tgkYc328fT05bzHVDccMc8NWsqItCm
   4IJ0AWu7Rlx5r+TRmfZ3E4z/6UQ/i/SIBDCETzrnRyo0KBAlkbL0gkjzo
   HVO7mnCzxdpr256+41Jv8dAYrrjj8UGveVfd/sLkhG0ag2bHgMXkDoh5Z
   w==;
X-CSE-ConnectionGUID: dchRT2rWSmKcIy3VLWbZuA==
X-CSE-MsgGUID: 4Y6Pe9lrSZuvnQQlWqd7vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8826308"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8826308"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 08:27:36 -0700
X-CSE-ConnectionGUID: 0v0PgkR4TjOzvIiSYipuDw==
X-CSE-MsgGUID: zABr9RwvR8iGpEHD5hr8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25710706"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2024 08:27:36 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruwKr-0008jd-0Q;
	Thu, 11 Apr 2024 15:27:33 +0000
Date: Thu, 11 Apr 2024 23:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 5/415] fs/libfs.c:1105 simple_write_to_buffer()
 warn: unsigned 'res' is never less than zero.
Message-ID: <202404112351.6vrHbsGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: a8065c7527f9650647089cc2f0e489548b7c8a29 [5/415] fs: add simple_copy_{to,from}_iter() helpers
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112351.6vrHbsGd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112351.6vrHbsGd-lkp@intel.com/

smatch warnings:
fs/libfs.c:1105 simple_write_to_buffer() warn: unsigned 'res' is never less than zero.
fs/libfs.c:1140 simple_copy_to_iter() warn: unsigned 'ret' is never less than zero.

vim +/res +1105 fs/libfs.c

  1077	
  1078	/**
  1079	 * simple_write_to_buffer - copy data from user space to the buffer
  1080	 * @to: the buffer to write to
  1081	 * @available: the size of the buffer
  1082	 * @ppos: the current position in the buffer
  1083	 * @from: the user space buffer to read from
  1084	 * @count: the maximum number of bytes to read
  1085	 *
  1086	 * The simple_write_to_buffer() function reads up to @count bytes from the user
  1087	 * space address starting at @from into the buffer @to at offset @ppos.
  1088	 *
  1089	 * On success, the number of bytes written is returned and the offset @ppos is
  1090	 * advanced by this number, or negative value is returned on error.
  1091	 **/
  1092	ssize_t simple_write_to_buffer(void *to, size_t available, loff_t *ppos,
  1093			const void __user *from, size_t count)
  1094	{
  1095		loff_t pos = *ppos;
  1096		size_t res;
  1097	
  1098		if (pos < 0)
  1099			return -EINVAL;
  1100		if (pos >= available || !count)
  1101			return 0;
  1102		if (count > available - pos)
  1103			count = available - pos;
  1104		res = copy_from_user(to + pos, from, count);
> 1105		if (res < 0)
  1106			return res;
  1107		count -= res;
  1108		*ppos = pos + count;
  1109		return count;
  1110	}
  1111	EXPORT_SYMBOL(simple_write_to_buffer);
  1112	
  1113	/**
  1114	 * simple_copy_to_iter - copy data userspace to iter
  1115	 * @from: the buffer to read from
  1116	 * @ppos: the current position in the buffer
  1117	 * @count: the maximum number of bytes to copy
  1118	 * @to: the iov_iter to copy to
  1119	 *
  1120	 * The simple_copy_to_iter() function reads up to @count bytes from the
  1121	 * buffer @from at offset @ppos into the user space address starting at @to.
  1122	 *
  1123	 * On success, the number of bytes copied is returned, or negative value is
  1124	 * returned on error.
  1125	 **/
  1126	ssize_t simple_copy_to_iter(const void *from, loff_t *ppos, size_t count,
  1127				    struct iov_iter *to)
  1128	{
  1129		size_t available = iov_iter_count(to);
  1130		loff_t pos = *ppos;
  1131		size_t ret;
  1132	
  1133		if (pos < 0)
  1134			return -EINVAL;
  1135		if (pos >= available || !count)
  1136			return 0;
  1137		if (count > available - pos)
  1138			count = available - pos;
  1139		ret = copy_to_iter(from + pos, count, to);
> 1140		if (ret < 0)
  1141			return ret;
  1142		count -= ret;
  1143		*ppos = pos + count;
  1144		return count;
  1145	}
  1146	EXPORT_SYMBOL(simple_copy_to_iter);
  1147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
