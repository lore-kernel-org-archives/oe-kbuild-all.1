Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD1156648
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 21:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712178859; cv=none; b=DOG2d7kSw9kGa7I9ZKuhCJ1WsyKl5DnpqfYcIqrHbL3IS9YgJnkwBgEBdypay4va7jNy+4UP2to/NOeES4iz2m6aBO0ceHnWdoxvNtiEwx7k+9rRAPoBlHvClF57z/jCN+veL4D4SA0ohuUWTHhy4++ChVFa0hKB9pCcGUK0ckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712178859; c=relaxed/simple;
	bh=ubS4dGN97f8UvKsL3ekauYbqL7niAb6hhUeuLY4wpb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A5f92cTIBT8Qykq6D2ol+eYCOJiBzgHekf1nsgVFiOvMy4DxIYIodQ46No2+EEiKSvNFnxgCuDkupv0vPTa3fPwBsQ9VH6eTY06ltMYjlDKlMB2z8vzVB5MM3vbvnGol/nTgsV/ZQJYasBs1xRv/3NBtPLUwUrlAmpmIQbk5WPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q21UlPph; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q21UlPph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712178857; x=1743714857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubS4dGN97f8UvKsL3ekauYbqL7niAb6hhUeuLY4wpb4=;
  b=Q21UlPph5JjLVwdC9C1NTmjq7zl7iio9/xhK3o26D2kMAV/K5HZqAiFa
   g9q5VieUUefkkp3JRBlFreuOE4gIUpT1sq43M2KIU+AtIOF49iS13lxz2
   IKypwkEQJZcu9Ygq1ducaJ53ozxDCyL1n0iAi30uCWhAtapL7pmaCVbRl
   EyCJH7rsnLVq+W6thPmtku+SFfsEjI2gaEBQsHPvWWb555avnrj+YWM+y
   VOFhT40yetozKNHsPr8h4P9a5sWGvkKhosLqzb9qFEkEEgTfJBZQiX8ZI
   kvyPeWgagUqCd79W5BvjnumLM6SffGQlZfNGd0iy2s6QdRP1gQlzAWC8G
   Q==;
X-CSE-ConnectionGUID: YX+4dSZ+Q4CzU89Cil/oag==
X-CSE-MsgGUID: jEti2MguSi27HZoL3GG8XA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18171920"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="18171920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 14:14:16 -0700
X-CSE-ConnectionGUID: LpunPk+qRYW3zT9e/UIdnw==
X-CSE-MsgGUID: Y7TmbVLZRiiSjuCw/5Sm9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56026601"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 14:14:13 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs7vu-0000F2-2u;
	Wed, 03 Apr 2024 21:14:10 +0000
Date: Thu, 4 Apr 2024 05:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] aarch64-linux-ld: toa.c:undefined reference
 to `inet_getname'
Message-ID: <202404040523.EHiArmKg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   e8d687b5f6eb9e01e5098c4902c223323ac40c10
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: arm64-randconfig-002-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040523.EHiArmKg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040523.EHiArmKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040523.EHiArmKg-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: net/toa/toa.o: in function `tcp_v4_syn_recv_sock_toa':
   toa.c:(.text+0x1b8): undefined reference to `tcp_v4_syn_recv_sock'
   aarch64-linux-ld: net/toa/toa.o: in function `inet_getname_toa':
   toa.c:(.text+0x334): undefined reference to `inet_getname'
   aarch64-linux-ld: net/toa/toa.o: in function `toa_exit':
   toa.c:(.exit.text+0x4): undefined reference to `inet_getname'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `inet_getname' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.exit.text+0x4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.exit.text+0x8): undefined reference to `inet_getname'
   aarch64-linux-ld: toa.c:(.exit.text+0xc): undefined reference to `inet_stream_ops'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `inet_stream_ops' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.exit.text+0xc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.exit.text+0x14): undefined reference to `inet_stream_ops'
   aarch64-linux-ld: toa.c:(.exit.text+0x40): undefined reference to `tcp_v4_syn_recv_sock'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tcp_v4_syn_recv_sock' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.exit.text+0x40): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.exit.text+0x44): undefined reference to `tcp_v4_syn_recv_sock'
   aarch64-linux-ld: toa.c:(.exit.text+0x48): undefined reference to `ipv4_specific'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `ipv4_specific' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.exit.text+0x48): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.exit.text+0x4c): undefined reference to `ipv4_specific'
   aarch64-linux-ld: net/toa/toa.o: in function `toa_init':
   toa.c:(.init.text+0x70): undefined reference to `inet_stream_ops'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `inet_stream_ops' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.init.text+0x70): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.init.text+0x74): undefined reference to `inet_stream_ops'
>> aarch64-linux-ld: toa.c:(.init.text+0xa0): undefined reference to `inet_getname'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `inet_getname' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.init.text+0xa0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.init.text+0xa8): undefined reference to `inet_getname'
   aarch64-linux-ld: toa.c:(.init.text+0xb8): undefined reference to `ipv4_specific'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `ipv4_specific' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.init.text+0xb8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.init.text+0xc0): undefined reference to `ipv4_specific'
>> aarch64-linux-ld: toa.c:(.init.text+0xe4): undefined reference to `tcp_v4_syn_recv_sock'
   aarch64-linux-ld: net/toa/toa.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tcp_v4_syn_recv_sock' which may bind externally can not be used when making a shared object; recompile with -fPIC
   toa.c:(.init.text+0xe4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: toa.c:(.init.text+0xec): undefined reference to `tcp_v4_syn_recv_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
