Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863262;
	b=boNTUa3/5zh1lcsjfY/hv8pmj2ndrQ7ZN7gtvLKFSNaXOZE8c6zFla9/rAVKSfDlpkbW
	 OEnb05cVwyeOb7pLVYwpkc3RRC/MvnqXPazGBkP5lAtfPUPdFzk/Fs09S5Ss3XxGjZp6H
	 Lc1iFlZ4bZpKEzs6Bn3Kvj5axx3K/ysGt9DnBsfblmfbmE7a/u98mr9pkthjuWH+J0fWK
	 4Lj+84MrMdCms40cq1wKq/hcdIL9OUdNTsfp/BE/W7dHpMSlt7JMOqlBU9VKfULPxsBEm
	 GKYGQr/9YlqkbBiox6AjwB1cECDKEl2c6T+LdWBIZK8pGBojpLl1N01Fc4x6FMY3OMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863262;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=k806BBPv8BGjL880n9W5SMH1v96EGy7qDLie5wy76Dg=;
	b=fD4s64h0Ojx5IPOP/0HX8g6kCqtrUEkZ3+Aulnx8Z3Fl3F2S5odbAJR21EjGS52UFdkr
	 oLBSwjnI1w+OADDa/ppzHM89iQ87GG+0cwDzEu8Z5yJBiCLnwqU7V8/4XxpLcfNNm5S7Q
	 y2OO7AVzl9/JH7Q4ZIoJ0UrvxP+AGINNPJWK5BB1V0Mj/YA+xKiVsFkkhSlWujkdDy5cx
	 B++A4pd0bhtJI72eilXpgcW1uHP9f1Rbw+ds3jJ5Nz08cvMtB6O77mopoZQqBhw7RKEZT
	 W3c7ZY6v78UlRHpWHHTHsyIf1M3HosYJnAeZHucnqC4pEbzW1w/+Jq3XKdXtiLtKwRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jU2RDeu6;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3598606A322
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 21:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3598606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jU2RDeu6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794863262; x=1826399262;
  h=date:from:to:cc:subject:message-id;
  bh=9KACA+pYxG1EbQhypd02pb16Mt6h39/URHcCAPHnBO4=;
  b=jU2RDeu6UDRtrf7f9Mhu8aiwwjO8t9W76BerPJTB6e6B3rwKaAkIhR3Z
   szU9Ml6+vri8/3gVFF0UShBL54Ptb0qKsXAMJa+MSOKQ4nZZViG3tahlo
   1R5qhZnqOLFLw4iDb3hmiSxv35Z8nCXXMLy2UQjAwPHMoBB6s4AxdDb0N
   6f69lN5UpimXhh7sTEm4owvoHr0GO8WCYGjP7mMtUiBDCwiycDG05oAsv
   1Tw+BbvygfLsYDqTNzjhQCdywi9fXVNKUCNJ94kLYmb9lk8m0BCvjPieL
   BDVox329MY+/QZPFMSiglH7Ks4fXUjveSRNqIzHsgplvb9PffT5iRpNnj
   A==;
X-CSE-ConnectionGUID: jphhx5ZYSbCoAMiyDwBz5g==
X-CSE-MsgGUID: a9Il4sg+RUOi2r9IkjX/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3650838"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3650838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:07:42 -0800
X-CSE-ConnectionGUID: lW/hP+yIQK+QVz4HxkvFAg==
X-CSE-MsgGUID: 6jLIy6y7SXajm4It3m1IbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9629447"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 13:07:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT3vN-000000002oQ-2yio;
	Mon, 16 Nov 2026 21:07:37 +0000
Date: Mon, 16 Nov 2026 22:07:09 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android18-7.3 5/5]
 ./usr/include/linux/android_fuse.h:7:10: fatal error: 'stdint.h' file not
 found
Message-ID: <202611162216.RFBedIbT-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android18-7.3
head:   8bf243c0128eec0a5942f72d5025582d5790441c
commit: 03e893c277ca546cba219fa7f82b93abc0250a7c [5/5] ANDROID: fuse-bpf: Add uapi, BPF_PROG_TYPE_FUSE and CONFIG_FUSE_BPF
config: arm64-randconfig-2001-20261116 (https://download.01.org/0day-ci/archive/20261116/202611162216.RFBedIbT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162216.RFBedIbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162216.RFBedIbT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/android_fuse.h:7:10: fatal error: 'stdint.h' file not found
       7 | #include <stdint.h>
         |          ^~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
