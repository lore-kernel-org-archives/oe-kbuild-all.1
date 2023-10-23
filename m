Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F422EFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 20:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtLwC4PO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698091274; x=1729627274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GV2LLbWUSwdfr1hLCL9cShrIr4ZwwLAtNMj8Q1ztWXU=;
  b=WtLwC4POcmg09ERB30kqIr/+GTLMdEvHbwxPGwu5BJuHCttmym82enyP
   jn+qg6zLHOhFDfZp1bSpnTF3i0RgfdAABAM92+6thDubOgo6H3b+AyhGP
   fNazOOHYmhR03y+IfJ5jcuhVkPiAWKIsSYAOGlhXBFogHd9xJbqUKNGHz
   NK5AWLopnDzisQrFu3YE8qzJqMgShhcFETf7k3n5Ei9g0L0e63rz1eAMI
   7HCsfbhab0oTtRxbEsnLnH3JZnHetwR+ifyH039IE7l1FG+FP2naLMmCy
   DgiJAP0Ais+nExyDdZcZ/YZWwXCLSTz2gD/roCfWYFh07BPnCEtoEuvHG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385814138"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="385814138"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="1089603453"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="1089603453"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2023 13:01:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv16p-0007DV-2B;
	Mon, 23 Oct 2023 20:01:07 +0000
Date: Tue, 24 Oct 2023 04:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm64:for-next/lpa2-stage1 33/61] checkpatch: WARNING: please, no
 space before tabs
Message-ID: <202310240328.tlMGQSLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/lpa2-stage1
head:   aa77c7fe48f8b863ab1c30daf17ed8893850c7eb
commit: 478ea56890547fb41d129b6a807bb9ed4001d1e2 [33/61] arm64: head: Move early kernel mapping routines into C code
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240328.tlMGQSLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310240328.tlMGQSLK-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#196: FILE: arch/arm64/kernel/image-vars.h:57:
+PROVIDE(__pi__stext               ^I= _stext);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#197: FILE: arch/arm64/kernel/image-vars.h:58:
+PROVIDE(__pi__etext               ^I= _etext);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#198: FILE: arch/arm64/kernel/image-vars.h:59:
+PROVIDE(__pi___start_rodata       ^I= __start_rodata);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#199: FILE: arch/arm64/kernel/image-vars.h:60:
+PROVIDE(__pi___inittext_begin     ^I= __inittext_begin);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#200: FILE: arch/arm64/kernel/image-vars.h:61:
+PROVIDE(__pi___inittext_end       ^I= __inittext_end);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#201: FILE: arch/arm64/kernel/image-vars.h:62:
+PROVIDE(__pi___initdata_begin     ^I= __initdata_begin);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#202: FILE: arch/arm64/kernel/image-vars.h:63:
+PROVIDE(__pi___initdata_end       ^I= __initdata_end);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#203: FILE: arch/arm64/kernel/image-vars.h:64:
+PROVIDE(__pi__data                ^I= _data);$

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#351: FILE: arch/arm64/kernel/pi/map_kernel.c:21:
+extern void idmap_cpu_replace_ttbr1(void *pgdir);

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#528: FILE: arch/arm64/kernel/pi/map_range.c:27:
+ * ^I^I^Iin the VA space$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
