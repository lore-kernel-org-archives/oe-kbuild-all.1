Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558C3DC87A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002060; cv=none; b=iIqjCiHFMnDcuwX1ewNynayJmsCABGuvRIfO1Sz0oGWP0pik+B7f3PC3sO+rTe36Ns51dyO5CccAA5I8RabaFG+i8Pxzydf+naWfUqk58+PsSGUKAGIst2zddnHgTBnm5AXkW5DZTjB5/HRs+9nATyRsVI/adBenULR1si/E9C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002060; c=relaxed/simple;
	bh=Iae508Q5YpwLhwofPLCZvLJ2krRH/h1LPqdg0yY1rAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HoQzLChEPiJVtFUwRr72oNEIMtPLry2076yqcW824jL/kHkEmbgexfytJhC+DNf8/dTBW00EWz+88GOigloBfd+XNtBmFHYfprIJDhltYuuYD9vT3hauL8kMgN69mlyQE/ebVGGF3SMTMLdo1cYybmEM4rt3sH/ylwv3Rl3JXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VThYSsG9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VThYSsG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786002059; x=1817538059;
  h=date:from:to:cc:subject:message-id;
  bh=Iae508Q5YpwLhwofPLCZvLJ2krRH/h1LPqdg0yY1rAk=;
  b=VThYSsG9ITRDUn08tked8psVY+kjKrgzjr2utA0uRJwMxND/UnSR0Y+C
   +f0RKLtSD4jkjzoiq61HxHorjDAs3Hcn1aOoj6sSJkILi2y31qdOAPkub
   78S6ydLOVVLcJxipi6wVtSWoEg1AOzmZQmtpB/C+9NDgtfuAwrL/GSQnH
   EPjqwJGdJotXYEW1sZVjiNcExs7/IQ5gryCN/In2BzyLPICO/XwcB4nZV
   JV81bBbc4UFu0DpC+03HNh0diA84Tt1AjWBP8Ns3njpAoCsHyWTh90/HN
   WXhPxcBSvxSOy0Got9ObQEZzxfz4F+kKBrNDM2RlXzk/ZTn6ht8etlumK
   A==;
X-CSE-ConnectionGUID: iH+/gJIHQBG9tti+aCymGA==
X-CSE-MsgGUID: xD0lUS6aQMSFHtXnj7R60A==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86703134"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86703134"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:40:59 -0700
X-CSE-ConnectionGUID: 27ml2ddlQIeoeQL2HDldkg==
X-CSE-MsgGUID: /HL/1dpfRCWxwOdQy1LfMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260265080"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2026 00:40:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsik-00000000EWl-1QHe;
	Thu, 06 Aug 2026 07:40:54 +0000
Date: Thu, 06 Aug 2026 15:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 9585/13093]
 drivers/soc/qcom/smem_dramc.c:235:87: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202608061531.vrPqyyLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1701fda2f58e345c050f4309971bdc07cd6146ba
commit: 1d234eeafc56af8c9af6eee857f41a4310615e78 [9585/13093] soc: qcom: smem: Expose DDR data from SMEM
config: m68k-randconfig-r131-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061531.vrPqyyLQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061531.vrPqyyLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061531.vrPqyyLQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/smem_dramc.c:235:87: sparse: sparse: restricted __le32 degrades to integer
>> drivers/soc/qcom/smem_dramc.c:385:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/soc/qcom/smem_dramc.c:384:45: sparse: signed value source

vim +235 drivers/soc/qcom/smem_dramc.c

   226	
   227	static void smem_dram_parse_v3_14freqs_data(struct smem_dram *dram, void *data)
   228	{
   229		struct ddr_details_v3_14freqs *details = data;
   230	
   231		for (int i = 0; i < MAX_DDR_FREQ_NUM_V3 + 1; i++) {
   232			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   233	
   234			if (freq_entry->freq_khz && freq_entry->enabled)
 > 235				dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
   236		}
   237	}
   238	
   239	static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
   240	{
   241		struct ddr_details_v4 *details = data;
   242	
   243		/* Rank 0 channel 0 entry holds the correct value */
   244		dram->hbb = details->highest_bank_addr_bit[0][0];
   245	
   246		for (int i = 0; i < MAX_DDR_FREQ_NUM_V3; i++) {
   247			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   248	
   249			if (freq_entry->freq_khz && freq_entry->enabled) {
   250				u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
   251				dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
   252			}
   253		}
   254	}
   255	
   256	static void smem_dram_parse_v5_data(struct smem_dram *dram, void *data)
   257	{
   258		struct ddr_details_v5 *details = data;
   259		struct ddr_regions_v5 *region = &details->ddr_regions;
   260	
   261		dram->hbb = le32_to_cpu(region[0].highest_bank_addr_bit);
   262	
   263		for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
   264			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   265	
   266			if (freq_entry->freq_khz && freq_entry->enabled) {
   267				u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
   268				dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
   269			}
   270		}
   271	}
   272	
   273	static void smem_dram_parse_v7_data(struct smem_dram *dram, void *data)
   274	{
   275		struct ddr_details_v7 *details = data;
   276		struct ddr_regions_v5 *region = &details->ddr_regions;
   277	
   278		dram->hbb = le32_to_cpu(region[0].highest_bank_addr_bit);
   279	
   280		for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
   281			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   282	
   283			if (freq_entry->freq_khz && freq_entry->enabled) {
   284				u32 freq_khz = le32_to_cpu(freq_entry->freq_khz);
   285				dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;
   286			}
   287		}
   288	}
   289	
   290	/* The structure contains no version field, so we have to perform some guesswork.. */
   291	static int smem_dram_infer_struct_version(size_t size)
   292	{
   293		/* Some early versions provided less bytes of less useful data */
   294		if (size < sizeof(struct ddr_details_v3))
   295			return -EINVAL;
   296	
   297		if (size == sizeof(struct ddr_details_v3))
   298			return INFO_V3;
   299	
   300		if (size == sizeof(struct ddr_details_v3_14freqs))
   301			return INFO_V3_WITH_14_FREQS;
   302	
   303		if (size == sizeof(struct ddr_details_v4))
   304			return INFO_V4;
   305	
   306		if (size == sizeof(struct ddr_details_v5) +
   307			    4 * sizeof(struct ddr_region_v5))
   308			return INFO_V5;
   309	
   310		if (size == sizeof(struct ddr_details_v5) +
   311			    4 * sizeof(struct ddr_region_v5) +
   312			    sizeof(struct ddr_xbl2quantum_smem_data) +
   313			    sizeof(struct shub_freq_plan_entry))
   314			return INFO_V5;
   315	
   316		if (size == sizeof(struct ddr_details_v5) +
   317			    6 * sizeof(struct ddr_region_v5))
   318			return INFO_V5_WITH_6_REGIONS;
   319	
   320		if (size == sizeof(struct ddr_details_v5) +
   321			    6 * sizeof(struct ddr_region_v5) +
   322			    sizeof(struct ddr_xbl2quantum_smem_data) +
   323			    sizeof(struct shub_freq_plan_entry))
   324			return INFO_V5_WITH_6_REGIONS;
   325	
   326		if (size == sizeof(struct ddr_details_v5) +
   327			    6 * sizeof(struct ddr_region_v5) +
   328			    sizeof(struct ddr_misc_info_v6) +
   329			    sizeof(struct shub_freq_plan_entry))
   330			return INFO_V6;
   331	
   332		if (size == sizeof(struct ddr_details_v7) +
   333			    4 * sizeof(struct ddr_region_v5) +
   334			    sizeof(struct ddr_misc_info_v6) +
   335			    sizeof(struct shub_freq_plan_entry))
   336			return INFO_V7;
   337	
   338		if (size == sizeof(struct ddr_details_v7) +
   339			    6 * sizeof(struct ddr_region_v5) +
   340			    sizeof(struct ddr_misc_info_v6) +
   341			    sizeof(struct shub_freq_plan_entry))
   342			return INFO_V7_WITH_6_REGIONS;
   343	
   344		return INFO_UNKNOWN;
   345	}
   346	
   347	static int smem_dram_frequencies_show(struct seq_file *s, void *unused)
   348	{
   349		struct smem_dram *dram = s->private;
   350	
   351		for (int i = 0; i < dram->num_frequencies; i++)
   352			seq_printf(s, "%lu\n", dram->frequencies[i]);
   353	
   354		return 0;
   355	}
   356	DEFINE_SHOW_ATTRIBUTE(smem_dram_frequencies);
   357	
   358	static int smem_hbb_show(struct seq_file *s, void *unused)
   359	{
   360		struct smem_dram *dram = s->private;
   361	
   362		if (!dram->hbb)
   363			return -EINVAL;
   364	
   365		seq_printf(s, "%d\n", dram->hbb);
   366	
   367		return 0;
   368	}
   369	DEFINE_SHOW_ATTRIBUTE(smem_hbb);
   370	
   371	struct dentry *smem_dram_parse(struct qcom_smem *smem, struct device *dev)
   372	{
   373		struct dentry *debugfs_dir;
   374		enum ddr_info_version ver;
   375		struct smem_dram *dram;
   376		size_t actual_size;
   377		void *data;
   378	
   379		/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
   380		data = __qcom_smem_get(smem, QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
   381		if (IS_ERR_OR_NULL(data))
   382			return ERR_PTR(-ENODATA);
   383	
   384		ver = smem_dram_infer_struct_version(actual_size);
 > 385		if (ver < 0) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
