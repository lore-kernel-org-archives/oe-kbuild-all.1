Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F431B828
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786596433; cv=none; b=rYWdueKlyWchw8BLrUcmyCRPcmAfitOHSuKdB7xqZboa2lXRpbrNgYCeAw55LCq5zKLaRjOrpWkBvrwaqyljjrlL9n8SMW1JR2V/EaDflCW83+63ahbY4fsGrmoBYK04FLxmp7LSExvK6XkcDFkILY0oXv88jnYHWZ16zdrBnJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786596433; c=relaxed/simple;
	bh=dpFWrGIEplvEYBC53bcndFpax5JU6LX+PQHB7H/TFxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lB6ANiciMuGsb6yd4XsV4/hOHZc4qFi0EWnk/NJ5C6/P4Y1BaE3s+3+zJ6EMg5q4g/TH/DIM68j2zRldjnOiC9IV5Bykg6UlmQ7RyHsc1C3xSV2Q15C0OYdwOp/rC7iyss7FLHkGarFrtgOR//zymzAs/1BCFKJ6/gg8zQy1utU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evpbvTAo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evpbvTAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151F01F000E9;
	Thu, 13 Aug 2026 04:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786596431;
	bh=U+U96SKpANOKoVg8L334AxLNvErFZrx3jQKBIlICCT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=evpbvTAoOwzv10tj/IerhRNbU62e6FE1/hSfmT9dvCnP4r9xVsalqdsAastpoX5NI
	 DJzrTto17Vw2LpoyBYKQvs8zE/vuw+fPyKixEJoGkK0WxND9vUT/Z/utMpRYDMHBzA
	 Lv8210ttf31Dr8hUWIU+iJt+YSNMRASgwcS2UEdb/ZCtROiAIr0wJmzn0FY+s8Rtzu
	 fHECPXo8vDZOSkSpZ9IKJgSXbQvbJXD9/qX1Quqv+QocCLenDapJTVFOu221MBnERT
	 9z8kGkvK9QYgocCgxDBR+E8TlsFf3EEeia3JE5gMRoyJxvWG9eG8YjoGV+CFIb8EHG
	 0uJKH+nbsaYyA==
Message-ID: <307d6642-4109-4f20-8207-9ee05d78b5b2@kernel.org>
Date: Thu, 13 Aug 2026 06:47:07 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8662/14447] drivers/soc/fsl/qe/gpio.c:42:34:
 sparse: sparse: incorrect type in assignment (different base types)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202608130908.gEy44F1D-lkp@intel.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <202608130908.gEy44F1D-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/08/2026 à 03:40, kernel test robot a écrit :
> Hi Christophe,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   5e6de6a2b522f659defacb1551d0465ba6ce13cf
> commit: 21d055109b2352542ac293872ca9113b42b6c55e [8662/14447] powerpc: Move CONFIG_QE_GPIO to SoC
> config: parisc-randconfig-r111-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130908.gEy44F1D-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.3.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130908.gEy44F1D-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608130908.gEy44F1D-lkp@intel.com/

Will be fixed by 
https://lore.kernel.org/linuxppc-dev/6a84b38e766729676b375c93bf54c67ea455288d.1786080840.git.chleroy@kernel.org/

> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/soc/fsl/qe/gpio.c:42:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdata @@     got unsigned int [usertype] cpdata @@
>     drivers/soc/fsl/qe/gpio.c:42:34: sparse:     expected restricted __be32 [usertype] cpdata
>     drivers/soc/fsl/qe/gpio.c:42:34: sparse:     got unsigned int [usertype] cpdata
>     drivers/soc/fsl/qe/gpio.c:43:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdir1 @@     got unsigned int @@
>     drivers/soc/fsl/qe/gpio.c:43:34: sparse:     expected restricted __be32 [usertype] cpdir1
>     drivers/soc/fsl/qe/gpio.c:43:34: sparse:     got unsigned int
>     drivers/soc/fsl/qe/gpio.c:44:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpdir2 @@     got unsigned int @@
>     drivers/soc/fsl/qe/gpio.c:44:34: sparse:     expected restricted __be32 [usertype] cpdir2
>     drivers/soc/fsl/qe/gpio.c:44:34: sparse:     got unsigned int
>     drivers/soc/fsl/qe/gpio.c:45:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cppar1 @@     got unsigned int @@
>     drivers/soc/fsl/qe/gpio.c:45:34: sparse:     expected restricted __be32 [usertype] cppar1
>     drivers/soc/fsl/qe/gpio.c:45:34: sparse:     got unsigned int
>>> drivers/soc/fsl/qe/gpio.c:46:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cppar2 @@     got unsigned int @@
>     drivers/soc/fsl/qe/gpio.c:46:34: sparse:     expected restricted __be32 [usertype] cppar2
>     drivers/soc/fsl/qe/gpio.c:46:34: sparse:     got unsigned int
>>> drivers/soc/fsl/qe/gpio.c:47:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] cpodr @@     got unsigned int @@
>     drivers/soc/fsl/qe/gpio.c:47:33: sparse:     expected restricted __be32 [usertype] cpodr
>     drivers/soc/fsl/qe/gpio.c:47:33: sparse:     got unsigned int
>     drivers/soc/fsl/qe/gpio.c:248:17: sparse: sparse: restricted __be32 degrades to integer
>     drivers/soc/fsl/qe/gpio.c:250:17: sparse: sparse: restricted __be32 degrades to integer
>     drivers/soc/fsl/qe/gpio.c:253:17: sparse: sparse: restricted __be32 degrades to integer
>     drivers/soc/fsl/qe/gpio.c:255:17: sparse: sparse: restricted __be32 degrades to integer
>     drivers/soc/fsl/qe/gpio.c:259:18: sparse: sparse: restricted __be32 degrades to integer
>     drivers/soc/fsl/qe/gpio.c:265:9: sparse: sparse: restricted __be32 degrades to integer
> 
> vim +42 drivers/soc/fsl/qe/gpio.c
> 
> 32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  36
> e9713655b29a47 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2025-09-18  37  static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
> 32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  38  {
> e9713655b29a47 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2025-09-18  39  	struct qe_pio_regs __iomem *regs = qe_gc->regs;
> 32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  40
> 3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06  41  	qe_gc->cpdata = ioread32be(&regs->cpdata);
> 1b9e89046c31fd arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-12-03 @42  	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
> 3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @43  	qe_gc->saved_regs.cpdir1 = ioread32be(&regs->cpdir1);
> 3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @44  	qe_gc->saved_regs.cpdir2 = ioread32be(&regs->cpdir2);
> 3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06  45  	qe_gc->saved_regs.cppar1 = ioread32be(&regs->cppar1);
> 3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @46  	qe_gc->saved_regs.cppar2 = ioread32be(&regs->cppar2);
> 3f39f38ea91dc2 drivers/soc/fsl/qe/gpio.c         Christophe Leroy 2021-03-06 @47  	qe_gc->saved_regs.cpodr = ioread32be(&regs->cpodr);
> 32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  48  }
> 32def337aafee0 arch/powerpc/sysdev/qe_lib/gpio.c Anton Vorontsov  2008-05-19  49
> 
> :::::: The code at line 42 was first introduced by commit
> :::::: 1b9e89046c31fd39d08742915b6bd72f6c239608 powerpc/qe: Implement QE Pin Multiplexing API
> 
> :::::: TO: Anton Vorontsov <avorontsov@ru.mvista.com>
> :::::: CC: Kumar Gala <galak@kernel.crashing.org>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

