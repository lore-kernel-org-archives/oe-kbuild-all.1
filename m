Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB6C19C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 02:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5jQCmDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698374041; x=1729910041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VzXoB9JW2W1zSw8T9tMcub2LWGdKknIu3UU0tDe7II0=;
  b=O5jQCmDD8FYauSomwRxLiPjbWCEKzlSuo7qERGpfnCSxk+v7LwLP3fiw
   RI86XO/napZpiUVY/gBtK2ajgHk+sBWFULDiEfiPpcPuRDDON/127lWqf
   bv9E3QzCr7RpC84dSW+jlyl5Cjl+OHjzywUm02ZHXEielmiPxnDeOarFE
   0XUX0zEGR0ogJGSqI+AkFfpD7q3+4RDiPTEKZQomHx1si+YC1EbDURJ7U
   495jWBZjBh93+O4odA4t+KnU1+P/DB0khcF4Du04/wH3MA+BOQS+mVhhg
   kVy4v2yDKda6pj6fdD+HCkTou0eK+yV27QK7OnnlZYP6mQy2VkhtwD3Rg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387510229"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="387510229"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 19:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1090785516"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="1090785516"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Oct 2023 19:33:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwCfc-000AMF-1k;
	Fri, 27 Oct 2023 02:33:56 +0000
Date: Fri, 27 Oct 2023 10:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 3/3] cxl/memdev: Register for and process CPER
 events
Message-ID: <202310271003.RR9zDNNq-lkp@intel.com>
References: <20230601-cxl-cper-v2-3-314d9c36ab02@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601-cxl-cper-v2-3-314d9c36ab02@intel.com>

Hi Ira,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1c8b86a3799f7e5be903c3f49fcdaee29fd385b5]

url:    https://github.com/intel-lab-lkp/linux/commits/Ira-Weiny/cxl-trace-Remove-uuid-from-event-trace-known-events/20231027-022447
base:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
patch link:    https://lore.kernel.org/r/20230601-cxl-cper-v2-3-314d9c36ab02%40intel.com
patch subject: [PATCH RFC v2 3/3] cxl/memdev: Register for and process CPER events
config: x86_64-randconfig-006-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271003.RR9zDNNq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271003.RR9zDNNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271003.RR9zDNNq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/pci.c:754:5: warning: no previous declaration for 'cxl_cper_event_call' [-Wmissing-declarations]
    int cxl_cper_event_call(struct notifier_block *nb, unsigned long action, void *data)
        ^~~~~~~~~~~~~~~~~~~


vim +/cxl_cper_event_call +754 drivers/cxl/pci.c

   752	
   753	#define CXL_EVENT_HDR_FLAGS_REC_SEVERITY GENMASK(1, 0)
 > 754	int cxl_cper_event_call(struct notifier_block *nb, unsigned long action, void *data)
   755	{
   756		struct cxl_cper_notifier_data *nd = data;
   757		struct cxl_event_record_raw record = (struct cxl_event_record_raw) {
   758			.hdr.id = UUID_INIT(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
   759		};
   760		enum cxl_event_log_type log_type;
   761		struct cxl_memdev_state *mds;
   762		u32 hdr_flags;
   763	
   764		mds = container_of(nb, struct cxl_memdev_state, cxl_cper_nb);
   765	
   766		/* Need serial number for device identification */
   767		if (!(nd->rec->hdr.validation_bits & CPER_CXL_DEVICE_SN_VALID))
   768			return NOTIFY_DONE;
   769	
   770		/* FIXME endianess and bytes of serial number need verification */
   771		/* FIXME Should other values be checked? */
   772		if (memcmp(&mds->cxlds.serial, &nd->rec->hdr.dev_serial_num,
   773			   sizeof(mds->cxlds.serial)))
   774			return NOTIFY_DONE;
   775	
   776		/* ensure record can always handle the full CPER provided data */
   777		BUILD_BUG_ON(sizeof(record) <
   778			(CPER_CXL_COMP_EVENT_LOG_SIZE + sizeof(record.hdr.id)));
   779	
   780		/*
   781		 * UEFI v2.10 defines N.2.14 defines the CXL CPER record as not
   782		 * including the uuid field.
   783		 */
   784		memcpy(&record.hdr.length, &nd->rec->comp_event_log,
   785			CPER_CXL_REC_LEN(nd->rec));
   786	
   787		/* Fabricate a log type */
   788		hdr_flags = get_unaligned_le24(record.hdr.flags);
   789		log_type = FIELD_GET(CXL_EVENT_HDR_FLAGS_REC_SEVERITY, hdr_flags);
   790	
   791		cxl_event_trace_record(mds->cxlds.cxlmd, log_type, &record,
   792				       nd->cper_event);
   793	
   794		return NOTIFY_OK;
   795	}
   796	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
