Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186448;
	b=rb3to2q+QzBuERHFsvwIlRYzDixj1JzHFRVg0K4OnY8oijkiblV/PBVKDlgdWYOYV/Wg
	 B90xvcXyEU/2BESQCdb85n9yIPk/Dq8RwaFSJEulJeDdZx/d+aeKPEzn2H9sukTapk/Xl
	 9qWZB1ws77UWfZB3Om1rhqNm9gsSIJmGR3odBFv3dVE+3RuR/VQweyX3iKIso2ReUGGQV
	 OkkTdRL2g2AAwco6xnTSon2ECXfwUMFfoyY3DVeQmhNSHGBhN9rVUtvRj1EzTtdZGS17N
	 oufFQMTX7EnCS93JsSg5NM+F7Lx3Pu6Mbb9Ouzwn/FI3Qnv9Aj3f/EpNo7s60H/g9XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186448;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mnWuDOmPWY8WhYih80hkenztlRuy241LzJymjPu652M=;
	b=H7HHnPAzMRfduW/pXw+0ebwLQF7OfeVoAMlYFtk9UsJAU6F9SpwBIsFEOcyEh2x+4HEo
	 hMhOEp+unAXv7cF5qXrNp4cvc65HPc1L7UakT1aUIrPogFu9EhO2lcCjHyuzpnSsiUmi0
	 96xhQqcxZ3AQ2LH+V4UHsBUL4iApL2AocO6D2gYq1bvshjHIrbl1gKP4kxtUKcWnnpYxJ
	 B96meFwTBYf8FQlogT2T2Z/wAuVvl4rNKj2Ancx+7BMfsWfdLVW0sRTOnmgF5m4sHqzOZ
	 SxCihw5STFsX6BmIeYEHgbCfSR9HPpHlpMrDZVohY6wx4HCZH8PK7f9/cx52lpsM30Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NM1HD3Tu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F325F606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NM1HD3Tu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6F81F01825;
	Wed, 28 Oct 2026 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186447;
	bh=mnWuDOmPWY8WhYih80hkenztlRuy241LzJymjPu652M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NM1HD3Tut1VHZHDl11QqeoHP2JRpAyp6uhOFlGj54PP+mEzoQ6su9PacVrnsQS/lK
	 wQ1ylnbv2UedJ6Eu5KiNbkqypUf3LVApF/a6P9FOV9v8mPqh630JlTkZP44EUrIJ27
	 UzyxlElyCylqKyzYDGpG72/5wVZZeRPs+oM3fG+NQgvm76tvZvD+wdvuHA7fmvFeSD
	 JC/qlqBr6crcQvqoAVgqJlw4nzif0SupZRyxBf4MIHN9cw8GFvcGkabG6OAzeD8t+N
	 fqiVPguIIlsP110FjSCt0wtORNH3IeMhtkK8mh0ZdSnc7n7mipMKipe936Ng0r3Fl1
	 9D3dcUz5SxaGw==
Date: Wed, 28 Oct 2026 11:20:44 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [linux-next:master 20068/20451]
 drivers/firmware/arm_scmi/driver.c:3110:23: error: implicit declaration of
 function 'acpi_device_hid'; did you mean 'acpi_device_handle'?
Message-ID: <20261028-noisy-rainbow-chimpanzee-dd8b5c@sudeepholla>
References: <202610281806.897kSNcR-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610281806.897kSNcR-lkp@intel.com>

On Wed, Oct 28, 2026 at 06:55:38PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   151a134a4e6ec66f69db8750c66006f5207f7a9d
> commit: 7f73b4cb4b3afff60577e5ddc532fd026b55d4e5 [20068/20451] firmware: arm_scmi: Drop redundant ACPI configuration guard
> config: arm-randconfig-1002-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281806.897kSNcR-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281806.897kSNcR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610281806.897kSNcR-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 151a134a4e6ec66f69db8750c66006f5207f7a9d builds fine.
>       It may have been fixed somewhere.
> 

It depends on commit 98b9bfb659a9 ("ACPI: bus: Use acpi/acpi_bus.h
without CONFIG_ACPI"). Not sure if this config was build without that
though unlikely as it is in the upstream tip.

-- 
Regards,
Sudeep
