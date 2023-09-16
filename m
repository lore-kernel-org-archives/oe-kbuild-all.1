Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627E12B9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694878207; x=1726414207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rqd0Bi9gyvshPzZDgA7rsXCLDrcMJMg7D3L2n494ibU=;
  b=RpjL9E4kMIad/C5RuK8UwrGxsNdrSG3r5VB1RFNLPgHuhrZv4YsYw8H5
   AlFN9qFnO5kBks2Pbyy9GPai++IiYSjIKhE7VMiUVorgjyBlfbt4GV3nT
   T7TxtdmYLXhvsNCI53pp2qKhQgnu0n0vQK5IkSpWtwDoqWrlSUFjcI5G5
   akup5b96/WkjFij2p/WFDPZC8XuM5gmL2VKjem4C3P3GTUqtyE7cNY9LZ
   txw3zUVD85wfCPOqB4QW59yGvg3yYOHwOE69U5GR8vuYaAi8RzN7J4Bmr
   mDBKCMt+Jj7vIoVYvIunFKSYelX+ceAvwLbiwIZ69u5TrVhfpu+MDOljI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="358837629"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="358837629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 08:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="780442431"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="780442431"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Sep 2023 08:29:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhXF6-0004Nz-1v;
	Sat, 16 Sep 2023 15:29:56 +0000
Date: Sat, 16 Sep 2023 23:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/9] ACPI: APEI: Use common ERST struct to read/write
 serialized MCE record
Message-ID: <202309162314.GyVewcND-lkp@intel.com>
References: <20230916130316.65815-3-xueshuai@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916130316.65815-3-xueshuai@linux.alibaba.com>

Hi Shuai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp rafael-pm/linux-next tip/x86/core efi/next linus/master v6.6-rc1 next-20230915]
[cannot apply to aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Xue/pstore-move-pstore-creator-id-section-type-and-record-struct-to-common-header/20230916-210612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20230916130316.65815-3-xueshuai%40linux.alibaba.com
patch subject: [RFC PATCH 2/9] ACPI: APEI: Use common ERST struct to read/write serialized MCE record
config: i386-buildonly-randconfig-003-20230916 (https://download.01.org/0day-ci/archive/20230916/202309162314.GyVewcND-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309162314.GyVewcND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309162314.GyVewcND-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:20,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from arch/x86/kernel/cpu/mce/apei.c:21:
   arch/x86/kernel/cpu/mce/apei.c: In function 'apei_write_mce':
>> arch/x86/kernel/cpu/mce/apei.c:135:30: warning: argument to 'sizeof' in '__builtin_memset' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
     135 |         memset(rcd, 0, sizeof(rcd));
         |                              ^
   arch/x86/include/asm/string_32.h:195:52: note: in definition of macro 'memset'
     195 | #define memset(s, c, count) __builtin_memset(s, c, count)
         |                                                    ^~~~~
   arch/x86/kernel/cpu/mce/apei.c: In function 'apei_read_mce':
>> arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' reading 124 bytes from a region of size 0 [-Wstringop-overread]
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/apei.c:187:9: note: in expansion of macro 'memcpy'
     187 |         memcpy(m, &rcd.data, sizeof(*m));
         |         ^~~~~~
   arch/x86/kernel/cpu/mce/apei.c:166:35: note: at offset 200 into source object 'rcd' of size 200
     166 |         struct cper_pstore_record rcd;
         |                                   ^~~


vim +135 arch/x86/kernel/cpu/mce/apei.c

   127	
   128	int apei_write_mce(struct mce *m)
   129	{
   130		struct cper_pstore_record *rcd;
   131		int record_len = sizeof(*m) + sizeof(*rcd);
   132		int data_len = sizeof(*m);
   133	
   134		rcd = kmalloc(record_len, GFP_KERNEL);
 > 135		memset(rcd, 0, sizeof(rcd));
   136	
   137		memcpy(rcd->hdr.signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
   138		rcd->hdr.revision = CPER_RECORD_REV;
   139		rcd->hdr.signature_end = CPER_SIG_END;
   140		rcd->hdr.section_count = 1;
   141		rcd->hdr.error_severity = CPER_SEV_FATAL;
   142		/* timestamp, platform_id, partition_id are all invalid */
   143		rcd->hdr.validation_bits = 0;
   144		rcd->hdr.record_length = record_len;
   145		rcd->hdr.creator_id = CPER_CREATOR_PSTORE;
   146		rcd->hdr.notification_type = CPER_NOTIFY_MCE;
   147		rcd->hdr.record_id = cper_next_record_id();
   148		rcd->hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
   149	
   150		rcd->sec_hdr.section_offset = (void *)&rcd->data - (void *)&rcd;
   151		rcd->sec_hdr.section_length = data_len;
   152		rcd->sec_hdr.revision = CPER_SEC_REV;
   153		/* ->ru_id and fru_text is invalid */
   154		rcd->sec_hdr.validation_bits = 0;
   155		rcd->sec_hdr.flags = CPER_SEC_PRIMARY;
   156		rcd->sec_hdr.section_type = CPER_SECTION_TYPE_MCE;
   157		rcd->sec_hdr.section_severity = CPER_SEV_FATAL;
   158	
   159		memcpy(rcd->data, m, data_len);
   160	
   161		return erst_write(&rcd->hdr);
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
