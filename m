Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A25328DB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712320427; cv=none; b=VK363OiXCeG2DY9b6Jk2WjHDRqw1WOGe4AR0KGXzRNNzDNJXHpKxSsiL6rILdM9WUAPIAvyULDmOHmTJRgTheiKutKbxtlsRbBqDxF9VF22YkkF7b/Yf8gHfXU7uzXTC83YMeyPrvn0dCZ7TcUmGtMDkvmJb6y3/5dH32l9Qo7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712320427; c=relaxed/simple;
	bh=dKhw0DYsADZK0a/V69pRtb7EJ49LziYGi6Irf0zWXX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAj0g2r2/1qBUcXKdTF0EYNAmfDnPwIHzDfOYApCwKwQ2cFr+Z8WoSq8Jn2sEjAT+/gzDDU+7eHzqqhFAaq6dR2NJm8+PJCvaKaxeOaEPGNt1oCyj3E4VF20YM7eWAYtxmV1RX8IRKruNn+qXXJKqDbV/Uw+MNMPhJxI7NxeMV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIihJSfd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIihJSfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712320426; x=1743856426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKhw0DYsADZK0a/V69pRtb7EJ49LziYGi6Irf0zWXX4=;
  b=FIihJSfd5Jix8FJdEJxkbIFZWCaGGPTZC3QNiXcUtCUPOAOpdUmFi4V8
   NBGBL8k499UAHLywGrz8U2EybE98Kwolki4x4NL/tofryMCxryPOEJeCt
   EdLTzfB9NaAL0NG3lg26qR5QDW+RDyVSp+yS2cQWDbYPTpMJ3XbTvF0Y7
   1q9v2bs/9RcppK6f9LoePPsL2hvO/saiDZZErHGI7vEq+oC9GAyJ+wuhZ
   qQk2tMYsIOggDb2DLa3Ep+Mydm6J0+EfNcbn+DHaRcqWMNNRB4Hq3RU//
   7kAQBPIAQRs6JimrHo/A7lz1sJOoYeAQQaxqpc/g8FL2XUoBK4Ctp2CCS
   w==;
X-CSE-ConnectionGUID: G1eXwDtsTs+4SZspKFNj5w==
X-CSE-MsgGUID: RMP5yuimRtaA4nh8r4CguA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7832452"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7832452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 05:33:45 -0700
X-CSE-ConnectionGUID: e4tB9Hh7ScKP+ijECRozkA==
X-CSE-MsgGUID: 0DSEn+K1TLCzY//AFEYPFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="23786394"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2024 05:33:44 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsilJ-0002G2-3C;
	Fri, 05 Apr 2024 12:33:41 +0000
Date: Fri, 5 Apr 2024 20:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 5/37] fs/libfs.c:1139:33: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202404052031.IqGnSD9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: a1ef617d783229016226ab770d59290a5ea6fc32 [5/37] fs: add simple_copy_{to,from}_iter() helpers
config: i386-randconfig-061-20240405 (https://download.01.org/0day-ci/archive/20240405/202404052031.IqGnSD9w-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404052031.IqGnSD9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404052031.IqGnSD9w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/libfs.c:1139:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *addr @@     got void const [noderef] __user * @@
   fs/libfs.c:1139:33: sparse:     expected void const *addr
   fs/libfs.c:1139:33: sparse:     got void const [noderef] __user *
   fs/libfs.c:2117:22: sparse: sparse: context imbalance in 'stash_dentry' - wrong count at exit
   fs/libfs.c:2156:5: sparse: sparse: context imbalance in 'path_from_stashed' - wrong count at exit

vim +1139 fs/libfs.c

  1112	
  1113	/**
  1114	 * simple_copy_to_iter - copy data userspace to iter
  1115	 * @from: the user space buffer to read from
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
  1126	ssize_t simple_copy_to_iter(const void __user *from, loff_t *ppos, size_t count,
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
> 1139		ret = copy_to_iter(from + pos, count, to);
  1140		if (ret == count)
  1141			return -EFAULT;
  1142		count -= ret;
  1143		*ppos = pos + count;
  1144		return count;
  1145	}
  1146	EXPORT_SYMBOL(simple_copy_to_iter);
  1147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
