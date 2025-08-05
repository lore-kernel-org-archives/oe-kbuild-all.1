Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4DA1D7E5B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396315; cv=none; b=jonEpAyOsQ4TD6MVwxvY2er+0PqaVvTswNGYVjAGxRfNR4wZ8Iaw9Au66tP2Z50/CQX2PlLpg9LHC+6AnGXLhl9iE/4w6f5OZ8RuC9GXdDyvwENO0c8PlJoeTihhaIGQ4qqTA7mIgSXhXqMDCBV3ZND7mY0gz+1b7vs9ij48nao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396315; c=relaxed/simple;
	bh=dELJosJbBGo6dq8BurzaE+9EAPJEWdIKKinsY+7CpVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kF9EkqJLxMGXbEdynmXFxd9voArCK3CTjesjdBIAp1pWHvhc+DX9XcjzzWuX3/yjNlvuu1o4bsC4T86aY3kRrj1y2dEJ/0cw5YGXOcresDQrzzJ3JUxRdI1NFVDlPqEiCMY5sClMPUNrymNllMoEPToE79wnhoE5OWUOO/Cg/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMawQdnu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMawQdnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754396313; x=1785932313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dELJosJbBGo6dq8BurzaE+9EAPJEWdIKKinsY+7CpVg=;
  b=eMawQdnupXKA85LlLJe9TsF5OIKz2fYRLeQQcbIqllB6vzT/LSYYjGEq
   IvAp9Eg+GLwTnpzQfHuhoVJBKmdI99VcDreLH8Bv2dqdY0T8JzBswMWIy
   cV6W+KPHmyYCkmrdIgWBg8jb52lv4HvPwtABMHHUDJuH6NRbvtbMsVlh4
   9pJajofQFaq/E17m+V/z6Y6IORwBjVZ790n6YQ3zg+tgxeTtuloOkpsSx
   DSqLruDRa3CJTEJE7X8z/Bh2wNpWyqlJWmBAQzBOGxTxDpkECCB0+KegI
   JdMO+/e6WZV4bM/lV33VNz42OiLAMqufRuitO3CmuPXZkOl+3GPQ1oiKk
   A==;
X-CSE-ConnectionGUID: zYa3IV79T1CjU+z7wpFtZQ==
X-CSE-MsgGUID: zxyscmOGQeuyDaBCwEbh8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56769985"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56769985"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 05:18:33 -0700
X-CSE-ConnectionGUID: WZz206foS5OHCb4EzTov1Q==
X-CSE-MsgGUID: CuunI+cjTcKZxM/QCbsbzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163733142"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 05:18:32 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujGcf-000203-1H;
	Tue, 05 Aug 2025 12:18:29 +0000
Date: Tue, 5 Aug 2025 14:18:20 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 arch/x86/kernel/cpu/bugs.c:614:6: warning: no previous prototype for
 'unpriv_ebpf_notify'
Message-ID: <202508051402.StwtRrWO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c7bbbad8e4b8331c0db8c827bcd03a54741d7fa
commit: 8fbdf654b00fdf629be3b94c4f64182b9522774a [1743/1743] x86/speculation: Include unprivileged eBPF status in Spectre v2 mitigation reporting
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508051402.StwtRrWO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508051402.StwtRrWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508051402.StwtRrWO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/bugs.c:614:6: warning: no previous prototype for 'unpriv_ebpf_notify' [-Wmissing-prototypes]
     614 | void unpriv_ebpf_notify(int new_state)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/bugs.c:1797:9: warning: no previous prototype for 'cpu_show_srbds' [-Wmissing-prototypes]
    1797 | ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf)
         |         ^~~~~~~~~~~~~~


vim +/unpriv_ebpf_notify +614 arch/x86/kernel/cpu/bugs.c

   612	
   613	#ifdef CONFIG_BPF_SYSCALL
 > 614	void unpriv_ebpf_notify(int new_state)
   615	{
   616		if (spectre_v2_enabled == SPECTRE_V2_EIBRS && !new_state)
   617			pr_err(SPECTRE_V2_EIBRS_EBPF_MSG);
   618	}
   619	#endif
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
