Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879824683
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735985128; cv=none; b=KzB4rN9JTkHAkJEvVvkRAWuVEiv3rbEOMXzhf14T3216yv5MYKRf9EY5yLjKXTeT6OsFDwUMjdJnaOmVHg/7JYJq7w8vQa174QAw5NgdcjpmrvmuVOPIdXbl71xzohzEFdYHV5uqiumKHv/lVHogMC3wK1dZelm9FpKiq4Qvm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735985128; c=relaxed/simple;
	bh=hIrRFtjFs5VnBjjYAhnh1eauGGST/Bq5/uc2bPZxh5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V9RMgMijVyvrYpEnxpeFLhkhYoQV4DTbKrEPSoXNjQjgIrioQtycMuvUwBrV7U06kR5bKzbIuplw0YJxi3WfjEhG1ZWrIn86xWY4aV18RT8IZ7KfI0oIlGQSoi6B2MLKEavemYmgf6JJqqOy2CH7I4VGeaFqzgec15LabaDyrpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUSHx7pg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUSHx7pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735985127; x=1767521127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hIrRFtjFs5VnBjjYAhnh1eauGGST/Bq5/uc2bPZxh5o=;
  b=fUSHx7pglgX6UI8jflqLeZbJ8gD1m/fzKe1QN7vSy1ee9T17hIXHNcQl
   1Dhf5gGUEm1fxMaI005oqgUH4Zg775dHMqeHuWRXqiTqPm+57c757eVen
   cxi0R8uN1Jtcpn4lUMHph67JnypOMM9NFV+xPLEDnguo4FV05GN8h/NDh
   qFlBmXx5fN5s36BmGdYxr5TPTNTvemgz62Ps6YAtY128Aq6YyW8PBe5A/
   ird9+9DXt8pv1f7WKfffT8tG2SvmSRx7aCARirRkNebU97l9v/SrmeVCd
   f7cInvxet+VvT80Zrl/t1tPudm6eWMg3ZDvUin3PH5VRw7BrofOpPANOt
   A==;
X-CSE-ConnectionGUID: SMH3pquyTWynDLTIg7EDvQ==
X-CSE-MsgGUID: 9fYGus+2TQ+psB2LDO42/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36087309"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36087309"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 02:05:26 -0800
X-CSE-ConnectionGUID: p4eWkX8SR628GkApxy/L0g==
X-CSE-MsgGUID: glcuIZ8BQ5uM5MbPpDa52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="132830172"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2025 02:05:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU122-000AoJ-3B;
	Sat, 04 Jan 2025 10:05:22 +0000
Date: Sat, 4 Jan 2025 18:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1367/1367]
 sound/soc/rockchip/rockchip_pcm.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202501041833.o4WHox7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   21eb7b92f86861232fed9eff3c46634d7535ef8a
commit: 4aa5db22d35588e1a5d2ee88472348ea73d9fb23 [1367/1367] Merge branch 'asoc-4.19' into asoc-next
config: x86_64-buildonly-randconfig-005-20250103 (https://download.01.org/0day-ci/archive/20250104/202501041833.o4WHox7g-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041833.o4WHox7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041833.o4WHox7g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_pcm.o: warning: objtool: missing symbol for section .text
--
>> sound/soc/meson/axg-tdmin.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
