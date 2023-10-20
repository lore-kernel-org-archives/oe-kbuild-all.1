Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B081CF9B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZThiN3jD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697818418; x=1729354418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eWAftVHC6HQVNtnpPsRWMbqa+BXYoeOA9V5JeSTXPSw=;
  b=ZThiN3jDRAWCiS5AoC5alAKR/ciN+RzCOb6ercnF2hEzQybLKwW4x9jZ
   hopGYvhUwnOodJeHjiFDVPqus0Tp9K2hRWviGx81BeOVr3d0w+nOViKYX
   FgOpXCawRKudBOMSjN+qnUUCwMgvkra6iNo8LsmnxtyZVcd7Pg81uVw84
   +SRRYOtZIpD4Jo3Ic/WXtEDFLEARVWgHZTKI6eQuYBqF2iHCz5Rr+zFIW
   ADnepcWjYWy9CjaqnRQgndF63WF/pVk8dVfHkHvmIHwfpbarQt/q3utJ1
   rraDHXaPTVEiWk81plGsRGQK1jSS6EKbI+d9yr/s38jA0VxuGDhnevQiU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8088544"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="8088544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 09:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5427967"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 09:13:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qts7g-0003k2-0n;
	Fri, 20 Oct 2023 16:13:16 +0000
Date: Sat, 21 Oct 2023 00:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ai Chao <aichao@kylinos.cn>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, Ai Chao <aichao@kylinos.cn>
Subject: Re: [PATCH v2] platform/x86: support to store/show powermode value
 for Inspur
Message-ID: <202310202354.NjaAKTX2-lkp@intel.com>
References: <20231014032844.3823198-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231014032844.3823198-1-aichao@kylinos.cn>

Hi Ai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ai-Chao/platform-x86-support-to-store-show-powermode-value-for-Inspur/20231017-125537
base:   linus/master
patch link:    https://lore.kernel.org/r/20231014032844.3823198-1-aichao%40kylinos.cn
patch subject: [PATCH v2] platform/x86: support to store/show powermode value for Inspur
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310202354.NjaAKTX2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202354.NjaAKTX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202354.NjaAKTX2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/inspur-wmi.c:70: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Set Power Mode to EC RAM. If Power Mode value greater than 0x3,
   drivers/platform/x86/inspur-wmi.c:111: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Get Power Mode from EC RAM, If Power Mode value greater than 0x3,


vim +70 drivers/platform/x86/inspur-wmi.c

    68	
    69	/**
  > 70	 * Set Power Mode to EC RAM. If Power Mode value greater than 0x3,
    71	 * return error
    72	 * Method ID: 0x3
    73	 * Arg: 4 Bytes
    74	 * Byte [0]: Power Mode:
    75	 *         0x0: Balance Mode
    76	 *         0x1: Performance Mode
    77	 *         0x2: Power Saver Mode
    78	 * Return Value: 4 Bytes
    79	 * Byte [0]: Return Code
    80	 *         0x0: No Error
    81	 *         0x1: Error
    82	 */
    83	static ssize_t powermode_store(struct device *dev,
    84				       struct device_attribute *attr,
    85				       const char *buf, size_t count)
    86	{
    87		struct inspur_wmi_priv *priv = dev_get_drvdata(dev);
    88		int ret;
    89		u32 mode;
    90		u8 *ret_code;
    91	
    92		ret = kstrtoint(buf, 0, &mode);
    93		if (ret)
    94			return ret;
    95	
    96		ret = inspur_wmi_perform_query(priv->wdev,
    97					       INSPUR_WMI_SET_POWERMODE,
    98					       &mode, sizeof(mode), sizeof(mode));
    99	
   100		if (ret < 0)
   101			return ret;
   102	
   103		ret_code = (u8 *)(&mode);
   104		if (ret_code[0])
   105			return -EBADRQC;
   106	
   107		return count;
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
