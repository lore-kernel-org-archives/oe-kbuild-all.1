Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0C17D341
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 19:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194711; cv=none; b=Uw4YNcexSSmSK13JwmOzwzKLdX9LVU0hrtt6qK41xXd4TbCFf/+8skx70vYiZ96bRKXQ3nQdXhzycYgJCPiSAy6+hwKavOahQdwe0UqiYUoAXDcXAicunaLYwL6IeHESDbEbopOv0LW73v3ke3opOEdugCa2Z4iZW/AWIAS/l9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194711; c=relaxed/simple;
	bh=7clHmBVdDO7eg7TIGu17ivDXSn20mIQLGFhfjiqfBf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amDXIJ39fctrb9jxR6gftYRCcPPWaKimH2bqyE+/yRnjv25vQytmibGhoOwuVTyRJTlBGlb5XejMq/8xlgR+ZNcndQUdyjwAQqmga3EISFLbkvICayfTfijMF58kvC6rj0iFw9zJsyX9pNUGcBFzz0Ocns0XIDmUTPuGPx5K+fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TdqhjeXR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TdqhjeXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729194706; x=1760730706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7clHmBVdDO7eg7TIGu17ivDXSn20mIQLGFhfjiqfBf0=;
  b=TdqhjeXRSieuX3CnM/MtzscDY4h8T0KWI8mkK432iXgs6jf8u9Km3mdv
   n83PSA9bzEcfkqfrqmLv9Nm8pgLJjXKr+X0eSPTHqH0cD8Ua0SuDjKt7n
   piEnJUsp8GZQr8YKVGM3fY2ARHeGYA2Uawougjjaza4Wv9DBW7hGSqCxs
   X3MfrSFIHejT2yvCypu3eGlQLdjLhLafgSc+wJLGJ9JWigJ+ydySUbtN/
   zhENCDI+hCOqmlx3ViM+xetNBtoTg3k5XcmANOO/f2Sj0iuVROoNetfZp
   Xr1MkJChUdDo4qKZFHU4jthVg/8lNu6ZTS4owXl1XaYTUUALoALkYEQab
   w==;
X-CSE-ConnectionGUID: xR6hF9NESVyrHfqIbP12hA==
X-CSE-MsgGUID: PkBLc/lUS+W/5JtsJr7CAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39827310"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39827310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 12:51:46 -0700
X-CSE-ConnectionGUID: 2uJQVyPsQtG6AnVKMF11JA==
X-CSE-MsgGUID: Z6JirABtTBqjov7JCSV1DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78617451"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2024 12:51:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1WX8-000Mqd-27;
	Thu, 17 Oct 2024 19:51:42 +0000
Date: Fri, 18 Oct 2024 03:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4004/5321]
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800:
 interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too
 short
Message-ID: <202410180310.4ytsUqy2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: f5b788d0e8cdaac7df6ec9a24926672965d87dfc [4004/5321] arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
config: arm64-randconfig-051-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180310.4ytsUqy2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180310.4ytsUqy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410180310.4ytsUqy2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4146.11-4156.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
