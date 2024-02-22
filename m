Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A4D1350FE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708610874; cv=none; b=Gjqxv3mkInlgcoo9AWqpu2vk3Y5U4aCEt59Y0Yfa7qY78XdOaq9D4AjYCsQIMjxSdzOU+i6lwTIkhz3cnQrgnVumWwFFxga0grDwEf/tIRt5Gy7Ys+seQ8Y7HmjvWxd5u1kbpmRen6pMZ+Be539TR4Co5jLwsp9A5AHPGffcu5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708610874; c=relaxed/simple;
	bh=9pz0Zkz94wbP47dvDYHN873/q/l6UuOb9Vrf2kaatvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7xLrRV4vf/nEu+czMveFD/BHxUFhgSGdiUBtD/qL3YEbki8PBOhQgT2BU9FOEiMEJ7yzXA4mJ3+xECkZ7k94KpVihiZeExIUVwTcqxR5qo+OiMnUMK9scB3z43RM7tYpyCm6YVUx0jvpiVEM96rSgQlDjCFxlrjI3DteNVgLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXA8wspc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXA8wspc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708610872; x=1740146872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pz0Zkz94wbP47dvDYHN873/q/l6UuOb9Vrf2kaatvc=;
  b=AXA8wspcBaRud1N7geKZ6rhHZOauy8X2mCE3Ij/0mcpHDkk9nTCPXiDI
   BJx8fEFI/QmXKJBOU7jyeRTzb2aT19p28L3wVCKN+8T3iZhtF2DjJhLaN
   3gxVsHwJ2YAephf/84nXzqqRDNvjJAVj51CEnCJLB/dPN9UGOi+DL1SVS
   sMommccVABN0k8A4KDIe9A+KVetUrrQ5x9453NPksbCGb4ahnN8qVv1lA
   gthrz1+bQNW9jRJze2gA+Wd4Rp/PP/s4+rphp9Y6XD6YMeVUEaYiLyenf
   9oPNbhnll42Bgr3eyS3oHEZ7kggBy6chTnpQrczRmJkmxrc3XEWFSbhky
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20386869"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20386869"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 06:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5445017"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2024 06:07:24 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd9ic-0006NU-16;
	Thu, 22 Feb 2024 14:06:48 +0000
Date: Thu, 22 Feb 2024 22:05:11 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:233: warning:
 "IS_SIGNIFICANT_DIFF" redefined
Message-ID: <202402222209.I4w4vCXQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 3218a487da04a90ebaac8870a044d48e293215de net: update bnxt_en driver
date:   2 years, 11 months ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240222/202402222209.I4w4vCXQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222209.I4w4vCXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222209.I4w4vCXQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:137:9: note: previous definition of 'DIM_APPLY_NEW_PROFILE' with type 'enum <anonymous>'
     137 |         DIM_APPLY_NEW_PROFILE,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:85:9: error: redeclaration of enumerator 'DIM_PARKING_ON_TOP'
      85 |         DIM_PARKING_ON_TOP,
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dim.h:152:9: note: previous definition of 'DIM_PARKING_ON_TOP' with type 'enum <anonymous>'
     152 |         DIM_PARKING_ON_TOP,
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:86:9: error: redeclaration of enumerator 'DIM_PARKING_TIRED'
      86 |         DIM_PARKING_TIRED,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/dim.h:153:9: note: previous definition of 'DIM_PARKING_TIRED' with type 'enum <anonymous>'
     153 |         DIM_PARKING_TIRED,
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:87:9: error: redeclaration of enumerator 'DIM_GOING_RIGHT'
      87 |         DIM_GOING_RIGHT,
         |         ^~~~~~~~~~~~~~~
   include/linux/dim.h:154:9: note: previous definition of 'DIM_GOING_RIGHT' with type 'enum <anonymous>'
     154 |         DIM_GOING_RIGHT,
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:88:9: error: redeclaration of enumerator 'DIM_GOING_LEFT'
      88 |         DIM_GOING_LEFT,
         |         ^~~~~~~~~~~~~~
   include/linux/dim.h:155:9: note: previous definition of 'DIM_GOING_LEFT' with type 'enum <anonymous>'
     155 |         DIM_GOING_LEFT,
         |         ^~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:92:9: error: redeclaration of enumerator 'DIM_STATS_WORSE'
      92 |         DIM_STATS_WORSE,
         |         ^~~~~~~~~~~~~~~
   include/linux/dim.h:169:9: note: previous definition of 'DIM_STATS_WORSE' with type 'enum <anonymous>'
     169 |         DIM_STATS_WORSE,
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:93:9: error: redeclaration of enumerator 'DIM_STATS_SAME'
      93 |         DIM_STATS_SAME,
         |         ^~~~~~~~~~~~~~
   include/linux/dim.h:170:9: note: previous definition of 'DIM_STATS_SAME' with type 'enum <anonymous>'
     170 |         DIM_STATS_SAME,
         |         ^~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:94:9: error: redeclaration of enumerator 'DIM_STATS_BETTER'
      94 |         DIM_STATS_BETTER,
         |         ^~~~~~~~~~~~~~~~
   include/linux/dim.h:171:9: note: previous definition of 'DIM_STATS_BETTER' with type 'enum <anonymous>'
     171 |         DIM_STATS_BETTER,
         |         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:98:9: error: redeclaration of enumerator 'DIM_STEPPED'
      98 |         DIM_STEPPED,
         |         ^~~~~~~~~~~
   include/linux/dim.h:186:9: note: previous definition of 'DIM_STEPPED' with type 'enum <anonymous>'
     186 |         DIM_STEPPED,
         |         ^~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:99:9: error: redeclaration of enumerator 'DIM_TOO_TIRED'
      99 |         DIM_TOO_TIRED,
         |         ^~~~~~~~~~~~~
   include/linux/dim.h:187:9: note: previous definition of 'DIM_TOO_TIRED' with type 'enum <anonymous>'
     187 |         DIM_TOO_TIRED,
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:100:9: error: redeclaration of enumerator 'DIM_ON_EDGE'
     100 |         DIM_ON_EDGE,
         |         ^~~~~~~~~~~
   include/linux/dim.h:188:9: note: previous definition of 'DIM_ON_EDGE' with type 'enum <anonymous>'
     188 |         DIM_ON_EDGE,
         |         ^~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:133:1: error: conflicting types for 'net_dim_get_rx_moderation'; have 'struct dim_cq_moder(u8,  int)' {aka 'struct dim_cq_moder(unsigned char,  int)'}
     133 | net_dim_get_rx_moderation(u8 cq_period_mode, int ix)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:280:21: note: previous declaration of 'net_dim_get_rx_moderation' with type 'struct dim_cq_moder(u8,  int)' {aka 'struct dim_cq_moder(unsigned char,  int)'}
     280 | struct dim_cq_moder net_dim_get_rx_moderation(u8 cq_period_mode, int ix);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:142:1: error: conflicting types for 'net_dim_get_def_rx_moderation'; have 'struct dim_cq_moder(u8)' {aka 'struct dim_cq_moder(unsigned char)'}
     142 | net_dim_get_def_rx_moderation(u8 rx_cq_period_mode)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:286:21: note: previous declaration of 'net_dim_get_def_rx_moderation' with type 'struct dim_cq_moder(u8)' {aka 'struct dim_cq_moder(unsigned char)'}
     286 | struct dim_cq_moder net_dim_get_def_rx_moderation(u8 cq_period_mode);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:154:20: error: conflicting types for 'dim_on_top'; have 'bool(struct dim *)' {aka '_Bool(struct dim *)'}
     154 | static inline bool dim_on_top(struct dim *dim)
         |                    ^~~~~~~~~~
   include/linux/dim.h:199:6: note: previous declaration of 'dim_on_top' with type 'bool(struct dim *)' {aka '_Bool(struct dim *)'}
     199 | bool dim_on_top(struct dim *dim);
         |      ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:167:20: error: conflicting types for 'dim_turn'; have 'void(struct dim *)'
     167 | static inline void dim_turn(struct dim *dim)
         |                    ^~~~~~~~
   include/linux/dim.h:208:6: note: previous declaration of 'dim_turn' with type 'void(struct dim *)'
     208 | void dim_turn(struct dim *dim);
         |      ^~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:211:20: error: conflicting types for 'dim_park_on_top'; have 'void(struct dim *)'
     211 | static inline void dim_park_on_top(struct dim *dim)
         |                    ^~~~~~~~~~~~~~~
   include/linux/dim.h:217:6: note: previous declaration of 'dim_park_on_top' with type 'void(struct dim *)'
     217 | void dim_park_on_top(struct dim *dim);
         |      ^~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:219:20: error: conflicting types for 'dim_park_tired'; have 'void(struct dim *)'
     219 | static inline void dim_park_tired(struct dim *dim)
         |                    ^~~~~~~~~~~~~~
   include/linux/dim.h:226:6: note: previous declaration of 'dim_park_tired' with type 'void(struct dim *)'
     226 | void dim_park_tired(struct dim *dim);
         |      ^~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:233: warning: "IS_SIGNIFICANT_DIFF" redefined
     233 | #define IS_SIGNIFICANT_DIFF(val, ref) \
         | 
   include/linux/dim.h:19: note: this is the location of the previous definition
      19 | #define IS_SIGNIFICANT_DIFF(val, ref) \
         | 
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:317:20: error: conflicting types for 'dim_update_sample'; have 'void(u16,  u64,  u64,  struct dim_sample *)' {aka 'void(short unsigned int,  long long unsigned int,  long long unsigned int,  struct dim_sample *)'}
     317 | static inline void dim_update_sample(u16 event_ctr,
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/dim.h:248:1: note: previous definition of 'dim_update_sample' with type 'void(u16,  u64,  u64,  struct dim_sample *)' {aka 'void(short unsigned int,  long long unsigned int,  long long unsigned int,  struct dim_sample *)'}
     248 | dim_update_sample(u16 event_ctr, u64 packets, u64 bytes, struct dim_sample *s)
         | ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:328: warning: "DIM_NEVENTS" redefined
     328 | #define DIM_NEVENTS 320
         | 
   include/linux/dim.h:13: note: this is the location of the previous definition
      13 | #define DIM_NEVENTS 64
         | 
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:332:20: error: conflicting types for 'dim_calc_stats'; have 'void(struct dim_sample *, struct dim_sample *, struct dim_stats *)'
     332 | static inline void dim_calc_stats(struct dim_sample *start,
         |                    ^~~~~~~~~~~~~~
   include/linux/dim.h:237:6: note: previous declaration of 'dim_calc_stats' with type 'void(struct dim_sample *, struct dim_sample *, struct dim_stats *)'
     237 | void dim_calc_stats(struct dim_sample *start, struct dim_sample *end,
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:351:6: error: conflicting types for 'net_dim'; have 'void(struct dim *, struct dim_sample)'
     351 | void net_dim(struct dim *dim, struct dim_sample end_sample);
         |      ^~~~~~~
   include/linux/dim.h:310:6: note: previous declaration of 'net_dim' with type 'void(struct dim *, struct dim_sample)'
     310 | void net_dim(struct dim *dim, struct dim_sample end_sample);
         |      ^~~~~~~


vim +/IS_SIGNIFICANT_DIFF +233 drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h

   218	
 > 219	static inline void dim_park_tired(struct dim *dim)
   220	{
   221		dim->steps_right  = 0;
   222		dim->steps_left   = 0;
   223		dim->tune_state   = DIM_PARKING_TIRED;
   224	}
   225	
   226	static inline void net_dim_exit_parking(struct dim *dim)
   227	{
   228		dim->tune_state = dim->profile_ix ? DIM_GOING_LEFT :
   229						  DIM_GOING_RIGHT;
   230		net_dim_step(dim);
   231	}
   232	
 > 233	#define IS_SIGNIFICANT_DIFF(val, ref) \
   234		(((100 * abs((val) - (ref))) / (ref)) > 10) /* more than 10% difference */
   235	
   236	static inline int net_dim_stats_compare(struct dim_stats *curr,
   237						struct dim_stats *prev)
   238	{
   239		if (!prev->bpms)
   240			return curr->bpms ? DIM_STATS_BETTER :
   241					    DIM_STATS_SAME;
   242	
   243		if (IS_SIGNIFICANT_DIFF(curr->bpms, prev->bpms))
   244			return (curr->bpms > prev->bpms) ? DIM_STATS_BETTER :
   245							   DIM_STATS_WORSE;
   246	
   247		if (!prev->ppms)
   248			return curr->ppms ? DIM_STATS_BETTER :
   249					    DIM_STATS_SAME;
   250	
   251		if (IS_SIGNIFICANT_DIFF(curr->ppms, prev->ppms))
   252			return (curr->ppms > prev->ppms) ? DIM_STATS_BETTER :
   253							   DIM_STATS_WORSE;
   254	
   255		if (!prev->epms)
   256			return DIM_STATS_SAME;
   257	
   258		if (IS_SIGNIFICANT_DIFF(curr->epms, prev->epms))
   259			return (curr->epms < prev->epms) ? DIM_STATS_BETTER :
   260							   DIM_STATS_WORSE;
   261	
   262		return DIM_STATS_SAME;
   263	}
   264	
   265	static inline bool net_dim_decision(struct dim_stats *curr_stats,
   266					    struct dim *dim)
   267	{
   268		int prev_state = dim->tune_state;
   269		int prev_ix = dim->profile_ix;
   270		int stats_res;
   271		int step_res;
   272	
   273		switch (dim->tune_state) {
   274		case DIM_PARKING_ON_TOP:
   275			stats_res = net_dim_stats_compare(curr_stats, &dim->prev_stats);
   276			if (stats_res != DIM_STATS_SAME)
   277				net_dim_exit_parking(dim);
   278			break;
   279	
   280		case DIM_PARKING_TIRED:
   281			dim->tired--;
   282			if (!dim->tired)
   283				net_dim_exit_parking(dim);
   284			break;
   285	
   286		case DIM_GOING_RIGHT:
   287		case DIM_GOING_LEFT:
   288			stats_res = net_dim_stats_compare(curr_stats, &dim->prev_stats);
   289			if (stats_res != DIM_STATS_BETTER)
   290				dim_turn(dim);
   291	
   292			if (dim_on_top(dim)) {
   293				dim_park_on_top(dim);
   294				break;
   295			}
   296	
   297			step_res = net_dim_step(dim);
   298			switch (step_res) {
   299			case DIM_ON_EDGE:
   300				dim_park_on_top(dim);
   301				break;
   302			case DIM_TOO_TIRED:
   303				dim_park_tired(dim);
   304				break;
   305			}
   306	
   307			break;
   308		}
   309	
   310		if ((prev_state      != DIM_PARKING_ON_TOP) ||
   311		    (dim->tune_state != DIM_PARKING_ON_TOP))
   312			dim->prev_stats = *curr_stats;
   313	
   314		return dim->profile_ix != prev_ix;
   315	}
   316	
 > 317	static inline void dim_update_sample(u16 event_ctr,
   318					     u64 packets,
   319					     u64 bytes,
   320					     struct dim_sample *s)
   321	{
   322		s->time	     = ktime_get();
   323		s->pkt_ctr   = packets;
   324		s->byte_ctr  = bytes;
   325		s->event_ctr = event_ctr;
   326	}
   327	
 > 328	#define DIM_NEVENTS 320
   329	#define BITS_PER_TYPE(type) (sizeof(type) * BITS_PER_BYTE)
   330	#define BIT_GAP(bits, end, start) ((((end) - (start)) + BIT_ULL(bits)) & (BIT_ULL(bits) - 1))
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
