Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C465BE4F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 00:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709167291; cv=none; b=NfVLw551tFDHPo2dKF6aprvaQadbUy4JOvtFMOhUqzRK+QI6Bomp1PfbvDc43Ruu09Yed0Tct36jbX1Pb7YGhmEmrd1+9u6JCCu/raibTkivnAPDK1NUy2wO7ZAr4CPRuOsYweXaULJzNuxXE7jNTAR97J3lp4vtO5w9lKtTLcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709167291; c=relaxed/simple;
	bh=7QUzxXvbG/w/Bu/R8yRpkCuKJAhKZbJea0hWtaOhFuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUQIp3q8YinFrM2e7CoRdGNtbGkDkIHeELieV3MeZxDa3MplT5PKJ+449q9J5sRt7q8wh6rCfd+pIREG6O3BSUU0fYD9xkcPPRaen/T9GnNVHkawPrb8Qez6elFjM70JJoRTXWxfPUMqpQ1sQXqy9CEbh3gn+mpGTYfM8mtghY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhkaCKa8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhkaCKa8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709167287; x=1740703287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7QUzxXvbG/w/Bu/R8yRpkCuKJAhKZbJea0hWtaOhFuU=;
  b=AhkaCKa8Dfqej53DJUR54rYv7+7piYkhs1PNCP1SjTG7WANPt6R4dVX7
   cypuu9+zF7QLiUNRv3QnruPsauCey6ZquTgj/mF6mPghuRpfZhoaCOAtW
   5OIRvitDm4eV6Q3ooJbP63KaREzgYMgYtAat6U+KYiF/mWfZ7FlGIgrDh
   ggkZi17CIvIEfko0k6ed593TQfZYF3OPBERjQjknL/s8KSyyuBqTTHnJk
   G3TRZl3OjdV8qzzSBfa/E+oCIHJ30A8a2AnXENtY82kfsgMJqbpnFKVi8
   mlBDmyNdKg7dTpjrVevkmleAJUtJb23/XgzKkBUD3CKvxRTMdHC+lXz98
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7440603"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7440603"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:41:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7562975"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Feb 2024 16:41:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfUUC-000CVj-30;
	Thu, 29 Feb 2024 00:41:20 +0000
Date: Thu, 29 Feb 2024 08:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/3] drivers/hid/hid-core.c:293:
 undefined reference to `uhid_hid_driver'
Message-ID: <202402290818.pPh4187v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lee,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   26423f6f2fa84939743b9511ee2953a557aac1d5
commit: e699d543bbc9d7614db3e01323c9321437304286 [1/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: i386-randconfig-062-20240228 (https://download.01.org/0day-ci/archive/20240229/202402290818.pPh4187v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290818.pPh4187v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290818.pPh4187v-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hid/hid-core.o: in function `hid_add_field':
>> drivers/hid/hid-core.c:293: undefined reference to `uhid_hid_driver'
   ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
   drivers/hid/hid-core.c:1770: undefined reference to `uhid_hid_driver'


vim +293 drivers/hid/hid-core.c

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
 > 293		if (parser->device->ll_driver == &uhid_hid_driver)
   294			max_buffer_size = UHID_DATA_MAX;
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
