Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BDD38B140
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790979760; cv=none; b=lkwq5FCqDwx2o6Bq38htrC6bjm8mVqsqfmP0qebrZQSJvKPqef4QhTA6W3OGeHbXW9PQ+WjxkxgT7Pgc2awQveOknzdKT2p2HwWJKcy5QG76+gIFkVj7W6YNFF606c3qrW45FG0Pfpv1zwQMv4X33RK+cfDn28xK6/ghoGmcbgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790979760; c=relaxed/simple;
	bh=acyvNWGxsRHOYPn00bGmttZDfDrNoJ21tSJ/cY4hwxs=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvsAtOqjqg1L/D4tME2ju8QZT+fiKWKtz4IyNdBX5SqMRHltgguSYwE/m//s7Shhrs7StrOhpYJDyuahM6icrmi0n+M3FhPyqXmHdgiZ75iMxMHDS4Ov5MXi+fNehL8Sre1NZBzwMrnhD8r/Dk0gXaKoNhlqU1g5IDfAfhGDqB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9dyi/Zc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9dyi/Zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790979758; x=1822515758;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=acyvNWGxsRHOYPn00bGmttZDfDrNoJ21tSJ/cY4hwxs=;
  b=a9dyi/ZcTYyyIgxwVQ7o1w3h4pGF0B1ZU1J+DwHGSWEtSkQkD1BE7BnB
   FRJ8ufJNyXxOXqfZl0OITmkoZwp6zwD6UD4QZMpcOn1yZ4vYvAGJWZvz8
   2OQhzK7yeyJVoUSTvxEphvhRnDMpChgGBmhh+wseyE5AuppNXm4tmZTfe
   dqnyh4/zF5/1zqSrT4/cLI1E1m2T1/3g3s9Z/UqdeFNzfFg4Qsvwbtozn
   t7OpMtih/lR6Lyph/YxDswAWMOXDGm6jio9tfWJbUMqYb/+wZU4DtoUfi
   vVreFwnTN4K1RfrEtspIFriwvY6jOKDahskycrQWBgFtAw8Q+Ea8hXaKI
   g==;
X-CSE-ConnectionGUID: JS63dJT/QeGThZE81g6uew==
X-CSE-MsgGUID: dROdV2tVRDqf+gvwAwLeNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="91615474"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="91615474"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 15:22:37 -0700
X-CSE-ConnectionGUID: 8dInX8S1ReCokQx/4nJRAQ==
X-CSE-MsgGUID: AED8LnreS3WFdE3G7wtOBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="342259"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 15:22:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCleE-00000000TWj-3QfN
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 22:22:34 +0000
Date: Sat, 3 Oct 2026 06:21:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: s390/dis: Mark non-NUL-terminated character arrays with
 __nonstring
Message-ID: <202610030650.DI42pRZv-lkp@intel.com>
References: <202610030650.DI42pRZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610030650.DI42pRZv-lkp@intel.com>

Hi Heiko,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Carstens/s390-dis-Mark-non-NUL-terminated-character-arrays-with-__nonstring/20261002-124446
base:   
patch link:    https://lore.kernel.org/r/202610030650.DI42pRZv-lkp%40intel.com
config: s390-randconfig-1000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610030650.DI42pRZv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030650.DI42pRZv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030650.DI42pRZv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kernel/dis.c:343:1: warning: 'nonstring' attribute ignored on objects of type 'char[][7]' [-Wattributes]
     343 | static char long_insn_name[][7] __nonstring = LONG_INSN_INITIALIZER;
         | ^~~~~~


vim +343 arch/s390/kernel/dis.c

   342	
 > 343	static char long_insn_name[][7] __nonstring = LONG_INSN_INITIALIZER;
   344	static struct s390_insn opcode[] = OPCODE_TABLE_INITIALIZER;
   345	static struct s390_opcode_offset opcode_offset[] = OPCODE_OFFSET_INITIALIZER;
   346	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
