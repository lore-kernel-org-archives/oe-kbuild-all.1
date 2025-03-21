Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16BE78F51
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 15:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572545; cv=none; b=Poa6+Ned6EuYPMN9cRblWkr8U89RtjS3Wz/vij45PuXcv4xiksRBNpBz5Rmu7+OeM+bnIuvzsOxMpioLSygTLOsJcwvQ5MX+JyslYfSVDDSF9iKekLsXclkiQfafnGefwHemTleO1i2Wxfau8hy3JinbZcaFKZIPPh6v2Smrr2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572545; c=relaxed/simple;
	bh=IcrukAlRHyoGRVNIrrGhW4F5Rh8/PjiDwyDtM13WFKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lulEj0qDL2XNRcd8POWqgr+gINSln+65TWUENp+4k6exXYGXkJkJLGrBriQp8iQbqiqOHhd+Icancsk0pF6rveGBab0HaiSbUNkccoB5ji1+kvCUCpfc0Md/J1eSiEFaijL91LPIEpos7C71wXAZwCljvLVwTOV68JOpfN+iJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBvPRE46; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBvPRE46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742572544; x=1774108544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IcrukAlRHyoGRVNIrrGhW4F5Rh8/PjiDwyDtM13WFKc=;
  b=YBvPRE46daKkTgoVe+DJaGsbTp14Li5EuJhh4gZgfcKNtUc4clWc6jze
   nfY9fwxj4TFWnu9jOsqZlmFxGcpfPPdcCvjUnWmRN1achGRp6CFJKOG8j
   YbLnE6qK18xlGzLLCR9Mgzinv0l/NZydTvnoPfxQ0Xox9vGn3FSoIOEH/
   nO7s/Wc8Cggt96OrYKBI4QSrFYOOsoNx0Ou9n5JVz1baA1ndmQEKfXfg/
   7SQvFgHMho9wgizfz8+pt2GgI7enV8ImxBzh1GkRnF4niOJGq1PDqD3TJ
   VabIRBXYDHV311AQqwlRdIylDzJW9S2gTVRvmk9unpknHsmZ5zKoPziBR
   w==;
X-CSE-ConnectionGUID: i6mLSQ3lRkeBGKKxpCZK7g==
X-CSE-MsgGUID: kKKOvTwtQgGQgDj0u2I50Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="44032978"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="44032978"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 08:55:43 -0700
X-CSE-ConnectionGUID: RYJswtZFRHu/m6axkT9Ggw==
X-CSE-MsgGUID: B4eKmWx/QLKvylsF0VXeCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="128549432"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2025 08:55:42 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tveiL-0001Rt-2j;
	Fri, 21 Mar 2025 15:55:37 +0000
Date: Fri, 21 Mar 2025 23:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 5979/13068]
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c:859:2-3: Unneeded semicolon
Message-ID: <202503212354.Hx2qaDRe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 6e9be3abb78c2f6c97a51070004a5165702f0ed9 [5979/13068] pinctrl: Add driver support for Amlogic SoCs
config: arm64-randconfig-r051-20250321 (https://download.01.org/0day-ci/archive/20250321/202503212354.Hx2qaDRe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503212354.Hx2qaDRe-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:859:2-3: Unneeded semicolon

vim +859 drivers/pinctrl/meson/pinctrl-amlogic-a4.c

   842	
   843	static void init_bank_register_bit(struct aml_pinctrl *info,
   844					   struct aml_gpio_bank *bank)
   845	{
   846		const struct aml_pctl_data *data = info->data;
   847		const struct aml_reg_bit *aml_rb;
   848		bool def_offs = true;
   849		int i;
   850	
   851		if (data) {
   852			for (i = 0; i < data->number; i++) {
   853				aml_rb = &data->rb_offs[i];
   854				if (bank->bank_id == aml_rb->bank_id) {
   855					def_offs = false;
   856					break;
   857				}
   858			}
 > 859		};
   860	
   861		if (def_offs) {
   862			for (i = 0; i < AML_NUM_REG; i++) {
   863				bank->pc.reg_offset[i] = aml_def_regoffs[i];
   864				bank->pc.bit_offset[i] = 0;
   865			}
   866		} else {
   867			for (i = 0; i < AML_NUM_REG; i++) {
   868				bank->pc.reg_offset[i] = aml_rb->reg_offs[i];
   869				bank->pc.bit_offset[i] = aml_rb->bit_offs[i];
   870			}
   871		}
   872	}
   873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
