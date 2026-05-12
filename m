Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D59E347C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778545048; cv=none; b=SOIWBPxXGSRfp4dBF8B9JygD27OI30pzUOYamk8yJgO53IzZIGdssd1BKo/8z/tSR2pO3F/jSWSuXF22HvaLbx5aQvnZ7YOTAv9NLCy+YQLmeZUDNOfr/elxzqRieOzs4tChO/NCISqiye3AGAvdWmJqhAUqkQXAtMFq9L1kfgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778545048; c=relaxed/simple;
	bh=doVm8WaQmxMw0Np8MC+ZDQRCMh5oGgPZRqRthq4L8vw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qV3a5oZ4yIrQEDD4AMl2OhvNdBPPMeBO7/qopc4V6DjkrIwCoawmJx1JLVgwhNOB4JFBTTpgbMz0oXMAW1O2BT2trHuXE5skbkePk17yk+lVKybhjEArq6NP7mTa5s1SPuJ813dky/GwB2vJDjRbiKmWdMSRyJnzqpdKgTKtT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcXgh6IF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcXgh6IF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778545046; x=1810081046;
  h=date:from:to:cc:subject:message-id;
  bh=doVm8WaQmxMw0Np8MC+ZDQRCMh5oGgPZRqRthq4L8vw=;
  b=DcXgh6IFzk5t3xwoibEZOF9VIJfg1q63/jL8KZaZSkwvx7PrV6ywWVha
   yWV/JI17HxnoXttel5B/8U709PpS8iga2AqUqzTmlL3fYIGvfLqlppzw5
   hvQXhPpy6gsVL/mu9cbtpeBoPbFO7xbB0fsH366oKz7TAm8R9m0TOBy98
   PUIwg0Ub+uEMdEOv+SjELYPI8fRCT8tZKQ5apP/oHnvFvhMX+Fp2hD376
   Ng7wVcnIbEE2kJYXhnVtykTtwKa+7vul49FSrofdT4bHhr15bTc7r7Hlh
   md/YMkE9xwDjn6Q/4WHZs+KmaFE8M0REXw9srPCUwqQipVEQOB5t8vLHU
   A==;
X-CSE-ConnectionGUID: UAyq6qsnQpW85jrvQ5EOkg==
X-CSE-MsgGUID: c197DEj9Q8yuCqttWF4Rbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79306618"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79306618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 17:17:26 -0700
X-CSE-ConnectionGUID: Rc7zQIvNSeyGjcAiiZdY1g==
X-CSE-MsgGUID: Xe7Z3LPKQHeGXpUqMc81OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="234936949"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 17:17:24 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMaoL-000000001LJ-3kSN;
	Tue, 12 May 2026 00:17:21 +0000
Date: Tue, 12 May 2026 08:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 44/162]
 utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202605120806.doTIuAHz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   12aaea139e45ed0d826a63a866c1ce03d352fea6
commit: 55170557815594a2dcf59eddecd949dd6f59044d [44/162] firmware: add r3mini phy firmware
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260512/202605120806.doTIuAHz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120806.doTIuAHz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120806.doTIuAHz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
