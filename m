Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDDD17745
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 23:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712620210; cv=none; b=CNC7jC3dnjY1ro5Mu3V4ls9kWmSC7JbSEc1zWc8JzoqJvZ5rY+6dtHgi48Ck2pBPody7PgsUSFOfF7OoOL3QqrH1DgkN98a19BaOVNnlU+9ZzWtdfNLI6PqeCntz7JcmKpT3NaZh2i9jLu1qnzru27xPu5HRARiFC6pFxgSr8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712620210; c=relaxed/simple;
	bh=BVy9IYmDui4BKydaWYyJjAXWalfPM7z/Z+8hILNQJWs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f62Ljuy3W2TbsckdbXq1MsyL650SFsehI7xaJIUA7ah7+jfXVpiDvtVVm/JWhz3Qh/uSo8KTWCWLEBr0cOBwSy3l3dvbsC6HSw4yRTDLHIFKNE0/+vQ+Ve81E00w/i8+iGgWVrVa1lueHVzEHLNMNO/mJwz0/XBlRrb26CdEpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COE77tYr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COE77tYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712620208; x=1744156208;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BVy9IYmDui4BKydaWYyJjAXWalfPM7z/Z+8hILNQJWs=;
  b=COE77tYr9aRBNDgFgnYhXT33/vm3lbuetWfe5Hm41tWOR39XZIoz0lig
   Af4PqC92gCJDBGPKo4e3HRUWgI70bngImV3IOQm45h146tHze55fN/n/1
   lkccyASHHyJ3eAhJ6XEE5PC2yj0LOd6xANwnFO3JmYX/2pLe2jUGKaDrg
   O5Zr5AWJ1Juq1IlTsIx2p2heB4hId6AmMfznnXTBuStR1r1hLz17r+NU/
   UxUfUwGhxOMxZTA7bH37IHfi7EEMBbUnMiFgeiTYQ06t9q/k9fVDnzL1E
   m+dhOjwgYzoWB0aRzz6/MiNV04kFyR0sowA3pGFzXHe9Hc3dkDpUc/0xn
   w==;
X-CSE-ConnectionGUID: fKVxGYZES4SCF0NXxaErRQ==
X-CSE-MsgGUID: 6fJlBcexRmuzTeB8FSs+bQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25365767"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25365767"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 16:50:07 -0700
X-CSE-ConnectionGUID: 6TomZ7ODRq+Q+3MnAvp+gQ==
X-CSE-MsgGUID: 0VQ0MDJeRLizKOCZv2KpSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24674848"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2024 16:50:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtykW-0005Ym-0V
	for oe-kbuild-all@lists.linux.dev;
	Mon, 08 Apr 2024 23:50:04 +0000
Date: Tue, 9 Apr 2024 07:49:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 290/1172] fs/crypto/policy.c:270:13:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202404090707.riELX8Fb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common 4.19/android_s
head:   71b63f21a8292ca960a4c363d69d5e95c0265597
commit: 73ce50dc2defcca646627630597dfe32bb8d3fdf [290/1172] fscrypt: v2 encryption policy support
config: m68k-randconfig-r123-20240406 (https://download.01.org/0day-ci/archive/20240409/202404090707.riELX8Fb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090707.riELX8Fb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090707.riELX8Fb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/policy.c:270:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *__gu_ptr @@     got unsigned char const [noderef] [usertype] <asn:1> * @@
   fs/crypto/policy.c:270:13: sparse:     expected void const *__gu_ptr
   fs/crypto/policy.c:270:13: sparse:     got unsigned char const [noderef] [usertype] <asn:1> *
   fs/crypto/policy.c:25: warning: Function parameter or member 'policy1' not described in 'fscrypt_policies_equal'
   fs/crypto/policy.c:25: warning: Function parameter or member 'policy2' not described in 'fscrypt_policies_equal'
   fs/crypto/policy.c:44: warning: Function parameter or member 'policy_u' not described in 'fscrypt_supported_policy'
   fs/crypto/policy.c:44: warning: Function parameter or member 'inode' not described in 'fscrypt_supported_policy'
   fs/crypto/policy.c:109: warning: Function parameter or member 'ctx_u' not described in 'fscrypt_new_context_from_policy'
   fs/crypto/policy.c:109: warning: Function parameter or member 'policy_u' not described in 'fscrypt_new_context_from_policy'
   fs/crypto/policy.c:163: warning: Function parameter or member 'policy_u' not described in 'fscrypt_policy_from_context'
   fs/crypto/policy.c:163: warning: Function parameter or member 'ctx_u' not described in 'fscrypt_policy_from_context'
   fs/crypto/policy.c:163: warning: Function parameter or member 'ctx_size' not described in 'fscrypt_policy_from_context'

vim +270 fs/crypto/policy.c

   260	
   261	int fscrypt_ioctl_set_policy(struct file *filp, const void __user *arg)
   262	{
   263		union fscrypt_policy policy;
   264		union fscrypt_policy existing_policy;
   265		struct inode *inode = file_inode(filp);
   266		u8 version;
   267		int size;
   268		int ret;
   269	
 > 270		if (get_user(policy.version, (const u8 __user *)arg))
   271			return -EFAULT;
   272	
   273		size = fscrypt_policy_size(&policy);
   274		if (size <= 0)
   275			return -EINVAL;
   276	
   277		/*
   278		 * We should just copy the remaining 'size - 1' bytes here, but a
   279		 * bizarre bug in gcc 7 and earlier (fixed by gcc r255731) causes gcc to
   280		 * think that size can be 0 here (despite the check above!) *and* that
   281		 * it's a compile-time constant.  Thus it would think copy_from_user()
   282		 * is passed compile-time constant ULONG_MAX, causing the compile-time
   283		 * buffer overflow check to fail, breaking the build. This only occurred
   284		 * when building an i386 kernel with -Os and branch profiling enabled.
   285		 *
   286		 * Work around it by just copying the first byte again...
   287		 */
   288		version = policy.version;
   289		if (copy_from_user(&policy, arg, size))
   290			return -EFAULT;
   291		policy.version = version;
   292	
   293		if (!inode_owner_or_capable(inode))
   294			return -EACCES;
   295	
   296		ret = mnt_want_write_file(filp);
   297		if (ret)
   298			return ret;
   299	
   300		inode_lock(inode);
   301	
   302		ret = fscrypt_get_policy(inode, &existing_policy);
   303		if (ret == -ENODATA) {
   304			if (!S_ISDIR(inode->i_mode))
   305				ret = -ENOTDIR;
   306			else if (IS_DEADDIR(inode))
   307				ret = -ENOENT;
   308			else if (!inode->i_sb->s_cop->empty_dir(inode))
   309				ret = -ENOTEMPTY;
   310			else
   311				ret = set_encryption_policy(inode, &policy);
   312		} else if (ret == -EINVAL ||
   313			   (ret == 0 && !fscrypt_policies_equal(&policy,
   314								&existing_policy))) {
   315			/* The file already uses a different encryption policy. */
   316			ret = -EEXIST;
   317		}
   318	
   319		inode_unlock(inode);
   320	
   321		mnt_drop_write_file(filp);
   322		return ret;
   323	}
   324	EXPORT_SYMBOL(fscrypt_ioctl_set_policy);
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
