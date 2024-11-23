Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388D27462
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 01:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732324733; cv=none; b=C7xI6OTNrrjuc7WGY1Wa8Kpyqoa/fQj/rWnq1nfHp5fCJ+j1sHdmpY+L1+5mtjR89jIyd9+7YbzyqVnUaQDOv/Q88PIoWPzLJ10K5QyE2GLeT/HQ9SbnH+lasqrE8MYPxmBEb0nFVDkfW/0weGkhTF/Jq+6RlA29kbiwpSkwRgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732324733; c=relaxed/simple;
	bh=b3iDnP47lzTDV1N74evCGHSTx0iTDQ9XDpjlzoMfHwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llh5b9yQVC1O94YLRL686stObJJj4c7BAeYresyguyvdoFZSoTBr151YfB++4a2THnr24XPjyqWmvLtYHh0tku/LoRNTQuna89FeIzOUD7Jn9kSOObTtwKUOV8u90qGIrzUw6lSjFtrN+N0GawOpdsyG5ft87l7AA4Ns384VZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+kHODKw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+kHODKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732324731; x=1763860731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b3iDnP47lzTDV1N74evCGHSTx0iTDQ9XDpjlzoMfHwg=;
  b=B+kHODKwBP4tn8UfBJgkrd3g68r11ocaBtqVEWyxjj8oWvH+R4Bxmpeh
   HLnIyTsFaEzKcKuIbGTd3rN+VzCU7c8NPisHKLWDo//nKWoZbOxlXBLxB
   11/J9j4HVhGOkeyeQSk2rYho2G/jqt8DFgOBAJT7POVRuew4BCuG+tkVx
   pKypTlEkNYFUUAt9G69Yl3X6gHiZicHXj+hP4GgMlWqcpIPmPs6wVxSPO
   Et6bbBZLGEUEKUrn9M0b9edfcOpoFqBF/8prABLTvciiKNvkSEaiVGjLV
   UP1NStMPMzCo0nBiMKh/ZeELDdtJLIBPr19+tQSjj9JW1VYvg0wbqo8+B
   Q==;
X-CSE-ConnectionGUID: Ez81hZmVRuuV1itf9jMdvw==
X-CSE-MsgGUID: 4TQCvKLUTo26lnWdfpIdVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="35350483"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="35350483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 17:18:48 -0800
X-CSE-ConnectionGUID: 0+ozZD/LR1iEtLeUzcb+xA==
X-CSE-MsgGUID: wR4nh5qVRiqZEPkpgfTK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="91161386"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2024 17:18:47 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEenN-0004Kj-0R;
	Sat, 23 Nov 2024 01:18:45 +0000
Date: Sat, 23 Nov 2024 09:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Erin Shepherd <erin.shepherd@e43.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs-6.14.pidfs 2/3] fs/fhandle.c:242:58: sparse:
 sparse: incorrect type in initializer (different modifiers)
Message-ID: <202411230942.zJUPeW2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.14.pidfs
head:   9a4b8de3ca939ccb9585039d2af094e9ac893e9d
commit: f77c0880b484f3273c5b7da0df3aa7b29e1b2f8c [2/3] exportfs: allow fs to disable CAP_DAC_READ_SEARCH check
config: x86_64-randconfig-121-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230942.zJUPeW2G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230942.zJUPeW2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230942.zJUPeW2G-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fhandle.c:242:58: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct export_operations *nop @@     got struct export_operations const *s_export_op @@
   fs/fhandle.c:242:58: sparse:     expected struct export_operations *nop
   fs/fhandle.c:242:58: sparse:     got struct export_operations const *s_export_op

vim +242 fs/fhandle.c

   237	
   238	static inline bool may_decode_fh(struct handle_to_path_ctx *ctx,
   239					 unsigned int o_flags)
   240	{
   241		struct path *root = &ctx->root;
 > 242		struct export_operations *nop = root->mnt->mnt_sb->s_export_op;
   243	
   244		if (nop && nop->flags & EXPORT_OP_UNRESTRICTED_OPEN)
   245			return true;
   246	
   247		if (capable(CAP_DAC_READ_SEARCH))
   248			return true;
   249	
   250		/*
   251		 * Allow relaxed permissions of file handles if the caller has the
   252		 * ability to mount the filesystem or create a bind-mount of the
   253		 * provided @mountdirfd.
   254		 *
   255		 * In both cases the caller may be able to get an unobstructed way to
   256		 * the encoded file handle. If the caller is only able to create a
   257		 * bind-mount we need to verify that there are no locked mounts on top
   258		 * of it that could prevent us from getting to the encoded file.
   259		 *
   260		 * In principle, locked mounts can prevent the caller from mounting the
   261		 * filesystem but that only applies to procfs and sysfs neither of which
   262		 * support decoding file handles.
   263		 *
   264		 * Restrict to O_DIRECTORY to provide a deterministic API that avoids a
   265		 * confusing api in the face of disconnected non-dir dentries.
   266		 *
   267		 * There's only one dentry for each directory inode (VFS rule)...
   268		 */
   269		if (!(o_flags & O_DIRECTORY))
   270			return false;
   271	
   272		if (ns_capable(root->mnt->mnt_sb->s_user_ns, CAP_SYS_ADMIN))
   273			ctx->flags = HANDLE_CHECK_PERMS;
   274		else if (is_mounted(root->mnt) &&
   275			 ns_capable(real_mount(root->mnt)->mnt_ns->user_ns,
   276				    CAP_SYS_ADMIN) &&
   277			 !has_locked_children(real_mount(root->mnt), root->dentry))
   278			ctx->flags = HANDLE_CHECK_PERMS | HANDLE_CHECK_SUBTREE;
   279		else
   280			return false;
   281	
   282		/* Are we able to override DAC permissions? */
   283		if (!ns_capable(current_user_ns(), CAP_DAC_READ_SEARCH))
   284			return false;
   285	
   286		ctx->fh_flags = EXPORT_FH_DIR_ONLY;
   287		return true;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
