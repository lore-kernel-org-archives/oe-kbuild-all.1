Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9406715E96
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798803; cv=none; b=q/HZH60jAgYDTctmQjo1g3zmsBMR5lxHDRK8j7gD4XQg43IRmgCrAGeW6TceD9CuE3wuCJfh9mjhToCzmaa9lyJd2+wzcsN+BQktHxGBCY+z9r3ZP8Y9dzd+T73hVIerf5z2ZVSAOBz8E+Vjwp/5sITf0OMQvjRoIFlgPKCyQWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798803; c=relaxed/simple;
	bh=Pn2LJXoPNHHioF96I//AcvYVwac71rqtd5VikWSdw+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hV3xwR1b6wK/qsulC/34PtFNiHq//J/YTToKHR9O22YRRXbMsQykyYc2jLZvCg/YkwABi/JMMWRtuO3x2wuQ5lUqlFiqSEBgChQFCXcM5fdHIbExl975/Mme+Cbp+7mtDk1JdSP5ga24jh7F/WKRc3pLTXlaiaQiiFU3V5dBH8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWx7VthL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWx7VthL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746798801; x=1778334801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pn2LJXoPNHHioF96I//AcvYVwac71rqtd5VikWSdw+M=;
  b=hWx7VthL9lne0S8o7vSJa2fAlkl5OgkbK3o3r1dNrXQmUcjLdcXyJeWw
   xIlidg0748I79y2XRa7kcjb0/E3rH/JIjf3UEDbtoGBPY9aSBUmt13Vr/
   Ykr6eoI4+QZVdLVe7HsMZviB01ZSmaEgZXL1z73lXgDMYDdMdJjTJV3uI
   8dRlxN+BIGTB7pkjMfIXJ/MfnAgTDaPbAbQqv1TP/Ag9qqvBtrDMgzc0b
   1IFn52VLCdJiIMbd5oqLejWgjtIt8tFB7miUojuXE8aib/h97IuXXgpos
   gbyqF0Mtdkg+6mNcS/5G3sqNBGkqypvMBDnY8YNSi0fiZQYzQ3YQTD4ZC
   w==;
X-CSE-ConnectionGUID: jyZxFgGMRQCkFbxlk+fAUA==
X-CSE-MsgGUID: gbHUOFGKR2y3LcicNZzroA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52435935"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="52435935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 06:53:20 -0700
X-CSE-ConnectionGUID: 5c+PerIJQxSEYtSqC5txNA==
X-CSE-MsgGUID: ql5yfkTxSUezx3+EdE8uhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137617866"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 May 2025 06:53:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDOA9-000C8F-05;
	Fri, 09 May 2025 13:53:17 +0000
Date: Fri, 9 May 2025 21:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94]
 drivers/net/ethernet/netronome/nfp/nfp_main.c:1128:6: warning: no previous
 prototype for function 'nfp_pci_error_reset_prepare'
Message-ID: <202505092133.4Bq8BN7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3e44eae7361a463faa2cab260363678a02c089f5
commit: 24b93510576b1bfe905af1ec32cf7fb97965bcbf [0/94] anolis: nfp: add pci_error_handler callback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505092133.4Bq8BN7V-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092133.4Bq8BN7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505092133.4Bq8BN7V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/netronome/nfp/nfp_main.c:1128:6: warning: no previous prototype for function 'nfp_pci_error_reset_prepare' [-Wmissing-prototypes]
    1128 | void nfp_pci_error_reset_prepare(struct pci_dev *dev)
         |      ^
   drivers/net/ethernet/netronome/nfp/nfp_main.c:1128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1128 | void nfp_pci_error_reset_prepare(struct pci_dev *dev)
         | ^
         | static 
>> drivers/net/ethernet/netronome/nfp/nfp_main.c:1144:6: warning: no previous prototype for function 'nfp_pci_error_reset_done' [-Wmissing-prototypes]
    1144 | void nfp_pci_error_reset_done(struct pci_dev *dev)
         |      ^
   drivers/net/ethernet/netronome/nfp/nfp_main.c:1144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1144 | void nfp_pci_error_reset_done(struct pci_dev *dev)
         | ^
         | static 
   2 warnings generated.


vim +/nfp_pci_error_reset_prepare +1128 drivers/net/ethernet/netronome/nfp/nfp_main.c

  1127	
> 1128	void nfp_pci_error_reset_prepare(struct pci_dev *dev)
  1129	{
  1130		struct nfp_pf *pf = pci_get_drvdata(dev);
  1131	
  1132		if (pf) {
  1133			if (pf->multi_pf.en && pf->multi_pf.beat_addr) {
  1134				/* Pause heartbeat timer so it can't happen during FLR */
  1135				del_timer_sync(&pf->multi_pf.beat_timer);
  1136				/* We need to write keepalive to keep firmware alive
  1137				 * during frequent FLR.
  1138				 */
  1139				writeq(jiffies, nfp_get_beat_addr(pf, pf->multi_pf.id));
  1140			}
  1141		}
  1142	}
  1143	
> 1144	void nfp_pci_error_reset_done(struct pci_dev *dev)
  1145	{
  1146		struct nfp_pf *pf = pci_get_drvdata(dev);
  1147	
  1148		if (pf)
  1149			if (pf->multi_pf.en && pf->multi_pf.beat_addr)
  1150				add_timer(&pf->multi_pf.beat_timer);
  1151	}
  1152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
