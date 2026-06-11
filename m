Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFA5380FFA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 23:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781221984; cv=none; b=ihgURej3xnad82Tpe/DFBlTNCKCdNIxrwVe7KvEbChdZ1WBjxMBWkCMvp/T8PHVVajxutQB/BBrQGfApzikveaRkhEylx2On4ypIsqu5vtHC4R9+Ds/kbT5U2medccqWufRo8ZrddEOhF0Q2od/QbkLCokAVZMij5GvcZC6iIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781221984; c=relaxed/simple;
	bh=9OEJdbOe3szU7H6NNfNWgjYLOWtN0GIUcSse/T8Zo/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW7Ep4ry+5udtJ+3f8OhjQxvQ2HpQL/6VIVEbrmxvYbMlHOygTMcXOdwf1B5lC1P9hey4bBLK/pQOGRBqYxv3K6JG6bo4wgd1/hAOLlgcLBBTS/NJgFGu1OdJApRs50K9RsX5j4YuOuppeWDxN/UBEunR5oHh9YlenU5H9OLg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIAoN8tc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIAoN8tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781221982; x=1812757982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9OEJdbOe3szU7H6NNfNWgjYLOWtN0GIUcSse/T8Zo/M=;
  b=hIAoN8tcohnHsSjuW6xIbwmsir7Ng72QlXVYWTzPWZCxx/PnDPuDAbTG
   xnb3ypSV+MNB2B+XuzIohCHsSLnmxMSzJvJ7NOXsW+RTEfiRuTGQYSRJy
   pvP49YLEE2oJVR5DMthjCS3Bj8/9xBdinSaCqJlBkbOmTQwsrU+zAXMNo
   z3+ug3gsUhR0xKCR+TuTnN8XavOGB/Ajd1myju75EmPu3T6PtQI4DvPKD
   WNR04aeVDubebI6yza9TziJrLza/hi0z/BTEvr5rKYuy/14qLoeVOetCv
   ry6zydJczMm260lccaEs0QHzpk5ddD49DiWbCdmzf+EhWeIuACrTWb8aT
   g==;
X-CSE-ConnectionGUID: aDLzh0/yTkOoedheDpAPdg==
X-CSE-MsgGUID: hVb+LwcvQr+MBGWQqBSwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81186189"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81186189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:53:02 -0700
X-CSE-ConnectionGUID: 7A088UPoRuS9SyY7bcYF+w==
X-CSE-MsgGUID: P3T+90fGR0euWCEAWPYoGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="243714785"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2026 16:53:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXpCk-00000000O1g-2x4W;
	Thu, 11 Jun 2026 23:52:58 +0000
Date: Fri, 12 Jun 2026 07:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Yeo <alexyeo362@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed
 mode for newer models
Message-ID: <202606120736.VmZFcjrX-lkp@intel.com>
References: <20260610031756.546459-1-alexyeo362@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610031756.546459-1-alexyeo362@gmail.com>

Hi Alex,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.1-rc7 next-20260610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Yeo/platform-x86-panasonic-laptop-add-fan-speed-mode-for-newer-models/20260610-112852
base:   linus/master
patch link:    https://lore.kernel.org/r/20260610031756.546459-1-alexyeo362%40gmail.com
patch subject: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed mode for newer models
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606120736.VmZFcjrX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120736.VmZFcjrX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120736.VmZFcjrX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/panasonic-laptop.c: In function 'check_fan_mode_present':
>> drivers/platform/x86/panasonic-laptop.c:518:9: error: 'status' undeclared (first use in this function); did you mean 'kstatfs'?
     518 |         status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
         |         ^~~~~~
         |         kstatfs
   drivers/platform/x86/panasonic-laptop.c:518:9: note: each undeclared identifier is reported only once for each function it appears in


vim +518 drivers/platform/x86/panasonic-laptop.c

   512	
   513	static acpi_status check_fan_mode_present(void)
   514	{
   515		acpi_handle handle;
   516	
   517		/* check if read (CEFM) and set (SEFM) are available */
 > 518		status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
   519		if (ACPI_FAILURE(status))
   520			return -ENOENT;
   521		status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
   522		if (ACPI_FAILURE(status))
   523			return -ENOENT;
   524	
   525		return 0;
   526	}
   527	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
