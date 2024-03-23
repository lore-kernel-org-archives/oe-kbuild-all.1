Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985B255C0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711214112; cv=none; b=ZxYE6G9qPH9KeTELoKJMQ8CqfNlbUkbs8d4l4BA78/BQhCVnuQkRz/GMNwd/UEmjuXJvxKJW6mq+Mxw2f6/mEemN/aKT9cghYHGWlSxJiYkLHfRIslPRmNKR8T+GZbUGGi34Q5Y08oISWHJ0GnaEJkiHxl/x/OE3u361JUdjslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711214112; c=relaxed/simple;
	bh=UeNyzUP0dCLHnFbihRMpGXxV2WmK3tBFKmfNOljwhms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulaiTBcAudf3RieokA3mgsLpQgc6Ewjmg3qgYCqLQ9WV+Z3oekoyJmItnjfBBoFBbmnJlfDfFs4d9IHmNa2zLlrN9FamuqMZv2uCHtZ96JNE3s986jRimNqRw27XvMxoJw0IsYLLQOT1WPDa+Ly6PXuyAl9IEPCRs74lF01/JJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2l3Dlym; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2l3Dlym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711214111; x=1742750111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UeNyzUP0dCLHnFbihRMpGXxV2WmK3tBFKmfNOljwhms=;
  b=m2l3Dlym8UySUiK+Id2DyeSlP9Pg5ng8zGB8+S9s3bDdT2Vv3uoOzB5Q
   F6v+cVTT4uW6sYPnZ6OGf8sQ4w0l64T1MUZG+4ljHrlc2g8Ngdrsdxpew
   fdWG7t93//Wc78gY00K3tAzfnkd3moMHSYZLNrWfZTqDAcObeNtQLFwM2
   wK0ybDP6y0wCan+In/uR+ZZYhjWEET72Escxi2X9cr4Lm4Mu7BlIxmJRa
   xcY26DNvsauEe1HaNz2LRlHC+SFPa09hIfXDTRvu/R6M1gxOwYTY0+QI3
   S9T1S4x4AhfrSj5qT8QXdlhOaM1NCdClguecOOz4+ZCPEUrG/uJFP4zrQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="10042900"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="10042900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 10:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="15209332"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Mar 2024 10:15:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro4xV-000LLf-0P;
	Sat, 23 Mar 2024 17:15:05 +0000
Date: Sun, 24 Mar 2024 01:14:08 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [drm-tip:drm-tip 4/11]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: error: '.bin' directive
 output may be truncated writing 4 bytes into a region of size between 2 and
 31
Message-ID: <202403240115.1lAo588s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   657dd8fcd2f1d1205c6f98fdb8b60915228991d1
commit: 0885186926a13c697d78f5af03f32445414b6ad5 [4/11] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240324/202403240115.1lAo588s-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240115.1lAo588s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240115.1lAo588s-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:66: error: 'snprintf' output may be truncated before the last format character [-Werror=format-truncation=]
     102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:17: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
     102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: error: '.bin' directive output may be truncated writing 4 bytes into a region of size between 2 and 31 [-Werror=format-truncation=]
     105 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
         |                                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:25: note: 'snprintf' output between 14 and 43 bytes into a destination of size 40
     105 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +105 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c

95d0906f850655 Leo Liu            2016-12-21   93  
69939009bde70c Mario Limonciello  2022-12-28   94  int amdgpu_vcn_early_init(struct amdgpu_device *adev)
69939009bde70c Mario Limonciello  2022-12-28   95  {
69939009bde70c Mario Limonciello  2022-12-28   96  	char ucode_prefix[30];
69939009bde70c Mario Limonciello  2022-12-28   97  	char fw_name[40];
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06   98  	int r, i;
69939009bde70c Mario Limonciello  2022-12-28   99  
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  100  	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
69939009bde70c Mario Limonciello  2022-12-28  101  		amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
69939009bde70c Mario Limonciello  2022-12-28 @102  		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  103  		if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==  IP_VERSION(4, 0, 6) &&
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  104  			i == 1) {
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06 @105  			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  106  		}
69939009bde70c Mario Limonciello  2022-12-28  107  
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  108  		r = amdgpu_ucode_request(adev, &adev->vcn.fw[i], fw_name);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  109  		if (r) {
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  110  			amdgpu_ucode_release(&adev->vcn.fw[i]);
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  111  			return r;
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  112  		}
6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  113  	}
69939009bde70c Mario Limonciello  2022-12-28  114  	return r;
69939009bde70c Mario Limonciello  2022-12-28  115  }
69939009bde70c Mario Limonciello  2022-12-28  116  

:::::: The code at line 105 was first introduced by commit
:::::: 6a7cbbc267c0cafa2b027983a40276deb673c066 drm/amdgpu/vcn: enable vcn1 fw load for VCN 4_0_6

:::::: TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
