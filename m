Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540CA52F68
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709271003; cv=none; b=XPfHStcUNBm8phZhxoVmA1ODm71VHgfu0SYcCOzqbU7sQuPAE5OUxjcKViB1anxESKvPz1tW3JOkRy/i1p7rDQJPC6vB/l5NLV1+v/uAwX6yB+03CjHbGRAtDmUzts7o2gH0P/DE9nKoxde/TE4Rt5K6BXiyGc+uL1LXihvf1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709271003; c=relaxed/simple;
	bh=mF37b7whIQFoBK+spzjevEMaTjdAPhHIkPz1KaYn6IU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jt3/1bfWLnm+tdCjVnkP2QeLom/8jIdycvP52Nnc8uW80oyUrIctmNRnPe3htxS5GTjw34doMz3L9SEK0WtXJ+naefAoLA4CRhDPI5sWzMmpQM80FQ5DkoD4oI2aK4diObcNwBZoOz4uNcf8MMVu92xNL5TJf7kEBQcgnrea1Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D33VY4Pt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D33VY4Pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709271001; x=1740807001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mF37b7whIQFoBK+spzjevEMaTjdAPhHIkPz1KaYn6IU=;
  b=D33VY4Pt2qdEN4p49PriFfl5S1klq4k4M6aa7BlJ2CTeu/bjUVu3D98A
   xtUu5eF/4doMJWi+exwEuCk2KkPZwwIKxJMOlt6kXT9t2ISKCuI5VoUmj
   M13u9/Wrv9nYjuV7+pme2kfSWud246sJWIp9f1BFfazC4hX+QBISCrTea
   GKgN6IaTCy0nYmnXqlWbd8Khcu+jcbKg17Ukj66PVMyCbQIpzgsSeWmTT
   gFRran0gU2lkXIHWcXhoQcHZbQjcvFbnGoF7eJdmWMGoTi7Imul9uf05V
   uga64zlg2uD38+oPtAC72dGgDUjIplksCrvuuzTyQo07/cy5FBcyfVYpe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="6742893"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="6742893"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 21:30:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="12770725"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Feb 2024 21:29:59 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfvT2-000DZ6-2K;
	Fri, 01 Mar 2024 05:29:56 +0000
Date: Fri, 1 Mar 2024 13:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Yang <ye.yang@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 130/860] drivers/misc/xlnx_dpu.h:21:
 warning: "in_range" redefined
Message-ID: <202403011306.yEjo7eRJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: 2d9cdbf45fbb41f9314bcf7bcae8a3c19de020c9 [130/860] misc: xlnx_dpu: Add Xilinx DPU IP driver for Vivado tool flow
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403011306.yEjo7eRJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011306.yEjo7eRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011306.yEjo7eRJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/xlnx_dpu.c:29:
>> drivers/misc/xlnx_dpu.h:21: warning: "in_range" redefined
      21 | #define in_range(b, start, len) (               \
         | 
   In file included from include/linux/kernel.h:27,
                    from include/linux/cpumask.h:10,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/misc/xlnx_dpu.c:14:
   include/linux/minmax.h:248: note: this is the location of the previous definition
     248 | #define in_range(val, start, len)                                       \
         | 
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
