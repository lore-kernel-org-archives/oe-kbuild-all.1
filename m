Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14A324B23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491121; cv=none; b=TlKruBZJGaCyM2oDOPyHt4gdiK7nRs0GrcdtcCbVcucX49D/j/fztL4T3R53gkbh1JBkdZEq9skZ7WcFswk+5WaPpOWomGnOZhmoiVm8syUT42w4poeppg+UvkFm/TueoKVAugoatrhCY/nQ0mxZc6bCQaN7wHUR8R11rAbYU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491121; c=relaxed/simple;
	bh=+r8hmJo/eIPLNbeG+lsbo/ZCl3qZMdkC4bU2eWmt9SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ucifpf+qHGVFoAuMFc/kd8uyHen5/VmKMwyPjDGJHph9saKujNkFTYuKM+hNtrqADiBpLkRA8NCEax2t+O4YrPBDAdfKUgeBMiVbNFxC9rU6E3oowYEStdOfyx1eDdOahbdm5gmR/7Z/Ii29Oph7eFLA2AfIvFYtLJFZYG8DzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVjuhXY0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVjuhXY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766491120; x=1798027120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+r8hmJo/eIPLNbeG+lsbo/ZCl3qZMdkC4bU2eWmt9SE=;
  b=mVjuhXY0BvAWxEvQhYlCqIx5QZ+YWKBZlpAtJHoMKCtj3tAnXv5NlTC2
   A7vs+aYOx/qFx3XSIpwfI5/T7NwL2cte0FMglhL7RAF0/71SWtU0noGW0
   Iczv/l99YUoW4SfZLwbiJVLTNw9T0gTJwnYUSw2MyLtlSL+4ezjaAWQx0
   wColSOQrxDMiBVemYgqxYbh/13z0aSOTzzmKh0bmiqwuz/aUTJ4jSVEES
   Hh/MlsrUywK/rS/iyopaKUe7O9k71FnZLi5KdPRZYmnKm4Bxv8VBScmB8
   JdHNG1H4eXLOgDJB6vXsUeKIX4mLrKF/hkqlB/FyqDuPePhorf+eY9ylH
   A==;
X-CSE-ConnectionGUID: BBPr7z+mSBmu8FEcRZ4KYQ==
X-CSE-MsgGUID: OVNaGGp7QS6tWe2HAuLrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85754302"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="85754302"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:58:39 -0800
X-CSE-ConnectionGUID: sS5n7jz8QxC+rhhJv33Thg==
X-CSE-MsgGUID: UakKEjSCRuuCvNwQ7rj56g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="200067102"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 03:58:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY12B-000000001qv-2CjW;
	Tue, 23 Dec 2025 11:58:35 +0000
Date: Tue, 23 Dec 2025 19:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jerry Wu <w.7erry@foxmail.com>, vladimir.oltean@nxp.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jerry Wu <w.7erry@foxmail.com>
Subject: Re: [PATCH] Prevent crash when adding interface under a lag
Message-ID: <202512231955.Jle1VCFu-lkp@intel.com>
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
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251223/202512231955.Jle1VCFu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231955.Jle1VCFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231955.Jle1VCFu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/netdevice.h:24,
                    from include/linux/if_bridge.h:12,
                    from include/linux/dsa/ocelot.h:8,
                    from drivers/net/ethernet/mscc/ocelot.c:7:
   drivers/net/ethernet/mscc/ocelot.c: In function 'ocelot_set_aggr_pgids':
>> include/linux/find.h:586:63: error: passing argument 3 of 'find_next_bit' makes integer from pointer without a cast [-Wint-conversion]
     586 |         for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
         |                                                               ^~~~~
         |                                                               |
         |                                                               struct ocelot_port *
   drivers/net/ethernet/mscc/ocelot.c:2322:17: note: in expansion of macro 'for_each_set_bit'
    2322 |                 for_each_set_bit(port, &bond_mask, ocelot->num_phys_ports) {
         |                 ^~~~~~~~~~~~~~~~
   include/linux/find.h:61:43: note: expected 'long unsigned int' but argument is of type 'struct ocelot_port *'
      61 |                             unsigned long offset)
         |                             ~~~~~~~~~~~~~~^~~~~~
>> include/linux/find.h:586:31: error: assignment to 'struct ocelot_port *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
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
>> drivers/net/ethernet/mscc/ocelot.c:2323:72: error: array subscript is not an integer
    2323 |                         struct ocelot_port *ocelot_port = ocelot->ports[port];
         |                                                                        ^
   In file included from include/soc/mscc/ocelot_vcap.h:9,
                    from drivers/net/ethernet/mscc/ocelot.c:13:
>> include/soc/mscc/ocelot.h:923:55: error: invalid operands to binary * (have 'int' and 'struct ocelot_port *')
     923 |         __ocelot_write_ix(ocelot, val, reg, reg##_RSZ * (ri))
         |                                                       ^
   drivers/net/ethernet/mscc/ocelot.c:2329:25: note: in expansion of macro 'ocelot_write_rix'
    2329 |                         ocelot_write_rix(ocelot, bond_mask,
         |                         ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mscc/ocelot.c:2333:62: error: assignment to 'u8' {aka 'unsigned char'} from 'struct ocelot_port *' makes integer from pointer without a cast [-Wint-conversion]
    2333 |                                 aggr_idx[num_active_ports++] = port;
         |                                                              ^
>> drivers/net/ethernet/mscc/ocelot.c:2352:27: error: assignment to 'struct ocelot_port *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
                    from arch/parisc/include/asm/bug.h:97,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6:
>> include/vdso/bits.h:7:40: error: invalid operands to binary << (have 'long unsigned int' and 'struct ocelot_port *')
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/net/ethernet/mscc/ocelot.c:2359:44: note: in expansion of macro 'BIT'
    2359 |                                 visited |= BIT(port);
         |                                            ^~~


vim +586 include/linux/find.h

6b8ecb84f8f6401 include/asm-generic/bitops/find.h Yury Norov 2021-08-14  584  
bc9d6635c293a2a include/linux/find.h              Yury Norov 2021-08-14  585  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70e include/linux/find.h              Yury Norov 2022-09-19 @586  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2a include/linux/find.h              Yury Norov 2021-08-14  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
