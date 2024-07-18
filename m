Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AD7605E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 07:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287712; cv=none; b=LOeWLKp9cGZQrsyIlat7wqSW7y37VJrWQU/Nbmr6klk+lkWQpqkxTEKFPOJbNkBM8gUqIy/ugVwe8F+Uzkc2K0xfOLUJRnTEdUCx+mePMvzFwbJ280AlD32SSGJSuDNrJ1JlgFQFK9k0UapBALeKeURz9fL3IuWPIuq8bDcXj6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287712; c=relaxed/simple;
	bh=1Zdjt/3VKK113P1VEk8Msrqf3AGBqrhNu+GJ49EjdKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXOxGhlY3b6ZexbJP5x9yRg2BI1Vn7O8v00Q3Kd5X1Kk57XyeF1qVli/O09++vzhiiFlk0xVRg+UiZXWroO3I5jXq78uH5d3sHqD1sSMOH/jv2OXe6i4v/FkTZuv4vcfx/PS3IL6WgWkUMo7/9uuEF5ZesO7wJiojaXRV/Rgyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNQRpJ32; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNQRpJ32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721287711; x=1752823711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Zdjt/3VKK113P1VEk8Msrqf3AGBqrhNu+GJ49EjdKk=;
  b=PNQRpJ32QkBYPEVESowlGJX6CQrAv4xU/1itznK39dIgDRlhLnk3i/17
   GEM7P3cn7SRCW8jhkTByT1rbtNSbhT7u/0crPBNL6AQmbRdtEbc+GSt28
   8WrzQtkdAm76RN73nB13Ypqqu0r+bwiZR+4uTCkQIhT/ZMAhEeKtP+mUv
   Ik07hCqAYB+nRGyq/Ue3jRp3Wt8+1g7huoUR9aoWs3XKCAdOcQEX0kGim
   DDo5bCwMuCVycltQArIy+h6M7XYw5H5PdyfhH0GojhKy7wKo0sRMy/rcg
   fQUzWXWzC9KO0xdCdxlJb5bW9OXMuJ8xTrxQGMVQkEEVvTOJNNSIVXvqy
   g==;
X-CSE-ConnectionGUID: SZKIVTpYT7iNnRGlbvKMvA==
X-CSE-MsgGUID: mjL/PXOzTnGGECccLZu2Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29990314"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="29990314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 00:28:30 -0700
X-CSE-ConnectionGUID: pKeFhikHTlOawwx9nH0Pwg==
X-CSE-MsgGUID: Ag38n0P0QNuuP9uERMNrCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="88158440"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2024 00:28:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sULYx-000h3X-0L;
	Thu, 18 Jul 2024 07:28:27 +0000
Date: Thu, 18 Jul 2024 15:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:secure-concat.v5 11/16]
 include/linux/nvme-keyring.h:23:16: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202407181537.J6IsR1qE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git secure-concat.v5
head:   4d58e409712027c1084413a8c31e93af4d148650
commit: c85200aaab7f1248dd0142da172df0047ddbb812 [11/16] nvme-keyring: add nvme_tls_psk_refresh()
config: i386-randconfig-061-20240718 (https://download.01.org/0day-ci/archive/20240718/202407181537.J6IsR1qE-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181537.J6IsR1qE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181537.J6IsR1qE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/nvme/host/fabrics.c: note: in included file:
>> include/linux/nvme-keyring.h:23:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected struct key * @@     got int @@
   include/linux/nvme-keyring.h:23:16: sparse:     expected struct key *
   include/linux/nvme-keyring.h:23:16: sparse:     got int
   drivers/nvme/host/fabrics.c: note: in included file (through include/linux/miscdevice.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +23 include/linux/nvme-keyring.h

    19	
    20	static struct key *nvme_tls_psk_refresh(struct key *keyring, char *hostnqn, char *subnqn,
    21			u8 hmac_id, bool generated, u8 *data, size_t data_len, char *digest)
    22	{
  > 23		return -ENOTSUPP;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
