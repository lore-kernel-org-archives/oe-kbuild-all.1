Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E6118DF75
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 11:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695451; cv=none; b=Sq2B18b/U3NbTnqAGLyQQwT4fNBeMChTL/7lfUbTmEZxtb3DDG9NoinvAIkGyHxr260tC8QaT4ZynwedQdczshaT5Kp7+IZc+sWR2yfNmLQX+r8UsRCyYAXsnRwOwoDIlCa8HaY2CRqW6VmKFEjcE8RckkVwLVPAUGzBby+4HnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695451; c=relaxed/simple;
	bh=r+IC8mVUa+i3BvoWA8Pyja4j7xKMaSzutI8qWszTNOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOiJi6boXaLHBFXQEwqKjReYPP2cMwEfZm5OEsAJrwJvksaEszx1jVswn4mLUcJPN4dT1B4Fi4AsBUAmGdJ1fCf++WJWYzrzuG8aY4o+q3T5YpQqBzb04nswJNO1FqOvjIzmvl1C8LmEUkE1vB52eEvy6jtG36nq3qlcB+8TxKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kV4lIc0Y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kV4lIc0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727695450; x=1759231450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+IC8mVUa+i3BvoWA8Pyja4j7xKMaSzutI8qWszTNOc=;
  b=kV4lIc0Ya6QpCDlRKqV/p5PBsaeKZpoNtUGlOiOXg2VBZixFWmuBIj+h
   YWo8tMnyYGRTQ/0umJnqS1do/b/KfK/GeqW4kBiewXCm6K7zNpiYRS6ik
   csIQNsA7wOrlsJXgWIIML0/v83uw2mG1CAYVkOzm31xR981fpFZEnQSll
   ukWmLKYXtNItNoZASM4LgbGNTv2SlGpWWvjCQ0MmQYyTFK9HygoRB7RXf
   bCupKgZO1CLehtmMQ6muDONVSvPxeRqflzcm+8u5+VWXepcBxu/T+yi44
   K1zq0f/AcrLAjvdnG2RmMGdUynFoGPXz2C+krb0detR2oUPrjPCqrc7yM
   A==;
X-CSE-ConnectionGUID: jfUn7suZTzaQHgRgY8lEOw==
X-CSE-MsgGUID: CCAoqveqS/G4dFI8rYiJfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30574358"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="30574358"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:24:09 -0700
X-CSE-ConnectionGUID: Bo3UdkScRMq+UYg5TIsECQ==
X-CSE-MsgGUID: SljCp+LjRia+qXPXo3cbPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="96597876"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2024 04:24:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svEVZ-000POT-3D;
	Mon, 30 Sep 2024 11:24:06 +0000
Date: Mon, 30 Sep 2024 19:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7330/14264]
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c:301:13: warning:
 'check_ari_mode' defined but not used
Message-ID: <202409301900.jvcSphIC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c594039dbf93789c67e3d7fe031bada7b7fc8aae
commit: f27f159f8a8867f846422bb8f1e0f01ff1803bf0 [7330/14264] RNPGBE: NET: Fix wanrings
config: loongarch-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301900.jvcSphIC-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301900.jvcSphIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301900.jvcSphIC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c:301:13: warning: 'check_ari_mode' defined but not used [-Wunused-function]
     301 | static bool check_ari_mode(struct pci_dev *dev)
         |             ^~~~~~~~~~~~~~


vim +/check_ari_mode +301 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_sriov.c

   300	
 > 301	static bool check_ari_mode(struct pci_dev *dev)
   302	{
   303		struct pci_bus *bus = dev->bus;
   304	
   305		return bus->self && bus->self->ari_enabled;
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
