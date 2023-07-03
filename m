Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F8E803
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688368439; x=1719904439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WEpGIYMSMPY4y707X8ag7bqeDALnQlq0+Of8UgOA9VM=;
  b=O42nqQq1tzZnQMQQfwRFNoEu6naIRAvWzcWAA7Jd8NbAh/24s6N64f4x
   epSVj08+4qNZjO0L5g5fFY5/6fdLz9aVl29JQHaUps8n136yIA7Pj91B9
   houiuauAvG1qJyMAOxpkITx8CJxTrYfj6eZqnT12CT6vLM2j9QN4mKGTn
   tVwxyZGIobUpsbDu/IWLtepVh8QezGBWxvtAu9kKxW+4MmPrmKetU3U0v
   LAVLkY1pgnRvCEIs/txpjXPWpFkUDeWa4BURQpA4sa70GhoWoCqzj+9FL
   9vNIbIWPTu/xFFv0kO0jGcrDXpIpmc8Tn2NDk+pMu7Lgbh5XkZKOSHzWY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361673356"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="361673356"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 00:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048967168"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1048967168"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2023 00:13:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGDkz-000HD1-00;
	Mon, 03 Jul 2023 07:13:57 +0000
Date: Mon, 3 Jul 2023 15:13:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-runtime-cleanup 6/6]
 arch/x86/include/asm/uv/bios.h:118:22: error: expected ')' before '*' token
Message-ID: <202307031501.x99uET07-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-runtime-cleanup
head:   22added69d4a97ad3edd0af0d8e403373f4bf17a
commit: 22added69d4a97ad3edd0af0d8e403373f4bf17a [6/6] efi/x86: Rely on compiler to emit MS ABI calls
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230703/202307031501.x99uET07-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307031501.x99uET07-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307031501.x99uET07-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/uv_sysfs.c:14:
>> arch/x86/include/asm/uv/bios.h:118:22: error: expected ')' before '*' token
     118 |         u64 (__efiapi *function)(enum uv_bios_cmd, ...);
         |                      ^~
         |                      )


vim +118 arch/x86/include/asm/uv/bios.h

   110	
   111	/*
   112	 * The UV system table describes specific firmware
   113	 * capabilities available to the Linux kernel at runtime.
   114	 */
   115	struct uv_systab {
   116		char signature[4];	/* must be UV_SYSTAB_SIG */
   117		u32 revision;		/* distinguish different firmware revs */
 > 118		u64 (__efiapi *function)(enum uv_bios_cmd, ...);
   119					/* BIOS runtime callback function ptr */
   120		u32 size;		/* systab size (starting with _VERSION_UV4) */
   121		struct {
   122			u32 type:8;	/* type of entry */
   123			u32 offset:24;	/* byte offset from struct start to entry */
   124		} entry[1];		/* additional entries follow */
   125	};
   126	extern struct uv_systab *uv_systab;
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
