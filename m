Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A26F17CA09
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725197329; cv=none; b=X7eAyvU6IQho/cLMIZiqW+tvmget3RwSN3fTwC+PQrR/U2eCqfQWjitIxmR+VZjp2meoUix88z80036N4A4FqwvyJP/u2WyAeDFllKKzr2b3s9tlqA6K4HNdFXgkC9B+eRo7J3nHn4wjvK5I5O3l5z9cchJQ8URGMYwfpJKyEPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725197329; c=relaxed/simple;
	bh=G9X0Ik3GkXVMs0qMSLrDrtcQjeRdpnOkW6jVj7+/FKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F91oLXe0/QDrrcF0QVsLv8hMEipc+trOcSfiOzlvcIjTw59OuKMVoh8XXXaBmH6IRLurR9i89jx7syuYIbTrfleP7Uw46/0R72Lyq4gj85HLiATaDeZ+Q3+Qhr7kM2wVXH5exrDyOwX+P+5/1o9pkzCGGcoLpXj3TuGB6JZNgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzJ7zbGR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzJ7zbGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725197328; x=1756733328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9X0Ik3GkXVMs0qMSLrDrtcQjeRdpnOkW6jVj7+/FKk=;
  b=EzJ7zbGR2eToTCEBHj4UD4b5GQ0jXkXrNcnNGCohEr0sHaER47CZMpfD
   h9vpttCwI92gVhsLyMyuMp3nGP2RCnR/L/Xvu1RXH7xbwyZEnRLSv8tdi
   WIxGVY7jba7mK0Csj5TTCDXO0YJCPf2HQbeKJZip9djGnJYE6GTP8CUej
   Di9eQYGTgBM/vMF50xM96X8K1TAcxTMfQNjx2mpsiAsvRHyQGJNalbEqA
   rA/VeFXiOnRDmq8Zpza0+vGdKltpg06hKFDJQQ/ogqtXAzVv6coh/w5PG
   wWKu/j+6PcLpQ8C62U6+l9DPdOa450tLRHcuquIzTe6ir5GuXcg42lLV9
   g==;
X-CSE-ConnectionGUID: vNS+TLIhRRWqMSrWFy6XWQ==
X-CSE-MsgGUID: Xh6jjL+6QRqfGqDonymztQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34446828"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="34446828"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 06:28:46 -0700
X-CSE-ConnectionGUID: oxzZow1AR1GI69ZBIxKy4w==
X-CSE-MsgGUID: 4PGoj0gVTUaPaAWqINSzpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64388336"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Sep 2024 06:28:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skkdG-0003gh-2O;
	Sun, 01 Sep 2024 13:28:42 +0000
Date: Sun, 1 Sep 2024 21:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next.v14-neilb 26/26]
 fs/nfs_common/nfslocalio.c:57:15: sparse: sparse: symbol 'nfsd_mod' was not
 declared. Should it be static?
Message-ID: <202409012124.f9orpSnc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
head:   70cce93a681fa1956cb736e574953994bfd5aae0
commit: 70cce93a681fa1956cb736e574953994bfd5aae0 [26/26] neilb's __module_get changes
config: parisc-randconfig-r121-20240901 (https://download.01.org/0day-ci/archive/20240901/202409012124.f9orpSnc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240901/202409012124.f9orpSnc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409012124.f9orpSnc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs_common/nfslocalio.c:57:15: sparse: sparse: symbol 'nfsd_mod' was not declared. Should it be static?
   fs/nfs_common/nfslocalio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/nfsd_mod +57 fs/nfs_common/nfslocalio.c

    56	
  > 57	struct module *nfsd_mod;
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
