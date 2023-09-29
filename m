Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF44399
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 04:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695962601; x=1727498601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=idf3vc/JVR4IufjNme59JUIlFwr0cnaEsXROxe3a1L8=;
  b=fN2uOBbYwlBG+fxTEN8/Qqw6HvxBkcTEknF2p6zu1ds9/bv99QlXdWWu
   KGQC8APXEm2FIJ/YDoMJHHS4A+nE0uOz0Kzr1LI9cEqo/SadkXmaL8Oik
   ZFJv3SW0MXq/GtYCx4kOfBBTxPkEIBHQF84wgIaF/2a/7ixyzNgRdkhas
   q0rppH+2oqR0xpvnpfg2bkzJD5R4hWUdUAljQq3YDOqUnbM5zLlvNSBS8
   3buQ0NXQPohbrk7+dqIvp9jJkyV3S2C+RxoD629N15M7bBogmcgLEVxIr
   +paBNpoXwnC+m80BFPkx4EAoe7mCjMXVpQscV8w0AGbbiycol62tTc5Lf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3805079"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="3805079"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 21:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779174673"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="779174673"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 21:43:18 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm5LQ-0002Tx-1r;
	Fri, 29 Sep 2023 04:43:16 +0000
Date: Fri, 29 Sep 2023 12:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/9] ACPI: APEI: Use common ERST struct to
 read/write serialized MCE record
Message-ID: <202309291243.U75V4UPI-lkp@intel.com>
References: <20230925074426.97856-3-xueshuai@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925074426.97856-3-xueshuai@linux.alibaba.com>

Hi Shuai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/pstore]
[also build test WARNING on kees/for-next/kspp rafael-pm/linux-next tip/x86/core efi/next linus/master v6.6-rc3 next-20230928]
[cannot apply to aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Xue/pstore-move-pstore-creator-id-section-type-and-record-struct-to-common-header/20230925-154609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20230925074426.97856-3-xueshuai%40linux.alibaba.com
patch subject: [RFC PATCH v2 2/9] ACPI: APEI: Use common ERST struct to read/write serialized MCE record
config: x86_64-buildonly-randconfig-004-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291243.U75V4UPI-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291243.U75V4UPI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291243.U75V4UPI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/mce/apei.c: In function 'apei_read_mce':
>> arch/x86/kernel/cpu/mce/apei.c:187:2: warning: 'memcpy' forming offset [201, 328] is out of the bounds [0, 200] of object 'rcd' with type 'struct cper_pstore_record' [-Warray-bounds]
     187 |  memcpy(m, &rcd.data, sizeof(*m));
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mce/apei.c:166:28: note: 'rcd' declared here
     166 |  struct cper_pstore_record rcd;
         |                            ^~~


vim +187 arch/x86/kernel/cpu/mce/apei.c

   163	
   164	ssize_t apei_read_mce(struct mce *m, u64 *record_id)
   165	{
   166		struct cper_pstore_record rcd;
   167		int rc, pos;
   168	
   169		rc = erst_get_record_id_begin(&pos);
   170		if (rc)
   171			return rc;
   172	retry:
   173		rc = erst_get_record_id_next(&pos, record_id);
   174		if (rc)
   175			goto out;
   176		/* no more record */
   177		if (*record_id == APEI_ERST_INVALID_RECORD_ID)
   178			goto out;
   179		rc = erst_read_record(*record_id, &rcd.hdr, sizeof(rcd), sizeof(rcd),
   180				&CPER_CREATOR_PSTORE);
   181		/* someone else has cleared the record, try next one */
   182		if (rc == -ENOENT)
   183			goto retry;
   184		else if (rc < 0)
   185			goto out;
   186	
 > 187		memcpy(m, &rcd.data, sizeof(*m));
   188		rc = sizeof(*m);
   189	out:
   190		erst_get_record_id_end();
   191	
   192		return rc;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
