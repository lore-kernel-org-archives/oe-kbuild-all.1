Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD7252900
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760807973; cv=none; b=YsWmmhApzFhbEZ+ljE3/P93YHXiLuqV1fgVhIVqOuzlo4R5trT5t2tkm4OfJIRqcyvg88wZVZLcp8h3fP24KnB2raq/C5ElD0FHMrOEGeye0EmirOum+bVZno0iOlmniKU8PYHF44r2za+Ti/zLK0DU8CdWVS55Nm3KhDdWPXrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760807973; c=relaxed/simple;
	bh=qsJderRx1r4Wwa9z+rV9IJC6khdiXfaLK066gjLXkhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FAu5VMmYO4oZSWSI+uKpCuK/oG8g022dVgXrXhmD1evJknLk4HXbXNmE1VQQKKbDlnaBOk9heKK5muw5CtgVrTASLc1lxYNHrEfAX6/maAufxn/Wa81XSVIYQlACwrv6/IDcuVemi2JXSieDF+RS/taNBIjdhQ0WPuUE3JA7h9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzUcRbtL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzUcRbtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760807971; x=1792343971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsJderRx1r4Wwa9z+rV9IJC6khdiXfaLK066gjLXkhs=;
  b=WzUcRbtLL4zcq5EDmc04m+zrvxQz//2n2oGxDzpRyfluNycUveMaJ8bE
   R0H/5SOLBi8Jxi2i3FvHfwz8Ske2QHeRe+/CD5m9RIDFwyqv6rzIPSGL4
   1U6xyrJ9vL/iDUfNXNV23SPLaG1UxZYXFXZj9cNy39wPmfGbVM+lvnKuo
   TI6dhevwhTM2wmCYYTn/fOFdpopmorCsZ8y9QI//i8S3XguhX0ToGdvtz
   6MEd2Wbk3sdRGq6b1gkqy1q73uEd7/xIQT5l2CdX15W6LyYbRTk28Cno+
   r8fogHCQYZfxEP4qUtGI3pN0viKzJy30UPRBFnfy9sjNYLs67dmXHAFtL
   w==;
X-CSE-ConnectionGUID: hr047qZ8TjCUofTrxGViSA==
X-CSE-MsgGUID: rIx6SaMETKCDg/adXjtPqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63039042"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="63039042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 10:19:30 -0700
X-CSE-ConnectionGUID: QRebgIptRpmg+17SeL6Cog==
X-CSE-MsgGUID: tXcMJis8T5KtUEwMrM4zIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="206699310"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2025 10:19:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAAaV-0008S1-1W;
	Sat, 18 Oct 2025 17:19:27 +0000
Date: Sun, 19 Oct 2025 01:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:balloon 2/23] drivers/misc/vmw_balloon.c:1857:9:
 error: 'b' undeclared; did you mean 'mb'?
Message-ID: <202510190152.ddbXDK88-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux balloon
head:   7eef08e97c0bed3ecf03a02e2283be82b9bce389
commit: 754bcc13125987809bf134f12b7d8db0bf74934c [2/23] vmw_balloon: remove vmballoon_compaction_init()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251019/202510190152.ddbXDK88-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190152.ddbXDK88-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190152.ddbXDK88-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/vmw_balloon.c: In function 'vmballoon_init':
>> drivers/misc/vmw_balloon.c:1857:9: error: 'b' undeclared (first use in this function); did you mean 'mb'?
    1857 |         b->b_dev_info.migratepage = vmballoon_migratepage;
         |         ^
         |         mb
   drivers/misc/vmw_balloon.c:1857:9: note: each undeclared identifier is reported only once for each function it appears in


vim +1857 drivers/misc/vmw_balloon.c

  1837	
  1838	static int __init vmballoon_init(void)
  1839	{
  1840		int error;
  1841	
  1842		/*
  1843		 * Check if we are running on VMware's hypervisor and bail out
  1844		 * if we are not.
  1845		 */
  1846		if (x86_hyper_type != X86_HYPER_VMWARE)
  1847			return -ENODEV;
  1848	
  1849		INIT_DELAYED_WORK(&balloon.dwork, vmballoon_work);
  1850	
  1851		error = vmballoon_register_shrinker(&balloon);
  1852		if (error)
  1853			return error;
  1854	
  1855		balloon_devinfo_init(&balloon.b_dev_info);
  1856	#ifdef CONFIG_BALLOON_COMPACTION
> 1857		b->b_dev_info.migratepage = vmballoon_migratepage;
  1858	#endif /* CONFIG_BALLOON_COMPACTION */
  1859	
  1860		INIT_LIST_HEAD(&balloon.huge_pages);
  1861		spin_lock_init(&balloon.comm_lock);
  1862		init_rwsem(&balloon.conf_sem);
  1863		balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
  1864		balloon.batch_page = NULL;
  1865		balloon.page = NULL;
  1866		balloon.reset_required = true;
  1867	
  1868		queue_delayed_work(system_freezable_wq, &balloon.dwork, 0);
  1869	
  1870		vmballoon_debugfs_init(&balloon);
  1871	
  1872		return 0;
  1873	}
  1874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
