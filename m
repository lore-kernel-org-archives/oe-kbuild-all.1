Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612C53E2C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 20:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710188723; cv=none; b=pyQhK+kJUwUqTA47MRtiquWOY+g1HvZT3s0ZXchuFkjnicC6LvNHHM/OxeaFKDHlBz03kPrGPOvi3qPGXh8Peo+2cVcb1fl3QV/s6iL8Z4P3ztTgkL0RTzJN52RPKqbj1YY4B0YSa0vQg/y8SPMI8EeQFS5mUwoCNLzdOVOHvI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710188723; c=relaxed/simple;
	bh=zA9ntwSf4Y08M6slgeGXAAwMkAPh5Z+OcKuSc1sNLsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OYkAIilZJ6QrFNqTspbMUvtG0Xjhq3J6fRPLRobHFFzDTll8L3arpYNSkzPgfcCaZlhnUzRkbjE7ncIRsQpj5t8JhzkHdp+LyGVG8hC9IASZf2x6Y8t1LKTbxQCe3GTMXM+34mw4/EKEk4yuTW0jFUcQnW7L0+TxtvQ6Ok14qPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZ3MViqI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZ3MViqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710188721; x=1741724721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zA9ntwSf4Y08M6slgeGXAAwMkAPh5Z+OcKuSc1sNLsw=;
  b=VZ3MViqIoAKpur7S2Ul2JicYzCVA7sd0csTmNYSIjei0FYq7BD0RQar4
   zLn2UyawNuFS4MD9Q2MqWRL1T6mjcYKthkmyEyJ39jlFnc1phCka90+7G
   bM9Xkd8qwn8JIwPJJQ4WTYZzLI/zcwDKSM6vkFHK5TW2AfKByMvaAlevM
   sUr9PTWTDXiBgeHcAcUNc6PjRk4E3GEYFs5i87FFHQnZ5PQGIvk+aeSFO
   jcof9o6qXvY2mUoelzbOuMyXkO861aBQFM6CcDDdKv5zPrIXNCH58GblY
   dljzpJkaPpbyKxWQNKVYqBrM6eNCg3HK8pJnn2B8RJotn0S6wKb2Matvw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15603146"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15603146"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 13:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11358964"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Mar 2024 13:24:58 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjmCe-0009Qv-0k;
	Mon, 11 Mar 2024 20:24:56 +0000
Date: Tue, 12 Mar 2024 04:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 144/146] fs/bcachefs/fs-ioctl.c:501
 bch2_ioctl_subvolume_path() warn: inconsistent indenting
Message-ID: <202403120441.QAmLadw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   964337312db426db662cde052d6a56c96657f7fb
commit: ae65bb6ad25564a46e515c8d3a372f3e94958872 [144/146] bcachefs: new subvol ioctls
config: i386-randconfig-141-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120441.QAmLadw1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120441.QAmLadw1-lkp@intel.com/

smatch warnings:
fs/bcachefs/fs-ioctl.c:501 bch2_ioctl_subvolume_path() warn: inconsistent indenting

vim +501 fs/bcachefs/fs-ioctl.c

   492	
   493	static long bch2_ioctl_subvolume_path(struct bch_fs *c, struct file *file,
   494					      struct bch_ioctl_subvolume_path __user *user_arg)
   495	{
   496		struct bch_ioctl_subvolume_path arg;
   497		darray_char path = {};
   498	
   499		int ret = copy_from_user_errcode(&arg, user_arg, sizeof(arg)) ?:
   500			  bch2_subvol_to_path_checked(c, file->f_path.mnt, arg.subvolid, &path);
 > 501			  (path.nr > arg.buflen ? -ERANGE : 0) ?:
   502			  (arg.buflen = path.nr, 0) ?:
   503			  copy_to_user_errcode(user_arg, &arg, sizeof(arg)) ?:
   504			  copy_to_user_errcode(&user_arg->buf, path.data, path.nr);
   505	
   506		darray_exit(&path);
   507		return ret;
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
