Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A1E3C38
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765543083; cv=none; b=ZUfUpyAhOjAmeQLfRol5tmXKbzBoHMsYtXOYx0IMYTke7l/+mwNjSqDLQ7yrI/rCutu0kfbsWMNLiBRachCqeeAT+sYujBhteiPow1bwu7usNqbioB0AwgFeBDAd4BU4SX1S0+dotKRXnvrye7giYwC690+UzuKY5+Ow7yrxQ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765543083; c=relaxed/simple;
	bh=/U8mSX8Z6ZGuyv8/D6YuJMHYx5zyuxG1cFcyNIT8RcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+7FGjslmdLcmte+ZKAAwc5hEkwWF4dP5kAcbkgUM1l8T8n05p4qR6t/VZWIGsXY7EP9SiqlT41hE/LErjav7fPIanLn/6ESe6cjSwzmGh9K7D3a1t4AMUAqbuGrNlb1LhPXv6ovrT5lA0iLkAnJEFZeHyrKicSR2lnNpWU3Qrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mFAaFzZT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mFAaFzZT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765543083; x=1797079083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/U8mSX8Z6ZGuyv8/D6YuJMHYx5zyuxG1cFcyNIT8RcE=;
  b=mFAaFzZTYT8kp2mFGxziYvfN8UCO/Y6eNtOavF0EjyQJs02il7UMvqFF
   SqHV7+OcppCOYbbEUJgC3qQu9y8MoHhRbQWTXjfPnGyMnK/sWl2mq9MJw
   D7I9sg6QjzCsYQUVjoW5+5tYa+Fq8hb7reeadWmTT6ZfPWReoFle/8N7f
   EJRxB1hPALpRH15R8g8N9COao68L8FdaY4ZiFTagcZ3WDuNcO8hHLEBGZ
   e392QQrahltJkTIFGoN4wc5KxGnoIbocQ8+sQiaU8xt/Gs7wa1IFbejG2
   s9RPOnedsAPsrzRKApHKahS7flIwPIJOZMTK6TGL3xTFE1hVWST75Igy3
   w==;
X-CSE-ConnectionGUID: nk+7rltvSOmFxJItLFAAKQ==
X-CSE-MsgGUID: rMY4f3Y0SZ+f08dDD63YUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67487378"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67487378"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:34:54 -0800
X-CSE-ConnectionGUID: vl/Ip9JsQdePixdcz6FzkA==
X-CSE-MsgGUID: 8kB32wuESK2v8KJEbqkmmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="228139183"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 04:34:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU2ME-0000000062P-27D7;
	Fri, 12 Dec 2025 12:34:50 +0000
Date: Fri, 12 Dec 2025 20:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:3: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512122024.MnPMvwJ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: dd013ad487534c1838afc2f55efdb5daec15aace [3541/3541] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122024.MnPMvwJ8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512122024.MnPMvwJ8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512122024.MnPMvwJ8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ipsec.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_netdev.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.


vim +3 drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c

   > 3	 * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
     4	 *
     5	 * @file: sxe_trace.c
     6	 * @author: Linkdata
     7	 * @date: 2025.02.16
     8	 * @brief:
     9	 * @note:
    10	 */
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
