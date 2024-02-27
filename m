Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7D652F98
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 06:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709016233; cv=none; b=phWeoS1U6J1K9QBdNSSSIOj6V1inEMgSRPC3LJRkplMb+OoOSOAk6fwwsoj6k699lELpsbETlBKhNJOj/evODlaNuN8DtNCYi3fgki6X4OkiZf4ZcDapDYpQ9No0aL8rnmR2wLdCcsg8QJgemfQQVK3u/rOtCYhxjfo3cOKDGdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709016233; c=relaxed/simple;
	bh=ReqBNEvEF1ysnfrtCxs8ML8ThthaJdQCaB25/uLJJkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0wIwkCGfAcaVaPuHD/rjxeZ8/g3j4ZFduf22gq3cGPVkg0jgYlZme+8z6SfXGdmNBRlDYpwoZF4R/kv/pEZzx/3qaAhK0saqJz/Xlko/4XILKqEaIPEz8igynVy0kFHmJVa+V+dikUyWd4cY2zXwG02POyCNSwaTYMPkVMxPm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSX0d+e2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSX0d+e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709016232; x=1740552232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ReqBNEvEF1ysnfrtCxs8ML8ThthaJdQCaB25/uLJJkw=;
  b=nSX0d+e2/sfjlWQKYNaiCAtowHsa33JtqrekUnaBlGL2xklRg0XZbatJ
   GVks1iI29phKEj5oR+zm7ilaufGQMUEuYtdNTJjPgbH0kNd3WYHmUGkW/
   se3pb4KfwuAzx955IvspLuUdX2QONYEVTn50L/FwACVsk1CkE8uZMxGKR
   1btzUjwa8GXGALhQTIoyEPme7BAjoTuTtuvRrxpNhuRM40VAO6OhzAqjf
   KcEELUG/FBx+KsIHUjRlZ3orrsK/53Zya+9yH/gsLcJS7rcmdXE/b1ZTf
   iAARghb8F5MGmzl3GpMug8YKGBKfSZzdLzsbqvC7QCHx0TLCS1SpQ9O8a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14765465"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="14765465"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 22:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7143861"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2024 22:43:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rerBs-000B0t-03;
	Tue, 27 Feb 2024 06:43:48 +0000
Date: Tue, 27 Feb 2024 14:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream 74/152] main.c:(.text+0x27c): multiple
 definition of `tdx_pre_memory_mapping';
 arch/x86/kvm/vmx/vmx.o:vmx.c:(.text+0x2620): first defined here
Message-ID: <202402271442.zIaNvJSG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   f1ccffc2bc17cc3feca6d575db7ea93c29a49453
commit: bbac4998cfb34da496646491038b03f501964cbd [74/152] KVM: TDX: Create initial guest memory
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240227/202402271442.zIaNvJSG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402271442.zIaNvJSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402271442.zIaNvJSG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/vmx/main.o: in function `tdx_pre_memory_mapping':
>> main.c:(.text+0x27c): multiple definition of `tdx_pre_memory_mapping'; arch/x86/kvm/vmx/vmx.o:vmx.c:(.text+0x2620): first defined here
   ld: arch/x86/kvm/vmx/main.o: in function `tdx_post_memory_mapping':
>> main.c:(.text+0x290): multiple definition of `tdx_post_memory_mapping'; arch/x86/kvm/vmx/vmx.o:vmx.c:(.text+0x2634): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
