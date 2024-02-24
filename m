Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875DE560
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708810880; cv=none; b=HUd16iLKT/saB9rnYk9pZ1gPpuSdr62zxR2K/Cr+wMEf7DzZktRibFjOE9XfCBe0BpdSMANYETfDuCCfYFCC4eJxNEH4nusHllgDYEx7/JQIAWAD9J2Bin4U2O1s/L58VWYAoCxKQhTE8twnO+nind7Lav45Cao92i4R+w1yvPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708810880; c=relaxed/simple;
	bh=DThGtEyT63VcfwMOdEZ95G9gWXGfwBltlbZv6BArCus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z9T6oiS4pKrkYBf3zVC2g4eSA1OfKM8fCLL8KdI6+GT0MJOOSe6ogrJ9TwZe7K/rpzb5KrUH17kPkwx474t1d/1R3594hmPGN6/EuJ1gEx2uauSiOWSzj5tcc7ec+IMFhsnybw+8GHWQwpoAwuXqo2QZJJTYVlhiyPcSumPTYg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQnphKS4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQnphKS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708810877; x=1740346877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DThGtEyT63VcfwMOdEZ95G9gWXGfwBltlbZv6BArCus=;
  b=JQnphKS4T3ICXLlHbdjU0oNMwnK09G+7e8wOs+NciKa7j0qwnMF1llDs
   Sojy02O1eADaTZ1TwPSxV6ioaKYr50QA0/Q61cgOamtYuyj1JJK3dCSgI
   JdpcAwQIB4L4o8Nt+AhJn08JmMRl/YnRZgPGVhlWv4EPR/cPOoIvi3O+n
   IA68AzFt847ga1tSWhd1QBPJ03mYIJffYU0grzGv1CWMkoqqbjfa+YuBH
   zl6rH6GHqQAj8f6EpOvFe16CCuTW13VkSNcbg8xxHXVaVG6NuOYKmpmsU
   eQtoC+WdSRgIv/VfxtVbTfHNA+Q72Rg+5GC9kkbtGKkLPN9cfCCIaia/B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="20571614"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="20571614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 13:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="11052642"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2024 13:41:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdzlf-0008v0-1c;
	Sat, 24 Feb 2024 21:41:11 +0000
Date: Sun, 25 Feb 2024 05:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/infiniband/hw/bnxt_re/roce_hsi.h:75:8: error: redefinition
 of 'struct dbc_dbc'
Message-ID: <202402250500.mCN8Fq9g-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240225/202402250500.mCN8Fq9g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250500.mCN8Fq9g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250500.mCN8Fq9g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/bnxt_re/main.c:58:
>> drivers/infiniband/hw/bnxt_re/roce_hsi.h:75:8: error: redefinition of 'struct dbc_dbc'
      75 | struct dbc_dbc {
         |        ^~~~~~~
   In file included from drivers/infiniband/hw/bnxt_re/roce_hsi.h:43:
   drivers/net/ethernet/broadcom/bnxt/bnxt_hsi.h:14331:8: note: originally defined here
   14331 | struct dbc_dbc {
         |        ^~~~~~~
>> drivers/infiniband/hw/bnxt_re/roce_hsi.h:108:8: error: redefinition of 'struct dbc_dbc32'
     108 | struct dbc_dbc32 {
         |        ^~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_hsi.h:14368:8: note: originally defined here
   14368 | struct dbc_dbc32 {
         |        ^~~~~~~~~
   In file included from drivers/net/ethernet/broadcom/bnxt/bnxt.h:43,
                    from drivers/infiniband/hw/bnxt_re/main.c:66:
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:39:8: error: redefinition of 'struct dim_cq_moder'
      39 | struct dim_cq_moder {
         |        ^~~~~~~~~~~~
   In file included from include/rdma/ib_verbs.h:64,
                    from drivers/infiniband/hw/bnxt_re/main.c:52:
   include/linux/dim.h:37:8: note: originally defined here
      37 | struct dim_cq_moder {
         |        ^~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:45:8: error: redefinition of 'struct dim_sample'
      45 | struct dim_sample {
         |        ^~~~~~~~~~
   include/linux/dim.h:53:8: note: originally defined here
      53 | struct dim_sample {
         |        ^~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:52:8: error: redefinition of 'struct dim_stats'
      52 | struct dim_stats {
         |        ^~~~~~~~~
   include/linux/dim.h:69:8: note: originally defined here
      69 | struct dim_stats {
         |        ^~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:58:8: error: redefinition of 'struct dim'
      58 | struct dim { /* Adaptive Moderation */
         |        ^~~
   include/linux/dim.h:93:8: note: originally defined here
      93 | struct dim {
         |        ^~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:72:9: error: redeclaration of enumerator 'DIM_CQ_PERIOD_MODE_START_FROM_EQE'
      72 |         DIM_CQ_PERIOD_MODE_START_FROM_EQE = 0x0,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:118:9: note: previous definition of 'DIM_CQ_PERIOD_MODE_START_FROM_EQE' with type 'enum <anonymous>'
     118 |         DIM_CQ_PERIOD_MODE_START_FROM_EQE = 0x0,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:73:9: error: redeclaration of enumerator 'DIM_CQ_PERIOD_MODE_START_FROM_CQE'
      73 |         DIM_CQ_PERIOD_MODE_START_FROM_CQE = 0x1,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:119:9: note: previous definition of 'DIM_CQ_PERIOD_MODE_START_FROM_CQE' with type 'enum <anonymous>'
     119 |         DIM_CQ_PERIOD_MODE_START_FROM_CQE = 0x1,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:74:9: error: redeclaration of enumerator 'DIM_CQ_PERIOD_NUM_MODES'
      74 |         DIM_CQ_PERIOD_NUM_MODES
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:120:9: note: previous definition of 'DIM_CQ_PERIOD_NUM_MODES' with type 'enum <anonymous>'
     120 |         DIM_CQ_PERIOD_NUM_MODES
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:79:9: error: redeclaration of enumerator 'DIM_START_MEASURE'
      79 |         DIM_START_MEASURE,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/dim.h:135:9: note: previous definition of 'DIM_START_MEASURE' with type 'enum <anonymous>'
     135 |         DIM_START_MEASURE,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:80:9: error: redeclaration of enumerator 'DIM_MEASURE_IN_PROGRESS'
      80 |         DIM_MEASURE_IN_PROGRESS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:136:9: note: previous definition of 'DIM_MEASURE_IN_PROGRESS' with type 'enum <anonymous>'
     136 |         DIM_MEASURE_IN_PROGRESS,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:81:9: error: redeclaration of enumerator 'DIM_APPLY_NEW_PROFILE'
      81 |         DIM_APPLY_NEW_PROFILE,
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dim.h:137:9: note: previous definition of 'DIM_APPLY_NEW_PROFILE' with type 'enum <anonymous>'
     137 |         DIM_APPLY_NEW_PROFILE,
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:85:9: error: redeclaration of enumerator 'DIM_PARKING_ON_TOP'
      85 |         DIM_PARKING_ON_TOP,
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dim.h:152:9: note: previous definition of 'DIM_PARKING_ON_TOP' with type 'enum <anonymous>'
     152 |         DIM_PARKING_ON_TOP,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:86:9: error: redeclaration of enumerator 'DIM_PARKING_TIRED'
      86 |         DIM_PARKING_TIRED,
         |         ^~~~~~~~~~~~~~~~~
   include/linux/dim.h:153:9: note: previous definition of 'DIM_PARKING_TIRED' with type 'enum <anonymous>'
     153 |         DIM_PARKING_TIRED,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:87:9: error: redeclaration of enumerator 'DIM_GOING_RIGHT'
      87 |         DIM_GOING_RIGHT,
         |         ^~~~~~~~~~~~~~~
   include/linux/dim.h:154:9: note: previous definition of 'DIM_GOING_RIGHT' with type 'enum <anonymous>'
     154 |         DIM_GOING_RIGHT,
         |         ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:88:9: error: redeclaration of enumerator 'DIM_GOING_LEFT'
      88 |         DIM_GOING_LEFT,
         |         ^~~~~~~~~~~~~~
   include/linux/dim.h:155:9: note: previous definition of 'DIM_GOING_LEFT' with type 'enum <anonymous>'
     155 |         DIM_GOING_LEFT,
         |         ^~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:92:9: error: redeclaration of enumerator 'DIM_STATS_WORSE'
      92 |         DIM_STATS_WORSE,
         |         ^~~~~~~~~~~~~~~
   include/linux/dim.h:169:9: note: previous definition of 'DIM_STATS_WORSE' with type 'enum <anonymous>'
     169 |         DIM_STATS_WORSE,
         |         ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:93:9: error: redeclaration of enumerator 'DIM_STATS_SAME'
      93 |         DIM_STATS_SAME,
         |         ^~~~~~~~~~~~~~
   include/linux/dim.h:170:9: note: previous definition of 'DIM_STATS_SAME' with type 'enum <anonymous>'
     170 |         DIM_STATS_SAME,
         |         ^~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:94:9: error: redeclaration of enumerator 'DIM_STATS_BETTER'
      94 |         DIM_STATS_BETTER,
         |         ^~~~~~~~~~~~~~~~
   include/linux/dim.h:171:9: note: previous definition of 'DIM_STATS_BETTER' with type 'enum <anonymous>'
     171 |         DIM_STATS_BETTER,
         |         ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:98:9: error: redeclaration of enumerator 'DIM_STEPPED'
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
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:233: warning: "IS_SIGNIFICANT_DIFF" redefined
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
   drivers/net/ethernet/broadcom/bnxt/bnxt_dim.h:328: warning: "DIM_NEVENTS" redefined
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
--
   In file included from drivers/infiniband/hw/bnxt_re/ib_verbs.c:55:
>> drivers/infiniband/hw/bnxt_re/roce_hsi.h:75:8: error: redefinition of 'struct dbc_dbc'
      75 | struct dbc_dbc {
         |        ^~~~~~~
   In file included from drivers/infiniband/hw/bnxt_re/roce_hsi.h:43:
   drivers/net/ethernet/broadcom/bnxt/bnxt_hsi.h:14331:8: note: originally defined here
   14331 | struct dbc_dbc {
         |        ^~~~~~~
>> drivers/infiniband/hw/bnxt_re/roce_hsi.h:108:8: error: redefinition of 'struct dbc_dbc32'
     108 | struct dbc_dbc32 {
         |        ^~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_hsi.h:14368:8: note: originally defined here
   14368 | struct dbc_dbc32 {
         |        ^~~~~~~~~
--
   In file included from drivers/infiniband/hw/bnxt_re/hw_counters.c:52:
>> drivers/infiniband/hw/bnxt_re/roce_hsi.h:75:8: error: redefinition of 'struct dbc_dbc'
      75 | struct dbc_dbc {
         |        ^~~~~~~
   In file included from drivers/infiniband/hw/bnxt_re/roce_hsi.h:43:
   drivers/net/ethernet/broadcom/bnxt/bnxt_hsi.h:14331:8: note: originally defined here
   14331 | struct dbc_dbc {
         |        ^~~~~~~
>> drivers/infiniband/hw/bnxt_re/roce_hsi.h:108:8: error: redefinition of 'struct dbc_dbc32'
     108 | struct dbc_dbc32 {
         |        ^~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt_hsi.h:14368:8: note: originally defined here
   14368 | struct dbc_dbc32 {
         |        ^~~~~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:393,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/interrupt.h:6,
                    from drivers/infiniband/hw/bnxt_re/hw_counters.c:40:
   drivers/infiniband/hw/bnxt_re/hw_counters.c: In function 'bnxt_re_ib_get_hw_stats':
>> drivers/infiniband/hw/bnxt_re/hw_counters.c:135:52: error: 'struct ctx_hw_stats' has no member named 'rx_drop_pkts'; did you mean 'rx_error_pkts'?
     135 |                         le64_to_cpu(bnxt_re_stats->rx_drop_pkts);
         |                                                    ^~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition of macro '__le64_to_cpu'
      32 | #define __le64_to_cpu(x) ((__force __u64)(__le64)(x))
         |                                                   ^
   drivers/infiniband/hw/bnxt_re/hw_counters.c:135:25: note: in expansion of macro 'le64_to_cpu'
     135 |                         le64_to_cpu(bnxt_re_stats->rx_drop_pkts);
         |                         ^~~~~~~~~~~


vim +75 drivers/infiniband/hw/bnxt_re/roce_hsi.h

^590eaf1fec755 Kaixu Xia 2021-03-16   72  
^590eaf1fec755 Kaixu Xia 2021-03-16   73  /* Doorbell Structures */
^590eaf1fec755 Kaixu Xia 2021-03-16   74  /* dbc_dbc (size:64b/8B) */
^590eaf1fec755 Kaixu Xia 2021-03-16  @75  struct dbc_dbc {
^590eaf1fec755 Kaixu Xia 2021-03-16   76  	__le32  index;
^590eaf1fec755 Kaixu Xia 2021-03-16   77  	#define DBC_DBC_INDEX_MASK		0xffffffUL
^590eaf1fec755 Kaixu Xia 2021-03-16   78  	#define DBC_DBC_INDEX_SFT		0
^590eaf1fec755 Kaixu Xia 2021-03-16   79  	__le32  type_path_xid;
^590eaf1fec755 Kaixu Xia 2021-03-16   80  	#define DBC_DBC_XID_MASK		0xfffffUL
^590eaf1fec755 Kaixu Xia 2021-03-16   81  	#define DBC_DBC_XID_SFT			0
^590eaf1fec755 Kaixu Xia 2021-03-16   82  	#define DBC_DBC_PATH_MASK		0x3000000UL
^590eaf1fec755 Kaixu Xia 2021-03-16   83  	#define DBC_DBC_PATH_SFT		24
^590eaf1fec755 Kaixu Xia 2021-03-16   84  	#define DBC_DBC_PATH_ROCE		(0x0UL << 24)
^590eaf1fec755 Kaixu Xia 2021-03-16   85  	#define DBC_DBC_PATH_L2			(0x1UL << 24)
^590eaf1fec755 Kaixu Xia 2021-03-16   86  	#define DBC_DBC_PATH_ENGINE		(0x2UL << 24)
^590eaf1fec755 Kaixu Xia 2021-03-16   87  	#define DBC_DBC_PATH_LAST		DBC_DBC_PATH_ENGINE
^590eaf1fec755 Kaixu Xia 2021-03-16   88  	#define DBC_DBC_DEBUG_TRACE		0x8000000UL
^590eaf1fec755 Kaixu Xia 2021-03-16   89  	#define DBC_DBC_TYPE_MASK		0xf0000000UL
^590eaf1fec755 Kaixu Xia 2021-03-16   90  	#define DBC_DBC_TYPE_SFT		28
^590eaf1fec755 Kaixu Xia 2021-03-16   91  	#define DBC_DBC_TYPE_SQ			(0x0UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   92  	#define DBC_DBC_TYPE_RQ			(0x1UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   93  	#define DBC_DBC_TYPE_SRQ		(0x2UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   94  	#define DBC_DBC_TYPE_SRQ_ARM		(0x3UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   95  	#define DBC_DBC_TYPE_CQ			(0x4UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   96  	#define DBC_DBC_TYPE_CQ_ARMSE		(0x5UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   97  	#define DBC_DBC_TYPE_CQ_ARMALL		(0x6UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   98  	#define DBC_DBC_TYPE_CQ_ARMENA		(0x7UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16   99  	#define DBC_DBC_TYPE_SRQ_ARMENA		(0x8UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16  100  	#define DBC_DBC_TYPE_CQ_CUTOFF_ACK	(0x9UL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16  101  	#define DBC_DBC_TYPE_NQ			(0xaUL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16  102  	#define DBC_DBC_TYPE_NQ_ARM		(0xbUL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16  103  	#define DBC_DBC_TYPE_NULL		(0xfUL << 28)
^590eaf1fec755 Kaixu Xia 2021-03-16  104  	#define DBC_DBC_TYPE_LAST		DBC_DBC_TYPE_NULL
^590eaf1fec755 Kaixu Xia 2021-03-16  105  };
^590eaf1fec755 Kaixu Xia 2021-03-16  106  
^590eaf1fec755 Kaixu Xia 2021-03-16  107  /* dbc_dbc32 (size:32b/4B) */
^590eaf1fec755 Kaixu Xia 2021-03-16 @108  struct dbc_dbc32 {
^590eaf1fec755 Kaixu Xia 2021-03-16  109  	__le32  type_abs_incr_xid;
^590eaf1fec755 Kaixu Xia 2021-03-16  110  	#define DBC_DBC32_XID_MASK		0xfffffUL
^590eaf1fec755 Kaixu Xia 2021-03-16  111  	#define DBC_DBC32_XID_SFT		0
^590eaf1fec755 Kaixu Xia 2021-03-16  112  	#define DBC_DBC32_PATH_MASK		0xc00000UL
^590eaf1fec755 Kaixu Xia 2021-03-16  113  	#define DBC_DBC32_PATH_SFT		22
^590eaf1fec755 Kaixu Xia 2021-03-16  114  	#define DBC_DBC32_PATH_ROCE		(0x0UL << 22)
^590eaf1fec755 Kaixu Xia 2021-03-16  115  	#define DBC_DBC32_PATH_L2		(0x1UL << 22)
^590eaf1fec755 Kaixu Xia 2021-03-16  116  	#define DBC_DBC32_PATH_LAST		DBC_DBC32_PATH_L2
^590eaf1fec755 Kaixu Xia 2021-03-16  117  	#define DBC_DBC32_INCR_MASK		0xf000000UL
^590eaf1fec755 Kaixu Xia 2021-03-16  118  	#define DBC_DBC32_INCR_SFT		24
^590eaf1fec755 Kaixu Xia 2021-03-16  119  	#define DBC_DBC32_ABS			0x10000000UL
^590eaf1fec755 Kaixu Xia 2021-03-16  120  	#define DBC_DBC32_TYPE_MASK		0xe0000000UL
^590eaf1fec755 Kaixu Xia 2021-03-16  121  	#define DBC_DBC32_TYPE_SFT		29
^590eaf1fec755 Kaixu Xia 2021-03-16  122  	#define DBC_DBC32_TYPE_SQ		(0x0UL << 29)
^590eaf1fec755 Kaixu Xia 2021-03-16  123  	#define DBC_DBC32_TYPE_LAST		DBC_DBC32_TYPE_SQ
^590eaf1fec755 Kaixu Xia 2021-03-16  124  };
^590eaf1fec755 Kaixu Xia 2021-03-16  125  

:::::: The code at line 75 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
