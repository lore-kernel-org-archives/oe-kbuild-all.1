Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA05F2038D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729269654; cv=none; b=ekOK92CoV4TeVeHTQGBOlbJgSQvHodRMv5OCt54GShj4iS4/JXUrD6S0dQhW9Qayhf5IlbI6yy82adNX8U++dzAY8hxCJB8BaM36jfGh5rGUfT76wpdxPot6LIfhupAzC5N+M/Un6Fd18H9W4kGAHAOcm6hfPkrTmHnp6zFqtFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729269654; c=relaxed/simple;
	bh=6e53PqhAlLlnyHRb1VQ7olcv/ybUHJgIG6Bcl3Iffus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GfvnlTCx9StQ3LF8Zq3nxrW4w+PgSd6YsAiO9z/vXpJWiZjsCxwAcCkVAZLUDxElPsi/p4zVyTxccANUx7d3HtTp7EybrdNtQ5BhR4YB8ZNJ3nl7CIrJ/kyE3eIetGjwRMTKe0sQ7nUkZsi0MZAzNdlCWy9sPvcDCEjtwn5UNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LARLZ2ce; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LARLZ2ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729269653; x=1760805653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6e53PqhAlLlnyHRb1VQ7olcv/ybUHJgIG6Bcl3Iffus=;
  b=LARLZ2ceqgSx/8BPtktP3sjiiQt3hk5ObSvzFZyQWSHF0oZCjU2Cay5J
   CKVXhoyBASdDV7YwZ+E5eQZMeBbtpikh+mnkvsbmNlQ4n+eMx4mSrWw1g
   zIrJXeo1gUa/JSh0lPlPDFh1kIBJkTRRy9h6pWBHqdn42ju3g43yaHPAP
   rpnsFmnnbFJmy8BqKCYndtZm5TjNMhyVoyNAwkTxsSEZk9u5UpssXTWzt
   BNOWHkiBJ/EHX3rjIkqcSAoRtJ4GhN6h34RelKWk+u4gF4YkOjXDda66V
   8XpKMIS1WmDVlQ0fUd6/O/BCPpZcejcymU7n9fzPIVAMwvNSZBGF4lYAV
   Q==;
X-CSE-ConnectionGUID: oHOQkFhmSkqFQtaQXa4TkA==
X-CSE-MsgGUID: d0zKQbdHQFa3QuwHg3D+wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40169191"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40169191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 09:40:52 -0700
X-CSE-ConnectionGUID: 6NgjvgyIQD+dukxWaTtLNw==
X-CSE-MsgGUID: y/bILRlXR1ukV+a928Uk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="83700674"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2024 09:40:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1q1w-000O4C-2q;
	Fri, 18 Oct 2024 16:40:48 +0000
Date: Sat, 19 Oct 2024 00:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14224/14651] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202410190046.BHffJ6Tf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   980f4346f1fdbd303ad74af8b2a62fbbbb6cf6c1
commit: bad535d287c9c1056d99de3666be7da84de4a8fc [14224/14651] Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.
reproduce: (https://download.01.org/0day-ci/archive/20241019/202410190046.BHffJ6Tf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190046.BHffJ6Tf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
