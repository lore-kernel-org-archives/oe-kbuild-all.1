Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A9F3DB9A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708613554; cv=none; b=IxG7Tj7P9UFTn3QPcrMo5HZV4P7ZSBr/PIqgb2+AnKJmax8g7xTAhjMZPbnjrFxj+UoYcnroN9ZE0O69+aZKTWSq6M2AUXLcVlRPddwyxuVFuelFDiaJ2pJ/1DC+4jktD+IrvsE/Gi1yErAET0B4bXuZ+93bMq4Z/XjFx7ce/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708613554; c=relaxed/simple;
	bh=ZZyAGsL7i7S/zZmQn6vPt3+4e+GSbHtokpbET19dxj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hzzyCR3V4+gf+q747E4jIkUdcntdEFE4ktfTlUrCVG5WNSf4SUUtNK7Cotx7iWKy14lLXF6f6meJpvy4hS6OghB+AI4DpXoPIMM34/X+CM4hBwGcK7SmnNTGIWRtncV9JEMtDpSQGhixCsPAJWK76XP4qoJ8YLxLD0NH+YAXZD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiHPLf4K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiHPLf4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708613552; x=1740149552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZyAGsL7i7S/zZmQn6vPt3+4e+GSbHtokpbET19dxj4=;
  b=RiHPLf4KImATCpoOe0BDI7MDqeheU3ZfJgyd6mTh1nUrRgEpb7DtL4I3
   N3rBS9on+EP3rYD6RtazQXJtgDPvLEeAoSLrjGIs1AQo8Tf7VOeZ5jf+O
   WWxG48NQrj51vJwv96rOPLBvi7Y+3IJkVgxx9ThRj2b2Lp2IIQUSH2VV0
   y10k9AHgHShqQXnNPChTYKpSmgfNqeenxqwBG73zl3KxuaxfezQwI2BOL
   TEb1LQ1WxYtB3qCabUhR+EyxnPlGAtLxrDoZsk3vJMict+AZxMfv5U+6U
   LYX31y75qslg5dl0q/MrmlSgJTgokhTdeP16dkX6M58oBh9stJ8d3ieh8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2992672"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2992672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 06:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5500662"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2024 06:52:30 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdAR1-0006Os-2x;
	Thu, 22 Feb 2024 14:52:27 +0000
Date: Thu, 22 Feb 2024 22:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [linux-next:master 8181/9122] lib/string_helpers.c:1023:34: sparse:
 sparse: incompatible types for operation (<):
Message-ID: <202402222223.h9rFmYj4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e31185ce00a96232308300008db193416ceb9769
commit: 0f4459080884b688c4ec9c2b121f22c641401bc1 [8181/9122] fortify: Split reporting and avoid passing string pointer
config: s390-randconfig-r123-20240222 (https://download.01.org/0day-ci/archive/20240222/202402222223.h9rFmYj4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240222/202402222223.h9rFmYj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222223.h9rFmYj4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types for operation (<):
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types for operation (<):
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types for operation (<):
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types for operation (<):
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: cast from unknown type
   lib/string_helpers.c:1023:34: sparse: sparse: cast from unknown type
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types in conditional expression (different types):
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse:    int *
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: bad constant expression type
   lib/string_helpers.c:1013:9: sparse: sparse: undefined identifier 'EACH_FORTIFY_FUNC'
   lib/string_helpers.c:1019:25: sparse: sparse: undefined identifier 'FORTIFY_REASON_FUNC'
   lib/string_helpers.c:1020:28: sparse: sparse: undefined identifier 'FORTIFY_REASON_DIR'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: cast from unknown type
   lib/string_helpers.c:1023:34: sparse: sparse: cast from unknown type
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types in conditional expression (different types):
   lib/string_helpers.c:1023:34: sparse:    bad type
   lib/string_helpers.c:1023:34: sparse:    int *
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
   lib/string_helpers.c:1023:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1023:34: sparse: sparse: incompatible types for operation (<):
   lib/string_helpers.c:1023:34: sparse:    unsigned long long __UNIQUE_ID___x302
   lib/string_helpers.c:1023:34: sparse:    bad type __UNIQUE_ID___y303

vim +1023 lib/string_helpers.c

  1016	
  1017	void __fortify_report(const u8 reason)
  1018	{
  1019		const u8 func = FORTIFY_REASON_FUNC(reason);
  1020		const bool write = FORTIFY_REASON_DIR(reason);
  1021		const char *name;
  1022	
> 1023		name = fortify_func_name[umin(func, FORTIFY_FUNC_UNKNOWN)];
  1024		WARN(1, "%s: detected buffer %s overflow\n", name, str_read_write(!write));
  1025	}
  1026	EXPORT_SYMBOL(__fortify_report);
  1027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
