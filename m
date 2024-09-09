Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C229CE8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 12:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884214; cv=none; b=m6cNQr+0bu2PYHLmWotogfiFnZwvG2v15pDuYgCNZpOQHyvr8ZsBkyxNlPQ61A646/rHqXcuZuv1KF7gf+Ra3p/aZlIYrolfceI8M3PstRtXyNJJoJbgrejnqMrYTzfFbS+CFDxnPqGkrq77ha/nPqWsCOXc01tRF59BOszYmN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884214; c=relaxed/simple;
	bh=WpxLbhTQT6DKk9hVlW2D9IB7LmfZsuZUuHGokN812y8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NbMB515twQUsNZQy5+UFa0Wpo2PUnFqW0WabxNs/dCAmHDtYJbm6k/BPzE8KOyrzwAqQT16u6OHrKWFwLgYS24Hx+xnkIhGsAWWQXy0tFEGEXuqAyCLRvuHK4SIdIbCj+IdF/xXmo9OwGCpxwBYylLB/M58PP9sA3Ir1Z+x/Yu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jR1YaWRG; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jR1YaWRG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57BC11C0003;
	Mon,  9 Sep 2024 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725884210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLVmE56mUfVzGSq6t/JF7XMKKBTDxxgVIRCJXv0PVw4=;
	b=jR1YaWRGYij+gUaOZTZrnnZcL3ySrWmAD+7I23Cz4XGp4lZOlE3+F9xcJ4t7fDDkp17BEm
	qwTfyJMD72g3/2xx/j9lJ99I/2bPCGwPj8U3KfAF2ZoOuYpiMRiJ1nBJWEV7j22KSMb0Ab
	J+ecQ9ynXmhip6v64Kx1XxnZnnfJ2PSQH8tjDb9hXwJxadEFJl+CJ6R3EmtqIwo+tZ9DIv
	sOP2P7oFi6LFN5nAuPw4Ic4sCH+DDxAfPPS52fs6SDUXxJFBsyg5UNURIxmuXWVOuLKh+9
	K8yI9vDDiW3UT+u4w52pWOSXC3IxGIvsTZ8q5bJdQzlAe6EQDpEM50NTWE+Otg==
Date: Mon, 9 Sep 2024 14:16:48 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [linux-next:master 8170/10296]
 drivers/soc/fsl/qe/qmc.c:2002:30: warning: 'qmc_data_qe' defined but not
 used
Message-ID: <20240909141648.6c027bcf@bootlin.com>
In-Reply-To: <202409071707.ou2KFNKO-lkp@intel.com>
References: <202409071707.ou2KFNKO-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi,

On Sat, 7 Sep 2024 17:30:44 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> commit: eb680d563089e55b20cb7730ed881638fe4425b7 [8170/10296] soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) implementation
> config: powerpc-randconfig-r031-20230616 (https://download.01.org/0day-ci/archive/20240907/202409071707.ou2KFNKO-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071707.ou2KFNKO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409071707.ou2KFNKO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/soc/fsl/qe/qmc.c:2002:30: warning: 'qmc_data_qe' defined but not used [-Wunused-const-variable=]  
>     2002 | static const struct qmc_data qmc_data_qe = {
>          |                              ^~~~~~~~~~~
>    drivers/soc/fsl/qe/qmc.c:1992:30: warning: 'qmc_data_cpm1' defined but not used [-Wunused-const-variable=]
>     1992 | static const struct qmc_data qmc_data_cpm1 = {
>          |                              ^~~~~~~~~~~~~
> 

Patch sent to fix the issue:
https://lore.kernel.org/lkml/20240909121129.57067-1-herve.codina@bootlin.com/

Regards,
Hervé
