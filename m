Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032B132E6AA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 17:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764090167; cv=none; b=dNo7TuL1j3r9B2j9jJn7Qmi40w9Lh1J5kD5htQk/cB8T41Ul8mCaqx9gGjJVtPaRiQoJX96hRi+DuMQCpzSyHcmCQn8tFVOwegya2SG4t5nTE0XfYpNCpBPapuZPKXckRo5DUFEqtcadqchQi/UnWVFLfJNWZy+ej9laJhmNc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764090167; c=relaxed/simple;
	bh=eVRfA2x9+/svqu/FjfHjZRCaUmEQXlFHoJ3lUnBHBf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWZ1OCo9N38g0k90cSlBvyZlFeOqLJhIq2CFTC1PYmomq+jYpVHp/kT3464ioP9w6sLZUdUZ506BGMSjvBWccituWDRT2e3KOi0RneVxTbTvqBjpZhVn+umaBLYbhYZvEKEQjcviCIexagAjgaRF7BMsCMRwtkfmfRSf9eULkGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnrPASWW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnrPASWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764090165; x=1795626165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eVRfA2x9+/svqu/FjfHjZRCaUmEQXlFHoJ3lUnBHBf8=;
  b=SnrPASWWVmsFQSvjjTcHTV4k6O+xf0+x5XH2ANtIgeHAQbTNAH4dnS8C
   eRmD60YsHNxmP8KRQPcdikTfyS19NAtHUZIzu8Q1I3k3WbdjBkqN1SZkb
   TpHz3EOe5n+rVS1hlDOaAnEn3aOkDZxGEqsrq4sHL3zL70gyLmKLrsUsL
   bB2T+9HBmrnD4QuVdPV2HMnh8J7y6eFN9STAMB5szBg/Wxru9qrNz78vK
   H9l8lB78Xmh2D9SSSl5w9RyTOhaJ0x7iquN4cbnEIJ3t30AOiIdFkjN1K
   Pa7H1EmLoNq8wAXivzkpkmiBJeYbv1kL5gaDuqgBLUUpFX1DtXzMd3VEj
   g==;
X-CSE-ConnectionGUID: z/MIaga0QW+q4GklBN0XXw==
X-CSE-MsgGUID: 8/YbWluASz6jjzRHt4UKjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53683888"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="53683888"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 09:02:44 -0800
X-CSE-ConnectionGUID: epg4iNruTxqSobS9vm1HTA==
X-CSE-MsgGUID: 0M4CY6OaRiOdIbv3QFRkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192922418"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2025 09:02:43 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNwR7-000000000XJ-2YOc;
	Tue, 25 Nov 2025 17:02:41 +0000
Date: Tue, 25 Nov 2025 18:02:06 +0100
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:stack_magic 31/31] include/linux/tracing.h:168:8: warning:
 extra tokens at end of #endif directive
Message-ID: <202511251836.ZugRd77H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux stack_magic
head:   4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa
commit: 4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa [31/31] add tracing.h
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251125/202511251836.ZugRd77H-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251836.ZugRd77H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251836.ZugRd77H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:15:
   In file included from include/linux/numa.h:6:
   In file included from include/linux/nodemask.h:94:
   In file included from include/linux/random.h:7:
   In file included from include/linux/kernel.h:34:
>> include/linux/tracing.h:168:8: warning: extra tokens at end of #endif directive [-Wextra-tokens]
     168 | #endif _/* _LINUX_TRACING_H */
         |        ^
         |        //
   1 warning generated.
--
>> clang diag: include/linux/tracing.h:168:8: warning: extra tokens at end of #endif directive [-Wextra-tokens]


vim +168 include/linux/tracing.h

   167	
 > 168	#endif _/* _LINUX_TRACING_H */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
