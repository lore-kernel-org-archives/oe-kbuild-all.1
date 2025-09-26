Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5334BA4B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 00:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758845386; cv=none; b=qJJjG7oO3fISxBGvfZo62b32/vvtK81pzQv2SHx1ERVGTwWfhHL6/+6cJgCGxg7xzJd1jhcTFBQldQRUWLCktGF3gHzMpH2mCp8BfjuMjRBjUKegW80RnzEleJmD0OPaRXUvdkTMrejXA6ijWD42yy8jFbcKEX/bi8a7YBdflyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758845386; c=relaxed/simple;
	bh=rCHV2gEQn70XE/Sefd9OpykTQf7v/OKrHzYHCAgvBrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWVv/65CBRr6IwZs+kwUDsTuhoqmW+/+R5FwVRm/MHcmXcdblwEOrfcfCbXzuIEZA4pSLM9VW9cx92SQwIyWoqGlm8gP18hGsvQOtnbKHJr6Ob1ySNmkfQuM7zct86r0Vf8NboD8vU7MVYQ1ITeGRt/RCBPnGUbNDzBSsslllAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+L05NGy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+L05NGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758845385; x=1790381385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCHV2gEQn70XE/Sefd9OpykTQf7v/OKrHzYHCAgvBrM=;
  b=e+L05NGyjcUErloXJOz0nEPThh+aa8kyP4q7vuM6krY5MGiKmPwYgFtE
   bdXEc0ZuxVoLBbW56/5jQlQSdel8MRya0/GWoE0AvxQtDk4lyFu838IGR
   nrbk1sylaWSQIo0Q7MyPvqS6ebo1Ue/HbWRIElxACwg0QOA+PKo7rrJU1
   6KJB/S5bGLGiQqL0l71z3jTW5OvvBL3FhKAYAA19yZV6CsExXMT1G6rVK
   e+NS7fI+iWt5mtQDK37SlQzrBcZmLpVgX2D5a/mXP+Bc0SZfhMxBs5eJv
   JvDjEy/BH49+Uzy6NA2wY4TenpIdysWhBpIfC0oSE59gSfrni/V42FRjx
   A==;
X-CSE-ConnectionGUID: qIDIKgI6S/67T7rtgROEvQ==
X-CSE-MsgGUID: S4pxJgsfQYapDeXabog6GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78610956"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="78610956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 17:09:44 -0700
X-CSE-ConnectionGUID: /XXu750FRjWG6kXmsGY3fw==
X-CSE-MsgGUID: ThZddzr1QGm/G/5mxTbx7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="177304580"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2025 17:09:41 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1w1p-0005k1-2w;
	Fri, 26 Sep 2025 00:09:37 +0000
Date: Fri, 26 Sep 2025 08:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <202509260727.MrXkGDmN-lkp@intel.com>
References: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-fastrpc-v1-1-4b40f8bfce1d@oss.qualcomm.com>

Hi Jingyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/misc-fastrpc-Add-support-for-new-DSP-IOVA-formatting/20250925-074855
base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
patch link:    https://lore.kernel.org/r/20250924-knp-fastrpc-v1-1-4b40f8bfce1d%40oss.qualcomm.com
patch subject: [PATCH 1/2] misc: fastrpc: Add support for new DSP IOVA formatting
config: x86_64-buildonly-randconfig-005-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260727.MrXkGDmN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260727.MrXkGDmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260727.MrXkGDmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:2296:34: warning: 'qcom_soc_match_table' defined but not used [-Wunused-const-variable=]
    2296 | static const struct of_device_id qcom_soc_match_table[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/qcom_soc_match_table +2296 drivers/misc/fastrpc.c

  2295	
> 2296	static const struct of_device_id qcom_soc_match_table[] = {
  2297		{ .compatible = "qcom,kaanapali", .data = &kaanapali_soc_data },
  2298		{},
  2299	};
  2300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
