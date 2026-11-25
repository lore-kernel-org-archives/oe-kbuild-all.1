Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588889;
	b=N/Ps/3lYECZ0Vrn1fRlJ0FcepIhS9PdKSgaETpUbckdKoFAdWJbuQ38vxqsKonQ3R4Rj
	 MktnuIXJdy/J5DAnMhWsxyIpDSJa+oPGeqU0IJ0AhidNuZF5kUby06RkmsG10hqB3kPDB
	 x5of3dE9EM7aAIXZMhTiXyFXlCuAfbFMQAlJea41XZXOoSmvq5SNjyVyNChazCM11nhBP
	 CaqlD63YChn4R/8X9kdujJzQf0/phRt8zhlciRI8g/3DduZ0qBCTrGid2sDFHUHrx1X8r
	 Z97WkrsKHgoqo/FBXXACKPitWr+mn9R4vgxXAySE7kOmI8LzK+xxEFE/umoaPkqngQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588889;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=u5atUNrbChV5e+iAOKhnXb9EcP1M2H25brNpnAq1TSE=;
	b=tLyyZQ8wQxK9riwn9gV0/WIvx8JXB1I5yz2fYVDuoVhuOwTOoRF2KwM5gMLK5mcZuIP6
	 /xKAgT+RaTYYOyq6jPMTwUxCIg2td2u4H/odA8kO4I9duVkN0Bk40QglCguwTtU6bOQ95
	 p/lFmsU49NrcOjWf0nzS3lk7yDFdNvSUUAV9F1/z6OwVWKslacpIuQGjlhvn/10rK6v6t
	 Hz6EQ+SaPci5PWOvZezUhbDWrWb0tfoQ4NDPqw7sHCLNSBJwDWTYwhLK8yU21tLOV/SS+
	 M9e4c/nkrPudiY/RQosLcCzth1o9fJGElM+Q/544ec3vDPWE0Chew7XNJKSdbM+9cjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hA9ksVZC;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC128606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 06:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC128606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hA9ksVZC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795588888; x=1827124888;
  h=date:from:to:cc:subject:message-id;
  bh=nTpDLjz3UAIv6Pwko4zY55qCasfh8XfpvNavq7IZxTQ=;
  b=hA9ksVZCjXi284L0TDNZthlItVTcXkzwmt19Z0jZ5VLYXrc6C5+yyFAI
   QSA5FTpEyXfaOhdAFyx9jEDtcxhnW51OSIcJhWllk6lDFjNyuTpsi7PXc
   ppadOYQ0yMbwi2L27M+ybzQuEZOXVYkrLzcw5ywb9fKyoYsDiRW5zOcOB
   B2I9dpkQAXeDWKMiSWmIBf6znkTkjpjK1gtYsK/Bnm1hFWdn1EOnpaN0j
   w7Qw3f5Bic2nxkEuRILCrHO89EQng1sag6i95iwwbnX7UWX1ATJnxmERn
   jigvW2ZmZTkjrJr9NvsqsXe8MPiTHq8v4AFS3glRCLvBDHE4yMcT5knv+
   Q==;
X-CSE-ConnectionGUID: bLXgjgSbSQySB1ZKIPk/rQ==
X-CSE-MsgGUID: 5kgsWwZuRwWu1NEQedvs2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4377068"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4377068"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 22:11:35 -0800
X-CSE-ConnectionGUID: MQvwHGc6To6Kp5iXfs8wkg==
X-CSE-MsgGUID: Zb+cFfc7QpKXAUX6IbCdMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11980229"
Received: from igk-lkp-server01.igk.intel.com (HELO 99c479ab0aeb) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Nov 2026 22:11:31 -0800
Received: from kbuild by 99c479ab0aeb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW6E5-0000000003z-08pt;
	Wed, 25 Nov 2026 06:11:29 +0000
Date: Wed, 25 Nov 2026 07:10:59 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 30/30]
 file.c:(.text.f2fs_ioc_load_dmabuf+0xae): undefined reference to
 `dma_buf_get'
Message-ID: <20261125070753.UE24exxq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ff6be2559af23135abf743199d61a2d1ea23a957
commit: 4f89cba389563d156f55da6d344d5d9a16055d33 [30/30] ANDROID: f2fs: add F2FS_IOC_LOAD_DMABUF
config: arm-randconfig-r2309-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125070753.UE24exxq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125070753.UE24exxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125070753.UE24exxq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/f2fs/file.o: in function `f2fs_ioc_load_dmabuf':
>> file.c:(.text.f2fs_ioc_load_dmabuf+0xae): undefined reference to `dma_buf_get'
>> arm-linux-gnueabi-ld: file.c:(.text.f2fs_ioc_load_dmabuf+0xf6): undefined reference to `dma_buf_put'
>> arm-linux-gnueabi-ld: file.c:(.text.f2fs_ioc_load_dmabuf+0x2da): undefined reference to `dma_buf_begin_cpu_access'
>> arm-linux-gnueabi-ld: file.c:(.text.f2fs_ioc_load_dmabuf+0x2ee): undefined reference to `dma_buf_vmap_unlocked'
>> arm-linux-gnueabi-ld: file.c:(.text.f2fs_ioc_load_dmabuf+0x432): undefined reference to `dma_buf_vunmap_unlocked'
>> arm-linux-gnueabi-ld: file.c:(.text.f2fs_ioc_load_dmabuf+0x43e): undefined reference to `dma_buf_end_cpu_access'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
