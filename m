Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D551A38CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710471298; cv=none; b=tVreDNgnygUNNCTeV25cNZSpij+PWDJuLmibPUXH+6gl6uFsrHI2j6pbTQMSaQTwh8Dt0EnCl1vS/iAr46VihANrJgGO+qIhy/jZarWePFGir0lWerfBVrOnP3E3SlLsy/ZE6K5T9syOaHFzaOZZTj+XFlwVXHZlP5jI+FxylVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710471298; c=relaxed/simple;
	bh=iY8Ow9Ulj0FQ/XqtgwUm8MNlnUGycPT/3+Ar0njThco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRS+q8+NUEh/IyqOFYsGIewBQGyyzH17qtlUbQxt16uWACqn2fMFQ4n5pb1teWV7TgLDhyO9mUwZCV+VKw+mDiig8v+PD96UoIDEVRzPP9LFrr5GN2pA0gEnn2zMUvOvvmbFKsK9dOEWchdEJrqDO/NHGyO8jmusaOfGp2NBINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKvGb3cW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKvGb3cW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710471296; x=1742007296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iY8Ow9Ulj0FQ/XqtgwUm8MNlnUGycPT/3+Ar0njThco=;
  b=UKvGb3cWimEom/prcmacUfbkyaf+hGdioY7qrNCg/dX3EcdzBDrCt3BF
   pPUtoQBRD5pmIVBO0Nifgmz+84ioJ81rWmT6Ofq6rZCpOT3h86bQCjbfX
   UelXAgJpQccn1ei8O2WmvBYs4TclqZrLX0ZXBin9B0/Kq2cRNdg426a1V
   x7QeeBH75zHrR+9YfQnIKqNrWJf7ryscOpaz3Hmoi7zX3ORDiVdGVUVfE
   bSNAqo39afHF7mSQIsSAsnwor0LUbZKGLtwm524ft17HFMBTKZXSSF1qN
   s8vhxhh6W+p1HHEBkto4bQ6wqlx4GTTwb4FRp6GC//AfqAUdWrI5R5c+o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5926558"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5926558"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 19:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12967862"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Mar 2024 19:54:54 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkxid-000E1N-0o;
	Fri, 15 Mar 2024 02:54:51 +0000
Date: Fri, 15 Mar 2024 10:54:35 +0800
From: kernel test robot <lkp@intel.com>
To: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Veerabadhran Gopalakrishnan <Veerabadhran.Gopalakrishnan@amd.com>,
	Leo Liu <leo.liu@amd.com>
Subject: [linux-next:master 13404/13571]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: warning: '.bin' directive
 output may be truncated writing 4 bytes into a region of size between 2 and
 31
Message-ID: <202403151008.QYEoXojA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9bb9b28d0568991b1d63e66fe75afa5f97ad1156
commit: b041fcaa26186dcfc121bcb9db285d6c73fd74e3 [13404/13571] drm/amdgpu/vcn: enable vcn1 fw load for VCN 4_0_6
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240315/202403151008.QYEoXojA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151008.QYEoXojA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151008.QYEoXojA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early_init':
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:66: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                                                                  ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:17: note: 'snprintf' output between 12 and 41 bytes into a destination of size 40
     102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: warning: '.bin' directive output may be truncated writing 4 bytes into a region of size between 2 and 31 [-Wformat-truncation=]
     105 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
         |                                                                         ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:25: note: 'snprintf' output between 14 and 43 bytes into a destination of size 40
     105 |                         snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +105 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c

    93	
    94	int amdgpu_vcn_early_init(struct amdgpu_device *adev)
    95	{
    96		char ucode_prefix[30];
    97		char fw_name[40];
    98		int r, i;
    99	
   100		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
   101			amdgpu_ucode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
   102			snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
   103			if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==  IP_VERSION(4, 0, 6) &&
   104				i == 1) {
 > 105				snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
   106			}
   107	
   108			r = amdgpu_ucode_request(adev, &adev->vcn.fw[i], fw_name);
   109			if (r) {
   110				amdgpu_ucode_release(&adev->vcn.fw[i]);
   111				return r;
   112			}
   113		}
   114		return r;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
