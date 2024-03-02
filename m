Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63071AD31
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 04:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709355079; cv=none; b=Yi4Dm1A4kpvgiBHxaHGAphgTM/lUzpL5OgNwQca5rLDvQS5/VgMBrh/ImgPrB/1NElhgZ07hkeuOfaGh6olXKRljBV1lZg+3GbWmQB7o1Ch2aP+iHs8gW82gqEz5nNjp35HQmyQg8witDgJIAW8Q+WOlmidYN6KS0iRRaQx1XdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709355079; c=relaxed/simple;
	bh=9Yw8AyG25s+opkacs2hH1MHrZU0LXK8hkYLMChX44TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GG5pxWzqpdG1ltv2iITb3QFfx0iyUUA6NOBIssMSWoumjmDwm6uWti8JbYT+kYVzIpPI3d9erbB2IRTXkILbWAt2vqSndV7yR7QJo63U96D8uBLZK68g7dO9MricVQXqJGYFNVes5F7QE2ELkUFk1Dvv3YqObRpbEUXXVII3NdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFBHCS91; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFBHCS91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709355076; x=1740891076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Yw8AyG25s+opkacs2hH1MHrZU0LXK8hkYLMChX44TM=;
  b=dFBHCS91SrqvCiCocYVUZM5kBAnSAyOMCyJLttXIPlgd6MiKIQLH46p6
   OjKzJUTnj0i09NVhdUwAZlvw0k0yEpZsIczP8zSYTGyQc5POu3R3EQyR+
   EyoSjc9zRDfuy8JXJmL1gXNVSCrrtNsU3IPWesipDtjT8KH/5QunodWRR
   NI01m8wdMOEcwhG5Q7ruGE6s7aJ36aFBTknkyos/VRyZsR6mhe2fBlNKH
   Ig/EnoV1/0VElgH1kb+msTH3W3HMASpC10XEaR9uIcPrg602Yr2OWjhCe
   PcQ6YxQa0KSIQ8vk3L6bOQaAW/wtOfd2RKHTHZ/tA8+VC6KppggESfGJE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3773258"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3773258"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 20:51:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8536741"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Mar 2024 20:51:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgHL6-000EKX-1Z;
	Sat, 02 Mar 2024 04:51:12 +0000
Date: Sat, 2 Mar 2024 12:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21121/21674]
 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:40:13: warning:
 'sss_deinit_vf_hw' defined but not used
Message-ID: <202403021253.DevBZWcC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c4c847f506337d954e047d8180cebae7d09d60e8
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [21121/21674] Net: ethernet: Support 3snic 3s9xx network card
config: arm64-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021253.DevBZWcC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021253.DevBZWcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021253.DevBZWcC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:40:13: warning: 'sss_deinit_vf_hw' defined but not used [-Wunused-function]
      40 | static void sss_deinit_vf_hw(void *hwdev, u16 vf_num)
         |             ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c:18:12: warning: 'sss_init_vf_hw' defined but not used [-Wunused-function]
      18 | static int sss_init_vf_hw(void *hwdev, u16 vf_num)
         |            ^~~~~~~~~~~~~~


vim +/sss_deinit_vf_hw +40 drivers/net/ethernet/3snic/sssnic/hw/sss_pci_sriov.c

    17	
  > 18	static int sss_init_vf_hw(void *hwdev, u16 vf_num)
    19	{
    20		int ret;
    21		u16 i;
    22		u16 id;
    23	
    24		/* mbx msg channel resources will be freed during remove process */
    25		ret = sss_init_func_mbx_msg(hwdev, sss_get_max_vf_num(hwdev));
    26		if (ret != 0)
    27			return ret;
    28	
    29		/* vf use 256K as default wq page size, and can't change it */
    30		for (i = 1; i <= vf_num; i++) {
    31			id = sss_get_glb_pf_vf_offset(hwdev) + i;
    32			ret = sss_chip_set_wq_page_size(hwdev, id, SSS_DEFAULT_WQ_PAGE_SIZE);
    33			if (ret != 0)
    34				return ret;
    35		}
    36	
    37		return 0;
    38	}
    39	
  > 40	static void sss_deinit_vf_hw(void *hwdev, u16 vf_num)
    41	{
    42		u16 i;
    43		u16 id;
    44	
    45		for (i = 1; i <= vf_num; i++) {
    46			id = sss_get_glb_pf_vf_offset(hwdev) + i;
    47			sss_chip_set_wq_page_size(hwdev, id, SSS_HW_WQ_PAGE_SIZE);
    48		}
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
