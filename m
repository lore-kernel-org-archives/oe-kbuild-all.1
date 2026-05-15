Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BA3D25CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 11:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843616; cv=none; b=jBjj0mXEzkL47dBJgUy9ZRomQP3K8DuDlxdg3SLwkLJeEO755iDiuPSNGeJzkcStDAJ9wogRSgvkxVB8cbMoRsmPGc3FnH8H00rzXNEC0MINL6pwcGYwN/DN4a4YyXpYTXT8SE6k6XhtBY1YVse8/2ZvyCm5GNgk9RW1iQqXpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843616; c=relaxed/simple;
	bh=TyNb4AG5QaYWop2A4m4WqyP/biLxo+Z1af5Z1ydgAqI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DA8D0IqbuzRXC7mU2LKMKiP3u435Oqc2hx6Tu8kzAXBXxYJYFbuIwx4bTWZ1LqZLaCqHN8wdv/LWpCZIl3tiwB/De9rYIihbG/M0QDqDyPod5l3ViioI95RkxI1lem5y9OzCb2R87atTLJNEPIwIAxQBDVsZYET7CuEu+Uf6yXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpSxOwHD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpSxOwHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778843614; x=1810379614;
  h=date:from:to:cc:subject:message-id;
  bh=TyNb4AG5QaYWop2A4m4WqyP/biLxo+Z1af5Z1ydgAqI=;
  b=fpSxOwHD+NZoPh4mjxj0kGi6ODhibyaKxkfYJ5Ll7p5B0hJ7X2bT8fa/
   hWaQx73w8dZJJzEbhOxejhJ+9Qd/Y9fJjoB0OU/4ODHHm9Si9fPm75YMs
   BsKsDeUtQRy203xYJYpzd4UZoNXuj6Q1w47w6637r95MbwlXSL0uY0qCr
   sAzYKC6wp65fpnj1nJ6ArsYv5pAqJvMT6nZVCczvs0Lj5hoOSQo/6ojmY
   tCNqwfJ8eF8eVq3PpTSoZLyLnjRLZ78rzfeR7Qj/HHMRuSccLFuzFQDSU
   lU2A5xikB//bS/dyn8etACHETO0U7+9cq7HD+CNkUwLniCykMgUjECPbV
   Q==;
X-CSE-ConnectionGUID: N6g+OjjeQoapYyoz0GRGZQ==
X-CSE-MsgGUID: xcDkgZMiRk6wWY3X4iUIKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105255609"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="105255609"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:13:34 -0700
X-CSE-ConnectionGUID: 0pLadw+JTIK6QmBYlsxQqw==
X-CSE-MsgGUID: 7ES0q6GUSayRmU4dKMUr/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="242660477"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 May 2026 04:13:28 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNqTJ-000000001Qp-1vZK;
	Fri, 15 May 2026 11:13:01 +0000
Date: Fri, 15 May 2026 19:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.18_LTS 361/870]
 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.c:1088:1: warning: the frame size of
 1312 bytes is larger than 1280 bytes
Message-ID: <202605151951.5rIlnKn6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.18_LTS
head:   fb979987d554f0c8fd045b114a27a6359c9265cf
commit: 131f25e6f7d2897cb6ac24af04f5bbc357483ded [361/870] drm: xlnx: hdcp: Add HDMI supportive HDCP1X functionalities
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151951.5rIlnKn6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151951.5rIlnKn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151951.5rIlnKn6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.c: In function 'xlnx_hdcp1x_tx_validate_ksv_list':
>> drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.c:1088:1: warning: the frame size of 1312 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1088 | }
         | ^


vim +1088 drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp1x_tx.c

   889	
   890	int xlnx_hdcp1x_tx_validate_ksv_list(struct xlnx_hdcp1x_config *xhdcp1x_tx, u16 repeater_info)
   891	{
   892		struct xlnx_sha1_context sha1_context;
   893		u8 buf[DRM_HDCP_KSV_LEN * XHDCP1X_PORT_SIZE_BKSV];
   894		u8 ksv_list_holder[XHDMI_HDCP1X_PORT_MAX_DEV_CNT * XHDCP1X_PORT_SIZE_BKSV];
   895		int num_to_read = 0;
   896		int ksv_count = 0, byte_count = 0;
   897		int ret = 0;
   898		unsigned int ksv_list_size = 0;
   899		u64 value = 0, buf_read_ksv_count = 0, mo = 0, remote_ksv;
   900		u8 sha_result[SHA1_HASH_SIZE];
   901		u8 bksv[XHDCP1X_PORT_SIZE_BKSV];
   902	
   903		memset(ksv_list_holder, 0, (XHDMI_HDCP1X_PORT_MAX_DEV_CNT * XHDCP1X_PORT_SIZE_BKSV));
   904	
   905		memset(buf, 0, DRM_HDCP_KSV_LEN * XHDCP1X_PORT_SIZE_BKSV);
   906	
   907		xlnx_sha1_reset(&sha1_context);
   908	
   909		repeater_info = xhdcp1x_tx->state_helper;
   910		num_to_read = ((repeater_info & XHDMI_HDCP1X_PORT_MAX_DEV_CNT) * DRM_HDCP_KSV_LEN);
   911	
   912		if (xhdcp1x_tx->protocol != XHDCP1X_TX_DP) {
   913			if (xhdcp1x_tx->handlers.rd_handler(xhdcp1x_tx->interface_ref,
   914							    XHDMI_HDCP1X_OFFSET_KSVFIFO,
   915							    ksv_list_holder, num_to_read)) {
   916				xlnx_sha1_input(&sha1_context, ksv_list_holder, num_to_read);
   917	
   918				while (byte_count < num_to_read) {
   919					if ((byte_count + 1) % DRM_HDCP_KSV_LEN == 0) {
   920						value = xlnx_hdcp1x_buf_to_unit((ksv_list_holder
   921										+ ((((byte_count + 1)
   922										/ XHDCP1X_PORT_SIZE_BKSV)
   923										- 1)
   924										* XHDCP1X_PORT_SIZE_BKSV)),
   925										XHDCP1X_PORT_SIZE_BKSV *
   926										BITS_PER_BYTE);
   927	
   928						if (!xlnx_hdcp1x_is_ksvvalid(value))
   929							return false;
   930	
   931						xhdcp1x_tx->repeatervalues.ksvlist[ksv_count++] = value;
   932						value = 0;
   933					}
   934					byte_count++;
   935				}
   936			}
   937		} else {
   938			unsigned int ksv_list_byte_count = 0;
   939	
   940			byte_count = (num_to_read / DRM_HDCP_KSV_LEN);
   941			ksv_list_size = byte_count;
   942			do {
   943				int total_bytes = XHDCP1X_PORT_SIZE_KSVFIFO;
   944				int min_bytes_to_read = XHDCP1X_PORT_MIN_BYTES;
   945	
   946				if (total_bytes > num_to_read)
   947					total_bytes = num_to_read;
   948	
   949				if (min_bytes_to_read > byte_count)
   950					min_bytes_to_read = byte_count;
   951	
   952				ret = xhdcp1x_tx->handlers.rd_handler(xhdcp1x_tx->interface_ref,
   953								      XHDCP1X_PORT_DPCD_BASE
   954								      + XHDCP1X_PORT_OFFSET_KSVFIFO,
   955								      buf, total_bytes);
   956				if (!ret)
   957					return false;
   958	
   959				xlnx_sha1_input(&sha1_context, buf, total_bytes);
   960				while (buf_read_ksv_count < total_bytes) {
   961					ksv_list_holder[ksv_list_byte_count++] =
   962					buf[buf_read_ksv_count];
   963					buf_read_ksv_count++;
   964				}
   965				num_to_read -= total_bytes;
   966				byte_count -= min_bytes_to_read;
   967	
   968			} while (num_to_read > 0);
   969		}
   970	
   971		/* Insert repeater_info into the SHA-1 transform */
   972		buf[0] = (u8)repeater_info;
   973	
   974		if (xhdcp1x_tx->protocol != XHDCP1X_TX_DP)
   975			buf[1] = (u8)(repeater_info
   976			>> XHDMI_HDCP1X_PORT_BSTATUS_DEPTH_SHIFT);
   977		else
   978			buf[1] = (u8)(repeater_info >> XHDCP1X_PORT_BINFO_DEPTH_SHIFT);
   979	
   980		xlnx_sha1_input(&sha1_context, buf, 2);
   981	
   982		/* Insert the mo into the SHA-1 transform */
   983		mo = xhdcp1x_cipher_get_mo(xhdcp1x_tx->cipher);
   984		xlnx_hdcp1x_uint_to_buf(buf, mo, XHDCP1X_BYTE_IN_BITS * BITS_PER_BYTE);
   985	
   986		xlnx_sha1_input(&sha1_context, buf, BITS_PER_BYTE);
   987	
   988		/* Finalize the SHA-1 result and confirm success */
   989		if (xlnx_sha1_result(&sha1_context, sha_result) == XLNX_SHA_SUCCESS) {
   990			u64 offset = 0;
   991			const u8 *sha1_buf = sha_result;
   992			int num_iterations = (SHA1_HASH_SIZE >> 2);
   993	
   994			if (xhdcp1x_tx->protocol != XHDCP1X_TX_DP)
   995				offset = XHDMI_HDCP1X_PORT_OFFSET_VH0;
   996			else
   997				offset = XHDCP1X_PORT_OFFSET_VH0;
   998	
   999			do {
  1000				u32 calc_calue = 0;
  1001				u32 read_value = 0;
  1002	
  1003				/* Determine calc_calue */
  1004				calc_calue = *sha1_buf++;
  1005				calc_calue <<= BITS_PER_BYTE;
  1006				calc_calue |= *sha1_buf++;
  1007				calc_calue <<= BITS_PER_BYTE;
  1008				calc_calue |= *sha1_buf++;
  1009				calc_calue <<= BITS_PER_BYTE;
  1010				calc_calue |= *sha1_buf++;
  1011	
  1012				if (xhdcp1x_tx->protocol != XHDCP1X_TX_DP)
  1013					offset = XHDMI_HDCP1X_PORT_OFFSET_VH0;
  1014	
  1015				else
  1016					offset = XHDCP1X_PORT_DPCD_BASE + XHDCP1X_PORT_OFFSET_VH0;
  1017	
  1018				ret =
  1019					xhdcp1x_tx->handlers.rd_handler(xhdcp1x_tx->interface_ref,
  1020									XHDCP1X_PORT_DPCD_BASE
  1021									+ offset, buf,
  1022									XHDCP1X_PORT_SIZE_VH0);
  1023	
  1024				if (!ret) {
  1025					dev_err(xhdcp1x_tx->dev, "Unable to read V");
  1026					return false;
  1027				}
  1028				memcpy(&xhdcp1x_tx->repeatervalues.v[offset - XHDMI_HDCP1X_PORT_OFFSET_VH0],
  1029				       buf, XHDCP1X_PORT_SIZE_VH0);
  1030				read_value = xlnx_hdcp1x_buf_to_unit(buf,
  1031								     BITS_PER_BYTE * XHDCP1X_PORT_SIZE_VH0);
  1032				if (calc_calue != read_value) {
  1033					dev_err(xhdcp1x_tx->dev, "V` Ksv's miss match");
  1034					return false;
  1035				}
  1036				offset += XHDCP1X_PORT_SIZE_VH0;
  1037				num_iterations--;
  1038			} while (num_iterations > 0);
  1039		} else {
  1040			dev_err(xhdcp1x_tx->dev, "SHA mismatch Occurred");
  1041			return false;
  1042		}
  1043		if (xhdcp1x_tx->is_repeater) {
  1044			if (xhdcp1x_tx->protocol == XHDCP1X_TX_DP) {
  1045				u64 val = 0;
  1046				u32 this_ksv = 0;
  1047	
  1048				while (this_ksv < ksv_list_size) {
  1049					val = xlnx_hdcp1x_buf_to_u64((ksv_list_holder +
  1050								       (this_ksv *
  1051								       XHDCP1X_PORT_SIZE_BKSV)),
  1052								       XHDCP1X_PORT_SIZE_BKSV *
  1053								       BITS_PER_BYTE);
  1054					if (!(val)) {
  1055						this_ksv++;
  1056						continue;
  1057					}
  1058					xhdcp1x_tx->repeatervalues.ksvlist[ksv_count++] = val;
  1059	
  1060					val = 0;
  1061					this_ksv++;
  1062				}
  1063			}
  1064	
  1065			memset(bksv, 0, XHDCP1X_PORT_SIZE_BKSV);
  1066			if (xhdcp1x_tx->protocol != XHDCP1X_TX_DP)
  1067				xhdcp1x_tx->handlers.rd_handler(xhdcp1x_tx->interface_ref,
  1068								XHDMI_HDCP1X_PORT_OFFSET_BKSV,
  1069								bksv,
  1070								XHDMI_HDCP1X_PORT_SIZE_BKSV);
  1071			else
  1072				xhdcp1x_tx->handlers.rd_handler(xhdcp1x_tx->interface_ref,
  1073								XHDCP1X_PORT_DPCD_BASE
  1074								+ XHDCP1X_PORT_OFFSET_BKSV,
  1075								bksv, XHDCP1X_PORT_SIZE_BKSV);
  1076	
  1077			/* Determine theremote_ksv */
  1078			remote_ksv = xlnx_hdcp1x_buf_to_unit(bksv,
  1079							     XHDCP1X_PORT_SIZE_BKSV * BITS_PER_BYTE);
  1080			/* Check for invalid */
  1081			if (!xlnx_hdcp1x_is_ksvvalid(remote_ksv)) {
  1082				dev_dbg(xhdcp1x_tx->dev, "Invalid Bksv reads");
  1083				return 0;
  1084			}
  1085			xhdcp1x_tx->repeatervalues.ksvlist[ksv_count] = remote_ksv;
  1086		}
  1087		return true;
> 1088	}
  1089	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
