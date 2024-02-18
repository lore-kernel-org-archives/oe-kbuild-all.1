Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9147492
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 12:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708259201; cv=none; b=JvhVMKrNonHmSpcNXZ2oiTbGilfuptQELhBNdNWxqUfXmqONBqis0igD09NzRiJ74v2P5Qjb07CYkOKqZcj1I1VxMycphw1zgYd0idCU4kqW/LXJR5Df/rHl2zNYwA55kKiUYyER3J9/Bz3TpwXg/cp5WwlKUgr3lA72OQ2Bo5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708259201; c=relaxed/simple;
	bh=v/x6ljZPrn2ivH36mcDPSzW+/LZmFjxV9m8vCbAmxkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMMZQ2Tp9OQvyzPUFPFtznZeDsTtUX1o2c/9L2WRF6ySv2FgJdLesnM+69GlWOFcoUITIUNufTBUWZSoj0Jv4Uq7+g44itTGkk7TyVqQJx9HqtYAe8+LzJopu5mwMkCA0mbLO0Fc8QunpVbfhOslrOjoWOXtSjda1XucQeczNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtC/CAAB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtC/CAAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708259200; x=1739795200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v/x6ljZPrn2ivH36mcDPSzW+/LZmFjxV9m8vCbAmxkY=;
  b=ZtC/CAAB1BV2Q3FKcEMWipPCE92VTSQbee/TjamB5XFryRvPbU9lbGCH
   svpTzbML+tw7VeruJZLFklX8SFWy7gYKo3/QC51Yxnj5jpQVOLK5YcilN
   wJx0hEDEQfw4vwku06QHLtkte5ftpTarCxW3vGDYl8ggXJMNKEkyIYSmo
   ihxbUeued0uBfIyk6C7OvX8oAgkrhbESLS82ZeVaP25eznkgdNgv3VwHQ
   HWxlf/r8hJDxLeCTNF1VdmRhsHBWX04eBzxaZ7bsk2bupK0y7dsPXFB16
   XRtI/hhmu5x9pGKON3TA6FHYpXO3Po1H3a/8/V20LcdXMoK0oEwkz/w4z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="19769098"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="19769098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 04:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4526858"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2024 04:26:32 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbgFa-00030o-0D;
	Sun, 18 Feb 2024 12:26:30 +0000
Date: Sun, 18 Feb 2024 20:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 14/18] PCI/pwrctl: add a power control driver for
 WCN7850
Message-ID: <202402182059.obwu4k7P-lkp@intel.com>
References: <20240216203215.40870-15-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216203215.40870-15-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240216]
[cannot apply to pci/next pci/for-linus robh/for-next bluetooth/master linus/master v6.8-rc4 v6.8-rc3 v6.8-rc2 v6.8-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/of-Add-cleanup-h-based-auto-release-via-__free-device_node-markings/20240217-044313
base:   next-20240216
patch link:    https://lore.kernel.org/r/20240216203215.40870-15-brgl%40bgdev.pl
patch subject: [PATCH v5 14/18] PCI/pwrctl: add a power control driver for WCN7850
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240218/202402182059.obwu4k7P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402182059.obwu4k7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402182059.obwu4k7P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pwrctl/core.c:121: warning: Function parameter or struct member 'dev' not described in 'devm_pci_pwrctl_device_set_ready'


vim +121 drivers/pci/pwrctl/core.c

3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  109  
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  110  /**
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  111   * devm_pci_pwrctl_device_set_ready - Managed variant of
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  112   * pci_pwrctl_device_set_ready().
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  113   *
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  114   * @pwrctl: PCI power control data
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  115   *
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  116   * Returns:
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  117   * 0 on success, negative error number on error.
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  118   */
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  119  int devm_pci_pwrctl_device_set_ready(struct device *dev,
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  120  				     struct pci_pwrctl *pwrctl)
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16 @121  {
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  122  	int ret;
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  123  
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  124  	ret = pci_pwrctl_device_set_ready(pwrctl);
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  125  	if (ret)
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  126  		return ret;
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  127  
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  128  	return devm_add_action_or_reset(dev,
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  129  					devm_pci_pwrctl_device_unset_ready,
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  130  					pwrctl);
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  131  }
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  132  EXPORT_SYMBOL_GPL(devm_pci_pwrctl_device_set_ready);
3f368e2e7dc2e8 Bartosz Golaszewski 2024-02-16  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
