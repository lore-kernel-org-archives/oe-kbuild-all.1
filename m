Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3A380
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420039; cv=none; b=O+o8DL2IFr9tMU4MWzZaVufil9KIJdWwIV2qTdmRwm1FLIv530Pj6MHWc/F3WmtBNfntjd9NZSh9bGVON56hBMteE3b14oFY9LuD8QQkCzD9qfnYYrw7GniBoI1x4bDR1wm7K8GoHoN4EplrcFrUda5Ka5eFwdPweI9AZsLwV7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420039; c=relaxed/simple;
	bh=i2WBeMWWNlPN6uniwZeWRruTdLxK2rbynkKRzWJ0w48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lEVqFi9Dd/KiRdKScjbqp4h/2+Z+UZzmAzCZFwOM8EraUJLvOAn409sIgI5leRSRABwOIXUY+vxCFbIcBYCNA8/vAD8KbzvY+T1gQxKMkG9qZDr47g962ds0CLE5nYsDb5+xlqIop5FxwshIzs3/CsNedAQV1antPQ+bDes9S8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhjP5mvL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhjP5mvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420033; x=1761956033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2WBeMWWNlPN6uniwZeWRruTdLxK2rbynkKRzWJ0w48=;
  b=LhjP5mvLmtAKDPnDbuwYeYjCY+J15zyVUyBukRr12l8YH8HnNpI/Y+pr
   Wq+ElEMiTd1XhOjLPmyzCxlUcDgFOKVbR7HcPCyUCbl9vUTz29AZDSPJZ
   Jwys0Jy1OPXJrKCEfX7IYAvyyOGRSFhb2O110t3+cg15iHL1fuBExdOLX
   DGb9im1TcdZzAfsKrqDRJ0z9HvL6wO0Wx21QEfpGb9SGHsw30fca92RL+
   6w+MUzbPemVI+YFHkqRFoAdkv0vB7tgxH7EaT+gRrLZApvrSQBJ8OyKHM
   cdHT0tmioOrggVBA8Cwl56DeUV5ZNWxk6UszfsBzy8L5G8/6GWoI+CeXt
   g==;
X-CSE-ConnectionGUID: boShgXhrQyyluTjaqnXupw==
X-CSE-MsgGUID: 9JELCmEHTMiovfZG8InSGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30400976"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="30400976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:13:53 -0700
X-CSE-ConnectionGUID: jLSN6+AoTbmYmAoAhpVUlA==
X-CSE-MsgGUID: nlToqnQJT4KK3Ft31iMspA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82920016"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2024 17:13:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fIT-000grc-1K;
	Fri, 01 Nov 2024 00:13:49 +0000
Date: Fri, 1 Nov 2024 08:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [linux-next:master 4678/8448] ld.lld: error: undefined symbol:
 handle_misaligned_load
Message-ID: <202411010803.kaXEvybi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
commit: d1703dc7bc8ec7adb91f5ceaf1556ff1ed212858 [4678/8448] RISC-V: Detect unaligned vector accesses supported
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241101/202411010803.kaXEvybi-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010803.kaXEvybi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010803.kaXEvybi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: handle_misaligned_load
   >>> referenced by traps.c:165 (arch/riscv/kernel/traps.c:165)
   >>>               arch/riscv/kernel/traps.o:(do_trap_load_misaligned) in archive vmlinux.a
   >>> referenced by traps.c:165 (arch/riscv/kernel/traps.c:165)
   >>>               arch/riscv/kernel/traps.o:(do_trap_load_misaligned) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: handle_misaligned_store
   >>> referenced by traps.c:0 (arch/riscv/kernel/traps.c:0)
   >>>               arch/riscv/kernel/traps.o:(do_trap_store_misaligned) in archive vmlinux.a
   >>> referenced by traps.c:0 (arch/riscv/kernel/traps.c:0)
   >>>               arch/riscv/kernel/traps.o:(do_trap_store_misaligned) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
