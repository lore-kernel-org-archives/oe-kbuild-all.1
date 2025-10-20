Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB1DCA6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 05:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760939294; cv=none; b=dQpU5oSDesp/hOJOiZJBJQ0hQ1XTQgGPprVTBP5DE5zkJFZTftHi1mtlIbHmZaTPs/zkiaKBiLU7jfWktyX8UufOSePI57soF7Juk/r//cdER+YeFKnyw3/CvsAQjW6ixUQSc9prb5DakQeh6ZlaQ5k11zsGS1nZszkoc4KUj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760939294; c=relaxed/simple;
	bh=PT0w0nE8yhByWisqMXS7Ip7aWWRGTudOnc4uUQpTrqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVM/ZUAgKricbJ+VUI7/tZw4SyiB/xyxAZv0XXkMc3RYrDe/nRjdk7rHXy+17uEWVnpf1HxxET3xMsURSmZVgezsEDSbx0LmoN4tgPA9zK8cG0vB2++sVH+KO8HoL6vFVMCkY9RZjfAAG3AB/VUiTaXHfBET7Jfz3KDA/x/gxbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg2iUK3w; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg2iUK3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760939293; x=1792475293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PT0w0nE8yhByWisqMXS7Ip7aWWRGTudOnc4uUQpTrqw=;
  b=gg2iUK3wBX7dNuiqM8OdlsUDHZVSJH8ElwBMsvbMpigqHSOeemqKCpP9
   /6zQwwbwieUIumhO5BeauKLNeRWVJYIexJyV2WprA0yyINvQSkJ6s2xYg
   UrA/UpGJzBs+GpSoQTT1bJyfeKSsRpfchBJ4fDtZYt9BNPyz9314P5UNn
   uwVA+PK4VtYUYpQhsseVP0u0Eqp79dQcMBmSNEY46wOkZ+NjrV4nnx+1a
   NTFuwPC6ioEhTHTkdHbF4wOdnANMt2ixHhT2C5sEVh8Bc7zPKcC/0HXne
   2ikz/9AG8InvUL4ERTp9g1mJBIzHZmuARY12BXL+xn9deibIS3Deo7iye
   g==;
X-CSE-ConnectionGUID: AiRec5XkRTCm6pISL5PuoA==
X-CSE-MsgGUID: LX1My9nISjGoxEReV/xsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62261316"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62261316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 22:48:12 -0700
X-CSE-ConnectionGUID: pI3l1LCaSdWHPvrgM+FkUg==
X-CSE-MsgGUID: 1R+inATeSYeHAOkp3LdA0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="213869831"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2025 22:48:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAikM-0009WJ-28;
	Mon, 20 Oct 2025 05:47:59 +0000
Date: Mon, 20 Oct 2025 13:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [linux-next:master 129/2617] devinfo.c:undefined reference to
 `iwl_bz_mac_cfg'
Message-ID: <202510201315.gJfS3FXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   606da5bb165594c052ee11de79bf05bc38bc1aa6
commit: 137b0bb916f1addb2ffbefd09a6e3e9d15fe6100 [129/2617] wifi: iwlwifi: tests: check listed PCI IDs have configs
config: loongarch-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201315.gJfS3FXH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201315.gJfS3FXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201315.gJfS3FXH-lkp@intel.com/

Note: the linux-next/master HEAD 606da5bb165594c052ee11de79bf05bc38bc1aa6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/net/wireless/intel/iwlwifi/tests/devinfo.o:(.text+0x34): relocation R_LARCH_PCALA_HI20 against `iwl_bz_mac_cfg` can not be used when making a PIE object; recompile with -mno-direct-extern-access and check the symbol visibility
   loongarch64-linux-ld: drivers/net/wireless/intel/iwlwifi/tests/devinfo.o: in function `devinfo_pci_ids_config':
>> devinfo.c:(.text+0x34): undefined reference to `iwl_bz_mac_cfg'
>> loongarch64-linux-ld: devinfo.c:(.text+0x58): undefined reference to `iwl_bz_mac_cfg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
