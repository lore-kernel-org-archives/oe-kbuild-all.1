Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974508BF1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675806278; x=1707342278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qP2GEbxGvtB8CKuaq99a6CG5C1f3hl6MJs6qTbkS3iQ=;
  b=Gj0P1mrVRgW8HnrJb7xfkDRTE3Ag9oddiEmwAJ4rvFeJ1aCVaO/er6gK
   A9jClBfM6UFaepiAaMNKVeMjMTmZ/mH82QRu7ILrajbqlvFkLsnDU6IVD
   ArtcVYdfhK2b5S2HkvfgSg8IGXbeTg9EJuQeEFP8bOBygi856VGN6OqdO
   aDz8Y3djTc66lWELCYLEaH6Fs08BcXy/X89ZJvkIn7Grfi9/gjUmCzdBA
   oHCfm1T6mP8xCIUk3DstDffSmuYex1+map7pBocJ997fB2OWy9vs4QTDi
   nxLoCcWx5+f+aS6/GsgFt6s61jCB6IeeBsJY3ttUOUyy4cclivttbbnFN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="328284523"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="328284523"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 13:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775733467"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="775733467"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 13:44:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPVlT-0003uq-3C;
	Tue, 07 Feb 2023 21:44:35 +0000
Date: Wed, 8 Feb 2023 05:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest 62/136] arch/x86/kernel/tdx.c:225:5: sparse:
 sparse: symbol 'tdx_hcall_set_notify_intr' was not declared. Should it be
 static?
Message-ID: <202302080505.wEZS8cAn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: 2c0498d3a27b537d428cc081fe9578605111569e [62/136] x86/tdx: Add SetupEventNotifyInterrupt TDX hypercall support
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230208/202302080505.wEZS8cAn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/2c0498d3a27b537d428cc081fe9578605111569e
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 2c0498d3a27b537d428cc081fe9578605111569e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/tdx.c:225:5: sparse: sparse: symbol 'tdx_hcall_set_notify_intr' was not declared. Should it be static?

vim +/tdx_hcall_set_notify_intr +225 arch/x86/kernel/tdx.c

   217	
   218	/*
   219	 * tdx_hcall_set_notify_intr() - Setup Event Notify Interrupt Vector.
   220	 *
   221	 * @vector        : Vector address to be used for notification.
   222	 *
   223	 * return 0 on success or failure error number.
   224	 */
 > 225	int tdx_hcall_set_notify_intr(u8 vector)
   226	{
   227		u64 ret;
   228	
   229		/* Minimum vector value allowed is 32 */
   230		if (vector < 32)
   231			return -EINVAL;
   232	
   233		/*
   234		 * Register callback vector address with VMM. More details
   235		 * about the ABI can be found in TDX Guest-Host-Communication
   236		 * Interface (GHCI), sec 3.5.
   237		 */
   238		ret = _trace_tdx_hypercall(TDVMCALL_SETUP_NOTIFY_INTR, vector, 0, 0, 0,
   239					   NULL);
   240	
   241		if (ret == TDVMCALL_SUCCESS)
   242			return 0;
   243		else if (ret == TDCALL_INVALID_OPERAND)
   244			return -EINVAL;
   245	
   246		return -EIO;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
