Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3B539B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 07:34:34 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685604867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnyHmo9sTxCtFcNjfHW8xU/+Kdw2Z24bOyeqg/dzcEo=;
	b=dPKcZ/aDGJ8AfP7AC5wpfVm6Q1XuckkZQDEWhIbY+UlXKAsS4tjBeAyLCUAsOn/oGYLuZs
	0ZNXS8B/64AZh33fXPHmyeN8NzEuNwwjQqaHvgvPSwlpzLFa0eFkl2mugLXc2EM+mYl9gK
	dssz267Zq2Z5/Tc6pHeUCeaGF0Sfs32zCdRjIlKwQ8R883yWhvzRDCRBBVRLY43U6C1OHa
	FofkA4HvR/BsaZAOPFAwCEAUdrgssTo0Fwm2maFI8dDvVyQzVYQMh80Kmv/oxcIVUfSb6E
	jYREa6qcs9raXhRsKQnnLUgWMIyeXc3kQb6r7nkCPAsCGX87D4SoQOqrvcD+jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685604867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnyHmo9sTxCtFcNjfHW8xU/+Kdw2Z24bOyeqg/dzcEo=;
	b=rxQR8a5yAxuDSnePOOFgh/4s03oSKPjhPBfGYQKsCvv+DgeX47LAaA/8ysOgQJdcav0wBk
	GX3mBRwuc1EOZhBQ==
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>, Marc
 Zyngier <maz@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [stable:linux-4.19.y 7623/9999] drivers/pci/msi.c:175:42:
 error: 'struct device' has no member named 'msi_lock'
In-Reply-To: <202306010832.aoPNj3I5-lkp@intel.com>
References: <202306010832.aoPNj3I5-lkp@intel.com>
Date: Thu, 01 Jun 2023 09:34:26 +0200
Message-ID: <87pm6feiv1.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 01 2023 at 08:44, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> head:   a8b7a32a3427d592a38cb0ed9c33088d44c82840
> commit: 3c9534778d4cc2bd01e20d4dcffc55df0962aa12 [7623/9999] PCI/MSI: Protect msi_desc::masked for multi-MSI
> config: powerpc-randconfig-r032-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010832.aoPNj3I5-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3c9534778d4cc2bd01e20d4dcffc55df0962aa12
>         git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>         git fetch --no-tags stable linux-4.19.y
>         git checkout 3c9534778d4cc2bd01e20d4dcffc55df0962aa12
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306010832.aoPNj3I5-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    include/linux/msi.h:131:9: note: in expansion of macro 'for_each_msi_entry'
>      131 |         for_each_msi_entry((desc), &(pdev)->dev)
>          |         ^~~~~~~~~~~~~~~~~~

# CONFIG_PCI is not set
CONFIG_PCI_MSI=y

PCI_MSI depends on PCI but there are quite some places in Kconfigs which
select PCI_MSI independent of PCI

Not sure what to do about that.

Thanks

        tglx
