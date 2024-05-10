Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21491BDC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 18:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715367211; cv=none; b=VYpHaVH5K2+Y4ydHGEv4HqoN+pLC+8eFlYINFGMhEiTqhY10UW5tpWyprSk4GU7QBjbfyZ+yrzqtMkMa7lehP7H5egDxnqS94MatxLJYc45aTeyWtqQ/cghZHGE3IkMWDOFV47NP/Cs42wwnzz4qeKWWPPbj/b056I8vedJkHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715367211; c=relaxed/simple;
	bh=MHGKt+62ash7YouIqjmurWnjbos2TP14xUeE18wJuoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbOLGr+NRWDathcb6Hkqq30zw3qXIMGnedTxG7wNC47tKIBURIGnOWiPIcIxrTn1iPEjBbeHvIoKYE0VqFLB9cL2LhPJr/bev2L50HRUWTxN3kO0xDy/67qenZconORBjlcAnq3cBAWxxHXpl5azJsuh0LnLUDkx3grHc0PC3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFwNjXir; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFwNjXir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715367210; x=1746903210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MHGKt+62ash7YouIqjmurWnjbos2TP14xUeE18wJuoo=;
  b=WFwNjXirZBdymJ1WFBAIt43YQJKHIjiiuxiyL3kMOKPbzWHC+ohIILWl
   rGRRRvgGXHonKYjtCKmPUzw/DKpiqbxWWsbHFoNb7NohhoadmI2ifcgMz
   7EMeksvFrV+tKt7LF8sQj2cBCR/Jbr012V+9Qw8J9Wn6YsqRpFpjvI8ya
   5gPCvJJ6ka1QM/CS4B86lXYswEozP9yErrZUt2pnAiX8z2bHKpmZm4JTj
   EJvE6qNevFEPt7T1V9Ie61FuR8UkJBAwnAtcvkzgEC73Mn5ZCbcOy5wB1
   TXDpy4ZSOEvYJmp+O4ddI83NXy4wKDgC+6u0U3lGS9PgazaxQujzAJ5gq
   g==;
X-CSE-ConnectionGUID: pvvL+XA4R9C7lIyrJvnB1g==
X-CSE-MsgGUID: 9CQCY3OiQjGENGGMHdOe+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11491092"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11491092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 11:53:30 -0700
X-CSE-ConnectionGUID: rYEsTmAWTb+NPWIlx8tb5Q==
X-CSE-MsgGUID: gg1RnP8cSFWB80vLfBzFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29767808"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 May 2024 11:53:28 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5VMz-0006Ut-25;
	Fri, 10 May 2024 18:53:25 +0000
Date: Sat, 11 May 2024 02:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v4 7/20]
 include/linux/nvme-keyring.h:23:16: warning: returning 'int' from a function
 with return type 'struct key *' makes pointer from integer without a cast
Message-ID: <202405110213.cB399tLO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v4
head:   8986008182ed104f529376181e6cfd13efa627e2
commit: f8255728afb5a8dc18988742ac844e0b690b5288 [7/20] nvme-keyring: add nvme_tls_psk_refresh()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240511/202405110213.cB399tLO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110213.cB399tLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110213.cB399tLO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/configfs.c:18:
   include/linux/nvme-keyring.h: In function 'nvme_tls_psk_refresh':
>> include/linux/nvme-keyring.h:23:16: warning: returning 'int' from a function with return type 'struct key *' makes pointer from integer without a cast [-Wint-conversion]
      23 |         return -ENOTSUPP;
         |                ^
   include/linux/nvme-keyring.h: At top level:
>> include/linux/nvme-keyring.h:20:20: warning: 'nvme_tls_psk_refresh' defined but not used [-Wunused-function]
      20 | static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
         |                    ^~~~~~~~~~~~~~~~~~~~


vim +23 include/linux/nvme-keyring.h

    19	
  > 20	static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
    21			u8 hmac_id, bool generated, u8 *data, size_t data_len, char *digest)
    22	{
  > 23		return -ENOTSUPP;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
