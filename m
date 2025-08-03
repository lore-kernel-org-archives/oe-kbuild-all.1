Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A58435979
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254279; cv=none; b=OvwuEyJGML1QkJ9k901+4Ctjmbkwz/3rix29Iomq7DbJgKpI+FK05vRd5rds5e96a02fdk7F+rlz9JwNgsY+GJBJW0spImW1YlSxcTxPZzXafnxzE5NbNeW6+FHk5Qb4mr+O55zdjLlS4C2BTfU9MPsG6RPwqdqnIJGFIZufEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254279; c=relaxed/simple;
	bh=Cknofb+4ZTGj9bNkEmSp2x4Xsx+/C94Vi4PHSfDHNgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrXVGf1QiWmMCNSzZ+6F85Uqrahed9Rwx+KWOKGCSwUGHbjmPg1jH596P7gXZyht/uOgMFo2cnk05/7IY8a1RJAf+tnJKQjlAYf8dONryl33lWc/GbaPqOpHxaJZ8NS6kZZ6EsypXaoHm8g9xHEQZC6VVr3braK/VjeAc3ARF0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GObqloeg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GObqloeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754254277; x=1785790277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cknofb+4ZTGj9bNkEmSp2x4Xsx+/C94Vi4PHSfDHNgU=;
  b=GObqloegrwtTFdQuL70ReChbcnYnuzwTcjogf/ri+1epwzOC240Fbk/W
   kybQfDEMKzhimTKFt1itjwdbYzfGs5Fasx9yjA2WOloS1NZJRgZw+8r6h
   BoEllCI8FW3B5Yq03JbTcoonMMhxJj05zy0aBeqN2v4oy6sQdexAsi+I9
   0O6YEqd6AJ+FBjVmMiR7ULrV39Y7b5QCUeRQMiCjcYMpB3tUhyBwK0O/9
   OzBbTv8F99e3fA0s53fg7vxEFGRGiGa8oMV2lPrPwxYazr4Hf98naaScy
   j/lkXyzzcDSGuy5yrEWr3M+rAF2g473QcAR8NIfz2qqeFuBwGWTOYgftB
   A==;
X-CSE-ConnectionGUID: CbPg5wbER7S1P+7oBEM7eQ==
X-CSE-MsgGUID: iAh7e7S0ThutnkNM4SEY9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56594535"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56594535"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 13:51:17 -0700
X-CSE-ConnectionGUID: xhjzwsqYSPGjFdvOVxi31Q==
X-CSE-MsgGUID: xc79+euwSIG5w1/6IKvJPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194824076"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2025 13:51:16 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiffl-0006dI-2y;
	Sun, 03 Aug 2025 20:51:13 +0000
Date: Mon, 4 Aug 2025 04:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 11/19] Warning:
 drivers/hid/hid-magicmouse.c:588 Excess struct member 'crc16' description in
 'tp_finger'
Message-ID: <202508040430.VmmeciR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   17ba359286a86638c4d3a3b5bb2ba3a19db1d898
commit: 9982077c4e27339a184bd14465b3f5b14be30533 [11/19] HID: magicmouse: add support for Macbook trackpads
config: arm-randconfig-004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040430.VmmeciR8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040430.VmmeciR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040430.VmmeciR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:588 Excess struct member 'crc16' description in 'tp_finger'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
