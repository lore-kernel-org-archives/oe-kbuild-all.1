Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74E4A06
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 22:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751928582; cv=none; b=Rc21aCI6yYRtjt1UvtCBcNySlLufdjBrbrqxm4gZO8s2bL5yIttRzhvpl+hJAeGF+eYrrFodIt3v12VWXaHdYaOieUxaeS5iACmwLsamZYH+Sdp3oo3TEV7iE6cYv70iZtT2i2K9evC13UMoirhrCNmxp+WiEQSgaxVhdQnaed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751928582; c=relaxed/simple;
	bh=vrsBs97mrG0fxCQbEzbtLNrTAMrwNEcHXHRAI+mG+CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sMbHGbx3wOOtVT/yhJymsRmeVgU1Ksi1Rff2UPvvK8RKd6TbRoZiVUFD/gj2KHVr86l1CVOPLscMJXiwAxJxyLUEgHlRtW5Pj4sw19/vGVXCJqqn1wsnV0RWWq+ZywvFz8iZNDPek5b039WWaRWJvI62cgdodamEHRRjDTbNiCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3WhwKdp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3WhwKdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751928580; x=1783464580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vrsBs97mrG0fxCQbEzbtLNrTAMrwNEcHXHRAI+mG+CE=;
  b=B3WhwKdpdyXEI4FYplr0dNUXG6xA5vYRuU6qN5cBxODBKmog1kXkRzo7
   /r4R4r/YbjcentZTimriJhyc7cpyohJpqBhCALr61nkMjrG2tLIDyTsSz
   97JohMpQCE5JA+daQupy1NV4q/XlraFpF1FhhqQtdsfqRvqLwnZn/DoO4
   nEWzmeJaXYqXI/+py8J7fEtf9VzELoOm/IMQJhnrJB6rolxDnvccN7I6y
   m6oN8bgSO+tsUCujvFd5IiR2ntHi93rjTeIpASYMMRx9mPK7Hj6IhJisS
   hksla6KT+igREDyoUo5Nwgo36PX2XKrdZ6n07qUBsQRPq3j4dzbiygtuN
   Q==;
X-CSE-ConnectionGUID: emp1b4KPQNmufWPLrIj3qA==
X-CSE-MsgGUID: q1dI9+LCQT+bzsgBd+oLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54285185"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="54285185"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 15:49:40 -0700
X-CSE-ConnectionGUID: RXzFXZjDThG/7AvzOYV/8g==
X-CSE-MsgGUID: i+116U5ZTmeCxNZigedgxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155685844"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Jul 2025 15:49:39 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYueX-0000nP-0Q;
	Mon, 07 Jul 2025 22:49:37 +0000
Date: Tue, 8 Jul 2025 06:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3022/3022] drivers/edac/amd64_edac.c:1113:59:
 warning: operator '>>' has lower precedence than '-'; '-' will be evaluated
 first
Message-ID: <202507080616.PEORXKcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   42f2d0a01a04fb2be4ff38f644059278b52c13b0
commit: 7e65f9c59b205c1c185e60023756dd02b6b08f80 [3022/3022] EDAC/amd64: Fix the calculation of cs id for Hygon family 18h model 4h
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250708/202507080616.PEORXKcZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080616.PEORXKcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080616.PEORXKcZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/amd64_edac.c:1113:59: warning: operator '>>' has lower precedence than '-'; '-' will be evaluated first [-Wshift-op-parentheses]
    1113 |                         cs_id |= ((cs_fabric_id & die_id_mask) >> die_id_shift - 4) << die_id_bit;
         |                                                                ~~ ~~~~~~~~~~~~~^~~
   drivers/edac/amd64_edac.c:1113:59: note: place parentheses around the '-' expression to silence this warning
    1113 |                         cs_id |= ((cs_fabric_id & die_id_mask) >> die_id_shift - 4) << die_id_bit;
         |                                                                                ^  
         |                                                                   (               )
   1 warning generated.


vim +1113 drivers/edac/amd64_edac.c

   962	
   963	static int hygon_umc_normaddr_to_sysaddr(u64 norm_addr, u16 nid, u8 umc, u64 *sys_addr)
   964	{
   965		u64 dram_base_addr, dram_limit_addr, dram_hole_base;
   966		/* We start from the normalized address */
   967		u64 ret_addr = norm_addr;
   968	
   969		u32 tmp;
   970	
   971		u8 die_id_shift, die_id_mask, socket_id_shift, socket_id_mask;
   972		u8 intlv_num_dies, intlv_num_chan, intlv_num_sockets;
   973		u8 intlv_addr_sel, intlv_addr_bit;
   974		u8 num_intlv_bits, hashed_bit;
   975		u8 lgcy_mmio_hole_en, base = 0;
   976		u8 cs_mask, cs_id = 0;
   977		bool hash_enabled = false;
   978	
   979		/* Read DramOffset, check if base 1 is used. */
   980		if (amd_df_indirect_read(nid, 0, 0x214, umc, &tmp))
   981			goto out_err;
   982	
   983		/* Remove HiAddrOffset from normalized address, if enabled: */
   984		if (tmp & BIT(0)) {
   985			u64 hi_addr_offset = (tmp & GENMASK_ULL(31, 20)) << 8;
   986	
   987			if (norm_addr >= hi_addr_offset) {
   988				ret_addr -= hi_addr_offset;
   989				base = 1;
   990			}
   991		}
   992	
   993		/* Read D18F0x110 (DramBaseAddress). */
   994		if (amd_df_indirect_read(nid, 0, 0x110 + (8 * base), umc, &tmp))
   995			goto out_err;
   996	
   997		/* Check if address range is valid. */
   998		if (!(tmp & BIT(0))) {
   999			pr_err("%s: Invalid DramBaseAddress range: 0x%x.\n",
  1000				__func__, tmp);
  1001			goto out_err;
  1002		}
  1003	
  1004		intlv_num_sockets = (tmp >> 2) & 0x3;
  1005		lgcy_mmio_hole_en = tmp & BIT(1);
  1006		intlv_num_chan	  = (tmp >> 4) & 0xF;
  1007		intlv_addr_sel	  = (tmp >> 8) & 0x7;
  1008		dram_base_addr	  = (tmp & GENMASK_ULL(31, 12)) << 16;
  1009	
  1010		/* {0, 1, 2, 3} map to address bits {8, 9, 10, 11} respectively */
  1011		if (intlv_addr_sel > 3) {
  1012			pr_err("%s: Invalid interleave address select %d.\n",
  1013				__func__, intlv_addr_sel);
  1014			goto out_err;
  1015		}
  1016	
  1017		/* Read D18F0x114 (DramLimitAddress). */
  1018		if (amd_df_indirect_read(nid, 0, 0x114 + (8 * base), umc, &tmp))
  1019			goto out_err;
  1020	
  1021		intlv_num_dies	  = (tmp >> 10) & 0x3;
  1022		dram_limit_addr	  = ((tmp & GENMASK_ULL(31, 12)) << 16) | GENMASK_ULL(27, 0);
  1023	
  1024		intlv_addr_bit = intlv_addr_sel + 8;
  1025	
  1026		/* Re-use intlv_num_chan by setting it equal to log2(#channels) */
  1027		switch (intlv_num_chan) {
  1028		case 0:
  1029			intlv_num_chan = 0;
  1030			break;
  1031		case 1:
  1032			intlv_num_chan = 1;
  1033			break;
  1034		case 3:
  1035			intlv_num_chan = 2;
  1036			break;
  1037		case 5:
  1038			intlv_num_chan = 3;
  1039			break;
  1040		case 7:
  1041			intlv_num_chan = 4;
  1042			break;
  1043	
  1044		case 8:
  1045			intlv_num_chan = 1;
  1046			hash_enabled = true;
  1047			break;
  1048		default:
  1049			if (boot_cpu_data.x86_model == 0x4 &&
  1050			    intlv_num_chan == 2)
  1051				break;
  1052			pr_err("%s: Invalid number of interleaved channels %d.\n",
  1053				__func__, intlv_num_chan);
  1054			goto out_err;
  1055		}
  1056	
  1057		num_intlv_bits = intlv_num_chan;
  1058	
  1059		if (intlv_num_dies > 2) {
  1060			pr_err("%s: Invalid number of interleaved nodes/dies %d.\n",
  1061				__func__, intlv_num_dies);
  1062			goto out_err;
  1063		}
  1064	
  1065		num_intlv_bits += intlv_num_dies;
  1066	
  1067		/* Add a bit if sockets are interleaved. */
  1068		num_intlv_bits += intlv_num_sockets;
  1069	
  1070		/* Assert num_intlv_bits in the correct range. */
  1071		if (num_intlv_bits > 7) {
  1072			pr_err("%s: Invalid interleave bits %d.\n",
  1073				__func__, num_intlv_bits);
  1074			goto out_err;
  1075		}
  1076	
  1077		if (num_intlv_bits > 0) {
  1078			u64 temp_addr_x, temp_addr_i, temp_addr_y;
  1079			u8 die_id_bit, sock_id_bit, cs_fabric_id;
  1080	
  1081			/*
  1082			 * Read FabricBlockInstanceInformation3_CS[BlockFabricID].
  1083			 * This is the fabric id for this coherent slave. Use
  1084			 * umc/channel# as instance id of the coherent slave
  1085			 * for FICAA.
  1086			 */
  1087			if (amd_df_indirect_read(nid, 0, 0x50, umc, &tmp))
  1088				goto out_err;
  1089	
  1090			cs_fabric_id = (tmp >> 8) & 0x7FF;
  1091			die_id_bit   = 0;
  1092	
  1093			/* If interleaved over more than 1 channel: */
  1094			if (intlv_num_chan) {
  1095				die_id_bit = intlv_num_chan;
  1096				cs_mask	   = (1 << die_id_bit) - 1;
  1097				cs_id	   = cs_fabric_id & cs_mask;
  1098			}
  1099	
  1100			sock_id_bit = die_id_bit;
  1101	
  1102			/* Read D18F1x208 (SystemFabricIdMask). */
  1103			if (intlv_num_dies || intlv_num_sockets)
  1104				if (amd_df_indirect_read(nid, 1, 0x208, umc, &tmp))
  1105					goto out_err;
  1106	
  1107			/* If interleaved over more than 1 die. */
  1108			if (intlv_num_dies) {
  1109				sock_id_bit  = die_id_bit + intlv_num_dies;
  1110				die_id_shift = (tmp >> 12) & 0xF;
  1111				die_id_mask  = tmp & 0x7FF;
  1112	
> 1113				cs_id |= ((cs_fabric_id & die_id_mask) >> die_id_shift - 4) << die_id_bit;
  1114			}
  1115	
  1116			/* If interleaved over more than 1 socket. */
  1117			if (intlv_num_sockets) {
  1118				socket_id_shift	= (tmp >> 28) & 0xF;
  1119				socket_id_mask	= (tmp >> 16) & 0x7FF;
  1120	
  1121				cs_id |= ((cs_fabric_id & socket_id_mask) >> socket_id_shift) << sock_id_bit;
  1122			}
  1123	
  1124			/*
  1125			 * The pre-interleaved address consists of XXXXXXIIIYYYYY
  1126			 * where III is the ID for this CS, and XXXXXXYYYYY are the
  1127			 * address bits from the post-interleaved address.
  1128			 * "num_intlv_bits" has been calculated to tell us how many "I"
  1129			 * bits there are. "intlv_addr_bit" tells us how many "Y" bits
  1130			 * there are (where "I" starts).
  1131			 */
  1132			temp_addr_y = ret_addr & GENMASK_ULL(intlv_addr_bit-1, 0);
  1133			temp_addr_i = (cs_id << intlv_addr_bit);
  1134			temp_addr_x = (ret_addr & GENMASK_ULL(63, intlv_addr_bit)) << num_intlv_bits;
  1135			ret_addr    = temp_addr_x | temp_addr_i | temp_addr_y;
  1136		}
  1137	
  1138		/* Add dram base address */
  1139		ret_addr += dram_base_addr;
  1140	
  1141		/* If legacy MMIO hole enabled */
  1142		if (lgcy_mmio_hole_en) {
  1143			if (amd_df_indirect_read(nid, 0, 0x104, umc, &tmp))
  1144				goto out_err;
  1145	
  1146			dram_hole_base = tmp & GENMASK(31, 24);
  1147			if (ret_addr >= dram_hole_base)
  1148				ret_addr += (BIT_ULL(32) - dram_hole_base);
  1149		}
  1150	
  1151		if (hash_enabled) {
  1152			/* Save some parentheses and grab ls-bit at the end. */
  1153			hashed_bit =	(ret_addr >> 12) ^
  1154					(ret_addr >> 18) ^
  1155					(ret_addr >> 21) ^
  1156					(ret_addr >> 30) ^
  1157					cs_id;
  1158	
  1159			hashed_bit &= BIT(0);
  1160	
  1161			if (hashed_bit != ((ret_addr >> intlv_addr_bit) & BIT(0)))
  1162				ret_addr ^= BIT(intlv_addr_bit);
  1163		}
  1164	
  1165		/* Is calculated system address is above DRAM limit address? */
  1166		if (ret_addr > dram_limit_addr)
  1167			goto out_err;
  1168	
  1169		*sys_addr = ret_addr;
  1170		return 0;
  1171	
  1172	out_err:
  1173		return -EINVAL;
  1174	}
  1175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
