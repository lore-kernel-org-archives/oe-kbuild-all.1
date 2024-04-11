Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043014600A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830763; cv=none; b=pTO9VasFHOdWFf+d5Tv3PMdUsOruhOzJvwBOwcpKEY+Ps84WBsqKj37eqd3/sy9Xg5Hwttlvc8/zPbCCBktvQJ7ggdmvDd8QNkL798oZV5BxfXlxcwZNyKrP/5uzGOqjwPCjQ00LQMTres15iXiRHCSGftwdfZlh0OLteeew2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830763; c=relaxed/simple;
	bh=8WiehQLnFdPJQKjmDNfyUVMtRxINhGXNdOw8JRTu+c8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iY4y3AbJF7Gg2KKfYlBgDmiUGaYQVg17hv373phx2IVmeflQhgaz3fXhOeDIa/oV0XlzvfUbKmJU9P0tNgE3SYaOKg2m0ZTfm/M4fDteXdO71mYby2sJTBW3vfHUlQDNTcEDsB6TDyiv7lH4rz/J/WJ77s1oHsU0K4gGSxAJw8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5PLt8ZL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5PLt8ZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712830760; x=1744366760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8WiehQLnFdPJQKjmDNfyUVMtRxINhGXNdOw8JRTu+c8=;
  b=E5PLt8ZLBl+i0/irPBgf1mvQEbb3bNf/NgsmHxT1XIp+/6PA8M0DBV3l
   /8W4xpsU5uSgHjjbYDTUo3hJCDsvxmJrkK8DNwJkHJuL1ZXoy3hirFDla
   seaf8/26F4ZMtj+P0pZqzudv75ofsih8r5Zld48jOY4YHZX0Q62eA52CV
   LYueM6VHVtmOXwSytpyMHKS2c7AhK1m4q0clRhCeEZ3NZsyu8QXzBJ2z+
   YnrIaoqhLexOfcg6R0pT/Unqapaxi74a4XhXYDohekh4L/3xmI1kg1UDf
   xnB5IeIVeq51s500b7x65cIA27LW/iVdvIVkweT8r5TpBWOFyvrHm9Tjb
   w==;
X-CSE-ConnectionGUID: vd/GrU4tQvqtUCvHiwwWhg==
X-CSE-MsgGUID: fUDjosktQoyyzBrrxmZ1xw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19383732"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="19383732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 03:19:20 -0700
X-CSE-ConnectionGUID: 1Sh+wHr7RY6y8I00i80Z8w==
X-CSE-MsgGUID: 3zxqLP/dRCyLHEUfj1m2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="25633313"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Apr 2024 03:19:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rurWW-0008VG-39;
	Thu, 11 Apr 2024 10:19:16 +0000
Date: Thu, 11 Apr 2024 18:18:53 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/6] mm/page_counter.c:232:73: error:
 'MCT_MEMORY' undeclared
Message-ID: <202404111837.1HGqLppO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   00829e628b41b68dd6bf2c08e6c4111f2b8ae7ed
commit: 8787ea8cd6b9123d75582491425c4aa1584c6b1e [4/6] mm: memcg: merge multiple page_counters into a single structure
config: i386-randconfig-005-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111837.1HGqLppO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111837.1HGqLppO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111837.1HGqLppO-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_counter.c: In function 'page_counter_set_min':
>> mm/page_counter.c:232:73: error: 'MCT_MEMORY' undeclared (first use in this function)
     232 |                 propagate_protected_usage(c, atomic_long_read(&c->usage[MCT_MEMORY]));
         |                                                                         ^~~~~~~~~~
   mm/page_counter.c:232:73: note: each undeclared identifier is reported only once for each function it appears in
   mm/page_counter.c: In function 'page_counter_set_low':
   mm/page_counter.c:249:73: error: 'MCT_MEMORY' undeclared (first use in this function)
     249 |                 propagate_protected_usage(c, atomic_long_read(&c->usage[MCT_MEMORY]));
         |                                                                         ^~~~~~~~~~


vim +/MCT_MEMORY +232 mm/page_counter.c

   217	
   218	/**
   219	 * page_counter_set_min - set the amount of protected memory
   220	 * @counter: counter
   221	 * @nr_pages: value to set
   222	 *
   223	 * The caller must serialize invocations on the same counter.
   224	 */
   225	void page_counter_set_min(struct page_counter *counter, unsigned long nr_pages)
   226	{
   227		struct page_counter *c;
   228	
   229		WRITE_ONCE(counter->min, nr_pages);
   230	
   231		for (c = counter; c; c = c->parent)
 > 232			propagate_protected_usage(c, atomic_long_read(&c->usage[MCT_MEMORY]));
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
