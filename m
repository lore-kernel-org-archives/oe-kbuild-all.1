Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56E14883C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 14:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714141555; cv=none; b=QhNpWbz7FXVxjj8I4rErq2nxEkqhzGXQp9+Jaq7NxsGor8JfVH9zstNLWVdMR9YeLNiaE3sRHlmi0m73UvpN5lf9QArVcaxPlBE6/Zijn8u2A/LB2KjBupnHSooLoMlIB8Y1tutQGsqSgHLeZdJV5i5QM1Qlztb2POttsDAikvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714141555; c=relaxed/simple;
	bh=+C7YuP039dPJu7e2ga+dIo5pp9/AxSdCSOcWsG7XYT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GY2bthy6CC/66IihiyFufKmVSdbEF2sUPkdx/SoExUVt14txQagjhPJoGMDU9ZmoeKhQU+ckP1XRmpSBpymkO3J1jsLv0psWXPD+BE0Hus/lu8LuWwTc/y9dwoBPCUN0CFiaSlQMwl+D4Qf6mNuPeZLBistcj5PHae1c8dlg93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdtC0raM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdtC0raM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714141555; x=1745677555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+C7YuP039dPJu7e2ga+dIo5pp9/AxSdCSOcWsG7XYT8=;
  b=XdtC0raMZwveQoMjOh5bwaIZwb7PO0G6cExxZsTZPMMu4dHS64DLXpiF
   TgkcqM4vHuEcom8nnE8L+AMrqNsnzqxTPWiSKziuWZ/NwGtQmzU5nD030
   3N6CEQNs3v1vu/PAZnUsByqW0QoXTs8nJQFqTt/KyYFXH6C32sdW07ZXm
   jE81lcQjiOKNtBNxVN1esItrPurEkPchC7yPvvHtXHLDfeiDTyYHINeze
   Ml3SGXY00837zNQxD6QUnVUEOUXciNdkqRgqozJtK2d3N/D90nERLO9Ne
   TsTpuogB3v5x9TwAxXt2TuZX8mszoQfwj2tuikbQ1SbTXwBgif7emkh4D
   A==;
X-CSE-ConnectionGUID: WoGlBV5MR+e3uAcO09F7QA==
X-CSE-MsgGUID: RFWyDYSXTH6+ubNlj8P9hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27333067"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="27333067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:25:54 -0700
X-CSE-ConnectionGUID: 4xAFwgBPSnyLjSQN7rsPHA==
X-CSE-MsgGUID: VnAo4k7/RnK9KsRq7dwmcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25313702"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Apr 2024 07:25:52 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0MWL-0003o6-1d;
	Fri, 26 Apr 2024 14:25:49 +0000
Date: Fri, 26 Apr 2024 22:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: [linux-next:master 7112/8890] arch/riscv/mm/init.c:1495:25: error:
 'MODULES_VADDR' undeclared
Message-ID: <202404262217.Dt4HoodH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bb7a2467e6beef44a80a17d45ebf2931e7631083
commit: 7aa7eb8269eabaef9ac49d261385e7f330c95715 [7112/8890] arch: make execmem setup available regardless of CONFIG_MODULES
config: riscv-randconfig-c024-20221028 (https://download.01.org/0day-ci/archive/20240426/202404262217.Dt4HoodH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404262217.Dt4HoodH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404262217.Dt4HoodH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/init.c: In function 'execmem_arch_setup':
>> arch/riscv/mm/init.c:1495:25: error: 'MODULES_VADDR' undeclared (first use in this function)
    1495 |                 start = MODULES_VADDR;
         |                         ^~~~~~~~~~~~~
   arch/riscv/mm/init.c:1495:25: note: each undeclared identifier is reported only once for each function it appears in
>> arch/riscv/mm/init.c:1496:23: error: 'MODULES_END' undeclared (first use in this function)
    1496 |                 end = MODULES_END;
         |                       ^~~~~~~~~~~


vim +/MODULES_VADDR +1495 arch/riscv/mm/init.c

  1489	
  1490	struct execmem_info __init *execmem_arch_setup(void)
  1491	{
  1492		unsigned long start, end;
  1493	
  1494		if (IS_ENABLED(CONFIG_64BIT)) {
> 1495			start = MODULES_VADDR;
> 1496			end = MODULES_END;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
