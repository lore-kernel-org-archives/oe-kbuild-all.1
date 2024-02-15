Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9BC12C7E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Feb 2024 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708029468; cv=none; b=i/M3nrbWrpCY/DNEgptjmaK7oZ8iPdbxuddXDa82SIPV/AUGc2LvPYx68fLFprYcWVl/2J10XThpzYQRBZIqEv7LG45cLE9wSGzKLbs6UOyfC34wJbW7URjs+EFxkMOrr3bcUDmT04g6gaAbm9r29TPanuZPOo4gnmOuXjSkle8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708029468; c=relaxed/simple;
	bh=CG8ORPhT+AnpLMu9WqnbAaoGXJ8EMlloDo7YZhgYyCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LathjT+VAIq5Mo3dsFVvBDyZCLWXlnD3xJ5aQUdHtx+tm6CvlYkqU0XjJ4+BsSiwEIKq5e1+pakG2sdhm+KD1JZpWYGp+wqKJHmXW/WZeIHTmnh7OLmdeqbCZVnV05h+moUauW8k+GLaTnquaorKZQK4yU76svYZZv4B+asUOJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U47ZbMsI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U47ZbMsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708029465; x=1739565465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CG8ORPhT+AnpLMu9WqnbAaoGXJ8EMlloDo7YZhgYyCQ=;
  b=U47ZbMsIMM3drvdEPMspUO6BP8p5525BM5N31DzVF/8ZLeGwflKT0Jju
   cMgBDghEygEDOmxa61WM+h9AAR0JpqTHLXSYXWLehpaXi39V/TFe/2sNr
   JomwbMJDz/ld/ORKu497XGHnO2eK/YnW+NDFKEiwckf5Dd5jKSU2NmbfR
   NjM+B0dSCcSa7eqdTdfFiCs67pdGOcrXLHivW94i9ZroDC4RR+A8AyJhB
   nCQdn2YKTGbFLN3WRTmTy7TjbaR47HLt5uVMDDbJsHlACn3d+5Ibo+Bv/
   9YXAmmthq2kp0Gc3uvPp/AILW/An52q65SlTz7ly/qDLnrK1EAEeJHo77
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19664917"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="19664917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 12:37:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8254771"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Feb 2024 12:37:43 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raiUG-0000kw-3D;
	Thu, 15 Feb 2024 20:37:41 +0000
Date: Fri, 16 Feb 2024 04:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 6204/6884] dm.c:undefined reference to
 `set_dax_nocache'
Message-ID: <202402160420.e4QKwoGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26d7d52b6253574d5b6fec16a93e1110d1489cef
commit: 5f97767a384ee9d0e6bb37e019218efa185d6d4a [6204/6884] dm: treat alloc_dax() -EOPNOTSUPP failure as non-fatal
config: csky-randconfig-r003-20220721 (https://download.01.org/0day-ci/archive/20240216/202402160420.e4QKwoGO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160420.e4QKwoGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160420.e4QKwoGO-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/md/dm.o: in function `alloc_dev':
>> dm.c:(.text+0x35ea): undefined reference to `set_dax_nocache'
>> csky-linux-ld: dm.c:(.text+0x35f2): undefined reference to `set_dax_nomc'
>> csky-linux-ld: dm.c:(.text+0x36f0): undefined reference to `set_dax_nocache'
   csky-linux-ld: dm.c:(.text+0x36f4): undefined reference to `set_dax_nomc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
