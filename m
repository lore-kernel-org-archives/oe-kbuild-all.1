Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEA7421A05
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 23:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949169; cv=none; b=tTIcZ09z6qjavyZQKkxOAQixb808KHJ2bwWIl6QgL9CvlSZBkbwyNoH1fYVMcnV7CzIcdpokbFxK2ub9oQRKBFuv8LJ7qWsY25h19JpopO+Z+FWncq+w7bmR953BuvI1P1mfPyGfG33trN0/6pl4ShhHxsWrntd2SmNq9ho2BHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949169; c=relaxed/simple;
	bh=wDne3BvYjEd7G1QnT8ZUbanmUxj89nm4xkqIsAtmiUI=;
	h=Date:From:Cc:Subject:Message-ID; b=k8zRFEbAUlUhXjELmLnIvhxuJKBekCOmSbCGcNpLi6EjUb3S7Hmj50Vbl/3KelmYbLWmksjUZNkMzn6M+U2eGWE+bTM3ABejiYJloXMz764m2lQZpQAyT0VEoj3unENEeOTdn00mAk6jABHxSS8tNfRL5IKnZRYR9I6o+4UHPvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KNdHPg1K; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNdHPg1K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782949167; x=1814485167;
  h=date:from:cc:subject:message-id;
  bh=wDne3BvYjEd7G1QnT8ZUbanmUxj89nm4xkqIsAtmiUI=;
  b=KNdHPg1KNzmIkm6YzhZD9WjKxMX6OP5Eny2KhIJNFzXeAtmsOfvoctCo
   EPqDk6B3MhfCEarUWya/4DffzXL6RAmLpvNuh/Oj7P2bjUblK7AbpTMDS
   MC5NqRzIU551CseO2NLRZ1cVwuTLnUhYNG4dvgIXtpU0ENGVABDcNpZQy
   JbND7oBIePPbzCDxLl8kY1qVkz6lHycz2foOaNaevZjwRmvp6qNb+kPSY
   ZRB0Fh3kqV6rJjwwK8RjQXcnAvcmRkfbj6pQHjENn8mnv6T5z9cA1/OV5
   1TPT8qb9fvckasG40hokVESwwenoh2eVCt8Oy8iJIkzZGMfgHz9xIbQqf
   A==;
X-CSE-ConnectionGUID: eks/EeiuS0m7cnmzVRiy/Q==
X-CSE-MsgGUID: OEL7ciyEQwKlzGGsDgbRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="86238426"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="86238426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 16:39:26 -0700
X-CSE-ConnectionGUID: WwCA4W/mRz+Rh40maFAYpQ==
X-CSE-MsgGUID: EkNm1tR8REqBGhqxOIgC/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="275912342"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2026 16:39:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf4WN-000000009ib-14gK;
	Wed, 01 Jul 2026 23:39:14 +0000
Date: Thu, 02 Jul 2026 07:38:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>
Subject: [tnguy-next-queue:dev-queue 53/137]
 include/linux/net/intel/virtchnl.h:480:30: error: enumerator value for
 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
Message-ID: <202607020746.dwYTCJet-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   62cd994a473c1a7b1f9880e51d3c8ef8ae3b7550
commit: 4efec52d707a97415f9106aa4ae888ddf2644a09 [53/137] virtchnl: move virtchnl and virtchnl2 headers to 'include/linux/net/intel'
config: arm-randconfig-r051-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020746.dwYTCJet-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020746.dwYTCJet-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020746.dwYTCJet-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/iavf/iavf.h:30,
                    from drivers/net/ethernet/intel/iavf/iavf_main.c:7:
>> include/linux/net/intel/virtchnl.h:174:43: warning: division by zero [-Wdiv-by-zero]
     174 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/net/intel/virtchnl.h:480:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     480 | VIRTCHNL_CHECK_STRUCT_LEN(2, virtchnl_irq_map_info);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/net/intel/virtchnl.h:480:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
     480 | VIRTCHNL_CHECK_STRUCT_LEN(2, virtchnl_irq_map_info);
         |                              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/net/intel/virtchnl.h:174:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     174 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^


vim +/virtchnl_static_assert_virtchnl_irq_map_info +480 include/linux/net/intel/virtchnl.h

62683ab51e487f drivers/net/ethernet/intel/i40evf/i40e_virtchnl.h Greg Rose         2013-12-21  479  
5e7f59fa07f86f include/linux/avf/virtchnl.h                      Alexander Lobakin 2023-07-28 @480  VIRTCHNL_CHECK_STRUCT_LEN(2, virtchnl_irq_map_info);
5e7f59fa07f86f include/linux/avf/virtchnl.h                      Alexander Lobakin 2023-07-28  481  #define virtchnl_irq_map_info_LEGACY_SIZEOF	14
73556269aab30c include/linux/avf/virtchnl.h                      Sridhar Samudrala 2017-05-11  482  

:::::: The code at line 480 was first introduced by commit
:::::: 5e7f59fa07f86f554c301c7a383bba54d5ef9819 virtchnl: fix fake 1-elem arrays in structures allocated as `nents + 1`

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
