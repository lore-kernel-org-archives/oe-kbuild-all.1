Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706048;
	b=d+V7OMfbxtrEYaWGMJ5IVL15QvXjFE+X7DJICi0gMG2OIRUMR/hxOEXEnubwBwAwk55F
	 I9hjyI5P1NIKFQYHEUoLC9c+YwWOIpKC2yT/Y+tHI5GLnsoHwhJURoQLSHcQ6ywR8jwKI
	 W9u9uKKs4Zap78vdiQUmI+K3w/M7WQh526a15R1Uofao3H7EqVe6GSxOO9DPw3n4a9Qaq
	 8WhcJSDhcJS8P6uuDUrynkudY0AVBaqZy5GYLsDYnhiS0AA+3ectRJ4SKos000z1Ho3tI
	 VkBIyZvZhHoAGhjeogDIeNzjbO7zwueh0O0D/4HcdCCXTR3b0KBKmh9Lr+XOIBzEqOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706048;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u+sBiYFYIERMNd94PS2nPIgRS21RQdHOPhL08BKrg94=;
	b=eKhGhQPhMNGtUtTQrrr4qjITJ6m2VSxB8X0EOliM4AVHIlfZd+1nmsI+R7bsQGSPox7j
	 XiyYG5mWxL8Yjg7RA/CXetU1Fh/QTyPgVP0GzsLv5k8HmGZv2YWcPWm5ESdFmFVlFtkWL
	 qQgnJlQkmpPElboVZPAoqGNTkIF6la01trPJYMl0FiXJEWWmQK8bsFV2WtSNXDaMTP4Gi
	 DMzE4Gb+ff6imatYXnwGjoA/Zqg7DsLywcvewFtH5yk1wcncOUHs0u3dnjIkHZDA5HZrE
	 ZjDblzpFvYyr3QzXQGKVaNJkLqu6hW8c953CwBVsYMShRR+JkwJeaFriTdaxuu/zykw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ktR5sfEE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8D606A32C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 15:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B8D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ktR5sfEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795706047; x=1827242047;
  h=date:from:to:cc:subject:message-id;
  bh=1TvKxDMVI7uK00ld3jbMQK+FLNkSikwPLwzLOLpXV1E=;
  b=ktR5sfEE8I0PwFT2PvLBTT/bbYtViwH7JAC8ezfYOEOq1Qrn8RFJuqRo
   VIIm+49XTgb+dntpHlPFn5CTNthX3oaqEBSwBr0CIzWOFbHFDYizX1d28
   r2eiVasn3q1DauzVt3PzVQ7x79JWq/QeEi3JYofxTl1shHK6hCmQmQr1T
   nsqY1gCABrQ6izgpvUYRxoSgwr4/Ae8pdOy7zX7Vgwnzu4dqhluVIQH7J
   MJy6qikEGqu/c5zlQnhwF8haSAvpFwlNSq2bFEz8tMr9JSMLQsbbwaXqt
   aTuDec+JudQTrzRCb8fNajWKHcg/UFHUpjTCPv/5WJNrQ8eT22yy2IhTu
   Q==;
X-CSE-ConnectionGUID: 34qH1uqJQ/ybCaIGwhR6Dg==
X-CSE-MsgGUID: Nn06jOSbRQSVsxkPY0IT6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4547873"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4547873"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 07:14:07 -0800
X-CSE-ConnectionGUID: lPoRWtN8QA+G2u6ofxZUlw==
X-CSE-MsgGUID: f4EnbyZzSV62kP9VlW+P5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12228213"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2026 07:14:06 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWbAh-0000000005y-0vCe;
	Thu, 26 Nov 2026 15:14:03 +0000
Date: Thu, 26 Nov 2026 16:13:48 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 65/65]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:980:5: warning: no previous
 prototype for function 'pci_write'
Message-ID: <20261126161032.qXHtS4Pe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Frank,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   36e3098ebf6d37570aab9dc5f8f4d24bd5ffdd06
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [65/65] PCI: endpoint: Support NTB transfer between RC and EP
config: x86_64-randconfig-2000-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126161032.qXHtS4Pe-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126161032.qXHtS4Pe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126161032.qXHtS4Pe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous prototype for function 'pci_read' [-Wmissing-prototypes]
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         |     ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:971:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         | ^
         | static 
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:980:5: warning: no previous prototype for function 'pci_write' [-Wmissing-prototypes]
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         |     ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         | ^
         | static 
   3 warnings generated.


vim +/pci_write +980 drivers/pci/endpoint/functions/pci-epf-vntb.c

   970	
 > 971	int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   972	{
   973		if (devfn == 0) {
   974			memcpy(val, ((u8 *)pci_space) + where, size);
   975			return PCIBIOS_SUCCESSFUL;
   976		}
   977		return PCIBIOS_DEVICE_NOT_FOUND;
   978	}
   979	
 > 980	int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   981	{
   982		return 0;
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
