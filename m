Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0140C03
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939355; cv=none; b=Z4Bl9izHM6/x3Ixp0DovV0CrEw2RBS1QTqQyW0GiYF+ro8PP9hAox1qp3cs62PBe+RHr/A1/oieCQ+1fNSd5G0fsuWSHfGAZAf74KHPdGxgionu9NxCFWNdyK60B7PHIDp8jJhUXnEmRGFAq479dDcVCkAKVBUd/+Aj7y1W5BDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939355; c=relaxed/simple;
	bh=CD7Fvz/x4/jSFkDHGazGmimGHodq1DcirqYH2k5bFQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=keM2sD1BWmY6bY8AFAs2ihCrKMnOYSG8DrGzcPyboynb0i8NlGpcZ05RRLuYF+XcwfNBMaA5ZLARy/YqeGymSEVSztousPvsCNAIdadZeBeL/4MPtQ8GtipipshImYn7ij2TE2rpmICgxyVZmIiVsm2W2SS/NYNNxTAK/rLw1Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO+WhJLt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO+WhJLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745939353; x=1777475353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CD7Fvz/x4/jSFkDHGazGmimGHodq1DcirqYH2k5bFQ0=;
  b=UO+WhJLtMB3r65fn9/4ytRUgXBK/V43DvCQ1GHHB0lMj24vlI7+oUyBx
   MpsfEAKsFJdxt+tyUPzJpJHnK0cYonrnKrvgeQEnkTQQOLCTRa2ao7ggR
   bsdL6K0wmKHSItTS3OtKuPVknALl5TswL3iA7bYV1aGudmK/e2NYwjH/B
   DMfwCL5OoGDQ3k7zdFFF0bGiMAcs7XKm8DfUc896CXlKLyj/HiRbGdHgK
   NQbgGKYlJLVY3yW5i+QIfMUnarHeEssAbwXc4VUBS02Zns4vdqWicVK3B
   rPT9kbwPbItzknusdixG61V17qpYo8BeA5ABTYRwHiWJvHhFCkQA6HLhp
   g==;
X-CSE-ConnectionGUID: Le/TEebJQ7iUiCxvY+aRxA==
X-CSE-MsgGUID: 4jEoVDeWR5GBWuWJ4jrjhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="50228909"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="50228909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 08:09:09 -0700
X-CSE-ConnectionGUID: emZtIpu6T8y5lvmvv2MF8Q==
X-CSE-MsgGUID: ULL9Hb3KTzmEJ3E2hKK4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="138834819"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 08:09:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ma1-0000oB-0y;
	Tue, 29 Apr 2025 15:09:05 +0000
Date: Tue, 29 Apr 2025 23:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:reftrack-dbgfs 7/11] lib/ref_tracker.c:373: warning: Excess
 function parameter 'fmt' description in 'ref_tracker_dir_debugfs'
Message-ID: <202504292314.hTb3yOEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git reftrack-dbgfs
head:   1c49f3ad833f720bc692137505882e0fbdabb7e4
commit: 49976a94ff22bbf15bf84f195ef6dbbeba17c7a8 [7/11] ref_tracker: automatically register a file in debugfs for a ref_tracker_dir
config: x86_64-buildonly-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292314.hTb3yOEn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292314.hTb3yOEn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292314.hTb3yOEn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ref_tracker.c:373: warning: Excess function parameter 'fmt' description in 'ref_tracker_dir_debugfs'
>> lib/ref_tracker.c:373: warning: Excess function parameter '...' description in 'ref_tracker_dir_debugfs'


vim +373 lib/ref_tracker.c

   360	
   361	/**
   362	 * ref_tracker_dir_debugfs - create debugfs file for ref_tracker_dir
   363	 * @dir: ref_tracker_dir to be associated with debugfs file
   364	 * @fmt: format string for filename
   365	 * @...: arguments for the format string
   366	 *
   367	 * Call this function to create a debugfs file for your ref_tracker_dir that
   368	 * displays the current refcounts for the object. It will be automatically
   369	 * removed when the ref_tracker_dir exits. The filename must be unique. If
   370	 * the creation fails then the pr_warn will be emitted.
   371	 */
   372	void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)
 > 373	{
   374		char name[NAME_MAX + 1];
   375		int ret;
   376	
   377		/* No-op if already created */
   378		if (!IS_ERR_OR_NULL(dir->dentry))
   379			return;
   380	
   381		ret = snprintf(name, sizeof(name), "%s@%px", dir->class, dir);
   382		name[sizeof(name) - 1] = '\0';
   383	
   384		if (ret < sizeof(name))
   385			dir->dentry = debugfs_create_file(name, S_IFREG | 0400,
   386							  ref_tracker_debug_dir, dir,
   387							  &ref_tracker_debugfs_fops);
   388		else
   389			dir->dentry = ERR_PTR(-ENAMETOOLONG);
   390	
   391		if (IS_ERR(dir->dentry))
   392			pr_warn("ref_tracker: unable to create debugfs file for %s: %pe\n",
   393				name, dir->dentry);
   394	}
   395	EXPORT_SYMBOL(ref_tracker_dir_debugfs);
   396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
