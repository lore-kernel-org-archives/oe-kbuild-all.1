Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B112B9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694878200; x=1726414200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m3JTfpeWdKWoM4xuIT+XTWk2G+IIjpL/JUZqqbDt5/4=;
  b=Qrxhj4Q4emqixPpzsFi2Kk8IqR43rlNqoqIvr0Bc419f/KuO5THxw0DA
   ANh5eb71jzjeUHaJHKYZj7JQktUvUc8IEr7Agrvem+KGoKD9H10bTru+N
   7oA9m3/934rvBAMIum/GkVYXQMO0go2YF2NA8KTLM76d5w19hUbA4pDqk
   6l4RrEgQA1/0VrdgXHj37bxFCK5guyitQJk92gd64Er9C55fBycQx2Tio
   HtL31t+bq0mvxgVKg3a1isCEzXUYieIphaVm3kMkGDiJ9fUN0sLdY1+Nv
   o6zF7S0UkyiDywLaYU1T/RaXVkJeOKQV82A+hNwhRsPdjJsD0M5vPdn36
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="410380942"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="410380942"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 08:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="835556086"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="835556086"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2023 08:29:58 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhXF6-0004Nu-1j;
	Sat, 16 Sep 2023 15:29:56 +0000
Date: Sat, 16 Sep 2023 23:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] ACPI: APEI: GHES: Use ERST to serialize APEI
 generic error before panic
Message-ID: <202309162321.hgJRirq8-lkp@intel.com>
References: <20230916130316.65815-6-xueshuai@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916130316.65815-6-xueshuai@linux.alibaba.com>

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
patch link:    https://lore.kernel.org/r/20230916130316.65815-6-xueshuai%40linux.alibaba.com
patch subject: [RFC PATCH 5/9] ACPI: APEI: GHES: Use ERST to serialize APEI generic error before panic
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230916/202309162321.hgJRirq8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309162321.hgJRirq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309162321.hgJRirq8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/apei/ghes.c: In function 'ghes_serialize_estatus':
>> drivers/acpi/apei/ghes.c:648:30: warning: argument to 'sizeof' in 'memset' call is the same expression as the destination; did you mean to dereference it? [-Wsizeof-pointer-memaccess]
     648 |         memset(rcd, 0, sizeof(rcd));
         |                              ^


vim +648 drivers/acpi/apei/ghes.c

   639	
   640	static int ghes_serialize_estatus(struct acpi_hest_generic_data *gdata, u8 notify_type)
   641	{
   642		void *err = acpi_hest_get_payload(gdata);
   643		int data_len = gdata->error_data_length;
   644		struct cper_pstore_record *rcd;
   645		int record_len = data_len + sizeof(*rcd);
   646	
   647		rcd = kmalloc(record_len, GFP_KERNEL);
 > 648		memset(rcd, 0, sizeof(rcd));
   649	
   650		memcpy(rcd->hdr.signature, CPER_SIG_RECORD, CPER_SIG_SIZE);
   651		rcd->hdr.revision = CPER_RECORD_REV;
   652		rcd->hdr.signature_end = CPER_SIG_END;
   653		rcd->hdr.section_count = 1;
   654		rcd->hdr.error_severity = CPER_SEV_FATAL;
   655		/* timestamp, platform_id, partition_id are all invalid */
   656		rcd->hdr.validation_bits = 0;
   657		rcd->hdr.record_length = record_len;
   658		rcd->hdr.creator_id = CPER_CREATOR_PSTORE;
   659		rcd->hdr.notification_type = CPER_NOTIFY_MCE;
   660		rcd->hdr.record_id = cper_next_record_id();
   661		rcd->hdr.flags = CPER_HW_ERROR_FLAGS_PREVERR;
   662	
   663		rcd->sec_hdr.section_offset = (void *)&rcd->data - (void *)&rcd;
   664		rcd->sec_hdr.section_length = data_len;
   665		rcd->sec_hdr.revision = CPER_SEC_REV;
   666		/* ->ru_id and fru_text is invalid */
   667		rcd->sec_hdr.validation_bits = 0;
   668		rcd->sec_hdr.flags = CPER_SEC_PRIMARY;
   669		rcd->sec_hdr.section_type = gdata->section_type;
   670		rcd->sec_hdr.section_severity = gdata->error_severity;
   671	
   672		memcpy(&rcd->data, err, data_len);
   673	
   674		return erst_write(&rcd->hdr);
   675	}
   676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
