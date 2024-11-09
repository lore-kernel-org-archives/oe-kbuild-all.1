Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9F1185B62
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 16:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731169434; cv=none; b=UbxZlQm9SuxOxT393s8pOU3rISBcbNYnActIG5ehRrzH8PuZdBGIGRi8PfZnLjm/Al6Ad5YAB22FXHZ4zcjmGP8edONa7YHK6owWOvtXEgsIL2gCUywrOGzJvJiJGPhWgOfX1di1GB/T17KD2pjJVgimoxRCL+prN9FJGKpnKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731169434; c=relaxed/simple;
	bh=A+m8GIFANXDQQQDd1cLeKflnz/dPkpPihto703Rt8hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SoEwJfxUuNyNNGRDkwCdq3Mr0MDdztfJv6FUizvpiKAH2iRwfLvSIeHZdv2tlskeWnTF02Z2rEhlc6ua4GCtB0Udjp6rohZ7WSwMWTZIqMSTiONrOIDDyJpcv+G380MCsDIusxXS3gewYI6ZhaCrRPUBcbcxMS8tpYO2MI6MT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wuv960Gy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wuv960Gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731169431; x=1762705431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A+m8GIFANXDQQQDd1cLeKflnz/dPkpPihto703Rt8hw=;
  b=Wuv960GyFUBYWplxnBgAaaJj2r16JLtq/RFXwxLUJ124ZtlWBTnv4NuN
   bJsA1JmTOsSAecIJz8zZ80C0bD9wYIQPUebCeMt29OGLh3UPNrU6cvDyk
   Zz8EA1nD1+xv1T+HiRy4bFj1EY38+GI8StSu164JI3wLxjbwTim/u+bRN
   9+ATlim/6RrSda13JVqSD2wDXqbUE3TYM/RCyzQPw4zEXmcmT8pAAgCnS
   vPjbx1T1HRkONjBXemGtfiuUCuFRAqh7glAoyDlp7NW8DDNpVYcDP45L4
   cTdYEKSFHn+n9+oo39XYmyFWPLlMfObzRbr2gULcVICByVdY3amu76K7B
   A==;
X-CSE-ConnectionGUID: eKptyPKIRr2T2VXk5WLMew==
X-CSE-MsgGUID: DYotEZ96SEOZR82Ig5dolg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30803158"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30803158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 08:23:51 -0800
X-CSE-ConnectionGUID: 6c5Ea/O2R/CMeDWDO1+ckQ==
X-CSE-MsgGUID: f9u29lPPSEWCSN2mNaU15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="85774684"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2024 08:23:50 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9oFY-000sSc-12;
	Sat, 09 Nov 2024 16:23:48 +0000
Date: Sun, 10 Nov 2024 00:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 14751/24136]
 drivers/gpu/arm/mali/mali_kbase_core_linux.c:351:7: error: implicit
 declaration of function 'iterate_fd' is invalid in C99
Message-ID: <202411100022.0hHUvFRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   213f014f54af1757a6058da8cb226e8168dc9ec5
commit: 87f5682a1e2b9a6c7cccba95d0c1e0bf47c43807 [14751/24136] CHROMIUM: gpu: mali: Apply r44p1 EAC release
config: arm64-randconfig-r054-20241109 (https://download.01.org/0day-ci/archive/20241110/202411100022.0hHUvFRt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100022.0hHUvFRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100022.0hHUvFRt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/arm/mali/mali_kbase_core_linux.c:351:7: error: implicit declaration of function 'iterate_fd' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (iterate_fd(current->files, 0, check_mali_file_open, kfile->filp)) {
                       ^
   drivers/gpu/arm/mali/mali_kbase_core_linux.c:351:7: note: did you mean 'iterate_dir'?
   include/linux/fs.h:3092:12: note: 'iterate_dir' declared here
   extern int iterate_dir(struct file *, struct dir_context *);
              ^
   1 error generated.


vim +/iterate_fd +351 drivers/gpu/arm/mali/mali_kbase_core_linux.c

   322	
   323	/**
   324	 * kbase_file_inc_fops_count_if_allowed - Increment the kfile::fops_count value if the file
   325	 *                                        operation is allowed for the current process.
   326	 *
   327	 * @kfile: Pointer to the object representing the /dev/malixx device file instance.
   328	 *
   329	 * The function shall be called at the beginning of certain file operation methods
   330	 * implemented for @kbase_fops, like ioctl, poll, read and mmap.
   331	 *
   332	 * kbase_file_dec_fops_count() shall be called if the increment was done.
   333	 *
   334	 * Return: true if the increment was done otherwise false.
   335	 *
   336	 * Note: This function shall always be called in Userspace context.
   337	 */
   338	static bool kbase_file_inc_fops_count_if_allowed(struct kbase_file *const kfile)
   339	{
   340		bool count_incremented = false;
   341	
   342		/* Disallow file operations from the other process that shares the instance
   343		 * of /dev/malixx file i.e. 'kfile' or disallow file operations if parent
   344		 * process has closed the file instance.
   345		 */
   346		spin_lock(&kfile->lock);
   347		if (likely(kfile->owner == current->files)) {
   348			kfile->fops_count++;
   349			count_incremented = true;
   350		} else if (!kfile->fops_count && atomic_read(&kfile->setup_state) == KBASE_FILE_NEED_VSN) {
 > 351			if (iterate_fd(current->files, 0, check_mali_file_open, kfile->filp)) {
   352				dev_dbg(kfile->kbdev->dev, "Mali file ownership transferred to %d_%d",
   353					current->tgid, current->pid);
   354				kfile->owner = current->files;
   355				kfile->fops_count++;
   356				count_incremented = true;
   357			} else
   358				dev_info(kfile->kbdev->dev, "Mali file already closed by %d_%d",
   359					 current->tgid, current->pid);
   360		}
   361		spin_unlock(&kfile->lock);
   362	
   363		return count_incremented;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
