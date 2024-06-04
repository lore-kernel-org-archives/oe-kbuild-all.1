Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326D14900E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717515091; cv=none; b=idCuArgscFo2u58TQP5VfiBgQpVPB8nNdLeUGd0L8yyj2X5CYOMfu676j6YKKarp7BrjL56Qx8wfSyFUYDerBZDGJpJHeJJ1aJBX4beTNyOFfQnsWka34kk2h60lidFOtF1RP4WwpazMxuOemlUeloDlA1JLEUW7XFttowb0L/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717515091; c=relaxed/simple;
	bh=QfvZxN9E/dAHNdF0wi0GiUgkYucNkGeV7Pl6uKyZ9y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFIEgb2qZKduSXa2c/1QQFy/oVhditbZvD38r5r1QraSVvJ2mQoP3pCqRhJ7Y86xfX1Oeg0BVyEZ6C4ev+vWefuG4aQbhSX8aCsIwMeSOLj4s8SxkCPkX9/c1t2cqj+IOZNEB1S+NsBmo/iTcXLYIlvaQZCTtkGUVq0du1jcrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwBsIA2g; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwBsIA2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717515090; x=1749051090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QfvZxN9E/dAHNdF0wi0GiUgkYucNkGeV7Pl6uKyZ9y8=;
  b=NwBsIA2gLsvoJvvhYhPnSgJUWzgBU/WQpbmzYXpfzSgq8iS/SwNTDOtN
   1AcRkmFa/MYmXQ+szMYm5s0YSNH9kCe//X5RhULIXbDC8EhHE0qoRdzbF
   7K0sANjVAwLoRLvlOCVG4FF/M0uthPrvfdZWsgAchQMBT2zbTQ2kMnHJ3
   wRUfw/ueS9OAnpkWrOjnOkTGUY2AgZO9ehBciSdeoyD6DFcVkUc3r5G5J
   NNMHvGc8vGeOpaOShQx1f9o6aY5dgg7E59qis4FuYjGKa2jOt/GUPCBBx
   wowd2Cuqdm6c8i4kUP8vbvz8VJ35Enn/AwQAs6wu6rjZtzjPKl2AhpDED
   w==;
X-CSE-ConnectionGUID: JECfgs2YQNOOzu5oRh9K0Q==
X-CSE-MsgGUID: IWsvSBaIRnGhO7TzsRV8tA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14226262"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="14226262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:31:29 -0700
X-CSE-ConnectionGUID: +qnVTt3JSay+MoX56aYJLA==
X-CSE-MsgGUID: SPVNlkW/Txa+8ilV6bbfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="37279261"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2024 08:31:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEW87-000NQR-1N;
	Tue, 04 Jun 2024 15:31:23 +0000
Date: Tue, 4 Jun 2024 23:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Li Lingfeng <lilingfeng@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] fs: pass sb_flags to submount
Message-ID: <202406042212.4WJ043p7-lkp@intel.com>
References: <20240604112636.236517-2-lilingfeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604112636.236517-2-lilingfeng@huaweicloud.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on cifs/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus mszeredi-fuse/for-next linus/master v6.10-rc2 next-20240604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Lingfeng/fs-pass-sb_flags-to-submount/20240604-192813
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240604112636.236517-2-lilingfeng%40huaweicloud.com
patch subject: [PATCH RFC 1/2] fs: pass sb_flags to submount
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240604/202406042212.4WJ043p7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406042212.4WJ043p7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406042212.4WJ043p7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs_context.c:357: warning: Function parameter or struct member 'sb_flags' not described in 'fs_context_for_submount'


vim +357 fs/fs_context.c

8d0347f6c3a9d4 David Howells 2018-11-04  345  
d80a8f1b58c2bc David Howells 2023-08-08  346  /**
d80a8f1b58c2bc David Howells 2023-08-08  347   * fs_context_for_submount: allocate a new fs_context for a submount
d80a8f1b58c2bc David Howells 2023-08-08  348   * @type: file_system_type of the new context
d80a8f1b58c2bc David Howells 2023-08-08  349   * @reference: reference dentry from which to copy relevant info
d80a8f1b58c2bc David Howells 2023-08-08  350   *
d80a8f1b58c2bc David Howells 2023-08-08  351   * Allocate a new fs_context suitable for a submount. This also ensures that
d80a8f1b58c2bc David Howells 2023-08-08  352   * the fc->security object is inherited from @reference (if needed).
d80a8f1b58c2bc David Howells 2023-08-08  353   */
e1a91586d5da6f Al Viro       2018-12-23  354  struct fs_context *fs_context_for_submount(struct file_system_type *type,
cd20f5d1813d58 Li Lingfeng   2024-06-04  355  					   struct dentry *reference,
cd20f5d1813d58 Li Lingfeng   2024-06-04  356  					   unsigned int sb_flags)
e1a91586d5da6f Al Viro       2018-12-23 @357  {
d80a8f1b58c2bc David Howells 2023-08-08  358  	struct fs_context *fc;
d80a8f1b58c2bc David Howells 2023-08-08  359  	int ret;
d80a8f1b58c2bc David Howells 2023-08-08  360  
cd20f5d1813d58 Li Lingfeng   2024-06-04  361  	fc = alloc_fs_context(type, reference, sb_flags, 0, FS_CONTEXT_FOR_SUBMOUNT);
d80a8f1b58c2bc David Howells 2023-08-08  362  	if (IS_ERR(fc))
d80a8f1b58c2bc David Howells 2023-08-08  363  		return fc;
d80a8f1b58c2bc David Howells 2023-08-08  364  
d80a8f1b58c2bc David Howells 2023-08-08  365  	ret = security_fs_context_submount(fc, reference->d_sb);
d80a8f1b58c2bc David Howells 2023-08-08  366  	if (ret) {
d80a8f1b58c2bc David Howells 2023-08-08  367  		put_fs_context(fc);
d80a8f1b58c2bc David Howells 2023-08-08  368  		return ERR_PTR(ret);
d80a8f1b58c2bc David Howells 2023-08-08  369  	}
d80a8f1b58c2bc David Howells 2023-08-08  370  
d80a8f1b58c2bc David Howells 2023-08-08  371  	return fc;
e1a91586d5da6f Al Viro       2018-12-23  372  }
e1a91586d5da6f Al Viro       2018-12-23  373  EXPORT_SYMBOL(fs_context_for_submount);
e1a91586d5da6f Al Viro       2018-12-23  374  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
