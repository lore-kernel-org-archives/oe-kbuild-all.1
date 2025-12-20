Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A225487B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 21:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766266128; cv=none; b=ZEHu0Tkw/OpPYyMKlWfxiXG8x8nvwcUn41Hm80rkzaBQT+TmbpB2h0LcxWm5l/KRPukRZGODcSrdMmNuNpqZncjNsHgjtnI1l35lsipGYlkRuVb6fFQMnYa/+kQ/UateUlVBZhUCOCD+uSt6wuaMq7tTsOq6HXr9n0lrdHT48/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766266128; c=relaxed/simple;
	bh=sGsIIRwZqxu5V+RYmT2JWr+PX3aFc+VIk1V9JeVfjkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TN7acULG/VA7wAFfM9m1QWjs8ILIPRJsTfte9vyNf1suePA2cxDXfMuqIujF1glfRChxqvXvfMYUCaN8u3bBKQL1yOHE0+4wXAYgMnCTC060LavjYi3iWE8kKNnjFRZIhgvlrGkBAQiTaidpKHcZBTQbO6zwmTAIy+j5cbIRmJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcVop3Zp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcVop3Zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766266126; x=1797802126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sGsIIRwZqxu5V+RYmT2JWr+PX3aFc+VIk1V9JeVfjkY=;
  b=bcVop3ZpXTZa3OI7mA+rm0BMY2gsMHvYbGLnPlQ7rN6jU2RZU+ZFaoak
   fCIsKMGOtDLLqs265Cig4zTM33xX+fzboiKl1U9aDAEl6eBEqZFmPnQf+
   Ag1mJmnbbNYyI7dG2r0ntr1O5mPB1Kn4FWi/Q4G0aZymF0pqh8veu1LWi
   lpVCXemyuxg2jvXufFZVw2WJN3TUU5A+4COKCLAJkYqwof6dXFyfreV5Q
   fGyB1qUa3UIxFc2rB7iqEKqEknNGGF2Ts9B5KHKPCpQMIQWJT9qlYgnrt
   9Xjl37sZdITsFX6xokhhuOq/8lj+F9J2lpQS1mVr4541xlFLPyeciHMz2
   A==;
X-CSE-ConnectionGUID: dek/i2l6QbeuWXVeRLMHoA==
X-CSE-MsgGUID: XKOmzC7KQbCTh+FABnSt1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="90847617"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="90847617"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 13:28:46 -0800
X-CSE-ConnectionGUID: HA08KyLXQHKXq0dYVzdFUg==
X-CSE-MsgGUID: Y0k9SvBoR+WuXgtoFk4Klg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 13:28:45 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX4VG-0000000058h-28JF;
	Sat, 20 Dec 2025 21:28:42 +0000
Date: Sun, 21 Dec 2025 05:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess
 function parameter 'file' description in 'SXE_MSG_LEVEL_DEFAULT'
Message-ID: <202512210525.8hRRLO09-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 3c27aa8f615da8e36e1dc802839c98702187757c [3418/3418] Linkdata：net：fix sxe compile errors 'sxe_resume' defined but not used
config: arm64-randconfig-001-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210525.8hRRLO09-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210525.8hRRLO09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210525.8hRRLO09-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess function parameter 'file' description in 'SXE_MSG_LEVEL_DEFAULT'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess function parameter 'author' description in 'SXE_MSG_LEVEL_DEFAULT'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c:48: warning: Excess function parameter 'date' description in 'SXE_MSG_LEVEL_DEFAULT'


vim +48 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_main.c

8cee206b555824 liujie_answer 2025-04-01  47  
8cee206b555824 liujie_answer 2025-04-01 @48  #define SXE_MSG_LEVEL_DEFAULT (NETIF_MSG_DRV | NETIF_MSG_PROBE | NETIF_MSG_LINK)
8cee206b555824 liujie_answer 2025-04-01  49  

:::::: The code at line 48 was first introduced by commit
:::::: 8cee206b5558245197158bd20895f95cc28d8468 Ethernet: Linkdata: Supports Linkdata ethernet Controllers

:::::: TO: liujie_answer <liujie5@linkdatatechnology.com>
:::::: CC: liujie_answer <liujie5@linkdatatechnology.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
