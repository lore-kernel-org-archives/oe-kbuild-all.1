Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD037268E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773962576; cv=none; b=nEFSVSZCfteTB4dUqCpw0gQODClJqQ5uJPeNdxJU8LFomDXc85tNRQ3ahQHJAbcK54602jMgP2ZZz5qW62rSAo8q0qREJISjpQl7iHztw5pJZ1DdKdHxhN2LDXJqGxJ2X2BE55AN/S5g4Uopu9cbF87HMAH710JmRzGODfjbz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773962576; c=relaxed/simple;
	bh=cgEsmrkch5Vk+2KCy1nIEPeZzkUYgKD9Cfu7WH7pHAw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pDHh8ofzmVX5h2F6xDUnsDkQdrhGG0w89wdC+1ufuumH6Z3OmqUVF59PEQ2E4br9E5vSicKee87uF1Yk2iui8YYKmuhuMFw128Q694IiicWoivQkOrA7X4zTPdQws916KYsP8IKzrbJZR9IQxHAo8k9X8NIUf5e7DTZQqXdPamY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b543bnyn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b543bnyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773962575; x=1805498575;
  h=date:from:to:cc:subject:message-id;
  bh=cgEsmrkch5Vk+2KCy1nIEPeZzkUYgKD9Cfu7WH7pHAw=;
  b=b543bnynhj/KMSrhh+9bdcHH1iwGXEUw5fxN6p6+2QSVJolEORfD2J9/
   QLaHq/gWp9QUbMhOl/UCzoq9Tm0D7my9oGCgRBdnbnnXlXAmttg5FaAX/
   Z/rh1n+2wNq11UCcX1pbLiJadxe1I3Xr5DTkpdQqEEfbda5QCY5GHSZvp
   81wYeLHh/q/SgovlqFB8qAvH1k3r8raSYE64ntZKtO4C9jQ0QVasJ96M5
   N8ABWbPbLLcSvIu3JMJrQgJxSH6nDxO4YKJGADiSJum28SBRwTZJtqsRt
   92xEUVrtkgXFGcBBis6DVW0BSZO/ICADR1kgefYaapQWjJIM/L5Sl/1Ao
   Q==;
X-CSE-ConnectionGUID: E37Get2CTbiBcerkIQcvwA==
X-CSE-MsgGUID: 6lHF98dWTKaveqmpkSLJMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92431907"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="92431907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 16:22:52 -0700
X-CSE-ConnectionGUID: ip7XE2fzQ62uuGbXVVjaqg==
X-CSE-MsgGUID: UGzryxtOT5maOvPB4yDFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222336030"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Mar 2026 16:22:50 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3MhT-000000001lL-2PVz;
	Thu, 19 Mar 2026 23:22:47 +0000
Date: Fri, 20 Mar 2026 07:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Likun Gao <Likun.Gao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 4594/7683]
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:534:3: error: a label can only
 be part of a statement and a declaration is not a statement
Message-ID: <202603200708.YuiOPK9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b5d083a3ed1e2798396d5e491432e887da8d4a06
commit: 47ab777c16c71ba033325593cd833bded65f5943 [4594/7683] drm/amdgpu/discovery: use common function to check discovery table
config: csky-randconfig-r063-20260320 (https://download.01.org/0day-ci/archive/20260320/202603200708.YuiOPK9z-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200708.YuiOPK9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200708.YuiOPK9z-lkp@intel.com/

Note: the linux-next/master HEAD b5d083a3ed1e2798396d5e491432e887da8d4a06 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c: In function 'amdgpu_discovery_table_check':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:534:3: error: a label can only be part of a statement and a declaration is not a statement
     534 |   struct ip_discovery_header *ihdr =
         |   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:542:3: error: a label can only be part of a statement and a declaration is not a statement
     542 |   struct gpu_info_header *ghdr =
         |   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:550:3: error: a label can only be part of a statement and a declaration is not a statement
     550 |   struct harvest_info_header *hhdr =
         |   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:558:3: error: a label can only be part of a statement and a declaration is not a statement
     558 |   struct vcn_info_header *vhdr =
         |   ^~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:566:3: error: a label can only be part of a statement and a declaration is not a statement
     566 |   struct mall_info_header *mhdr =
         |   ^~~~~~


vim +534 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

   515	
   516	static int amdgpu_discovery_table_check(struct amdgpu_device *adev,
   517						uint8_t *discovery_bin,
   518						uint16_t table_id)
   519	{
   520		int r, act_val, exp_val, table_size;
   521		uint16_t offset, checksum;
   522		struct table_info *info;
   523		bool check_table = true;
   524		char *table_name;
   525	
   526		r = amdgpu_discovery_get_table_info(adev, &info, table_id);
   527		if (r)
   528			return r;
   529		offset = le16_to_cpu(info->offset);
   530		checksum = le16_to_cpu(info->checksum);
   531	
   532		switch (table_id) {
   533		case IP_DISCOVERY:
 > 534			struct ip_discovery_header *ihdr =
   535				(struct ip_discovery_header *)(discovery_bin + offset);
   536			act_val = le32_to_cpu(ihdr->signature);
   537			exp_val = DISCOVERY_TABLE_SIGNATURE;
   538			table_size = le16_to_cpu(ihdr->size);
   539			table_name = "data table";
   540			break;
   541		case GC:
   542			struct gpu_info_header *ghdr =
   543				(struct gpu_info_header *)(discovery_bin + offset);
   544			act_val = le32_to_cpu(ghdr->table_id);
   545			exp_val = GC_TABLE_ID;
   546			table_size = le16_to_cpu(ghdr->size);
   547			table_name = "gc table";
   548			break;
   549		case HARVEST_INFO:
   550			struct harvest_info_header *hhdr =
   551				(struct harvest_info_header *)(discovery_bin + offset);
   552			act_val = le32_to_cpu(hhdr->signature);
   553			exp_val = HARVEST_TABLE_SIGNATURE;
   554			table_size = sizeof(struct harvest_table);
   555			table_name = "harvest table";
   556			break;
   557		case VCN_INFO:
   558			struct vcn_info_header *vhdr =
   559				(struct vcn_info_header *)(discovery_bin + offset);
   560			act_val = le32_to_cpu(vhdr->table_id);
   561			exp_val = VCN_INFO_TABLE_ID;
   562			table_size = le32_to_cpu(vhdr->size_bytes);
   563			table_name = "vcn table";
   564			break;
   565		case MALL_INFO:
   566			struct mall_info_header *mhdr =
   567				(struct mall_info_header *)(discovery_bin + offset);
   568			act_val = le32_to_cpu(mhdr->table_id);
   569			exp_val = MALL_INFO_TABLE_ID;
   570			table_size = le32_to_cpu(mhdr->size_bytes);
   571			table_name = "mall table";
   572			check_table = false;
   573			break;
   574		default:
   575			dev_err(adev->dev, "invalid ip discovery table id %d specified\n", table_id);
   576			check_table = false;
   577			break;
   578		}
   579	
   580		if (check_table && offset) {
   581			if (act_val != exp_val) {
   582				dev_err(adev->dev, "invalid ip discovery %s signature\n", table_name);
   583				return -EINVAL;
   584			}
   585	
   586			if (!amdgpu_discovery_verify_checksum(adev, discovery_bin + offset,
   587							      table_size, checksum)) {
   588				dev_err(adev->dev, "invalid ip discovery %s checksum\n", table_name);
   589				return -EINVAL;
   590			}
   591		}
   592	
   593		return 0;
   594	}
   595	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
