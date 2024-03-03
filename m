Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20503AD24
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709455244; cv=none; b=rxRYNkYm4Y15h2TX6GNqAWMFaovDGOXn5p0UHgPpJ8cwk2K4ryPnradCs91rY53lG8CeAQ2JwclLZUMvOzGWBZ1MNQe753PM+B7hJCaH62Em7H9RSHBjNE1QGLJpoK+WUw9MMh3oH89nMcVf5HdzvcRrNO0LFuK+dn8DwFZKWUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709455244; c=relaxed/simple;
	bh=QNkc2cbgph7UqtyFZ+seaxjY5cmu/mFLLsGWv6HnQHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uREyWY7QMr9QE2i77ujwNRBEfT9rMHW6NBndMeQkaEchqjuWCVxCVB7pHlE9GVvTkvCe13rW1BYtSupFWlbsEjPLGqlXgZQTwDYJto5XzHwwhZEZIPvboA0YxRJylhtWEerhFOukrT7shOKA3I3DQyn3bWwBm/o80EXY0RJqYlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2BOKYll; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2BOKYll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709455242; x=1740991242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNkc2cbgph7UqtyFZ+seaxjY5cmu/mFLLsGWv6HnQHk=;
  b=M2BOKYll864RSdMJPix00Hm4fuauASl/Wqrxz6sO2RcukVtKtGkPkb1x
   rU3hrKlgadFjAFy27KZxsFo2ajiyZaESY0YUQk6XcYIXQkge/MXDen5nN
   GMN0uBGRc7yUZWK03AYZ5d1HMqP2DmHhOpj0aS6WChE/BCWYUzX/0dt0f
   CbI9X+u7SDDoudQA3OS5qtICgapRt7VMeWLH0ZLqEh2vZfc06hubLrfbs
   aFE61D/p66+W2S8r4VKXgX/nZ6Pe2WdkQnE2P34hyH0ii1TQhgr3dPBCZ
   p1gD0khVMN5Ge7I9EIbm1fD5UdEZrenYJDgrKNQco2H/w8k78WiLbWpd1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="21496131"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="21496131"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 00:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13231277"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 00:40:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rghOg-0001XY-0J;
	Sun, 03 Mar 2024 08:40:38 +0000
Date: Sun, 3 Mar 2024 16:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2688/3769] drivers/acpi/pptt.c:309:5: sparse:
 sparse: symbol 'acpi_pptt_for_each_container' was not declared. Should it be
 static?
Message-ID: <202403031641.WjM6vjTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: 1ab6383ee94e788fe424d7eac10dc8ec3bfa6828 [2688/3769] ACPI / PPTT: Provide a helper to walk processor containers
config: loongarch-randconfig-r112-20240302 (https://download.01.org/0day-ci/archive/20240303/202403031641.WjM6vjTf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240303/202403031641.WjM6vjTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031641.WjM6vjTf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/pptt.c:309:5: sparse: sparse: symbol 'acpi_pptt_for_each_container' was not declared. Should it be static?

vim +/acpi_pptt_for_each_container +309 drivers/acpi/pptt.c

   297	
   298	/**
   299	 * acpi_pptt_for_each_container() - Iterate over all processor containers
   300	 *
   301	 * Not all 'Processor' entries in the PPTT are either a CPU or a Processor
   302	 * Container, they may exist purely to describe a Private resource. CPUs
   303	 * have to be leaves, so a Processor Container is a non-leaf that has the
   304	 * 'ACPI Processor ID valid' flag set.
   305	 *
   306	 * Return: 0 for a complete walk, or the first non-zero value from the callback
   307	 *         that stopped the walk.
   308	 */
 > 309	int acpi_pptt_for_each_container(acpi_pptt_cpu_callback_t callback, void *arg)
   310	{
   311		struct acpi_pptt_processor *cpu_node;
   312		struct acpi_table_header *table_hdr;
   313		struct acpi_subtable_header *entry;
   314		bool leaf_flag, has_leaf_flag = false;
   315		unsigned long table_end;
   316		acpi_status status;
   317		u32 proc_sz;
   318		int ret = 0;
   319	
   320		status = acpi_get_table(ACPI_SIG_PPTT, 0, &table_hdr);
   321		if (ACPI_FAILURE(status))
   322			return 0;
   323	
   324		if (table_hdr->revision > 1)
   325			has_leaf_flag = true;
   326	
   327		table_end = (unsigned long)table_hdr + table_hdr->length;
   328		entry = ACPI_ADD_PTR(struct acpi_subtable_header, table_hdr,
   329				     sizeof(struct acpi_table_pptt));
   330		proc_sz = sizeof(struct acpi_pptt_processor);
   331		while ((unsigned long)entry + proc_sz < table_end) {
   332			cpu_node = (struct acpi_pptt_processor *)entry;
   333			if (entry->type == ACPI_PPTT_TYPE_PROCESSOR &&
   334			    cpu_node->flags & ACPI_PPTT_ACPI_PROCESSOR_ID_VALID)
   335			{
   336				leaf_flag = cpu_node->flags & ACPI_PPTT_ACPI_LEAF_NODE;
   337				if ((has_leaf_flag && !leaf_flag) ||
   338				    (!has_leaf_flag && !acpi_pptt_leaf_node(table_hdr, cpu_node)))
   339				{
   340					ret = callback(cpu_node, arg);
   341					if (ret)
   342						break;
   343				}
   344			}
   345			entry = ACPI_ADD_PTR(struct acpi_subtable_header, entry,
   346					     entry->length);
   347		}
   348	
   349		acpi_put_table(table_hdr);
   350	
   351		return ret;
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
