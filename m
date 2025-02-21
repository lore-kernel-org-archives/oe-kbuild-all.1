Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FF0253B64
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740171596; cv=none; b=GYdaRcuz3c27T1rZzrhshQeXvvtdnotQxUA3pOxJMr7xrOtm9C34MmKHqs4etFB+EKUf9ZAWSHHsMJZ8X0VGiyKMWRgGR60Ddfnnhslqyl3ui8+z7snIET78d9qKO7nhCtzoF/2gl5X2kGgl/r95Z+jaF/evm+GzUxvjnLRhj8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740171596; c=relaxed/simple;
	bh=spXiQvNak9gioNT5c96yN83ynGxFqbSEc3tT3nnnv+g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+Pag2pMp70KIcIaz07tNaY1qZwaFegzCnKbm/SX6U/0E64J47bNO4s1onl8KZ6mkXVFd7Aa1iaKmmRI3PDzr94LuVEOaLWl9O0dPix+oNfcHNA3upqf9HMshZ+57jUYIQJps8FVHZcX54hKPub3yQBWEq90ljyQ8wUfRp9nD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9n/dWl1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9n/dWl1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740171594; x=1771707594;
  h=date:from:cc:subject:message-id:mime-version;
  bh=spXiQvNak9gioNT5c96yN83ynGxFqbSEc3tT3nnnv+g=;
  b=P9n/dWl1eBILMXM+88DmreOHwb0QAoZ4mTfglZ0ZkbW685fXzda2Pkku
   C21XxApUOKOuV/bsJnZV6NJDmPh7k9UBA3VOXg9Qr2sM2NPsySLU3I65h
   4tENvoFtJ/bdsZkqhi+YMGb4iY5bnRDhc7g+YdgdVkBBzmbSLIrnO0GPa
   hXus4bZxoAGlMuVdETlSjzoUETokokiiXy2MC8AHCPnF995prbm4VgnIg
   UzBjPD0qLZ1Nq7v69qaMjpBWbVkEE3MWyXN3LiMrCLwEcL21Ivg9V9RQh
   WlTUAYHPirmt7h9R7kOyMOBqEc7J5We3plFGRbUarBxcoLAFmi0syWTpO
   Q==;
X-CSE-ConnectionGUID: iwI2/gxdRC2Ez/esp9WW9A==
X-CSE-MsgGUID: jJqPf3L6Sq6Bt+Jc43sMdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51629479"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="51629479"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:59:54 -0800
X-CSE-ConnectionGUID: wz5bA7jPTk6rIUDS2ch3jQ==
X-CSE-MsgGUID: P+3ETNLuSn+OjDTKObxAZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="138701365"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2025 12:59:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tla7i-00060x-2a
	for oe-kbuild-all@lists.linux.dev;
	Fri, 21 Feb 2025 20:59:50 +0000
Date: Sat, 22 Feb 2025 04:59:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1]
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:65:6: warning:
 variable 'xmit_status' set but not used
Message-ID: <202502220409.BXUvo6OJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: ceed73a2cf4aff2921802aa3d21d45280677547d [1/1] drivers: net: ethernet: qualcomm: rmnet: Initial implementation
config: xtensa-randconfig-002-20250218 (https://download.01.org/0day-ci/archive/20250222/202502220409.BXUvo6OJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502220409.BXUvo6OJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502220409.BXUvo6OJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/timer.h:4,
                    from include/linux/netdevice.h:28,
                    from drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:13:
   include/linux/dma-mapping.h: In function 'dma_map_resource':
   arch/xtensa/include/asm/page.h:185:9: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
     ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
            ^
   include/linux/compiler.h:175:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/linux/dma-mapping.h:331:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
     ^~~~~~
   include/linux/dma-mapping.h:331:9: note: in expansion of macro 'pfn_valid'
     BUG_ON(pfn_valid(PHYS_PFN(phys_addr)));
            ^~~~~~~~~
   drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c: In function 'rmnet_map_do_flow_control':
   drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:28:6: warning: variable 'qos_id' set but not used [-Wunused-but-set-variable]
     u32 qos_id;
         ^~~~~~
   drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:27:6: warning: variable 'fc_seq' set but not used [-Wunused-but-set-variable]
     u16 fc_seq;
         ^~~~~~
   drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:26:6: warning: variable 'ip_family' set but not used [-Wunused-but-set-variable]
     u16 ip_family;
         ^~~~~~~~~
   drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c: In function 'rmnet_map_send_ack':
>> drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c:65:6: warning: variable 'xmit_status' set but not used [-Wunused-but-set-variable]
     int xmit_status;
         ^~~~~~~~~~~


vim +/xmit_status +65 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c

    59	
    60	static void rmnet_map_send_ack(struct sk_buff *skb,
    61				       unsigned char type,
    62				       struct rmnet_real_dev_info *rdinfo)
    63	{
    64		struct rmnet_map_control_command *cmd;
  > 65		int xmit_status;
    66	
    67		skb->protocol = htons(ETH_P_MAP);
    68	
    69		cmd = RMNET_MAP_GET_CMD_START(skb);
    70		cmd->cmd_type = type & 0x03;
    71	
    72		netif_tx_lock(skb->dev);
    73		xmit_status = skb->dev->netdev_ops->ndo_start_xmit(skb, skb->dev);
    74		netif_tx_unlock(skb->dev);
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
