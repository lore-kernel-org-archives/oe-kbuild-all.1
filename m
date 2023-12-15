Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726854184B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3Vx4VyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702669461; x=1734205461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXFyAOxM/hBgCWYyyk2AlFlLZRGFNzdB8lf0rys90RU=;
  b=R3Vx4VyGUuNVX2hiHDc9AdgRBcQkUAcoNY2Coagcy4/jncK+A/rb1oe9
   YSTiYxDMkghztXsWNUPduaQogE9PliQQsmNbW2vrQvPRH9TJ2CIgeAFAO
   7l4UcGinaJUqhaSAI0dN2Ce8rQzeHsMMt1rymuPbvw64ZRQOYOXHaVH1e
   ewVMyu9/VhrIdjUQHXiXT1xwJbrJv/7aN6jlfwgVb68oQ0pDQ2rdzlHYc
   Q5bn65nXKucGJxIKG4/nQ6Y5d68F3iH+J/lj0vn/XkQk2zM1hGRNTpjt/
   MEDJ42G/GKwlccMueeWtcYvcrMfPcf1kFkZdjP1Y8oTqxWOZpzXsmY02z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2142431"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="2142431"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 11:44:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="1106226123"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="1106226123"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Dec 2023 11:44:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEE6b-0000fm-0u;
	Fri, 15 Dec 2023 19:44:17 +0000
Date: Sat, 16 Dec 2023 03:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 9/9]
 drivers/gpu/arm/mali/mali_kbase_core_linux.c:350:21: error: implicit
 declaration of function 'iterate_fd'; did you mean 'iterate_dir'?
Message-ID: <202312160306.rIIxgw0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   cd7b2e5a0bcfaf553d21c4a8efc3bed42f174d36
commit: dff70587a6dc864468f1d3ce0457856748fdb044 [9/9] CHROMIUM: gpu: mali: Uprev to r44p1 EAC release
config: arm64-randconfig-r052-20231216 (https://download.01.org/0day-ci/archive/20231216/202312160306.rIIxgw0u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160306.rIIxgw0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160306.rIIxgw0u-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/arm/mali/mali_kbase_core_linux.c: In function 'kbase_file_inc_fops_count_if_allowed':
>> drivers/gpu/arm/mali/mali_kbase_core_linux.c:350:21: error: implicit declaration of function 'iterate_fd'; did you mean 'iterate_dir'? [-Werror=implicit-function-declaration]
     350 |                 if (iterate_fd(current->files, 0, check_mali_file_open, kfile->filp)) {
         |                     ^~~~~~~~~~
         |                     iterate_dir
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [y]:
   - MALI [=y] && HAS_IOMEM [=y] && ARM64 [=y] && ARM64_PAGE_SHIFT [=12]=12 && !MALI_MIDGARD && MALI_MIDGARD!=m


vim +350 drivers/gpu/arm/mali/mali_kbase_core_linux.c

   321	
   322	/**
   323	 * kbase_file_inc_fops_count_if_allowed - Increment the kfile::fops_count value if the file
   324	 *                                        operation is allowed for the current process.
   325	 *
   326	 * @kfile: Pointer to the object representing the /dev/malixx device file instance.
   327	 *
   328	 * The function shall be called at the beginning of certain file operation methods
   329	 * implemented for @kbase_fops, like ioctl, poll, read and mmap.
   330	 *
   331	 * kbase_file_dec_fops_count() shall be called if the increment was done.
   332	 *
   333	 * Return: true if the increment was done otherwise false.
   334	 *
   335	 * Note: This function shall always be called in Userspace context.
   336	 */
   337	static bool kbase_file_inc_fops_count_if_allowed(struct kbase_file *const kfile)
   338	{
   339		bool count_incremented = false;
   340	
   341		/* Disallow file operations from the other process that shares the instance
   342		 * of /dev/malixx file i.e. 'kfile' or disallow file operations if parent
   343		 * process has closed the file instance.
   344		 */
   345		spin_lock(&kfile->lock);
   346		if (likely(kfile->owner == current->files)) {
   347			kfile->fops_count++;
   348			count_incremented = true;
   349		} else if (!kfile->fops_count && atomic_read(&kfile->setup_state) == KBASE_FILE_NEED_VSN) {
 > 350			if (iterate_fd(current->files, 0, check_mali_file_open, kfile->filp)) {
   351				dev_dbg(kfile->kbdev->dev, "Mali file ownership transferred to %d_%d",
   352					current->tgid, current->pid);
   353				kfile->owner = current->files;
   354				kfile->fops_count++;
   355				count_incremented = true;
   356			} else
   357				dev_info(kfile->kbdev->dev, "Mali file already closed by %d_%d",
   358					 current->tgid, current->pid);
   359		}
   360		spin_unlock(&kfile->lock);
   361	
   362		return count_incremented;
   363	}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
