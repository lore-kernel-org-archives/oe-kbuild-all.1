Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F69372
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 00:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720656978; cv=none; b=mIpX04lI3Z3TY9Ps1loUMdirPbaQUrLWO1euydp1J8v9blp9EZwhk2QtCPv7/y0GqRI0yEkQnh+TW1BQlpm/PLZ9DFkWxHBCwaTIkwYFIaJgpChJWp3fhr2w/qfeHBIL+EEEAv10nNILu9L3wUp95IGOlOu2gb4IAOZxf0zf9fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720656978; c=relaxed/simple;
	bh=Hpg40zUDodjZBRBy1wQZZ3kAyWnz1j4BK1BDC/3Z4H0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=unnk4WjudGuQeiZs26PCFD0U1XXZVmsVOBDWZqMlNnG0KlN+2iSlNgMOVRWWlYa2fTVQ8AZkuXrgy/EYMtX3kMSEl63uvirOOlFffw1Cfkahag1BEalUZY1nUtNJuQkN3E0c+CYW8qNObCdfL983IHwAHIIib2zsIFvLNJe86KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX+jfa7V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX+jfa7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BDEC32781;
	Thu, 11 Jul 2024 00:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720656977;
	bh=Hpg40zUDodjZBRBy1wQZZ3kAyWnz1j4BK1BDC/3Z4H0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KX+jfa7VGo6rmHcLGb7r56GhVXXWgll7/7cz+hUjkzRsqnJAnRxtcFAQIQjg+TOyA
	 KTS3P/iGPztXcrNkr34bBtOcp8/iDqO2vAiY4dNSyLUCjSjUvYYL3cLFB4CziaUwXO
	 7BwawMCFBC2rgKlexyc5h4V8lESv6OxZdWaRm1S4qFMARa+CZqajQG8xKbEN6RWZ7f
	 JYC0IT0LnH51aXnNaqbnqj+b7WeYb1M1P3xx5cyTRywG+ww4zkGrBIMgh3n+I2As4A
	 1+ZIZbygL5pHl1R4AF7Ulj+V29K1dE39Nun9AY4Mw7weSk8iBAxQ8rLs5udtSWgrTl
	 dP3PtI1n2yvpw==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7425/10451] WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_rel_cleanup_cb+0x16 (section: .text) -> .L0  (section: .init.text)
Date: Wed, 10 Jul 2024 17:16:14 -0700
Message-Id: <20240711001614.100561-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202407091849.4HyNYQIj-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 9 Jul 2024 19:07:55 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0b58e108042b0ed28a71cd7edf5175999955b233
> commit: e576342789f1e76ada9fed44f891f5fce83579e9 [7425/10451] mm/damon/core: implement DAMON context commit function
> config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407091849.4HyNYQIj-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091849.4HyNYQIj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407091849.4HyNYQIj-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_rel_cleanup_cb+0x16 (section: .text) -> .L0  (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_attrs_put+0x18 (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_caps_fill+0x2e (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_linecard_set+0xc (section: .text) -> .L0  (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_function_validate+0x26 (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devlink_set+0x2c (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_phys_port_name_get+0x1e (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_init+0xe (section: .text) -> .L0  (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fini+0xa (section: .text) -> .L0  (section: .init.text)
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_set+0xc (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_pci_pf_set+0xc (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_pci_vf_set+0x10 (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_pci_sf_set+0xc (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_function_set+0x3a (section: .text) -> .L0  (section: .init.text)
[...]
> >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_split_doit+0x4c (section: .text) -> .L0  (section: .init.text)

Similar to my reply[1] to another similar report, It doesn't look like the
commit is somewhat to be changed for these new warnings.

Please let me know if I'm missing something.

[1] https://lore.kernel.org/20240711001043.100459-1-sj@kernel.org


Thanks,
SJ
