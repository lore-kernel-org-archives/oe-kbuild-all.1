Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF91335BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766504209; cv=none; b=LjTyKs4XfosWIfQsRNIOcEoZ4miraVN4ypAfsSfdxT6Ymc3gL3og/Jl75kfpR8Be3q+I+bcyzqasmc3TY7w4CDsQUBA+RQX9agWZgRaiu6Mn4SD/iG+T5KJ41Ki2vLx4BKxxZf18Qjwl6JJ5rgJzldArYlxHq+q/vsECbLEG9sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766504209; c=relaxed/simple;
	bh=8DGKSI5O7O5TnXhmAejFI8rR2FOYHUT7M2pviCtDjOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iObGRZOntz/mRu/tAW4gPnbEokAsmD/TTMFfb/48H6r5KNwnjC4BXHbHgeIG8dq9NPmLHm1Cks5HoP+IRS0YaLk0RdrK0Wx/UJPSBUaIpy4gIfmR5zVvShdbI45VyxNqCH2wAlJN0HdNVObzv/frY0pgWaTzAiJ03RUzMU6ZcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7sPk4OE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7sPk4OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766504207; x=1798040207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8DGKSI5O7O5TnXhmAejFI8rR2FOYHUT7M2pviCtDjOA=;
  b=B7sPk4OEwX11mBnopEtvZRd4cYPboLP3TFpYB6Pw122o8NTNlp5hpy6j
   y8LMa04O6yQGkIO2+hPMHslSf8nezgQBk1bLVCadVr4neCqRTZGF4GiOd
   4+IRbmAetAg60Y4BeEZ4j04nd5cFIHSvMV+dSiGvE+suGOe2YPYjlK6MF
   tsvfouawUu7yeouY6jHyrPOAMlq0RJK1Z02QpclXUGcisVhiO4YpB5wCZ
   spzjsEQbfgh4V3100o5BTBbexHJhPAfGUG2e0WPpSwU+ZH0m5pxVCoMEs
   uwTV9JvnC60pvLBPPwrhLogeqzsrtg+G010GTf7GIaII4C5j5mrAvE45H
   g==;
X-CSE-ConnectionGUID: AyROOkdkQVyBr1HPJEDNzQ==
X-CSE-MsgGUID: Q2D3LzqUQhm+rwXzUITXKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79715463"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79715463"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:36:47 -0800
X-CSE-ConnectionGUID: ANZeHrg6T7G8O+eZXXHy6Q==
X-CSE-MsgGUID: 4W3nHMBoTJud1uUcErz9gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204324609"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Dec 2025 07:36:45 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4Qh-0000000024r-3L74;
	Tue, 23 Dec 2025 15:36:12 +0000
Date: Tue, 23 Dec 2025 23:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jerry Wu <w.7erry@foxmail.com>, vladimir.oltean@nxp.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jerry Wu <w.7erry@foxmail.com>
Subject: Re: [PATCH] Prevent crash when adding interface under a lag
Message-ID: <202512232301.jt5UlaM8-lkp@intel.com>
References: <tencent_9E2B81D645D04DFE191C86F128212F842B05@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_9E2B81D645D04DFE191C86F128212F842B05@qq.com>

Hi Jerry,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerry-Wu/Prevent-crash-when-adding-interface-under-a-lag/20251221-013514
base:   linus/master
patch link:    https://lore.kernel.org/r/tencent_9E2B81D645D04DFE191C86F128212F842B05%40qq.com
patch subject: [PATCH] Prevent crash when adding interface under a lag
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512232301.jt5UlaM8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232301.jt5UlaM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232301.jt5UlaM8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:114,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/jiffies.h:7,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from include/linux/if_bridge.h:12,
                    from include/linux/dsa/ocelot.h:8,
                    from drivers/net/ethernet/mscc/ocelot.c:7:
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_set_aggr_pgids':
>> include/linux/find.h:586:63: error: passing argument 3 of '_find_next_bit_le' makes integer from pointer without a cast [-Wint-conversion]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct ocelot_port *
   arch/arm/include/asm/bitops.h:205:64: note: in definition of macro 'find_next_bit'
     205 | #define find_next_bit(p,sz,off)         _find_next_bit_le(p,sz,off)
         |                                                                ^~~
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
   arch/arm/include/asm/bitops.h:167:91: note: expected 'long unsigned int' but argument is of type 'struct ocelot_port *'
     167 | unsigned long _find_next_bit_le(const unsigned long *p, unsigned long size, unsigned long offset);
         |                                                                             ~~~~~~~~~~~~~~^~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8:
   include/linux/find.h:586:31: error: assignment to 'struct ocelot_port *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                               ^
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
   include/linux/find.h:586:77: warning: comparison between pointer and integer
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                                             ^
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:2323:72: error: array subscript is not an integer
    2323 |                         struct ocelot_port *ocelot_port = ocelot->ports[port];
         |                                                                        ^
   In file included from include/soc/mscc/ocelot_vcap.h:9,
                    from drivers/net/ethernet/mscc/ocelot.c:13:
   include/soc/mscc/ocelot.h:923:55: error: invalid operands to binary * (have 'int' and 'struct ocelot_port *')
     923 |         __ocelot_write_ix(ocelot, val, reg, reg##_RSZ * (ri))
         |                                                       ^
   drivers/net/ethernet/mscc/ocelot.c:2329:25: note: in expansion of macro 'ocelot_write_rix'
    2329 |                         ocelot_write_rix(ocelot, bond_mask,
         |                         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:2333:62: error: assignment to 'u8' {aka 'unsigned char'} from 'struct ocelot_port *' makes integer from pointer without a cast [-Wint-conversion]
    2333 |                                 aggr_idx[num_active_ports++] = port;
         |                                                              ^
   drivers/net/ethernet/mscc/ocelot.c:2352:27: error: assignment to 'struct ocelot_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2352 |                 for (port = lag; port < ocelot->num_phys_ports; port++) {
         |                           ^
   drivers/net/ethernet/mscc/ocelot.c:2352:39: warning: comparison between pointer and integer
    2352 |                 for (port = lag; port < ocelot->num_phys_ports; port++) {
         |                                       ^
   drivers/net/ethernet/mscc/ocelot.c:2353:72: error: array subscript is not an integer
    2353 |                         struct ocelot_port *ocelot_port = ocelot->ports[port];
         |                                                                        ^
   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/ktime.h:24:
   include/vdso/bits.h:7:40: error: invalid operands to binary << (have 'long unsigned int' and 'struct ocelot_port *')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/net/ethernet/mscc/ocelot.c:2359:44: note: in expansion of macro 'BIT'
    2359 |                                 visited |= BIT(port);
         |                                            ^~~


vim +/_find_next_bit_le +586 include/linux/find.h

6b8ecb84f8f640 include/asm-generic/bitops/find.h Yury Norov 2021-08-14  584  
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  585  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov 2022-09-19 @586  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
