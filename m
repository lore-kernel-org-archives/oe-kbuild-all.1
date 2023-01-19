Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F503D6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 21:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674162565; x=1705698565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FPV+sXUT6RwMIun09rFdCTGoTBlBDkJSiO7/m9iiaW0=;
  b=GN4ATipuRwUp58KGhYw7cxVopxxGNs0x5gSTWl7EUetSgsBLqdnXR2/j
   SU1WMjr6I2iGUNSlw553Cmh+IkG6/oNPP9rWwK/WqUeJYphKEILM8GTQP
   RGeTBhjiFsNxGDbQiWQscGB5C6SMhsuI55VJG8qvZsUKAD569INFHy6Zh
   to0zpEJaXTHbibal17ial/e67toRojAbpUzo3XZWaQNlZzXjki6ubSUZz
   5XwKDMFBeA5cSnDiCcTsnzX4rKFV2TA8+jLlgC01t8wYyQfnW7pJ9UOx+
   Z7KxRT4d+ULB+Rz1PT1MBcVymAGem9jE3zaTk4bebWTHCTjdUxKcGae0v
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305792355"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="305792355"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 13:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="728846417"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; 
   d="scan'208";a="728846417"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 13:09:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIc9z-0001rK-14;
	Thu, 19 Jan 2023 21:09:23 +0000
Date: Fri, 20 Jan 2023 05:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	linux-doc@vger.kernel.org
Subject: [agd5f:drm-next 251/262] htmldocs:
 Documentation/gpu/amdgpu/driver-misc.rst:38: WARNING: "csv-table" widths do
 not match the number of columns in table (7).
Message-ID: <202301200440.NYkEqozZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   52c5cea1ba6bf42e8f34ac045d5e8fa57dcb38d4
commit: 15c4ed80669b2457f8e856cd7b654dd3e7680b27 [251/262] Documentation/gpu: Add MP0 version to apu-asic-info-table
reproduce:
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 15c4ed80669b2457f8e856cd7b654dd3e7680b27
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/gpu/amdgpu/driver-misc.rst:38: WARNING: "csv-table" widths do not match the number of columns in table (7).

vim +38 Documentation/gpu/amdgpu/driver-misc.rst

9d9b217d52b41f Rodrigo Siqueira 2022-08-11  37  
9d9b217d52b41f Rodrigo Siqueira 2022-08-11 @38  .. csv-table::
9d9b217d52b41f Rodrigo Siqueira 2022-08-11  39     :header-rows: 1
9d9b217d52b41f Rodrigo Siqueira 2022-08-11  40     :widths: 3, 2, 2, 1, 1, 1
9d9b217d52b41f Rodrigo Siqueira 2022-08-11  41     :file: ./apu-asic-info-table.csv
9d9b217d52b41f Rodrigo Siqueira 2022-08-11  42  

:::::: The code at line 38 was first introduced by commit
:::::: 9d9b217d52b41f6d99279211b83c26b2484a142b Documentation/gpu: Add info table for ASICs

:::::: TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
