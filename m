Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057835681
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678903863; x=1710439863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2GP0qvqEWLomWX8e4zMLs2ORjIiSISETKjDS6LDeyvA=;
  b=cCyd+LD4bFDOjbbW5dsnGTP99GVpDVf5ZdeyqJKph3fdhVsF42VjPhWW
   xyFfEK9Rty+HQYqtgDlf1hrKjCWFMSOOQVR7c+3bdX+XysaTh7u2MUTAl
   iDfc5CuqF2eEwJ/h7kDOiVdR6azL/0Bdi6xW0mHK5p3n0PCoyu4+wwGnE
   uqftK854tWieJMW4kIyrjuRwyNRDexT8Sc73kmozZMpUUiMDIBC2GZrqs
   Bn/zOijVMnGO5H+YnR2QsdsO+e92y8r4Y4Wn+KXhrliaPOc0OAeivhiQp
   ER7fB58VZUvEciQeQOQFYucI+QqbVRUZi5kQk5qNdy/Uwc9KFQkmmj7n7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="318183167"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="318183167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 11:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743824573"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="743824573"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 11:11:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcVaW-0007w7-2r;
	Wed, 15 Mar 2023 18:11:00 +0000
Date: Thu, 16 Mar 2023 02:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 virtio 7/7] pds_vdpa: pds_vdps.rst and Kconfig
Message-ID: <202303160136.S3u5ryaW-lkp@intel.com>
References: <20230309013046.23523-8-shannon.nelson@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309013046.23523-8-shannon.nelson@amd.com>

Hi Shannon,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shannon-Nelson/pds_vdpa-Add-new-vDPA-driver-for-AMD-Pensando-DSC/20230309-093236
patch link:    https://lore.kernel.org/r/20230309013046.23523-8-shannon.nelson%40amd.com
patch subject: [PATCH RFC v2 virtio 7/7] pds_vdpa: pds_vdps.rst and Kconfig
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/62e66fe7b18c78aab45a3aad6ef9925a932f75c9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shannon-Nelson/pds_vdpa-Add-new-vDPA-driver-for-AMD-Pensando-DSC/20230309-093236
        git checkout 62e66fe7b18c78aab45a3aad6ef9925a932f75c9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160136.S3u5ryaW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/networking/device_drivers/ethernet/pensando/pds_vdpa.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
