Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F68B43AA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 18:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374116; cv=none; b=jr+k84NPj6VRDpLReWXi4DIOpG/lGaotvpMb2gQBiLQJVaVbM0Y7KDZEfPD73MHUa5+dkyM9mV5rPcF3jh4NzuvwYJwdPKW2brcT6Ccrsrbmse+YumiFOwxmXPOEyobO10NUaxgpiANZazk9XytWscO4LdBxmrNj3OmDN2Y+Flk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374116; c=relaxed/simple;
	bh=vxpbgAkCICUKPIhdoKouzhQlrVcQkDqBnjiZdpe8YZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ERue6rnfzD+WrqVmoWNvoACCrMoHB/GRSzv+gMTJl1Kab6TsYsnC4Vbn2iLVQEUdedpgFpxrhxWN0CqRF9J7GpmDTcXVKacR0YqN17GeUOoD1tTTSu9KJRfnxMYDi8gtATJHObQsyiEOMm/079ffFDUzN1pQLUqD1h17YsY/aXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9rvzFPo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9rvzFPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734374113; x=1765910113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxpbgAkCICUKPIhdoKouzhQlrVcQkDqBnjiZdpe8YZY=;
  b=O9rvzFPoV+H5ELLVA64N24EWLOTVM6wrkCswrPFdYyPsZMGDVWszq/hA
   DdEkwOtGbvuce5ZiL8xbBSX9mqqFHF4uoNHKaxkvM125k1pg0rVBX/H21
   IV2NfyKec6VO07Uyiz1k/zQe9b14r+zsXIi/h85dFxQDpYm7maDGwDxA1
   meXQexBpCidZ4000TF7mYwme3lvNK1SQ0AEM9oWpNmCCYTQY/YERLW0VQ
   7MaWQJuUmznfI+pbbSEdccR/k23HeeR0JxFfWZB0l7XawvfWhKFsWNGmw
   Ye7iEoMcjCjHvokkQLndlzZ1Swk/DJo/odbflRauCiosqI6LGWnXakyty
   Q==;
X-CSE-ConnectionGUID: G7po7hb8T8qViYqEviAohA==
X-CSE-MsgGUID: nNlsZnHcSu2RnJV98/GL6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="22364451"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="22364451"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 10:35:12 -0800
X-CSE-ConnectionGUID: FxjUfRVVRW64uDuujzKULw==
X-CSE-MsgGUID: EbX+2Q5oQSKaSXVK6+Qv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120544513"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2024 10:35:11 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNFvx-000EPE-1i;
	Mon, 16 Dec 2024 18:35:09 +0000
Date: Tue, 17 Dec 2024 02:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-6.14 13/29]
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c:337:33: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202412170233.8DnsdtY6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.14
head:   5725bce709db1c001140d79398581e067e28c031
commit: dd0b6b1f29b92202d03a6d2dd7d65ecead27941a [13/29] firmware: cs_dsp: Add KUnit testing of bin file download
config: arm-randconfig-r133-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170233.8DnsdtY6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241217/202412170233.8DnsdtY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170233.8DnsdtY6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c:337:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] len @@     got unsigned int [assigned] [usertype] description_len @@
   drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c:337:33: sparse:     expected restricted __le16 [usertype] len
   drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c:337:33: sparse:     got unsigned int [assigned] [usertype] description_len
--
>> drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c:540:28: sparse: sparse: cast to restricted __be32

vim +337 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c

5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  260  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  261  void cs_dsp_mock_wmfw_add_coeff_desc(struct cs_dsp_mock_wmfw_builder *builder,
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  262  				     const struct cs_dsp_mock_coeff_def *def)
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  263  {
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  264  	struct wmfw_adsp_coeff_data *v1;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  265  	struct wmfw_short_string *shortstring;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  266  	struct wmfw_long_string *longstring;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  267  	size_t bytes_needed, shortname_len, fullname_len, description_len;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  268  	__le32 *ple32;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  269  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  270  	KUNIT_ASSERT_NOT_NULL(builder->test_priv->test, builder->alg_data_header);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  271  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  272  	switch (builder->format_version) {
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  273  	case 0:
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  274  		return;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  275  	case 1:
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  276  		bytes_needed = offsetof(struct wmfw_adsp_coeff_data, data);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  277  		KUNIT_ASSERT_TRUE(builder->test_priv->test,
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  278  				  (builder->write_p + bytes_needed) <
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  279  				  (builder->buf + CS_DSP_MOCK_WMFW_BUF_SIZE));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  280  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  281  		v1 = (struct wmfw_adsp_coeff_data *)builder->write_p;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  282  		memset(v1, 0, sizeof(*v1));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  283  		v1->hdr.offset = cpu_to_le16(def->offset_dsp_words);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  284  		v1->hdr.type = cpu_to_le16(def->mem_type);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  285  		v1->hdr.size = cpu_to_le32(bytes_needed - sizeof(v1->hdr));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  286  		v1->ctl_type = cpu_to_le16(def->type);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  287  		v1->flags = cpu_to_le16(def->flags);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  288  		v1->len = cpu_to_le32(def->length_bytes);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  289  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  290  		if (def->fullname)
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  291  			strscpy(v1->name, def->fullname, sizeof(v1->name));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  292  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  293  		if (def->description)
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  294  			strscpy(v1->descr, def->description, sizeof(v1->descr));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  295  		break;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  296  	default:
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  297  		fullname_len = 0;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  298  		description_len = 0;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  299  		shortname_len = strlen(def->shortname);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  300  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  301  		if (def->fullname)
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  302  			fullname_len = strlen(def->fullname);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  303  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  304  		if (def->description)
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  305  			description_len = strlen(def->description);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  306  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  307  		bytes_needed = sizeof(__le32) * 2; /* type, offset and size */
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  308  		bytes_needed += round_up(shortname_len + sizeof(u8), sizeof(__le32));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  309  		bytes_needed += round_up(fullname_len + sizeof(u8), sizeof(__le32));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  310  		bytes_needed += round_up(description_len + sizeof(__le16), sizeof(__le32));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  311  		bytes_needed += sizeof(__le32) * 2; /* flags, type and length */
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  312  		KUNIT_ASSERT_TRUE(builder->test_priv->test,
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  313  				  (builder->write_p + bytes_needed) <
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  314  				  (builder->buf + CS_DSP_MOCK_WMFW_BUF_SIZE));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  315  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  316  		ple32 = (__force __le32 *)builder->write_p;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  317  		*ple32++ = cpu_to_le32(def->offset_dsp_words | (def->mem_type << 16));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  318  		*ple32++ = cpu_to_le32(bytes_needed - sizeof(__le32) - sizeof(__le32));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  319  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  320  		shortstring = (__force struct wmfw_short_string *)ple32;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  321  		shortstring->len = shortname_len;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  322  		memcpy(shortstring->data, def->shortname, shortname_len);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  323  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  324  		/* Round up to next __le32 multiple */
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  325  		ple32 += round_up(struct_size_t(struct wmfw_short_string, data, shortname_len),
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  326  				  sizeof(*ple32)) / sizeof(*ple32);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  327  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  328  		shortstring = (__force struct wmfw_short_string *)ple32;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  329  		shortstring->len = fullname_len;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  330  		memcpy(shortstring->data, def->fullname, fullname_len);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  331  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  332  		/* Round up to next __le32 multiple */
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  333  		ple32 += round_up(struct_size_t(struct wmfw_short_string, data, fullname_len),
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  334  				  sizeof(*ple32)) / sizeof(*ple32);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  335  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  336  		longstring = (__force struct wmfw_long_string *)ple32;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12 @337  		longstring->len = description_len;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  338  		memcpy(longstring->data, def->description, description_len);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  339  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  340  		/* Round up to next __le32 multiple */
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  341  		ple32 += round_up(struct_size_t(struct wmfw_long_string, data, description_len),
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  342  				  sizeof(*ple32)) / sizeof(*ple32);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  343  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  344  		*ple32++ = cpu_to_le32(def->type | (def->flags << 16));
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  345  		*ple32 = cpu_to_le32(def->length_bytes);
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  346  		break;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  347  	}
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  348  
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  349  	builder->write_p += bytes_needed;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  350  	builder->bytes_used += bytes_needed;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  351  	builder->num_coeffs++;
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  352  }
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  353  EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_wmfw_add_coeff_desc, "FW_CS_DSP_KUNIT_TEST_UTILS");
5cf1b7b471803f7 Richard Fitzgerald 2024-12-12  354  

:::::: The code at line 337 was first introduced by commit
:::::: 5cf1b7b471803f7cc654a29ee16cb085ad69c097 firmware: cs_dsp: Add mock wmfw file generator for KUnit testing

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
