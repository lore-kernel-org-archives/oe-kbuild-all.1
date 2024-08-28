Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8D19755B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724860705; cv=none; b=XrxV4MgzDoJUqjrvFvdzfK9pSVAUInOKjaNCDnAaqEaKvdZal2scrXf0H13MXxiSEFIaI+XN3ZCune2iG8YmEurgECgw1bAgxBJ4ySMm1u8SSYYKQNK7sZM8u0QD/DAM5rQUoqN0jaSY+RbWNiEoV1+rxIW1HGj99bTLjFunZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724860705; c=relaxed/simple;
	bh=TxlAO4Kxx7QCieHYqGaCcAgQiYcEQNTZ17o0Al3wEr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IO1QW6nJ3iq1ci3nkra+lLNzoUrpmf+cFp12nvSCpQ0n9lOf3IX9FbrXZ9rUyFYbwOYWFb6Wf98CEhT5bq55o6/+vKI6H82HUU2psJgjAqAlWIbuE/Oh5RaWs1y5q4EmJnm10bJMLJr+VCqpiYC06/cVvOgsMXs1n7nA+XiSxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnLFjGbq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnLFjGbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724860704; x=1756396704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TxlAO4Kxx7QCieHYqGaCcAgQiYcEQNTZ17o0Al3wEr8=;
  b=lnLFjGbqp+t07yylMrGP12o32SAfv2v7HRSBiGmKswdFZLAweX80Xbr1
   AiajWct4RExcJDvmvwAPDwUkEKQtvMpd4w5XWJKtL5/zuiiqgW1nJ/BtF
   +2SW4mAFDyKR1kBdF+nMCrnrfZ2iACZ9fHf8N1j9dnvSjRODpDNPt9lwB
   CPZB0vLYfBYma/MghYDMqlK5uyBJ2p4+hhgvtMYTbWQQa54pTNVzjhQwv
   enwux883l7NPE7iZ7u+mY53b55xt/kMdoF/dxvTHcYaHwHs4FivTJGA3e
   6KKp/Amwku5RPxbX+/5eViaj2OqpoRDynaF+xdNHv+zfo1gt+4AGwEqfm
   Q==;
X-CSE-ConnectionGUID: 6la/yBHUQIOwXLbBgl23/A==
X-CSE-MsgGUID: gxPwB/fOT9KYjZMs2W2/5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33970603"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="33970603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 08:58:20 -0700
X-CSE-ConnectionGUID: hz3lr2YDTA+9x9EzujyqEQ==
X-CSE-MsgGUID: bzNCvkCUSae8nBIy4tGTvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63323786"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2024 08:58:19 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjL3o-000L7C-2c;
	Wed, 28 Aug 2024 15:58:16 +0000
Date: Wed, 28 Aug 2024 23:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [sudeep-holla:for-next/scmi/updates 26/31]
 include/linux/firmware/imx/sm.h:25:17: error: 'EOPNOTSUPP' undeclared
Message-ID: <202408282338.qrb84lm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/scmi/updates
head:   65cfee129206cf5b1bfb9ebe2fdfee89608bc4bf
commit: a13ee2a0faab458f730cc0c7918f111b8707bb4f [26/31] firmware: imx: add i.MX95 MISC driver
config: openrisc-randconfig-r063-20240828 (https://download.01.org/0day-ci/archive/20240828/202408282338.qrb84lm7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408282338.qrb84lm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408282338.qrb84lm7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/sm-misc.c:6:
   include/linux/firmware/imx/sm.h: In function 'scmi_imx_misc_ctrl_get':
>> include/linux/firmware/imx/sm.h:25:17: error: 'EOPNOTSUPP' undeclared (first use in this function)
      25 |         return -EOPNOTSUPP;
         |                 ^~~~~~~~~~
   include/linux/firmware/imx/sm.h:25:17: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/firmware/imx/sm.h: At top level:
>> include/linux/firmware/imx/sm.h:29:1: error: expected identifier or '(' before '{' token
      29 | {
         | ^
>> drivers/firmware/imx/sm-misc.c:26:5: error: redefinition of 'scmi_imx_misc_ctrl_get'
      26 | int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/firmware/imx/sm.h:23:19: note: previous definition of 'scmi_imx_misc_ctrl_get' with type 'int(u32,  u32 *, u32 *)' {aka 'int(unsigned int,  unsigned int *, unsigned int *)'}
      23 | static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/EOPNOTSUPP +25 include/linux/firmware/imx/sm.h

    18	
    19	#if IS_ENABLED(CONFIG_IMX_SCMI_MISC_EXT)
    20	int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
    21	int scmi_imx_misc_ctrl_set(u32 id, u32 val);
    22	#else
    23	static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
    24	{
  > 25		return -EOPNOTSUPP;
    26	}
    27	
    28	static inline int scmi_imx_misc_ctrl_set(u32 id, u32 val);
  > 29	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
