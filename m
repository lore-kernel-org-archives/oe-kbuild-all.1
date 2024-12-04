Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720CE1F03ED
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 19:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733342391; cv=none; b=bsDmkSvRcp3rAd3WIIcZY0VAG6LWySpEemmNvWqghCAW/DfJYP5cCIngI0X4wOMqu7Zm1CMXLCj/TnOSUjQxKeaojsmekCuUxRFhPmuaSmiMyLmlrv47Z0/MRqXO5inRBGuGuIz6MhKf794HHppY54kcJp0/hmMdg9L2+WHDYE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733342391; c=relaxed/simple;
	bh=WLfo2o0Y60t1aSJeo3mzNrSNG5aE46mbYXIqulb8WhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URnsRPEL9zapEeCXaXs8sV2bDExBrBsXLc8KD4SBd4HaCRvjaozuQTLKThTkGfQAcBOrPaoRdp1FlhCe70EtfShNPS7zU9KyHPHqWcyFAJxnnKQhZTdoMQhS07QSQQFoe6i8fPSNaFDXkRgF9gWKxUCB5ZE56NkzoVqg5xBTeiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEiYL1sb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEiYL1sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733342389; x=1764878389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLfo2o0Y60t1aSJeo3mzNrSNG5aE46mbYXIqulb8WhY=;
  b=YEiYL1sb55AedyGDjOIQj7VGIyRRo8y3upZLE7VNTi2gXq4iVVYqiRKu
   F/LERkreQ+WE4KBr+hcKO9inKPFA+SfY94IObzDnnsyQ+lKykaLa8tEGW
   T+81Egv5I61ZgjharpedhC05glFFTFKjPDQfjdEwjBvOMJhYZbnZ/0LdX
   bGxLs+yBUgoMtDTTP+tp9lOyr/dySTS04b2yAqsu2Y5z0wDSD0nnQ9jnw
   p+UA9GoIfgCuPjNue5ejPOPRq5QzXoyUPw3i7QZBnbb2/iWS39gakkjPJ
   Oib8sSNkCAg+Cr0qyh2IBYQtvmOZsm81wYXJ1HFdOFToxwXRUAJF1kSmU
   Q==;
X-CSE-ConnectionGUID: Yy4KbwjLSnuX/AkiQikphg==
X-CSE-MsgGUID: vTnqTh1EQ9KEARWTwRvTPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="59037445"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="59037445"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 11:59:49 -0800
X-CSE-ConnectionGUID: f0sa6V87T9Co8C/4c2rJGg==
X-CSE-MsgGUID: p9UfXjt5QRiI22L8y6y6kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93944589"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2024 11:59:48 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIvXF-0003RJ-17;
	Wed, 04 Dec 2024 19:59:45 +0000
Date: Thu, 5 Dec 2024 03:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, heppen <hepeng68@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1590/1590] drivers/acpi/cppc_acpi.c:1671:
 warning: Function parameter or member 'auto_sel' not described in
 'cppc_get_auto_sel'
Message-ID: <202412050326.2EEPoVUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a2c7a5a53b2787fa56e28a271e9d3894f70e8374
commit: b718dd523687c682c11f3aa590780c277a8a90d9 [1590/1590] ACPI: CPPC: Add New ABIs for reading and writing three new CPPC registers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241205/202412050326.2EEPoVUd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050326.2EEPoVUd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050326.2EEPoVUd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/cppc_acpi.c:1671: warning: Function parameter or member 'auto_sel' not described in 'cppc_get_auto_sel'
>> drivers/acpi/cppc_acpi.c:1671: warning: Excess function parameter 'auto_act_window' description in 'cppc_get_auto_sel'


vim +1671 drivers/acpi/cppc_acpi.c

  1664	
  1665	/**
  1666	 * cppc_get_auto_sel() - Read autonomous selection register.
  1667	 * @cpunum:CPU from which to read register.
  1668	 * @auto_act_window:Return address.
  1669	*/
  1670	int cppc_get_auto_sel(int cpunum, u64 *auto_sel)
> 1671	{
  1672		return cppc_get_reg(cpunum, AUTO_SEL_ENABLE, auto_sel);
  1673	}
  1674	EXPORT_SYMBOL_GPL(cppc_get_auto_sel);
  1675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
