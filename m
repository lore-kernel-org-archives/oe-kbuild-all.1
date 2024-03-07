Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E214290
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709817963; cv=none; b=gs/hK+Lk89jmELEYnKtZaUCrqtGPVsJqubMkine/D+PN1DWUZdgMbABOBayUeqEsbZgbyvv5Qc1WafvBc/jtG6VtZNoVuU99FLlEknAs1W1t54CElu8Jgx87e1fQrkATk96HCDXGzKybiKAH0k//0t2vsH+yNRQyyhYsQ4sxePo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709817963; c=relaxed/simple;
	bh=JiJ2BOXGpjAQwlw+y5pwrgZ3q7DywKdmkRxz38Pj3QE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ACqmdvoAoEsIkwBgJ26K9+azVubQdVl5T60oheS7fMX+FCe6kc4wt1UcPW5Dcn2TIl/GL2Mx1b2RxKDV7aq9oBwxehtnAowiRphfCB2PvNHZWAru7ck7Cj0yZyfHgtjDwudj6lv+kR7dg5nnrv7Ek6o0fx7Qkknnr6P8JA+ZFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7iIFRs5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7iIFRs5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709817962; x=1741353962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JiJ2BOXGpjAQwlw+y5pwrgZ3q7DywKdmkRxz38Pj3QE=;
  b=H7iIFRs5aey3tO7oEx7mK7pdIlyesQdQsXVvW0l9dLfPDlEbkpmUybEQ
   jvb1DNz5aLoSVpTVwX4aT+UBVySx7TQZaNVsKbivGu/3Ov1PIeFJc2Ahw
   uyXa1ja55b9ULOVcWltXWGSi/y92kgig8y48xydpfLwvi2QRLwKZaLGGw
   /HZNUW/FT8dqD+QEi5u1JBrunHw2OVZz6tqTPVoOHQs0l1/cgQq8yG2DB
   Y9s0AZDIatcYUrlHtTfmmMpLTWVrkSk3qQuP3ssiXWtm9IK+O8Fy2Hxqm
   9YGUjkJdJiaBkjFkjB+iQcY5TELWXAzn/70IjrUjNiNilmEFwFyq+LfHW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4626256"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="4626256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 05:26:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="14767973"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2024 05:25:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riDky-0005DF-16;
	Thu, 07 Mar 2024 13:25:56 +0000
Date: Thu, 7 Mar 2024 21:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] toa.c:undefined reference to `inet_getname'
Message-ID: <202403072123.wzz9qB1j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   8dcb1461d4be3fd869342518d63355cc46a7c1f9
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: x86_64-buildonly-randconfig-006-20240307 (https://download.01.org/0day-ci/archive/20240307/202403072123.wzz9qB1j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403072123.wzz9qB1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403072123.wzz9qB1j-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `inet_getname_toa':
>> toa.c:(.text+0xfe3962): undefined reference to `inet_getname'
   ld: vmlinux.o: in function `tcp_v4_syn_recv_sock_toa':
>> toa.c:(.text+0xfe39e9): undefined reference to `tcp_v4_syn_recv_sock'
   ld: vmlinux.o: in function `toa_init':
>> toa.c:(.init.text+0x6a64b): undefined reference to `inet_stream_ops'
>> ld: toa.c:(.init.text+0x6a65f): undefined reference to `ipv4_specific'
   ld: toa.c:(.init.text+0x6a6b9): undefined reference to `ipv4_specific'
>> ld: toa.c:(.init.text+0x6a6c0): undefined reference to `tcp_v4_syn_recv_sock'
>> ld: toa.c:(.init.text+0x6a6d7): undefined reference to `inet_stream_ops'
>> ld: toa.c:(.init.text+0x6a6de): undefined reference to `inet_getname'
   ld: vmlinux.o: in function `toa_exit':
>> toa.c:(.exit.text+0x9757): undefined reference to `inet_stream_ops'
>> ld: toa.c:(.exit.text+0x975b): undefined reference to `inet_getname'
>> ld: toa.c:(.exit.text+0x976b): undefined reference to `ipv4_specific'
>> ld: toa.c:(.exit.text+0x976f): undefined reference to `tcp_v4_syn_recv_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
