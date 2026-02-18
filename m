Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5BD26B777;
	Wed, 18 Feb 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408043; cv=none; b=bnKDeRsX8z75i9mQTUzAbHCsYzC5d1tqeH/ho1Y9+rvfQUdFxb1AJW53c5TZUj13Z0U6E+fKEr0KSDCzMRdArrW6PurmmQQdLpZZm5XXCl64OtosSxpKCsqU5TLFTDWLok0UYI/sc/4/E29D6d33HPiBPunj4izxUGo6poYTKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408043; c=relaxed/simple;
	bh=jeeOHjPXnJVmpeethi7dKscTaeQK34T+yExQIMEwedI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBNNUm2/tNkt2yG1SpzCAOaQSSaNRQq5pz/m46LY7VqX70NfuTbPrAhP2eQN72z5gqzxZb26UH3/397/XIw5vJ+1j1Bh78/xgQACjvKX3+X8KAG8IpUN0bAqaUnoZiEa7+aqS7z5AiMOEAj35//jY3qkilcdJhzxsqLlcc26LIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+Z6It4g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+Z6It4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F78C19421;
	Wed, 18 Feb 2026 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771408043;
	bh=jeeOHjPXnJVmpeethi7dKscTaeQK34T+yExQIMEwedI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U+Z6It4gJscQ1TGMP5ZyBVV1ztbUJh3oj69o8+lo3auE7TRKT8Fr7JhbdnpzoEdM8
	 KhtlL6PJaWuNjx906o9PXyIhTOeP98YvFB6HP6g7iYny7rh/No1eQaG3aDBWRXeU7i
	 6XE6uBIheQCFE7WuTytba5NhoIXm6qLIQ0fnV7x1Ty3ApiNkIrwtD/a8SvAyjIYQJV
	 ulZovj/Vktf6p4qBC4qORAWnT6fiIWZjitvQ0C96SH4gY/yyRyaPLeYH/MUHjyoZqs
	 75voG7cqEEyGfcRKFUi2WGlmhrPLnolSbifmy/B0eBpz3UAUT8PN2pwACEqmzC5Q1B
	 MMRlBbrzaDlWA==
Date: Wed, 18 Feb 2026 10:47:19 +0100
From: Niklas Cassel <cassel@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: pci-epf-test.c:undefined reference to
 `config_group_init_type_name'
Message-ID: <aZWKp3WsRueo2fH1@ryzen>
References: <202602180706.VtXkmtqL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602180706.VtXkmtqL-lkp@intel.com>

On Wed, Feb 18, 2026 at 08:05:16AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   e81dd54f62c753dd423d1a9b62481a1c599fb975
> commit: ffcc4850a16133d8db0f11ee6dde319201800451 PCI: endpoint: pci-epf-test: Allow overriding default BAR sizes
> date:   3 weeks ago
> config: sparc-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180706.VtXkmtqL-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180706.VtXkmtqL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602180706.VtXkmtqL-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    sparc64-linux-ld: drivers/pci/endpoint/functions/pci-epf-test.o: in function `pci_epf_test_add_cfs':
> >> pci-epf-test.c:(.text+0xec): undefined reference to `config_group_init_type_name'
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for CAN_DEV
>    Depends on [n]: NETDEVICES [=n] && CAN [=y]
>    Selected by [y]:
>    - CAN [=y] && NET [=y]
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thank you for the report dear kernel test robot,

Arnd has already posted a fix for this here:
https://lore.kernel.org/linux-pci/20260211070812.4087119-1-arnd@kernel.org/


Kind regards,
Niklas
