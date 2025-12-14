Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84181B86C7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 04:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765685331; cv=none; b=Gw1OoP/XM4/NBhJJ6zbrynkzvwl+VSeyQclBzNlsH+V60gYa/UEUajweb+nRkMqYlVHqYCOeWTQrEfh3F2ReakS4cSFf/cDx/NZSZpxyzNv7mcLLn9SUCJH6DPeKELznK4gPj1viU1Y/PsqMyTQJNtuuIqY7KFEDr75OR5zlypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765685331; c=relaxed/simple;
	bh=oYhOQfu2NKsKcThnKjCPkE6tS/X05vC4mJXqBtN83Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K33H5C4h/RXIEFYR4DWS7/mkRLAggD6xc4CJUM1rqkX60brTvaH4YvJ+a5FUDh40sAazN0vXpkreBv55Oz26ry4PgMG1M5BDTqKMT8D7ZIp5E+n2KwGRlqIptJJfY17Lm2htoaEF2la6pEoE02XlsZ7BoqESbzfUs6a4W/UkK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hbc2oEV7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hbc2oEV7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765685328; x=1797221328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYhOQfu2NKsKcThnKjCPkE6tS/X05vC4mJXqBtN83Xw=;
  b=Hbc2oEV7Yq17SRa1iU3GTAhSaSUUJqThEx5p23CkQF8TRt7YU68sdwpx
   MaOweUVp3+wbzqqN0LQfQpNm04ITHSUdbSrA6B+0IS4GHXpW4M60cCabS
   of5pZ+eL5ca8GffSWbDPGcMjH4LCBuBgztswCRcZ6vLdqINKuGckYipmh
   GM0UkYEMpYcJJEthLQCSM/3CAAybSZAsC0I2r8H3IJJYIOShN29ciz+DV
   RDq59DzJzKXAChUlZS0myvzZZKRwdif09SDo5CF2uCXcUkhbDGMWqAI4/
   E4A5XrIhr7eSHjyX6CO808UlTI36cl8ip3YArccAyICbqudHH3fX1st7R
   Q==;
X-CSE-ConnectionGUID: iDQqg3gASs2UHN8sBya8dw==
X-CSE-MsgGUID: s0YOrNI+Qi25c62Au4x/GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79002256"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79002256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 20:08:47 -0800
X-CSE-ConnectionGUID: rLm0t9jYT0qcCUVe8XMquw==
X-CSE-MsgGUID: F6AsCexNQnSczRzZWThDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197334269"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Dec 2025 20:08:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUdPZ-000000008YT-007K;
	Sun, 14 Dec 2025 04:08:45 +0000
Date: Sun, 14 Dec 2025 12:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50]
 drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous
 prototype for 'kprobe_symbol_address_byname'
Message-ID: <202512141259.BzQMeKny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi hanliyang,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 8b22631ae702232f523b0bf4690a5435da8e23f3 [50/50] anolis: crypto: ccp: Move Hygon tdm and vpsp code to drivers/crypto/ccp/hygon/
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251214/202512141259.BzQMeKny-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141259.BzQMeKny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141259.BzQMeKny-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:151:5: warning: no previous prototype for 'tdm_service_run' [-Wmissing-prototypes]
     151 | int tdm_service_run(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/tdm-kernel-guard.c:212:5: warning: no previous prototype for 'tdm_service_exit' [-Wmissing-prototypes]
     212 | int tdm_service_exit(struct tdm_security_enhance *data)
         |     ^~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/tdm-kernel-guard.c:243:15: warning: no previous prototype for 'kprobe_symbol_address_byname' [-Wmissing-prototypes]
     243 | unsigned long kprobe_symbol_address_byname(const char *name)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kprobe_symbol_address_byname +243 drivers/crypto/ccp/hygon/tdm-kernel-guard.c

f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  242  
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01 @243  unsigned long kprobe_symbol_address_byname(const char *name)
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  244  {
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  245  	int p_ret;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  246  	struct kprobe p_kprobe;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  247  	unsigned long addr = 0;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  248  
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  249  	memset(&p_kprobe, 0, sizeof(p_kprobe));
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  250  
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  251  	p_kprobe.pre_handler = p_tmp_kprobe_handler;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  252  	p_kprobe.symbol_name = name;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  253  
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  254  	p_ret = register_kprobe(&p_kprobe);
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  255  	if (p_ret < 0) {
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  256  		pr_err("register_kprobe error [%d] :(\n", p_ret);
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  257  		return 0;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  258  	}
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  259  
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  260  	addr = (unsigned long)p_kprobe.addr;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  261  	unregister_kprobe(&p_kprobe);
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  262  
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  263  	return addr;
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  264  }
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  265  #endif
f99785a97cbf24 drivers/crypto/ccp/tdm-kernel-guard.c chench00 2024-04-01  266  

:::::: The code at line 243 was first introduced by commit
:::::: f99785a97cbf246cd0f776098186a6aeb274e40b anolis: crypto: tdm: Support dynamic protection for SCT and IDT by HYGON TDM

:::::: TO: chench00 <chench@hygon.cn>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
