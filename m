Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EF136A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777622; cv=none; b=aIDZ058uVo8nYM412sq5wRaPAdbGSGK+/yVnlIKGGCC18X2aerPcpwFcUVxY5k2G+7sKJ8L8M312hhbcMD3iR4Helnquwagt6k3qjfdE2IQC06HzrZli1yvvUDPLe0KNDGKe82HUmelJEOQ5KNNKGWtP5g0WxuUdvc19mIiAs3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777622; c=relaxed/simple;
	bh=7lq2fguzNm+8Fijys2ZLscq4LEcDyXPESBuX81bOeow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MjzXfbeCxItdQg5xaP5/esr19OGer1ReWPs5xs2h+mcj7T26+U26biRrVL3F2nGGq+6DPmFSsBssrkYPO6OSmDbHP8bP9vSoXUmVIryCC9EM6pt93mgFmI4YGFPy8O+L0Dnc5H1Oh+x76PvkDaTePfiLFEE89K9aGNZp+h+WaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKiKUF7r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKiKUF7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729777619; x=1761313619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lq2fguzNm+8Fijys2ZLscq4LEcDyXPESBuX81bOeow=;
  b=QKiKUF7r3w4UKzmryXlMxelfKj1WeqOGbfyE40LrekIbHipgR+56Brvt
   wOOzMbBdtTJJoDawdpUtdY6UM7DNieusGLf4951SJ9R8kfPR6F/cxFquU
   bQdIH/yMtgu1jIMFCUxmSr2F1zy7kIr49pxwLUnHc+kjKH4iULt/ClBUr
   ogjobpiOmSNV84iOLfunWUs9N4M1eCK8w+NLY8K9F9T1nvSo1a5w5fiFG
   2pXzUmWGE0OU5ulJ915SZVFzpm5h5+KZ0pXuwusWhC4eZxriYfSa4q34Y
   GACNg+sQ/OmnVXczY5wHz1PWVlSs1p8uHvkUYCbSoKoIepbtdUMR12DyG
   g==;
X-CSE-ConnectionGUID: 0/rQtY2ZQFWsRxUCc8RoFQ==
X-CSE-MsgGUID: 38vCBmXfRhKdLv7OYIh6hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29626206"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29626206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 06:46:59 -0700
X-CSE-ConnectionGUID: F80eMI/QQAuh+MC+3qUioQ==
X-CSE-MsgGUID: UzqBsq7kR+Cf8zSsO65xuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80889875"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 06:46:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3yAv-000WUI-1y;
	Thu, 24 Oct 2024 13:46:53 +0000
Date: Thu, 24 Oct 2024 21:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6278/13046] arch/x86/crypto/sm4-zhaoxin-gmi.o:
 warning: objtool: rep_xcrypt.isra.0+0x40: return with modified stack frame
Message-ID: <202410242151.XVfm0Z0j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 07428127920a146709701a1cc907ba297b9f4141 [6278/13046] Add support for Zhaoxin GMI SM4 Block Cipher algorithm
config: x86_64-buildonly-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242151.XVfm0Z0j-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242151.XVfm0Z0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242151.XVfm0Z0j-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/crypto/sm4-zhaoxin-gmi.c:164:5: warning: no previous prototype for 'gmi_sm4_set_key' [-Wmissing-prototypes]
     164 | int gmi_sm4_set_key(struct crypto_skcipher  *tfm, const u8 *in_key,
         |     ^~~~~~~~~~~~~~~
   arch/x86/crypto/sm4-zhaoxin-gmi.c: In function 'sm4_cipher_common':
   arch/x86/crypto/sm4-zhaoxin-gmi.c:189:13: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     189 |         u8 *iv;
         |             ^~
   arch/x86/crypto/sm4-zhaoxin-gmi.c: In function 'sm4_cipher_ctr':
   arch/x86/crypto/sm4-zhaoxin-gmi.c:269:13: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     269 |         u8 *iv, *dst, *src;
         |             ^~
   arch/x86/crypto/sm4-zhaoxin-gmi.c: In function 'sm4_ctr_zxc':
   arch/x86/crypto/sm4-zhaoxin-gmi.c:350:13: warning: variable 'iv' set but not used [-Wunused-but-set-variable]
     350 |         u8 *iv = NULL, *dst, *src;
         |             ^~
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: rep_xcrypt.isra.0+0x40: return with modified stack frame
>> arch/x86/crypto/sm4-zhaoxin-gmi.o: warning: objtool: rep_xcrypt_ecb_ONE.constprop.0.isra.0+0x33: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
