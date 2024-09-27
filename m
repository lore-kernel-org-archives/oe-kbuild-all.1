Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A13C6BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 23:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727480578; cv=none; b=i3EYR8glczshKYv4jXlNxcIeQ4WXSroIw45yujbMQoK8kuHrUeYP09AD+A7u19fa1YByT6cNRaNvN9mbd4NUKkq4L0pc1MAyacGYWTos+59E5LyJ5Fe+hzv9qI3fL1I3Zz1DiWpY6aLf9KwF1VFD1u6UAYJWLEN8O0CcTgpG+hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727480578; c=relaxed/simple;
	bh=qelp6IkSdihmzlZYv0yt2h8NfeANj9XSs62Z4YYIGII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=puZBGCR/cJrtQZs2tGSJemIs4RKEfaOERQEETjEeTaLKKBYH18ckY1UmOzCFjXKS3vN1Bbn4ebUGZya6YlEYXHCHKvEO3ou/hi8gKuZgxNXLSOoARoGvBdusVc91dfxPxj4dn5wscAyCNVxtSOYu2HoiZSPHT+ehSRhXmYHTceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpP40XqX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpP40XqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727480577; x=1759016577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qelp6IkSdihmzlZYv0yt2h8NfeANj9XSs62Z4YYIGII=;
  b=fpP40XqXFlIqE8S9fkp0p2zC1oMCswepDdoACfkewGBf33DkzCcOZfr+
   MVNwTMGiiGfMKJcog7k/gJ4xVkNKpwH/C/9zrt1F74YbRU6Msjy8emFss
   slR1NsqsylQq3tO3k439pyM3gxjGBmEyHq7n5s/Vqe7lBI7rSLGOAf46G
   RjyG4MvsbrwrYsecHqGxqEZqDaMoAV9akGIt5FhGI9naq6xtVJO20TzKh
   aT4mPti/WHT+RPExArKWwsjEwpD6Ylp0wObFKy+tNgDflcfCx9QusOQKI
   FXz/MkxKf+2I4GWjJd9kIgwL/YpOnMIuVJl+PAb/9Ze1i2+bxiLXMspoZ
   g==;
X-CSE-ConnectionGUID: 9Zxf12JvTliUIzNQw95PbQ==
X-CSE-MsgGUID: 3T3EuA1nR0eoaLgMWwAODg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30344647"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30344647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 16:42:54 -0700
X-CSE-ConnectionGUID: sUYBLugIRNGFaXJBuz3T3A==
X-CSE-MsgGUID: iz5BI6stRFidq9lk6kZaOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72566089"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Sep 2024 16:42:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suKbp-000Mjl-0c;
	Fri, 27 Sep 2024 23:42:49 +0000
Date: Sat, 28 Sep 2024 07:42:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 130/1001]
 drivers/misc/xlnx_dpu.h:21:9: warning: "in_range" redefined
Message-ID: <202409280702.kuFibMcP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ye,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: 2d9cdbf45fbb41f9314bcf7bcae8a3c19de020c9 [130/1001] misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20240928/202409280702.kuFibMcP-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280702.kuFibMcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280702.kuFibMcP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/xlnx_dpu.c:29:
>> drivers/misc/xlnx_dpu.h:21:9: warning: "in_range" redefined
      21 | #define in_range(b, start, len) (               \
         |         ^~~~~~~~
   In file included from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/misc/xlnx_dpu.c:14:
   include/linux/minmax.h:248:9: note: this is the location of the previous definition
     248 | #define in_range(val, start, len)                                       \
         |         ^~~~~~~~
   drivers/misc/xlnx_dpu.c: In function 'dump_show':
>> drivers/misc/xlnx_dpu.c:1295:61: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1295 |                                 seq_printf(seq, "   0x%010llx-0x%010llx\t\t",
         |                                                       ~~~~~~^
         |                                                             |
         |                                                             long long unsigned int
         |                                                       %010x
    1296 |                                            h->phy_addr,
         |                                            ~~~~~~~~~~~       
         |                                             |
         |                                             phys_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1295:71: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
    1295 |                                 seq_printf(seq, "   0x%010llx-0x%010llx\t\t",
         |                                                                 ~~~~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                 %010x
    1296 |                                            h->phy_addr,
    1297 |                                            h->phy_addr + h->size);
         |                                            ~~~~~~~~~~~~~~~~~~~~~       
         |                                                        |
         |                                                        phys_addr_t {aka unsigned int}
>> drivers/misc/xlnx_dpu.c:1298:58: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1298 |                                 seq_printf(seq, "0x%010llx-0x%010llx\n",
         |                                                    ~~~~~~^
         |                                                          |
         |                                                          long long unsigned int
         |                                                    %010x
    1299 |                                            h->dma_addr,
         |                                            ~~~~~~~~~~~    
         |                                             |
         |                                             dma_addr_t {aka unsigned int}
   drivers/misc/xlnx_dpu.c:1298:68: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1298 |                                 seq_printf(seq, "0x%010llx-0x%010llx\n",
         |                                                              ~~~~~~^
         |                                                                    |
         |                                                                    long long unsigned int
         |                                                              %010x
    1299 |                                            h->dma_addr,
    1300 |                                            (h->dma_addr + h->size));
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~  
         |                                                         |
         |                                                         dma_addr_t {aka unsigned int}


vim +/in_range +21 drivers/misc/xlnx_dpu.h

    20	
  > 21	#define in_range(b, start, len) (		\
    22	{						\
    23	typeof(b) b_ = (b);				\
    24	typeof(start) start_ = (start);			\
    25	((b_) >= (start_) && (b_) < (start_) + (len));	\
    26	}						\
    27	)
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
