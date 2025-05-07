Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D453A1DED54
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 05:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594599; cv=none; b=TDOp7AOZzRJvJkukV76/70ESEF14tJI/T8Mg5N3+chJFpiOVez8p1gL9RkZ4fylRHY7b/pXdgqfhe1RbWtZOTPkL7rn7ol5ylQqS0UbImY4rhzLxIj7WpU3pe/llR90R5e2YyI5eppQx6V8sRrZqk7DKd3tpqFbSgiBBBpKSDk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594599; c=relaxed/simple;
	bh=f1shF0Ol6FuRg7+lb+POsL2mq47eosItoqhVUbiWWG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbcMyY6p+KnBL9E+K9z+YGs00TIAQdXavLGbBN/0nnC6AInVsC8M1WqTlA1vpGVxPS+fPw+kP00omKUS0zBn4Sk4KfrMt6Kb+ix5ctnNPU+SiGjzIFKY5q4SgqFzaJ9P3UdvpGfbcZ2P2KwOVm4OG44QgYSJW16OlZcmowgV39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqTpwUbH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqTpwUbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746594597; x=1778130597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f1shF0Ol6FuRg7+lb+POsL2mq47eosItoqhVUbiWWG0=;
  b=FqTpwUbHVEWcVMhWfS1RT9Qoyk57Dmh/hKqjEo81GQKzD1hKeSStHf67
   3dULYCKDrEu4ijXHzdU1yeecSlXPDCW4++o/UrZQleXGq7rH4SJ9HCEp+
   EOuNkPxMwW6/tijLGU3SUWFxOzIV8qlRInX7DITJqwRLvHuRgthC9HeDL
   mhRLgqR5qeotEg88H7brNQtkPfqGUjLQz5ENviw4LuYj8mZGoEief3qF6
   Xno9NRV2+mLknQlrsbjXSHdAxzu5Zs+bozHAkuWaJQnkQkGVyCyJPQ2Q1
   yql+UrF+8aMOysiBu28B8VW2D7EutTv+Hb4Ms7gclFGutA+1dMHG2nNKw
   Q==;
X-CSE-ConnectionGUID: lQMTUr9JS++K9ZtJPTVQUA==
X-CSE-MsgGUID: TViLxI/1SZifPBgqji5gKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58930501"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="58930501"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:09:56 -0700
X-CSE-ConnectionGUID: K8JdkooFQviTzAO8uI8Z5w==
X-CSE-MsgGUID: J88HebAcTqaMojvvtnveMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135707422"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 May 2025 22:09:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCX2W-00073s-3A;
	Wed, 07 May 2025 05:09:52 +0000
Date: Wed, 7 May 2025 13:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] i2c: i801: don't instantiate spd5118 under SPD
 Write Disable
Message-ID: <202505071252.vUPz0Kaf-lkp@intel.com>
References: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com>

Hi Yo-Jung,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9d9096722447b77662d4237a09909bde7774f22e]

url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin/i2c-smbus-introduce-Write-Disable-aware-SPD-instantiating-functions/20250430-193343
base:   9d9096722447b77662d4237a09909bde7774f22e
patch link:    https://lore.kernel.org/r/20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7%40canonical.com
patch subject: [PATCH v2 2/2] i2c: i801: don't instantiate spd5118 under SPD Write Disable
config: x86_64-buildonly-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071252.vUPz0Kaf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071252.vUPz0Kaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071252.vUPz0Kaf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-i801.c: In function 'i801_probe_optional_targets':
>> drivers/i2c/busses/i2c-i801.c:1180:54: error: 'struct i801_priv' has no member named 'mux_pdev'
    1180 |         if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
         |                                                      ^~


vim +1180 drivers/i2c/busses/i2c-i801.c

  1159	
  1160	/* Register optional targets */
  1161	static void i801_probe_optional_targets(struct i801_priv *priv)
  1162	{
  1163		/* Only register targets on main SMBus channel */
  1164		if (priv->features & FEATURE_IDF)
  1165			return;
  1166	
  1167		if (apanel_addr) {
  1168			struct i2c_board_info info = {
  1169				.addr = apanel_addr,
  1170				.type = "fujitsu_apanel",
  1171			};
  1172	
  1173			i2c_new_client_device(&priv->adapter, &info);
  1174		}
  1175	
  1176		if (dmi_name_in_vendors("FUJITSU"))
  1177			dmi_walk(dmi_check_onboard_devices, &priv->adapter);
  1178	
  1179		/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
> 1180		if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
  1181			if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
  1182				i2c_register_spd_write_disable(&priv->adapter);
  1183			else
  1184				i2c_register_spd_write_enable(&priv->adapter);
  1185		}
  1186	}
  1187	#else
  1188	static void __init input_apanel_init(void) {}
  1189	static void i801_probe_optional_targets(struct i801_priv *priv) {}
  1190	#endif	/* CONFIG_X86 && CONFIG_DMI */
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
