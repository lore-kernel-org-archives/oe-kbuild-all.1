Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B11195B18
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734188251; cv=none; b=uCZVzMvLbOByhGK4m0CAOCgV/9+Z3iOYtviSCCRMZlRPrBZGEksk8ed3/E2HHKPvbO74fzJoschLrsEVG5ggwfopgpNDXF6lnNRWbp73Th39Xkz86mWnQzvSZfu2us+yTa4Pph4yfUL9DU6aC+yu/7JhN7tKcqF30fsL3WIL+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734188251; c=relaxed/simple;
	bh=Q8wnozErmY4m/qN+ZddbovkebuzBeCBt6V1EZpORDQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XrfMcSIi8cnrBlXmDHELvLrr/fEogwxmHBn840Ie2J49uDNNjmnGuPT9OgOXwWttC9Fy25vIN4l3ote9MFmFh8Lz8fQkxqmu56fq+0LpI3+EP6CAT6imHY4reMz3QWtu5pRdmzAwNsRzV0hgB5CiaarfAkqmGZxg6T7vvGkPpeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAT5l2LQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAT5l2LQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734188250; x=1765724250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8wnozErmY4m/qN+ZddbovkebuzBeCBt6V1EZpORDQg=;
  b=AAT5l2LQiZpOyG7jtiVjRTLCFB47HQkS62ax9nRX8A89uQ5/XEVegdou
   7jmFjyBOLXBnHrncGJe7CmlBAkHGwaxMyuNn7ZEORk9ddIUDiCTJUMa9F
   rWqwzGq3X6daYLv0d5Dp5mZPsMIyH+E+j6qnzabC7Fcop04P6kTytr4mT
   wN0EC1lgApRhAskMYw3NAHTZJq6zn0zzoA6AjA1TrWUF71hjEhIScxlC5
   Dodl2/OMbIERi8gA02KxhHqZcWsjrccEYnPnqpyPaFO5uVkr+aK0/Va0q
   wzZaM7QbQoEmV6E2jtu3q8TmcSo8KjFU/6qpbbTcBMbzCm/TMhKdGq5TK
   Q==;
X-CSE-ConnectionGUID: xcy7eGA4RASLdGkcFyeqcw==
X-CSE-MsgGUID: 5JDi2I2ZRiKiOyQpe9e6Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38313290"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="38313290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 06:57:29 -0800
X-CSE-ConnectionGUID: tK9sS442QKeKKGSpxiTzhg==
X-CSE-MsgGUID: 98MnqsoURyKsUzq2ROtVUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="101886380"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2024 06:57:27 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMTa8-000CzL-2Y;
	Sat, 14 Dec 2024 14:57:24 +0000
Date: Sat, 14 Dec 2024 22:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.14 13/25]
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c:153: warning: Function
 parameter or struct member 'alg_id' not described in
 'cs_dsp_mock_bin_add_patch'
Message-ID: <202412142205.HHHcousT-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.14
head:   5ce3beed07b8145aff61f2cb41f1868f6221271f
commit: dd0b6b1f29b92202d03a6d2dd7d65ecead27941a [13/25] firmware: cs_dsp: Add KUnit testing of bin file download
config: arc-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412142205.HHHcousT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412142205.HHHcousT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412142205.HHHcousT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/cirrus/test/cs_dsp_mock_bin.c:67: warning: Function parameter or struct member 'alg_id' not described in 'cs_dsp_mock_bin_add_raw_block'
>> drivers/firmware/cirrus/test/cs_dsp_mock_bin.c:67: warning: Excess function parameter 'alg_ig' description in 'cs_dsp_mock_bin_add_raw_block'
>> drivers/firmware/cirrus/test/cs_dsp_mock_bin.c:153: warning: Function parameter or struct member 'alg_id' not described in 'cs_dsp_mock_bin_add_patch'
>> drivers/firmware/cirrus/test/cs_dsp_mock_bin.c:153: warning: Excess function parameter 'alg_ig' description in 'cs_dsp_mock_bin_add_patch'


vim +153 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c

7c052c6615297ff Richard Fitzgerald 2024-12-12   51  
7c052c6615297ff Richard Fitzgerald 2024-12-12   52  /**
7c052c6615297ff Richard Fitzgerald 2024-12-12   53   * cs_dsp_mock_bin_add_raw_block() - Add a data block to the bin file.
7c052c6615297ff Richard Fitzgerald 2024-12-12   54   *
7c052c6615297ff Richard Fitzgerald 2024-12-12   55   * @builder:		Pointer to struct cs_dsp_mock_bin_builder.
7c052c6615297ff Richard Fitzgerald 2024-12-12   56   * @alg_ig:		Algorithm ID.
7c052c6615297ff Richard Fitzgerald 2024-12-12   57   * @alg_ver:		Algorithm version.
7c052c6615297ff Richard Fitzgerald 2024-12-12   58   * @type:		Type of the block.
7c052c6615297ff Richard Fitzgerald 2024-12-12   59   * @offset:		Offset.
7c052c6615297ff Richard Fitzgerald 2024-12-12   60   * @payload_data:	Pointer to buffer containing the payload data.
7c052c6615297ff Richard Fitzgerald 2024-12-12   61   * @payload_len_bytes:	Length of payload data in bytes.
7c052c6615297ff Richard Fitzgerald 2024-12-12   62   */
7c052c6615297ff Richard Fitzgerald 2024-12-12   63  void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
7c052c6615297ff Richard Fitzgerald 2024-12-12   64  				   unsigned int alg_id, unsigned int alg_ver,
7c052c6615297ff Richard Fitzgerald 2024-12-12   65  				   int type, unsigned int offset,
7c052c6615297ff Richard Fitzgerald 2024-12-12   66  				   const void *payload_data, size_t payload_len_bytes)
7c052c6615297ff Richard Fitzgerald 2024-12-12  @67  {
7c052c6615297ff Richard Fitzgerald 2024-12-12   68  	struct wmfw_coeff_item *item;
7c052c6615297ff Richard Fitzgerald 2024-12-12   69  	size_t bytes_needed = struct_size_t(struct wmfw_coeff_item, data, payload_len_bytes);
7c052c6615297ff Richard Fitzgerald 2024-12-12   70  
7c052c6615297ff Richard Fitzgerald 2024-12-12   71  	KUNIT_ASSERT_TRUE(builder->test_priv->test,
7c052c6615297ff Richard Fitzgerald 2024-12-12   72  			  (builder->write_p + bytes_needed) <
7c052c6615297ff Richard Fitzgerald 2024-12-12   73  			  (builder->buf + CS_DSP_MOCK_BIN_BUF_SIZE));
7c052c6615297ff Richard Fitzgerald 2024-12-12   74  
7c052c6615297ff Richard Fitzgerald 2024-12-12   75  	item = builder->write_p;
7c052c6615297ff Richard Fitzgerald 2024-12-12   76  
7c052c6615297ff Richard Fitzgerald 2024-12-12   77  	item->offset = cpu_to_le16(offset);
7c052c6615297ff Richard Fitzgerald 2024-12-12   78  	item->type = cpu_to_le16(type);
7c052c6615297ff Richard Fitzgerald 2024-12-12   79  	item->id = cpu_to_le32(alg_id);
7c052c6615297ff Richard Fitzgerald 2024-12-12   80  	item->ver = cpu_to_le32(alg_ver << 8);
7c052c6615297ff Richard Fitzgerald 2024-12-12   81  	item->len = cpu_to_le32(payload_len_bytes);
7c052c6615297ff Richard Fitzgerald 2024-12-12   82  
7c052c6615297ff Richard Fitzgerald 2024-12-12   83  	if (payload_len_bytes)
7c052c6615297ff Richard Fitzgerald 2024-12-12   84  		memcpy(item->data, payload_data, payload_len_bytes);
7c052c6615297ff Richard Fitzgerald 2024-12-12   85  
7c052c6615297ff Richard Fitzgerald 2024-12-12   86  	builder->write_p += bytes_needed;
7c052c6615297ff Richard Fitzgerald 2024-12-12   87  	builder->bytes_used += bytes_needed;
7c052c6615297ff Richard Fitzgerald 2024-12-12   88  }
7c052c6615297ff Richard Fitzgerald 2024-12-12   89  EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_raw_block, "FW_CS_DSP_KUNIT_TEST_UTILS");
7c052c6615297ff Richard Fitzgerald 2024-12-12   90  
7c052c6615297ff Richard Fitzgerald 2024-12-12   91  static void cs_dsp_mock_bin_add_name_or_info(struct cs_dsp_mock_bin_builder *builder,
7c052c6615297ff Richard Fitzgerald 2024-12-12   92  					     const char *info, int type)
7c052c6615297ff Richard Fitzgerald 2024-12-12   93  {
7c052c6615297ff Richard Fitzgerald 2024-12-12   94  	size_t info_len = strlen(info);
7c052c6615297ff Richard Fitzgerald 2024-12-12   95  	char *tmp = NULL;
7c052c6615297ff Richard Fitzgerald 2024-12-12   96  
7c052c6615297ff Richard Fitzgerald 2024-12-12   97  	if (info_len % 4) {
7c052c6615297ff Richard Fitzgerald 2024-12-12   98  		/* Create a padded string with length a multiple of 4 */
7c052c6615297ff Richard Fitzgerald 2024-12-12   99  		info_len = round_up(info_len, 4);
7c052c6615297ff Richard Fitzgerald 2024-12-12  100  		tmp = kunit_kzalloc(builder->test_priv->test, info_len, GFP_KERNEL);
7c052c6615297ff Richard Fitzgerald 2024-12-12  101  		KUNIT_ASSERT_NOT_ERR_OR_NULL(builder->test_priv->test, tmp);
7c052c6615297ff Richard Fitzgerald 2024-12-12  102  		memcpy(tmp, info, info_len);
7c052c6615297ff Richard Fitzgerald 2024-12-12  103  		info = tmp;
7c052c6615297ff Richard Fitzgerald 2024-12-12  104  	}
7c052c6615297ff Richard Fitzgerald 2024-12-12  105  
7c052c6615297ff Richard Fitzgerald 2024-12-12  106  	cs_dsp_mock_bin_add_raw_block(builder, 0, 0, WMFW_INFO_TEXT, 0, info, info_len);
7c052c6615297ff Richard Fitzgerald 2024-12-12  107  	kunit_kfree(builder->test_priv->test, tmp);
7c052c6615297ff Richard Fitzgerald 2024-12-12  108  }
7c052c6615297ff Richard Fitzgerald 2024-12-12  109  
7c052c6615297ff Richard Fitzgerald 2024-12-12  110  /**
7c052c6615297ff Richard Fitzgerald 2024-12-12  111   * cs_dsp_mock_bin_add_info() - Add an info block to the bin file.
7c052c6615297ff Richard Fitzgerald 2024-12-12  112   *
7c052c6615297ff Richard Fitzgerald 2024-12-12  113   * @builder:	Pointer to struct cs_dsp_mock_bin_builder.
7c052c6615297ff Richard Fitzgerald 2024-12-12  114   * @info:	Pointer to info string to be copied into the file.
7c052c6615297ff Richard Fitzgerald 2024-12-12  115   *
7c052c6615297ff Richard Fitzgerald 2024-12-12  116   * The string will be padded to a length that is a multiple of 4 bytes.
7c052c6615297ff Richard Fitzgerald 2024-12-12  117   */
7c052c6615297ff Richard Fitzgerald 2024-12-12  118  void cs_dsp_mock_bin_add_info(struct cs_dsp_mock_bin_builder *builder,
7c052c6615297ff Richard Fitzgerald 2024-12-12  119  			      const char *info)
7c052c6615297ff Richard Fitzgerald 2024-12-12  120  {
7c052c6615297ff Richard Fitzgerald 2024-12-12  121  	cs_dsp_mock_bin_add_name_or_info(builder, info, WMFW_INFO_TEXT);
7c052c6615297ff Richard Fitzgerald 2024-12-12  122  }
7c052c6615297ff Richard Fitzgerald 2024-12-12  123  EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_info, "FW_CS_DSP_KUNIT_TEST_UTILS");
7c052c6615297ff Richard Fitzgerald 2024-12-12  124  
7c052c6615297ff Richard Fitzgerald 2024-12-12  125  /**
7c052c6615297ff Richard Fitzgerald 2024-12-12  126   * cs_dsp_mock_bin_add_name() - Add a name block to the bin file.
7c052c6615297ff Richard Fitzgerald 2024-12-12  127   *
7c052c6615297ff Richard Fitzgerald 2024-12-12  128   * @builder:	Pointer to struct cs_dsp_mock_bin_builder.
7c052c6615297ff Richard Fitzgerald 2024-12-12  129   * @name:	Pointer to name string to be copied into the file.
7c052c6615297ff Richard Fitzgerald 2024-12-12  130   */
7c052c6615297ff Richard Fitzgerald 2024-12-12  131  void cs_dsp_mock_bin_add_name(struct cs_dsp_mock_bin_builder *builder,
7c052c6615297ff Richard Fitzgerald 2024-12-12  132  			      const char *name)
7c052c6615297ff Richard Fitzgerald 2024-12-12  133  {
7c052c6615297ff Richard Fitzgerald 2024-12-12  134  	cs_dsp_mock_bin_add_name_or_info(builder, name, WMFW_NAME_TEXT);
7c052c6615297ff Richard Fitzgerald 2024-12-12  135  }
7c052c6615297ff Richard Fitzgerald 2024-12-12  136  EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_name, "FW_CS_DSP_KUNIT_TEST_UTILS");
7c052c6615297ff Richard Fitzgerald 2024-12-12  137  
7c052c6615297ff Richard Fitzgerald 2024-12-12  138  /**
7c052c6615297ff Richard Fitzgerald 2024-12-12  139   * cs_dsp_mock_bin_add_patch() - Add a patch data block to the bin file.
7c052c6615297ff Richard Fitzgerald 2024-12-12  140   *
7c052c6615297ff Richard Fitzgerald 2024-12-12  141   * @builder:		Pointer to struct cs_dsp_mock_bin_builder.
7c052c6615297ff Richard Fitzgerald 2024-12-12  142   * @alg_ig:		Algorithm ID for the patch.
7c052c6615297ff Richard Fitzgerald 2024-12-12  143   * @alg_ver:		Algorithm version for the patch.
7c052c6615297ff Richard Fitzgerald 2024-12-12  144   * @mem_region:		Memory region for the patch.
7c052c6615297ff Richard Fitzgerald 2024-12-12  145   * @reg_addr_offset:	Offset to start of data in register addresses.
7c052c6615297ff Richard Fitzgerald 2024-12-12  146   * @payload_data:	Pointer to buffer containing the payload data.
7c052c6615297ff Richard Fitzgerald 2024-12-12  147   * @payload_len_bytes:	Length of payload data in bytes.
7c052c6615297ff Richard Fitzgerald 2024-12-12  148   */
7c052c6615297ff Richard Fitzgerald 2024-12-12  149  void cs_dsp_mock_bin_add_patch(struct cs_dsp_mock_bin_builder *builder,
7c052c6615297ff Richard Fitzgerald 2024-12-12  150  			       unsigned int alg_id, unsigned int alg_ver,
7c052c6615297ff Richard Fitzgerald 2024-12-12  151  			       int mem_region, unsigned int reg_addr_offset,
7c052c6615297ff Richard Fitzgerald 2024-12-12  152  			       const void *payload_data, size_t payload_len_bytes)
7c052c6615297ff Richard Fitzgerald 2024-12-12 @153  {
7c052c6615297ff Richard Fitzgerald 2024-12-12  154  	/* Payload length must be a multiple of 4 */
7c052c6615297ff Richard Fitzgerald 2024-12-12  155  	KUNIT_ASSERT_EQ(builder->test_priv->test, payload_len_bytes % 4, 0);
7c052c6615297ff Richard Fitzgerald 2024-12-12  156  
7c052c6615297ff Richard Fitzgerald 2024-12-12  157  	cs_dsp_mock_bin_add_raw_block(builder, alg_id, alg_ver,
7c052c6615297ff Richard Fitzgerald 2024-12-12  158  				      mem_region, reg_addr_offset,
7c052c6615297ff Richard Fitzgerald 2024-12-12  159  				      payload_data, payload_len_bytes);
7c052c6615297ff Richard Fitzgerald 2024-12-12  160  }
7c052c6615297ff Richard Fitzgerald 2024-12-12  161  EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_patch, "FW_CS_DSP_KUNIT_TEST_UTILS");
7c052c6615297ff Richard Fitzgerald 2024-12-12  162  

:::::: The code at line 153 was first introduced by commit
:::::: 7c052c6615297ff32032105130cd5f02059f7ae4 firmware: cs_dsp: Add mock bin file generator for KUnit testing

:::::: TO: Richard Fitzgerald <rf@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
