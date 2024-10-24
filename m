Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76914F12F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729780803; cv=none; b=bPo/k3Iz7EaCx0WNJ5VaY8c33BccwB2G+ghAKJExPbEaMPnafHOLJnyNlNwTFt9AeOwozQTr5bDKXigo69MRmm0u+Qw3hvK//ADUjaeWHm3ousPxGN8Ps09j84vHKTW3MEcjDSWteCJU4YXRritM/rf54ia4PqPyktlMqxFS3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729780803; c=relaxed/simple;
	bh=CwDIeWvKEXr+2d1rKwezVrTpPVEyQZ6689gB7M1gT6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OaqnZARkzQaU4ICM554mEHSGu5fHvCEnwR9HWv7tFAhJ/p3z4rEGgR70yrS/wBg1mLKBjRZibDujx0z5LFDj0CexHkZYuvmaOILDm+O17mS/aHEibfot1HJsTBkpGM0s2T2XOhP2O8VOn/sr5BoCj1w5JFJ2o2Ogb2ban9dt9c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2eNlRja; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2eNlRja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729780801; x=1761316801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CwDIeWvKEXr+2d1rKwezVrTpPVEyQZ6689gB7M1gT6o=;
  b=U2eNlRjaUqxZUCYwCrkkB/tonvbXGqigIuyJGrm+Ba2K6K2TBQyf49de
   dfC5E43zuLTohn/5adrl/+rljSP4uT7ndSg9Bc3v1PrIi9AHLyF/AdQFl
   +BqLOuN6SDVgMiNhDwUc+nsL94/8bacmsWfDmQjB8PgxLo4sWSqZH8P9E
   imknYLejjIOsZMx93rJ9lhTgnmRADNKEaWraNjc3SPNCD1sm4cWg+BIdn
   7L4q1LEpPw71KOAFZ9aWsQK7FSLeLzoYyp45NZG9jMuVyydM7zS+6BgCy
   8jyl+iTMg4dhDLed83NwiHT2Fx/xuhhvoeF4O4Ah41djW8vDzIvLMu1oZ
   w==;
X-CSE-ConnectionGUID: Z5BFCmkMT+a/eDROOS2M5g==
X-CSE-MsgGUID: RVoLx0BERh+0QrNlbaygDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32269832"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="32269832"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:40:01 -0700
X-CSE-ConnectionGUID: xexQNmJqT7yir1q2qsBndg==
X-CSE-MsgGUID: LlcM0ZhDQ9+I2UtSTrHkQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="111421541"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Oct 2024 07:39:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3z0F-000WXA-28;
	Thu, 24 Oct 2024 14:39:55 +0000
Date: Thu, 24 Oct 2024 22:38:55 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6278/13046] vmlinux.o: warning: objtool:
 rep_xcrypt.isra.0+0x39: return with modified stack frame
Message-ID: <202410242227.Q48yML1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 07428127920a146709701a1cc907ba297b9f4141 [6278/13046] Add support for Zhaoxin GMI SM4 Block Cipher algorithm
config: x86_64-buildonly-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242227.Q48yML1T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242227.Q48yML1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242227.Q48yML1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sm3_generic_block_fn.part.0+0x1d: BP used as a scratch register
>> vmlinux.o: warning: objtool: rep_xcrypt.isra.0+0x39: return with modified stack frame
   vmlinux.o: warning: objtool: .altinstr_replacement+0x4e2: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
