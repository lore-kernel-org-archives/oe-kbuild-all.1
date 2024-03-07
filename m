Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9664AAA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709846067; cv=none; b=sLhhkBqSoZ8jVcEspQfvO2teN8Z4yAta/flKxILk1NxnoNZwZXOs+pMP59MfLTDc1VCaLQg4tqPpqNplvjNDTnPv6RH67RBMLVfH2Dk0s9FphFQrLYbSEds6xfV2qhluacpIHHGBd5SyAdk0XD/h0e39cxzny2zC6Ls6n3iWrls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709846067; c=relaxed/simple;
	bh=jl+amsPvNvXEp4WIbg9sh4F+DGTeetyXKrQSI1XpWXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XH5iobZFZCFu8ImYCfnsAGAMnWA9d2H6cL+0d+EIlj8GUBxyajE29YwWD96fQ1TFfo+jdyeI1whaxrm0MG7qpEy/sJ+X5rl7/dmCMqN1PQA4TJuED6CegYAf45VPtCub7gpWSJC/ZdIlUSKeaZ5N01Xl0RZNjLWQdvviQkEyMCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SretKvr/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SretKvr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709846066; x=1741382066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jl+amsPvNvXEp4WIbg9sh4F+DGTeetyXKrQSI1XpWXE=;
  b=SretKvr/vP1FEstBkHpopPdc7JzvJ48XB8kd/fyZV4dkivk0+ShtBOSy
   zMOVEmu8UWEBjpYDCDdXmnFwIoCU38fOYk/HmkSNTmvGHWbGlZLYCnOxe
   66QE1bhj6dof9GJalc1py2H9jATf58iCZGvWdd9taETUuYrBf+Jo0Qxlq
   AnDkIjp/zA07Y2f9wHnz1jmQcKCQLzsjurSInBDCvU09YrBIY1NBliiYU
   TcTuZqwrntcvYyVu68MVXfH8hJQ2win2pgk+DfJ1f05nZ9lI+0ZKcpWhi
   LDTKutgBsFklZvQl7qz7gR6UhiZm92SuyAwo2WVFmu3ELAvfgv+cimwh6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="8358341"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="8358341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 13:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="10308443"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2024 13:14:21 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riL4F-0005ht-0S;
	Thu, 07 Mar 2024 21:14:19 +0000
Date: Fri, 8 Mar 2024 05:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 25/98] net-procfs.c:undefined reference to
 `snmp_fold_field'
Message-ID: <202403080540.BUxR7JD2-lkp@intel.com>
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
commit: d9324ddd538a0b57dbee8623806ff9b9f7811202 [25/98] net: dev ipv4/v6 stat
config: x86_64-buildonly-randconfig-006-20240307 (https://download.01.org/0day-ci/archive/20240308/202403080540.BUxR7JD2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080540.BUxR7JD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080540.BUxR7JD2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `dev_ext_seq_show':
>> net-procfs.c:(.text+0xe5d249): undefined reference to `snmp_fold_field'
   ld: vmlinux.o: in function `inet_getname_toa':
   toa.c:(.text+0xfdd382): undefined reference to `inet_getname'
   ld: vmlinux.o: in function `tcp_v4_syn_recv_sock_toa':
   toa.c:(.text+0xfdd409): undefined reference to `tcp_v4_syn_recv_sock'
   ld: vmlinux.o: in function `toa_init':
   toa.c:(.init.text+0x6a67b): undefined reference to `inet_stream_ops'
   ld: toa.c:(.init.text+0x6a68f): undefined reference to `ipv4_specific'
   ld: toa.c:(.init.text+0x6a6e9): undefined reference to `ipv4_specific'
   ld: toa.c:(.init.text+0x6a6f0): undefined reference to `tcp_v4_syn_recv_sock'
   ld: toa.c:(.init.text+0x6a707): undefined reference to `inet_stream_ops'
   ld: toa.c:(.init.text+0x6a70e): undefined reference to `inet_getname'
   ld: vmlinux.o: in function `toa_exit':
   toa.c:(.exit.text+0x9757): undefined reference to `inet_stream_ops'
   ld: toa.c:(.exit.text+0x975b): undefined reference to `inet_getname'
   ld: toa.c:(.exit.text+0x976b): undefined reference to `ipv4_specific'
   ld: toa.c:(.exit.text+0x976f): undefined reference to `tcp_v4_syn_recv_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
