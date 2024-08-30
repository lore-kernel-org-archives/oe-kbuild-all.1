Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815638DD4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 01:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724981627; cv=none; b=nqpjluYF3xvlOXPa5cR1u23v2ld/UugGgwp1VsYCbLXbY8S312NLQocDk+MhT1GtdfulsugckYrH8MiXsFHoYitYvWJnFiRH1+E4Zg+gcJOSWFNYSbVCEcEmKt3PztJ2iZjnExmWLa2mVJGnlDllCQhmSR6GkFarOPZy8ffkbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724981627; c=relaxed/simple;
	bh=S00u+sMAZom70+h5Tn+g1sbaHrQM2Vncse1/WzaACNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAuKbTXM9DcuRb4GfOzp/Ni1hwVUDbWCMq1zRpz24VhqjIeTXN0nyANAe4H8mA5f02x+fNRimddpPTUrwKAxxh3ni/gfZ/YIfKzkob//6+7P6fT8j7scuYygRMpbt7FQQIKvg3j9wu0uoF+RmVAvA3SVd/M2WwXR48oNccLPkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nuv1f+Di; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nuv1f+Di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724981626; x=1756517626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S00u+sMAZom70+h5Tn+g1sbaHrQM2Vncse1/WzaACNY=;
  b=Nuv1f+Di0PUwGK/66/EbG2zY43HZJE453Cz3PrI+ARrn56SD79gIsf4Y
   h/mwjDxPuIi0tPElqjdwQ3/Q7gtny8YRml89pXNqPX7KFdKjaTVJx0ACC
   4VUErsVoUvkf4iMpgFoc5h/EqyRlLUVhJJdJb0dKNnHZc9cFuZT7iLxMD
   ynMFMrJsEWGQ8OP7D6QsesT1xbXE6a+oQ5g5qoh/i1nJ8IHUBC8y313z+
   OEPif8xhC1mfUUT9OBZsqPvHGlb/EMed/w77AWwwB4y1ki5C2bKuD2LyF
   LSnDpF5loXDEUuvxlFbKWlFCZlaHMXCWkfZi5FszdqMII892W/JuwNPAH
   w==;
X-CSE-ConnectionGUID: XbuxCr5KRWe6/VGPsZDGSA==
X-CSE-MsgGUID: 1sYXUS6YQAC+VBWALE3WpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="46119804"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="46119804"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 18:33:45 -0700
X-CSE-ConnectionGUID: FIm8TtInQf2MGnY6VH8QqQ==
X-CSE-MsgGUID: Qyfaf2riSZuKA8X2O6H4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; 
   d="scan'208";a="86985990"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2024 18:33:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjqWD-0000ri-2G;
	Fri, 30 Aug 2024 01:33:41 +0000
Date: Fri, 30 Aug 2024 09:32:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/7] nfsd: add support for FATTR4_OPEN_ARGUMENTS
Message-ID: <202408300938.JuwmtIFM-lkp@intel.com>
References: <20240826-delstid-v2-3-e8ab5c0e39cc@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-delstid-v2-3-e8ab5c0e39cc@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 55f9aa30de14b6ec52940adeb4790c15247fed40]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/nfsd-add-pragma-public-to-delegated-timestamp-types/20240826-205313
base:   55f9aa30de14b6ec52940adeb4790c15247fed40
patch link:    https://lore.kernel.org/r/20240826-delstid-v2-3-e8ab5c0e39cc%40kernel.org
patch subject: [PATCH v2 3/7] nfsd: add support for FATTR4_OPEN_ARGUMENTS
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240830/202408300938.JuwmtIFM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300938.JuwmtIFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408300938.JuwmtIFM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4xdr_gen.c:5:10: fatal error: linux/sunrpc/xdrgen/nfs4.h: No such file or directory
       5 | #include <linux/sunrpc/xdrgen/nfs4.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +5 fs/nfsd/nfs4xdr_gen.c

a5d1a86a2b739f3 Chuck Lever 2024-08-19  4  
f96781780f53e55 Jeff Layton 2024-08-26 @5  #include <linux/sunrpc/xdrgen/nfs4.h>
a5d1a86a2b739f3 Chuck Lever 2024-08-19  6  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
