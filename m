Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BE01F94C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790649; cv=none; b=fussqsiO90wX7x7jENsoiEz/ha80gMIoWUnM9Ou1lPYRxy2hHDvqZUqCRWPOfwFdBJBW5CEeImh9jeOCLUEpZbicppzGjnopXnmBvXcVVDHy7fkhVUC5nEhsaOWCg9RKIGAPGUBjQF5RfWby/DnqnCRB+Y/AQV7QhkNlIV51xEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790649; c=relaxed/simple;
	bh=kqM0V7JlTzXDtzTvx8oGQH244Z8KZvj1CkDr24Uu2/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z3a1NksQK5efqjX3stdNMDkmi2NqqflYykntU1JaBp4/kOvbDyQqtpiGsMwe4eU3DXE9FZzUfWq3OGJLG8IEnVX13ddlwn7/ttPFIGbrRG6v1fSKEfkUyL3IMhQQ+d9AM5s2aU1cmBZ5CwuZ5tvobbFF7TgIlJxhtV1QDf1EhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvsF/byp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvsF/byp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744790647; x=1776326647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kqM0V7JlTzXDtzTvx8oGQH244Z8KZvj1CkDr24Uu2/0=;
  b=DvsF/bypIA3i/nWF5a9v9dsE60jKfVEIkHytJGdkpYU/3qFwtnQwlsM/
   WpQtZ6AzXNoXUM9aglE8UH3O5BU5scmIPYyRsRGNeeRm58ueCAFYg1/my
   eQlVxpZxwXBD/mSqe63xGXbREigLY57n8yTWFt5pUH+x8B0wu5q17vpFp
   S0cVTYUckITzsixyg4xA6vFhMg1nORjMaH37dK1crc2QyjhkotQUVDyOH
   YvgZZ6lZIswaGZA8MuLPPmEZd5JKrSjHMhJZlwWCu27wdVEPb+axA3jdi
   3+iXSiej0PQe20hj1BoIxcICbOfRldxRSDcYjESZQ29yvFMvUy/rPa16k
   A==;
X-CSE-ConnectionGUID: wmDFKcHJRsuLTVG5GFWlNw==
X-CSE-MsgGUID: 8XGSe/EuQUiZ4xue1BVm4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56502610"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="56502610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:04:07 -0700
X-CSE-ConnectionGUID: GDmSWWA+Rg6VPHr0Um21iQ==
X-CSE-MsgGUID: XSEE3EeJTDeJ9MIzHxDCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135163370"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 01:04:05 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4xkZ-000JHg-2b;
	Wed, 16 Apr 2025 08:04:03 +0000
Date: Wed, 16 Apr 2025 16:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1571/1571]
 drivers/usb/typec/tps6598x.o: warning: objtool: tps6598x_probe()+0x1ed:
 can't find switch jump table
Message-ID: <202504161537.Uan8Cvv1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nikolaus,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d47443532b562cff105f8cfbc32343f83a2ecd01
commit: 10379cc2b54aefd096d8f00b7e3bd25b3dc6632d [1571/1571] drivers/usb/typec/tps6598x.c: fix portinfo width
config: x86_64-buildonly-randconfig-002-20250408 (https://download.01.org/0day-ci/archive/20250416/202504161537.Uan8Cvv1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161537.Uan8Cvv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161537.Uan8Cvv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tps6598x.o: warning: objtool: tps6598x_probe()+0x1ed: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
