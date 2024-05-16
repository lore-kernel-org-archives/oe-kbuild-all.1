Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9014533D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715881100; cv=none; b=u2SxMSMdUqVVPJxSsB9ln8dKXn42KkTFNiaQ9cRB/asL6G7SuX74IVOlNhJnBofaHJhirMh4k3EDc3G4r1fpfcDNfNcGAZ65WzCla8PRFMsM/F18r4C7XoXbejFz7g3BIvjioee7bWZqepawiHBi0V3ZciMQvpMhy9uBDPkMkHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715881100; c=relaxed/simple;
	bh=vFLu7l39073N0IRlIdMuCpE0cjPmmcXpX4+6rvPTR7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WSgSMgy5NQHknm17NU994DolMiva0TULECAM44q3AsAkMkNBzOia53YdNwPxg1wHw+nrEnDOMVQT0xoTMWyaCf+0LRFPrvv/IFxBZwY+PmwhkKb6gdMcQW3zneg9JAo1CdZS42twIRjcZ0fSgZAAyy5tKSjDJ7S6ERnBGJ7RRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nyh20r8E; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nyh20r8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715881097; x=1747417097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vFLu7l39073N0IRlIdMuCpE0cjPmmcXpX4+6rvPTR7I=;
  b=Nyh20r8EXDNe/l5wHZ/dEkHhN7zb4j2362YD5BIrAqn5Zecw/l+bxVfP
   KNpIT6c29zm0tVihT99DUBVdXsQZgdXv//34O7i/iuMhjIJoVERwM+sNC
   LlqDcuTSo68YRW66bJQiHD2YeeUI07id53d+p4pPYZUZQ6WCnsP7Oqdqn
   dLVxlYtuzpQIJdd2GqVFa2ny6K12P8GqRQaInx/o6A1unCXRdNl64oBGW
   JCibkxyi2Fml74KpdpayrgTqLF0Vy4XDNBLBF8oWIw/ocZhQsbi/ozPpF
   gtpQL2HrFWNhVqrYhNRVUVfWZLM79IiHsx8AJvysTR/qp0AMemuh+5C4I
   Q==;
X-CSE-ConnectionGUID: T9U/INNDQO+e0lvgZ/orbg==
X-CSE-MsgGUID: /pto3n3BRA+xnI27J6I5EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12130673"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="12130673"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 10:38:16 -0700
X-CSE-ConnectionGUID: 4UIlnjoPTPaOUdp1Yl0tjA==
X-CSE-MsgGUID: b9GrQJo+TSWGgorFr0g4og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="31343352"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2024 10:38:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7f3U-000EXl-18;
	Thu, 16 May 2024 17:38:12 +0000
Date: Fri, 17 May 2024 01:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8557/22438] mm/swapfile.o: warning:
 objtool: missing symbol for section .text.unlikely
Message-ID: <202405170118.NQpCse4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8ac9764e4f9b88e554a8dafd8283dab32512691c
commit: 775947c125d5bd6e00e0dcf9d12c57fd5d44d07f [8557/22438] asm-generic: fix -Wtype-limits compiler warnings
config: x86_64-buildonly-randconfig-001-20240516 (https://download.01.org/0day-ci/archive/20240517/202405170118.NQpCse4L-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170118.NQpCse4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170118.NQpCse4L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.o: warning: objtool: missing symbol for section .text.unlikely
--
   In file included from include/linux/sctp.h:57,
                    from net/core/dev.c:145:
   include/uapi/linux/sctp.h:390:1: warning: alignment 4 of 'struct sctp_paddr_change' is less than 8 [-Wpacked-not-aligned]
     390 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:719:1: warning: alignment 4 of 'struct sctp_setpeerprim' is less than 8 [-Wpacked-not-aligned]
     719 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:718:33: warning: 'sspp_addr' offset 4 in 'struct sctp_setpeerprim' isn't aligned to 8 [-Wpacked-not-aligned]
     718 |         struct sockaddr_storage sspp_addr;
         |                                 ^~~~~~~~~
   include/uapi/linux/sctp.h:732:1: warning: alignment 4 of 'struct sctp_prim' is less than 8 [-Wpacked-not-aligned]
     732 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:731:33: warning: 'ssp_addr' offset 4 in 'struct sctp_prim' isn't aligned to 8 [-Wpacked-not-aligned]
     731 |         struct sockaddr_storage ssp_addr;
         |                                 ^~~~~~~~
   include/uapi/linux/sctp.h:783:1: warning: alignment 4 of 'struct sctp_paddrparams' is less than 8 [-Wpacked-not-aligned]
     783 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:775:33: warning: 'spp_address' offset 4 in 'struct sctp_paddrparams' isn't aligned to 8 [-Wpacked-not-aligned]
     775 |         struct sockaddr_storage spp_address;
         |                                 ^~~~~~~~~~~
   include/uapi/linux/sctp.h:896:1: warning: alignment 4 of 'struct sctp_paddrinfo' is less than 8 [-Wpacked-not-aligned]
     896 | } __attribute__((packed, aligned(4)));
         | ^
   include/uapi/linux/sctp.h:890:33: warning: 'spinfo_address' offset 4 in 'struct sctp_paddrinfo' isn't aligned to 8 [-Wpacked-not-aligned]
     890 |         struct sockaddr_storage spinfo_address;
         |                                 ^~~~~~~~~~~~~~
   In file included from include/linux/if_ether.h:23,
                    from net/core/dev.c:92:
   include/linux/skbuff.h: In function '__skb_metadata_differs':
   include/linux/skbuff.h:3501:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3501 |         case 32: diffs |= __it_diff(a, b, 64);
         |                        ^~
   include/linux/skbuff.h:3502:9: note: here
    3502 |         case 24: diffs |= __it_diff(a, b, 64);
         |         ^~~~
   include/linux/skbuff.h:3502:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3502 |         case 24: diffs |= __it_diff(a, b, 64);
         |                        ^~
   include/linux/skbuff.h:3503:9: note: here
    3503 |         case 16: diffs |= __it_diff(a, b, 64);
         |         ^~~~
   include/linux/skbuff.h:3503:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3503 |         case 16: diffs |= __it_diff(a, b, 64);
         |                        ^~
   include/linux/skbuff.h:3504:9: note: here
    3504 |         case  8: diffs |= __it_diff(a, b, 64);
         |         ^~~~
   include/linux/skbuff.h:3506:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3506 |         case 28: diffs |= __it_diff(a, b, 64);
         |                        ^~
   include/linux/skbuff.h:3507:9: note: here
    3507 |         case 20: diffs |= __it_diff(a, b, 64);
         |         ^~~~
   include/linux/skbuff.h:3507:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3507 |         case 20: diffs |= __it_diff(a, b, 64);
         |                        ^~
   include/linux/skbuff.h:3508:9: note: here
    3508 |         case 12: diffs |= __it_diff(a, b, 64);
         |         ^~~~
   include/linux/skbuff.h:3508:24: warning: this statement may fall through [-Wimplicit-fallthrough=]
    3508 |         case 12: diffs |= __it_diff(a, b, 64);
         |                        ^~
   include/linux/skbuff.h:3509:9: note: here
    3509 |         case  4: diffs |= __it_diff(a, b, 32);
         |         ^~~~
>> net/core/dev.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
