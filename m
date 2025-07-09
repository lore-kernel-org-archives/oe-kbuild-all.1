Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA22275859
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052871; cv=none; b=PL2jCWYifqxk52/UUPG6XNviuFQFzWj7HZm5NBQ7jWV8mT7sO73at0C78M4U8bFXbU1arB1+hUI5Me8ZRS1uQ/xPWIJmQ9lVgzeBXV1vELf0V70rAlsqzWh1YIYazYrpJISD3MVDMhxlrOMvdcSK5UGbbH13AC3zFNl4lx1FLp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052871; c=relaxed/simple;
	bh=paEqWLdl0sDW3K/8vVBpLnFG6q/SSJTMnd4LoG5OXEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKb7bKmC5ZM6atlvGbwvlC1YNa60M7w6pPLrlhXatqRapQUFZJM9zwHvlIfl99VOzKZGKdtHwRrsL2GYRGbJOwyaNlHh0ErnGW2S+92+M20KKlRPAxUKOGV2a342Q/u22DGIXiCG9RroaOL9Ae/WDj9QKfvcdaWwmPe0FoQq+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dAh5mjOI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dAh5mjOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752052869; x=1783588869;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=paEqWLdl0sDW3K/8vVBpLnFG6q/SSJTMnd4LoG5OXEQ=;
  b=dAh5mjOIbREUPG8AfwMFcdBI6J6hjvpxWpobo4GjOoweEhSCrcOyqkK0
   0QoI1dn3VXVXPb30MRMLg1jtLexPdBYt0SsK9oNbooBmYOkvBdVPBJL1V
   IlIl0t2VQpstgahL6ZArvl7SoB0fmA6q74IwsTgehGaU0bIP38nYoW/E5
   8CdEqCK8ucWTS6q8nHWQVzv1cfWATivt8SgKCwql7jjy67w6gUXW3Gk7k
   zfZuYiLPmS4lFND+6OhKg0+oe3miBDM+AVqGrTXojKk+wTH2X0tbkgRoh
   isH0Jlss3NNqrfc3dQWow5wUJqywAwa7P/IxD03J3naLDPo5MZHVaTiGX
   Q==;
X-CSE-ConnectionGUID: 60djPPxTQyW2SQ5urvtSQQ==
X-CSE-MsgGUID: 4WVjrWlAS8KGF72KVKRXmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41929477"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="41929477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 02:21:09 -0700
X-CSE-ConnectionGUID: VcHUsw3JS8iqKRNaZEnA4w==
X-CSE-MsgGUID: Qan6L+mdRr23A3n75UksUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155813049"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2025 02:21:07 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZQzB-0003Lb-13;
	Wed, 09 Jul 2025 09:21:05 +0000
Date: Wed, 9 Jul 2025 17:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Polensky <japo@linux.ibm.com>, brauner@kernel.org, jack@suse.cz
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] fs: Fix use of incorrect flags with splice() on
 pipe from/to memfd
Message-ID: <202507091628.cPbKOFjN-lkp@intel.com>
References: <20250708154352.3913726-1-japo@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708154352.3913726-1-japo@linux.ibm.com>

Hi Jan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.16-rc5 next-20250708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Polensky/fs-Fix-use-of-incorrect-flags-with-splice-on-pipe-from-to-memfd/20250708-234803
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20250708154352.3913726-1-japo%40linux.ibm.com
patch subject: [PATCH v1 1/1] fs: Fix use of incorrect flags with splice() on pipe from/to memfd
config: x86_64-buildonly-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091628.cPbKOFjN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091628.cPbKOFjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091628.cPbKOFjN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/anon_inodes.c:115 function parameter 'secmem' not described in 'anon_inode_make_secure_inode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
