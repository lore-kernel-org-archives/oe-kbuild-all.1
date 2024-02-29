Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320E4AEE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709223517; cv=none; b=rYpKVyT6mEOYSglRFh8C1ZaoEE+fkvP8KhPtPlwhFleuB054uqBdCJoVdb+PuLI38EKnXsgOjZ1jEOVfhEsKUVybgRAT4BHD7V1HxEwpqHi7PfSFKAhw9Bf5fdC757w+xOHB2p/oLqbGUmQkyYfDCBT4b4Tbekj0SXTXFKXYruU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709223517; c=relaxed/simple;
	bh=WpBCISM6E7kdZ1GpKXEe+oP+zFWb+h1MGHzA3FJNL6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MyHbc27cpHvEkoIhEwqqkRNmWx7NUh+U1LDkpHgl9A37Az+Pe2c/VhvGdNvjiHkmaizS9oA2/hHpYaAbbRW13R5U4ssidW/1JZ6eOLV6Kd+1ZAyhTwIGbk04ftdqEHzgfO0cW+0ZQPTL0E+cPpffLy+PTY6fNr/K+EGcMev/Gvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrIOKU97; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrIOKU97"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709223514; x=1740759514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpBCISM6E7kdZ1GpKXEe+oP+zFWb+h1MGHzA3FJNL6w=;
  b=QrIOKU97SeRxHOu/Zpy3n7fj0YgmXuUllG3c1b85mNXCzNnqgFw2sowq
   TRHwrTV+x+XeCOHu3mytaEDSLLW8dVEo0jpLZFGfgjhGyncN/Ha/+gKg5
   I9UQ2l4aCi784WKBekvSlG6RQ7g1AGhRBVs/oXxAAFJ58WU7h4uRgOlSD
   zZOTVhEy4Uk8XJb4qMmmLAZIp9Xg/HrNegFkxwpshLu+XdJv4bFLuwOYK
   NIu3UVgOVRnxxePCgWQfbKA62xTlLUszsAOCyBR9CG8nqvaO7RuM5J68G
   /zKPxagWJZdtg0XRPs+enLhywy22mm0VWgrTATmKdDfLsCmkARno1/kLT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="15118871"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="15118871"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 08:18:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12429145"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 08:18:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfj6o-000D4r-00;
	Thu, 29 Feb 2024 16:18:10 +0000
Date: Fri, 1 Mar 2024 00:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 6/6] bus.c:undefined reference to
 `ghes_debugfs_init'
Message-ID: <202403010014.E9MdhVcz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   6c540a23cb1194d67a9dcfefb702774a99afc3b1
commit: 6c540a23cb1194d67a9dcfefb702774a99afc3b1 [6/6] acpi/ghes: Add CXL CPER injection debugfs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010014.E9MdhVcz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010014.E9MdhVcz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010014.E9MdhVcz-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/acpi/bus.o: in function `.L282':
>> bus.c:(.init.text+0x7d8): undefined reference to `ghes_debugfs_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
