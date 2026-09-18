Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A42EEE63
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691068; cv=none; b=bkPAk/riIT2/sCFZEDRTCatWZfGLqd2jOsbq8wlbxDrZL3OjKyXBjRgaPxHfZBkvhknF+nxj+poFwAEiqz6tl7Z0AU/CpaW5yIr7AhZKS4jZ8vQEGAsYoXvvhWXeXO9VPlNn7lcYPHxlJJbJMMNplpGI/VXBce9E93xTPr3zMeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691068; c=relaxed/simple;
	bh=Un/X4dUVyAa7quQLPeFnbQopAkd0hOdNELLOyOnT1+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cyMqaCyI/hUuRNId+eoowWfXKxFSwwsRDoZrdHygc8CiEjeuSsAWFnq01zk8pGE+FI32e/pWdKPN8HC6uyQ0Ut6OPxDENk5+t2HYnVYea7oLlK/eOvsCmcZE8jzrblyuQBi10qM03HiXpT78/zr01tuF48UHWtnqjBLUq1jRCuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDIa94w/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDIa94w/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789691063; x=1821227063;
  h=date:from:to:cc:subject:message-id;
  bh=Un/X4dUVyAa7quQLPeFnbQopAkd0hOdNELLOyOnT1+I=;
  b=cDIa94w/gu1NFlFjGm0KwV6bS43EGPvB6niAxZ2pUMTBmdFkphU6mlTu
   hPMYWNGB5xy8jnUCjyqWQWVyFmeKnHF/FURciLxI7eIZAvkvmWFxEQrZ3
   O/itsbbAdIvvIjcVVGplwIRdaKN01raijtZtZ1Ca0/MJuZ7+mr6i1/23Y
   Ccg13augqEa+s3wksluLs6YYnmeuH+Q+hEhEEZNebZ3sA3YSPmTrQcsSW
   R3ZzbupecPdUjZ5EW2azvRdMXAejIItqlvgJaRKHjNNWP+gw2HwBHzxRE
   aJz5gk4Otyzhal/yvYm1dGFhHsWcO8EcygKI5VJebOuSqVVXMy12PgOpy
   Q==;
X-CSE-ConnectionGUID: TVs9LTpQSg6Vc0tTexdfew==
X-CSE-MsgGUID: 0+4MwUfPQgmi/nbXu4MBEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77730235"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77730235"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 17:24:13 -0700
X-CSE-ConnectionGUID: vjBsr4SDRAyGAJN1dUuA3w==
X-CSE-MsgGUID: /Em9/uitQC+5kdqI7QE51w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2325838"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 17 Sep 2026 17:24:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7MOf-000000008rZ-1N31;
	Fri, 18 Sep 2026 00:24:09 +0000
Date: Fri, 18 Sep 2026 08:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 9/9]
 drivers/soc/qcom/qmi_encdec.c:359:55: sparse: sparse: cast to restricted
 __le16
Message-ID: <202609180824.eDtwyluo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   09f57006a67d7344ac94f30b5356ab6e990640c1
commit: 04e7717dddc0a373dd71a88a663bf9ae4b97171e [9/9] soc: qcom: QMI encoding/decoding for big endian
config: arm-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180824.eDtwyluo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180824.eDtwyluo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180824.eDtwyluo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/qmi_encdec.c:359:55: sparse: sparse: cast to restricted __le16
>> drivers/soc/qcom/qmi_encdec.c:676:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] val32 @@     got restricted __le32 [usertype] @@
   drivers/soc/qcom/qmi_encdec.c:676:31: sparse:     expected unsigned int [usertype] val32
   drivers/soc/qcom/qmi_encdec.c:676:31: sparse:     got restricted __le32 [usertype]

vim +359 drivers/soc/qcom/qmi_encdec.c

   279	
   280	/**
   281	 * qmi_encode() - Core Encode Function
   282	 * @ei_array: Struct info array describing the structure to be encoded.
   283	 * @out_buf: Buffer to hold the encoded QMI message.
   284	 * @in_c_struct: Pointer to the C structure to be encoded.
   285	 * @out_buf_len: Available space in the encode buffer.
   286	 * @enc_level: Encode level to indicate the depth of the nested structure,
   287	 *             within the main structure, being encoded.
   288	 *
   289	 * Return: The number of bytes of encoded information on success or negative
   290	 * errno on error.
   291	 */
   292	static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
   293			      const void *in_c_struct, u32 out_buf_len,
   294			      int enc_level)
   295	{
   296		const struct qmi_elem_info *temp_ei = ei_array;
   297		u8 opt_flag_value = 0;
   298		u32 data_len_value = 0, data_len_sz;
   299		u8 *buf_dst = (u8 *)out_buf;
   300		u8 *tlv_pointer;
   301		u32 tlv_len;
   302		u8 tlv_type;
   303		u32 encoded_bytes = 0;
   304		const void *buf_src;
   305		int encode_tlv = 0;
   306		int rc;
   307		u8 val8;
   308		u16 val16;
   309	
   310		if (!ei_array)
   311			return 0;
   312	
   313		tlv_pointer = buf_dst;
   314		tlv_len = 0;
   315		if (enc_level == 1)
   316			buf_dst = buf_dst + (TLV_LEN_SIZE + TLV_TYPE_SIZE);
   317	
   318		while (temp_ei->data_type != QMI_EOTI) {
   319			buf_src = in_c_struct + temp_ei->offset;
   320			tlv_type = temp_ei->tlv_type;
   321	
   322			if (temp_ei->array_type == NO_ARRAY) {
   323				data_len_value = 1;
   324			} else if (temp_ei->array_type == STATIC_ARRAY) {
   325				data_len_value = temp_ei->elem_len;
   326			} else if (data_len_value <= 0 ||
   327				    temp_ei->elem_len < data_len_value) {
   328				pr_err("%s: Invalid data length\n", __func__);
   329				return -EINVAL;
   330			}
   331	
   332			switch (temp_ei->data_type) {
   333			case QMI_OPT_FLAG:
   334				rc = qmi_encode_basic_elem(&opt_flag_value, buf_src,
   335							   1, sizeof(u8));
   336				if (opt_flag_value)
   337					temp_ei = temp_ei + 1;
   338				else
   339					temp_ei = skip_to_next_elem(temp_ei, enc_level);
   340				break;
   341	
   342			case QMI_DATA_LEN:
   343				data_len_sz = temp_ei->elem_size == sizeof(u8) ?
   344						sizeof(u8) : sizeof(u16);
   345				/* Check to avoid out of range buffer access */
   346				if ((data_len_sz + encoded_bytes + TLV_LEN_SIZE +
   347				    TLV_TYPE_SIZE) > out_buf_len) {
   348					pr_err("%s: Too Small Buffer @DATA_LEN\n",
   349					       __func__);
   350					return -ETOOSMALL;
   351				}
   352				if (data_len_sz == sizeof(u8)) {
   353					val8 = *(u8 *)buf_src;
   354					data_len_value = (u32)val8;
   355					rc = qmi_encode_basic_elem(buf_dst, &val8,
   356								   1, data_len_sz);
   357				} else {
   358					val16 = *(u16 *)buf_src;
 > 359					data_len_value = (u32)le16_to_cpu(val16);
   360					rc = qmi_encode_basic_elem(buf_dst, &val16,
   361								   1, data_len_sz);
   362				}
   363				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   364							encoded_bytes, tlv_len,
   365							encode_tlv, rc);
   366				if (!data_len_value)
   367					temp_ei = skip_to_next_elem(temp_ei, enc_level);
   368				else
   369					encode_tlv = 0;
   370				break;
   371	
   372			case QMI_UNSIGNED_1_BYTE:
   373			case QMI_UNSIGNED_2_BYTE:
   374			case QMI_UNSIGNED_4_BYTE:
   375			case QMI_UNSIGNED_8_BYTE:
   376			case QMI_SIGNED_2_BYTE_ENUM:
   377			case QMI_SIGNED_4_BYTE_ENUM:
   378				/* Check to avoid out of range buffer access */
   379				if (((data_len_value * temp_ei->elem_size) +
   380				    encoded_bytes + TLV_LEN_SIZE + TLV_TYPE_SIZE) >
   381				    out_buf_len) {
   382					pr_err("%s: Too Small Buffer @data_type:%d\n",
   383					       __func__, temp_ei->data_type);
   384					return -ETOOSMALL;
   385				}
   386				rc = qmi_encode_basic_elem(buf_dst, buf_src,
   387							   data_len_value,
   388							   temp_ei->elem_size);
   389				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   390							encoded_bytes, tlv_len,
   391							encode_tlv, rc);
   392				break;
   393	
   394			case QMI_STRUCT:
   395				rc = qmi_encode_struct_elem(temp_ei, buf_dst, buf_src,
   396							    data_len_value,
   397							    out_buf_len - encoded_bytes,
   398							    enc_level + 1);
   399				if (rc < 0)
   400					return rc;
   401				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   402							encoded_bytes, tlv_len,
   403							encode_tlv, rc);
   404				break;
   405	
   406			case QMI_STRING:
   407				rc = qmi_encode_string_elem(temp_ei, buf_dst, buf_src,
   408							    out_buf_len - encoded_bytes,
   409							    enc_level);
   410				if (rc < 0)
   411					return rc;
   412				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   413							encoded_bytes, tlv_len,
   414							encode_tlv, rc);
   415				break;
   416			default:
   417				pr_err("%s: Unrecognized data type\n", __func__);
   418				return -EINVAL;
   419			}
   420	
   421			if (encode_tlv && enc_level == 1) {
   422				QMI_ENCDEC_ENCODE_TLV(tlv_type, tlv_len, tlv_pointer);
   423				encoded_bytes += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
   424				tlv_pointer = buf_dst;
   425				tlv_len = 0;
   426				buf_dst = buf_dst + TLV_LEN_SIZE + TLV_TYPE_SIZE;
   427				encode_tlv = 0;
   428			}
   429		}
   430	
   431		return encoded_bytes;
   432	}
   433	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
