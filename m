Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286091DED6F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739955037; cv=none; b=GNdiEKq9++H5EIe9OuF/K324DJT3vF+8U6//+M+xs0Yhp5zUHsNz65L3F2EoGj1FFfejXyY3S24Ef2K3U6wYf84QfMlo6ACoxhVuKX0j/KtbxmNjJoLqRSWrWTxG0yW2l2Wy9P6mzArQim72+7UdUCg5aQySYq3PC75CZrLi+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739955037; c=relaxed/simple;
	bh=pyPUJAv8CKd5XNbCuJ2XHSJLEqvmF2CYGNx9FNnBHD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAUAHFPMGh+c7SOKOWjjV/PHYHzIg8yJzQNdhiF2kkRyesxynzfQm/sTzre0jBm1tr9Bs3hViPPWXTTMPX4AFmKByyLsrjdy4c2HB7H5h6yRs8EuiXDtMbwj+QZEjSlKIW7PEJf7xr8T7+w5PoQt0nq9JN21xRvq+62OGy86Vi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXMDPxoX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXMDPxoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739955034; x=1771491034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pyPUJAv8CKd5XNbCuJ2XHSJLEqvmF2CYGNx9FNnBHD8=;
  b=WXMDPxoXXnYSqDtEeaxUTu8JgXGJw2wpgHDjFCozT5rFlz/jR5QHgFpf
   oKnURFxU9X4hQ6HTwpIXlmVvPs9d3Ptnh2RpN0ZPLg8lvMPu1iJ9Sh9Jz
   uxcx8X5GS385ggzB68TipiuhKKX3oz2TkAYuZ1MrnU6Os2GZpnQnxZbG0
   OiVpUpO05+4FQYDti3xEMHlK89qWylJjA4q0/0TK11gQxdkAJW2JncULr
   nEiF4AcbE6aEwCyA1OJNq/45r3HX/sQX9RniUgfm8HH+pgXYqVgxfacrl
   sHgZeWZrUh/FBBDluZ8vttiNTTRViRCWk3xBPehucL0AY3gZI8fugN4Bb
   g==;
X-CSE-ConnectionGUID: 6oEFeTtWThCu6XBVg4h2Qg==
X-CSE-MsgGUID: Hydd+8gDTVCaGizTHpYYzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28279437"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="28279437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 00:50:31 -0800
X-CSE-ConnectionGUID: jXY9OT07Re6DaH7GoSicdw==
X-CSE-MsgGUID: ApdnotaiSduhmIbZ6/4kVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137900915"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2025 00:50:25 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkfmh-0001d9-0z;
	Wed, 19 Feb 2025 08:50:23 +0000
Date: Wed, 19 Feb 2025 16:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Chen CJ <jason.cj.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Fei Yang <fei.yang@intel.com>,
	Zheng Xiao <xiao.zheng@intel.com>,
	"Chi, Mingqiang" <mingqiang.chi@intel.com>,
	"Dong, Eddie" <eddie.dong@intel.com>
Subject: [intel-lts:pr/59 1/1] drivers/pci/pci.h:183:41: warning: 'struct
 msi_desc' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202502191620.PQnvG9Po-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: c22623595765848d46aad881681409ba4e90bd1f [1/1] x86:cwp: add write_msi pv ops to intercept pci msi write with pv method
config: s390-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191620.PQnvG9Po-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191620.PQnvG9Po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191620.PQnvG9Po-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/slot.c:13:0:
>> drivers/pci/pci.h:183:41: warning: 'struct msi_desc' declared inside parameter list will not be visible outside of this definition or declaration
    void __iomem *pci_msix_desc_addr(struct msi_desc *desc);
                                            ^~~~~~~~
--
   In file included from drivers/pci/pcie/ptm.c:18:0:
>> drivers/pci/pcie/../pci.h:183:41: warning: 'struct msi_desc' declared inside parameter list will not be visible outside of this definition or declaration
    void __iomem *pci_msix_desc_addr(struct msi_desc *desc);
                                            ^~~~~~~~


vim +183 drivers/pci/pci.h

   182	
 > 183	void __iomem *pci_msix_desc_addr(struct msi_desc *desc);
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
