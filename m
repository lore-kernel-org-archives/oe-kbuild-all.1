Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9716132F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 08:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746952826; cv=none; b=p1TEhPBlmqFIyhPw/Vk/G3ukNnwBLpU73TDQ4SJVoonVuCHMSmU6eb5JV2Gc8+5jT8+9VzXaEZx1BX9Ns8tAdYRj5f7QZKJ1U1r/rfCr6jkXRKtzmWQRKrxGDGYVzwiI+mJ+tiYY+s8jVKJaQbla826f9lWTEk3Zq5etuRj8iW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746952826; c=relaxed/simple;
	bh=SCFpYY0cyuW5tJvqoyH7lsFnJErkC9yzGVPhfkXOVcA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dv+VYCFYQXCf+YfHgyBXyd9xAstLQtkfAhmI11jyU4AkTTSbVmAFKi4zQWw1rb/iyeLW4Clr/5B1p+olJU+fIXTjErAvYZqON1OIN+yfRvpvdDvX0bu386ZyE4Zrycrp/cvx4T0idaG/6sWuPQps96o3lMmeCoz6SBTVvzyspwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGaxf1uH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGaxf1uH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746952824; x=1778488824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SCFpYY0cyuW5tJvqoyH7lsFnJErkC9yzGVPhfkXOVcA=;
  b=HGaxf1uHWNTjgNp3pTrySo4RR9eONwqAFPWwq0pxVqo8GcRXvqpA2agE
   EhR3Xlp0ccMmpsnKUGk7r9GrzveeqxpzpIcYYz0w0wxNJ1Epur0V/qwZT
   f72bTzBuTu5ZRQOo4lESlFX4H7PI4sV3IycxDIwGM5/MJ9mEHYh5lbnWZ
   xloT+8311QOxzr9esbOE/ts2x2yy3EPpOEDrXJMKVwK2PgUyNW91ew6rR
   lQu2MPAxM1hvaUeerOxizOXXb16SGH/r23wniFuPEutQWBDG+alHkfQSj
   kNKa9CAvI/djop17orH8xipaUwTJrq2qObtcKbO+rnrXz53YEtu7oF4rs
   g==;
X-CSE-ConnectionGUID: /ind5LaWQ4+sZnp+g4OUWg==
X-CSE-MsgGUID: OxQurGLwTruLvSyhRNLlHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="52562187"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="52562187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 01:40:24 -0700
X-CSE-ConnectionGUID: d5wG6il5Tmy316BWknV7Yg==
X-CSE-MsgGUID: fXBUHZMNSS+9KJEONbFtrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="141985205"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 May 2025 01:40:23 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE2EO-000DgL-2Z;
	Sun, 11 May 2025 08:40:20 +0000
Date: Sun, 11 May 2025 16:39:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] drivers/cxl/pci.c:208:1:
 warning: no previous prototype for function 'cxl_pci_quirk_lookup_id'
Message-ID: <202505111650.ZZdou694-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5b7daba404993131fe0d699e5acdccaa5bc3a017
commit: c7069262a20a5ce622c02aaee4333820d7c97023 [0/94] anolis: driver/cxl: remove the sanitize limit and fix the return code bug
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505111650.ZZdou694-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505111650.ZZdou694-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505111650.ZZdou694-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/pci.c:208:1: warning: no previous prototype for function 'cxl_pci_quirk_lookup_id' [-Wmissing-prototypes]
     208 | cxl_pci_quirk_lookup_id(u16 vendor, u16 device,
         | ^
   drivers/cxl/pci.c:207:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
     207 | const struct cxl_pci_quirk *
         |       ^
         | static 
>> drivers/cxl/pci.c:223:1: warning: no previous prototype for function 'cxl_pci_quirk_lookup' [-Wmissing-prototypes]
     223 | cxl_pci_quirk_lookup(struct pci_dev *pci, const struct cxl_pci_quirk *list)
         | ^
   drivers/cxl/pci.c:222:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
     222 | const struct cxl_pci_quirk *
         |       ^
         | static 
   2 warnings generated.


vim +/cxl_pci_quirk_lookup_id +208 drivers/cxl/pci.c

   206	
   207	const struct cxl_pci_quirk *
 > 208	cxl_pci_quirk_lookup_id(u16 vendor, u16 device,
   209				const struct cxl_pci_quirk *list)
   210	{
   211		const struct cxl_pci_quirk *q;
   212	
   213		for (q = list; q->vendor || q->device; q++) {
   214			if (q->vendor != vendor)
   215				continue;
   216			if (!q->device || device == q->device)
   217				return q;
   218		}
   219		return NULL;
   220	}
   221	
   222	const struct cxl_pci_quirk *
 > 223	cxl_pci_quirk_lookup(struct pci_dev *pci, const struct cxl_pci_quirk *list)
   224	{
   225		if (!pci)
   226			return NULL;
   227		return cxl_pci_quirk_lookup_id(pci->vendor,
   228					       pci->device,
   229					       list);
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
