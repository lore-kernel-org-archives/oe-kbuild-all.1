Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428EE2BDC03
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755905246; cv=none; b=KFZBLFdNko4UByYVPGgAS4slMNv7GnLVWb8IaSmkGB29atC0FHYffqGagys0PCGKkCdHtyrYvxhlQQhOPhEt9Xr4YW7GrRnXznMkpK4TzSfCk8fjU4+cSlxeDS7xsYHWo5RGm+wQds1crzk3NNOo3SFqj/AcGI76STcRL1jib/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755905246; c=relaxed/simple;
	bh=E72AbR4aaL4AHFEODGC4riXiaUoDPze7E3sjBa+2SIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FkCNhJK4ecbpeQC1Giq3ivjRkVF5QrwguKr++I0UUa31RKYZ8KZ9F42zXGbUr9q8WOUitNb3MnM/rm3Co5nIhTNFYEF/WkaFqLK46oVOAjg+MXDyoBum1XYD27uJ+2/8MaCRTnt8C+oP6U22pv1XrfCUa/T1fFsDe1bzYfFmXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkvc3n2P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkvc3n2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755905245; x=1787441245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E72AbR4aaL4AHFEODGC4riXiaUoDPze7E3sjBa+2SIQ=;
  b=hkvc3n2P2yTOXtb9/seY2aYwzNE6jXJ8A6CCpt/eGupcpb9EJi5zjcp5
   TDGn7rRwiAjCjo7koiSZqsMMALqPzsLruCeYqZWM/xCa8fa/UiiTxYWuI
   XrWsZNIOR2GWnins+JxYjyUPjyo5F9jgAGuHnguTw1PdbhARXeSEHaJkx
   /XrYRgAfaK77Bz+Rl6MVK1LCaz4s397v1Ktuvbf256Jt8GvTZntjwbzeW
   JLpFFFZpU+QucPfRSEYqL68ossWjGvJ0uYMr/gNK5PBrIWP7HxNIvgVpd
   ig1m4taGzkFf7s2PWznKcgkcU7pdksA2VD5MgP7tPzjZDdg6Kgj3QSoqJ
   A==;
X-CSE-ConnectionGUID: oSKYdUyQR3O+TGf4huP6aQ==
X-CSE-MsgGUID: m+CjuVK0TDWqGHNXg43wMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58166618"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58166618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 16:27:24 -0700
X-CSE-ConnectionGUID: Wm4gu3VmSQ+/yLYYhwYwQQ==
X-CSE-MsgGUID: ChmafUIXTaaxlT+oJFRo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169174731"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Aug 2025 16:27:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upbAG-000LvF-1D;
	Fri, 22 Aug 2025 23:27:20 +0000
Date: Sat, 23 Aug 2025 07:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3052/4234]
 sound/soc/qcom/qdsp6/topology.c:317:30: sparse: sparse: restricted __le32
 degrades to integer
Message-ID: <202508230741.heXmHeDC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f4c93f7eb861acab537dbe94441817a270537bf
commit: c7ed4c2debfd192f6071f4ab33c092d419abb941 [3052/4234] ASoC: qcom: audioreach: add support for static calibration
config: csky-randconfig-r121-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230741.heXmHeDC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250823/202508230741.heXmHeDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230741.heXmHeDC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/qcom/qdsp6/topology.c:317:30: sparse: sparse: restricted __le32 degrades to integer

vim +317 sound/soc/qcom/qdsp6/topology.c

   307	
   308	static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
   309			struct snd_soc_tplg_private *private)
   310	{
   311		int sz;
   312	
   313		for (sz = 0; sz < le32_to_cpu(private->size); ) {
   314			struct snd_soc_tplg_vendor_array *mod_array;
   315	
   316			mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
 > 317			if (mod_array->type == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
   318				struct audioreach_module_priv_data *pdata;
   319	
   320				pdata = kzalloc(struct_size(pdata, data, le32_to_cpu(mod_array->size)),
   321					       GFP_KERNEL);
   322				if (!pdata)
   323					return ERR_PTR(-ENOMEM);
   324	
   325				memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
   326							le32_to_cpu(mod_array->size)));
   327				return pdata;
   328			}
   329	
   330			sz = sz + le32_to_cpu(mod_array->size);
   331		}
   332	
   333		return NULL;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
