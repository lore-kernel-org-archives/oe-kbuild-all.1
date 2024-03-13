Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77F524DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710355564; cv=none; b=aM5EyCJef2dQPEbFOmnG2JCEueVGbfJR8A948+IiHC3n9SpDlL9WtnXp+Brs9DAp85qf17Id13I7WzhGBN9XZ2gTmamsVRNpfgyTy76rCfCqWbwzAHRp0EsuwuozqOYXZX9qkBvvTd1vqhhXj5jEUL+aN6/vkF7rSBt+cK/gBX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710355564; c=relaxed/simple;
	bh=PjSs+lTdGDKvwVF7H5qvZEpDpoXFchfAOD+tMuxixI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H64rT0ef1H6n/5VnONDF32AG8Pa1rbWEat/zFHwM0yZG/61Q66wICEzNId3jfjf3P5KDl7KRpwBxLCWDG28DsxOPfo9CL+f+HicwTNelWee0GiVkvfhFLFjXZMfK9gGHCgxgtdsyFmsP4iTiON/kDvaAA8wCdm7C17JFx6/BP7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXMlDU45; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXMlDU45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710355563; x=1741891563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PjSs+lTdGDKvwVF7H5qvZEpDpoXFchfAOD+tMuxixI4=;
  b=VXMlDU45EV05jTNxlzI593JGecQlsVSm6LjEvxve+QVIeMSwFgDWHrZW
   xOk4y4UalNcMhKCaBAFF09T1mBTWiNtkZ5lSHleLZqX3ZlsJsHycOd4R7
   JXoZKOn22KPVYQH0tPCSl5ViAGj3gSuSWk/Axi+e8gKmFfkRZr+O8z+V/
   LI5rBlhhtwRMIqSbPdV3F5M1XRx1rc8gmEGj7MpCojI8W/KMWcXRn2Z32
   KgaFOw4IskLPCan/g45V/FtthosTbuE7Vl6hmnvv0yLUSYTXZ2VwFgEp/
   0QGPutJcxsFWpnXcY8vTJ3vLApU2mP153AgRtj9ojvACJDh/Htmt6TFAu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="4998026"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="4998026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 11:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="12478787"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Mar 2024 11:46:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkTby-000CgT-23;
	Wed, 13 Mar 2024 18:45:58 +0000
Date: Thu, 14 Mar 2024 02:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 find_next_bit+0x14 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Message-ID: <202403140236.HDGbPm2J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b0546776ad3f332e215cebc0b063ba4351971cca
commit: de5f84338970815b9fdd3497a975fb572d11e0b5 lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers
date:   2 days ago
config: xtensa-randconfig-s031-20211010 (https://download.01.org/0day-ci/archive/20240314/202403140236.HDGbPm2J-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140236.HDGbPm2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140236.HDGbPm2J-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: put_page+0x3c (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> WARNING: modpost: vmlinux: section mismatch in reference: find_next_bit+0x14 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
