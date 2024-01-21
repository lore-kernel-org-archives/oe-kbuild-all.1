Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6045E37706
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 16:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705853899; cv=none; b=S3vGCTZaPUZWB4f8RI2lr2j1ShKGhAKDPTZ7q07mZjNUAgR8ytc73hMGmtSRdqRA8s6OcGU5MzkD7t2klqw6lk9rqq0Zi+8MAiVm5LjF/Yx3IAbOtb3LjjVYpd97OYQUKbhtScl4DYIy/oEBNPW7C3o9xx5gfxk6qD9Xgp9MsEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705853899; c=relaxed/simple;
	bh=8pRM0IInDoDJ+vCzECwjP1XetR2n2+qXonZ/KCALHqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsrARv8OiKo+U8j0XSXobVos8Y7/u4hD61ezdZ7owN9Ot2cu+WSB3/tFUVQ1Mo067eTScgG5JK1FwbDCIpjLZsZbULD9HNBCeJ++g3cZ3DSrglRQRpoalqyx6m5KO0vDVB/qnf+BUIbn7swWdFux1wbGRQjV/x4SBLj/fZP6v1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TkSn1BEl; arc=none smtp.client-ip=134.134.136.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TkSn1BEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705853897; x=1737389897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pRM0IInDoDJ+vCzECwjP1XetR2n2+qXonZ/KCALHqM=;
  b=TkSn1BElXyaTFSIeYyMKNthJ51oCoDu8hY+0S6qtdHZjeio47f3eS8+v
   8vBMYxA9YjO+NVOj6/KJTHwEgxRPpCa9J4PRdpciaEYo7x02H9B1RVSa1
   prvVYlpOz4EMtuZMHsAxbV0qzyWAHns9z2uGmvg9vcCk6IZC718cbztxI
   YWD3IVj6FYlHZg9Tc3gJ6gMupkY1wAbpEFiIY9tggOyQJHDxpkbD4VBNj
   LubjzDyHoSfDAlKsOKruUqreaZsN5cbShH5dfHUUQe6FjQofdy6UiE2Vu
   yPe+txhfN1yRemgYCRqW7YWmgg3gf8dEQ3AB9/5/iU78Ne04L1o+Ise4s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="465307162"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="465307162"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 08:18:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="1116653576"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="1116653576"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2024 08:18:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRaWT-00062Y-17;
	Sun, 21 Jan 2024 16:18:13 +0000
Date: Mon, 22 Jan 2024 00:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:6.6/linux 325/333] udmabuf.c:undefined reference to
 `vmf_insert_pfn'
Message-ID: <202401220025.2DER379x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   9fe58986e8674d72a73d6e5c010afea625409635
commit: 25afabc9050716decb54475eeb1c642d0f1d2662 [325/333] udmabuf: Use vmf_insert_pfn and VM_PFNMAP for handling mmap
config: arm-randconfig-001-20240121 (https://download.01.org/0day-ci/archive/20240122/202401220025.2DER379x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220025.2DER379x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220025.2DER379x-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/dma-buf/udmabuf.o: in function `udmabuf_vm_fault':
>> udmabuf.c:(.text+0xaa): undefined reference to `vmf_insert_pfn'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
