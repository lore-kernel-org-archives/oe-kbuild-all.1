Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C3E549
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 17:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692640550; x=1724176550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNQbk9pHom0EBiNYi9gQiThIros4wsYOLnTQjrhf6hw=;
  b=Ctudscbg26yhEvk+HXjlsCulGJAI2boszZYWSZzjxfeR6e1GpHnIfI3e
   iM1fWl84uPH+SKeWhfcCeuRt7cVn53q7KDXEGgt/wPVk+kw2GxLvAe7VY
   3NTp83vTRAQ82w0ZxCu7/eK8+EOb+3FzQNyc0nO1bSMDT8bxcwLheLygn
   jmEBpU7z6OrIbpjj62DuAH/TTh7aTwAysmVuwdHBbKI8au6uIusRUl20U
   ZXe4QugkT9xeyoV/1K+avUne79E8AuqWiC2KQ4QJNKltHuuGxAW250QWa
   +3zfKtMx5Vg8+Apd40lD6AONAquj4tLqzKmkbP+mSEzx42Un1YgwODT5a
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437586886"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="437586886"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 10:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685744790"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="685744790"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 10:55:47 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY97z-0000lO-2N;
	Mon, 21 Aug 2023 17:55:47 +0000
Date: Tue, 22 Aug 2023 01:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/3] drivers/hid/hid-core.c:294:
 undefined reference to `uhid_hid_driver'
Message-ID: <202308220125.lF9L4BT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f0fefbe055362c9a8f29ddaadf584466477b8ea0
commit: 6804500c16a5ba86b57c9976fc1491fa0efc2132 [2/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: x86_64-randconfig-005-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220125.lF9L4BT1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220125.lF9L4BT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220125.lF9L4BT1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-core.o: in function `hid_add_field':
>> drivers/hid/hid-core.c:294: undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
   drivers/hid/hid-core.c:1778: undefined reference to `uhid_hid_driver'


vim +294 drivers/hid/hid-core.c

   253	
   254	/*
   255	 * Register a new field for this report.
   256	 */
   257	
   258	static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsigned flags)
   259	{
   260		struct hid_report *report;
   261		struct hid_field *field;
   262		unsigned int max_buffer_size = HID_MAX_BUFFER_SIZE;
   263		unsigned int usages;
   264		unsigned int offset;
   265		unsigned int i;
   266		unsigned int application;
   267	
   268		application = hid_lookup_collection(parser, HID_COLLECTION_APPLICATION);
   269	
   270		report = hid_register_report(parser->device, report_type,
   271					     parser->global.report_id, application);
   272		if (!report) {
   273			hid_err(parser->device, "hid_register_report failed\n");
   274			return -1;
   275		}
   276	
   277		/* Handle both signed and unsigned cases properly */
   278		if ((parser->global.logical_minimum < 0 &&
   279			parser->global.logical_maximum <
   280			parser->global.logical_minimum) ||
   281			(parser->global.logical_minimum >= 0 &&
   282			(__u32)parser->global.logical_maximum <
   283			(__u32)parser->global.logical_minimum)) {
   284			dbg_hid("logical range invalid 0x%x 0x%x\n",
   285				parser->global.logical_minimum,
   286				parser->global.logical_maximum);
   287			return -1;
   288		}
   289	
   290		offset = report->size;
   291		report->size += parser->global.report_size * parser->global.report_count;
   292	
   293		if (parser->device->ll_driver == &uhid_hid_driver)
 > 294			max_buffer_size = UHID_DATA_MAX;
   295	
   296		/* Total size check: Allow for possible report index byte */
   297		if (report->size > (max_buffer_size - 1) << 3) {
   298			hid_err(parser->device, "report is too long\n");
   299			return -1;
   300		}
   301	
   302		if (!parser->local.usage_index) /* Ignore padding fields */
   303			return 0;
   304	
   305		usages = max_t(unsigned, parser->local.usage_index,
   306					 parser->global.report_count);
   307	
   308		field = hid_register_field(report, usages);
   309		if (!field)
   310			return 0;
   311	
   312		field->physical = hid_lookup_collection(parser, HID_COLLECTION_PHYSICAL);
   313		field->logical = hid_lookup_collection(parser, HID_COLLECTION_LOGICAL);
   314		field->application = application;
   315	
   316		for (i = 0; i < usages; i++) {
   317			unsigned j = i;
   318			/* Duplicate the last usage we parsed if we have excess values */
   319			if (i >= parser->local.usage_index)
   320				j = parser->local.usage_index - 1;
   321			field->usage[i].hid = parser->local.usage[j];
   322			field->usage[i].collection_index =
   323				parser->local.collection_index[j];
   324			field->usage[i].usage_index = i;
   325			field->usage[i].resolution_multiplier = 1;
   326		}
   327	
   328		field->maxusage = usages;
   329		field->flags = flags;
   330		field->report_offset = offset;
   331		field->report_type = report_type;
   332		field->report_size = parser->global.report_size;
   333		field->report_count = parser->global.report_count;
   334		field->logical_minimum = parser->global.logical_minimum;
   335		field->logical_maximum = parser->global.logical_maximum;
   336		field->physical_minimum = parser->global.physical_minimum;
   337		field->physical_maximum = parser->global.physical_maximum;
   338		field->unit_exponent = parser->global.unit_exponent;
   339		field->unit = parser->global.unit;
   340	
   341		return 0;
   342	}
   343	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
