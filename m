Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FD935944;
	Wed, 15 Jan 2025 22:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736979842; cv=none; b=FCkKP357lr3vX1iI/OcAGEvggigGGCymNRBe4IkC1cD/b5d4a9Smcc4sXzRIf+NYxHGB5HBEtCFqBuu+EmtVfaQrIyEYXDX3tt2WWi7BpOk/JJqEF3dno/KPc7pBTnP5Qj6C665RxsSkfYLA6KI7y0w/mgYwcWP6k9cyICmb7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736979842; c=relaxed/simple;
	bh=P0IB9CA2JOEL0b3uJXLFEuNzlAaGzpFTi09Vv7Pefso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJ0J/ygmAUHE7KfVOsO1HAG9BnllSaWy8VSaPK0L4ogKj5mH/dTGpRo0CH0oCtOjAUGmRFbemngFwuXntCb3+tsh8JymtwPEOLK4IJZZ9aIZ9sbewscbgCN506RB4MsZjIpkSPCKk7rtt4HVobWtV4syRuy5kA/LJezJjfHZBeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=K/S0ZVrT; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="K/S0ZVrT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=qAD0jJD8FFxPrbsJLyiU+U3D+AjzxOT/zGNyyXaDofg=; b=K/S0ZVrTZ9MeHsAG
	mgGLHNFWw6VopvNF5UT7VOAeyNGmWB2xst5uaj2K6liIKGyUn/gAlhxJ/U+J1bpg3ccZ2StXVuqQD
	rYb9D9SgE6Wmxda219N7y9cRkXhQUlxIv4AFXU916ar+VZKTzoItojmDqr0m/1tPa6OprHm7Nt3c8
	PLtRV2NDjlG3qbm+LI4woURCT+APSsdoMreBtztQAPq/bv315ulkWpWsMy6Xpa5nRv7sIVs24iREV
	OhS+PZVqNw20p1HlKDyo+vGC6cv6NXK/D3niWFcqCW/1p0yfwJS7FtqjrI0YmIzOBDl2wgdYVsgAE
	TG4avd7VHYHY+KV7Mg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tYBKf-00AUvI-0K;
	Wed, 15 Jan 2025 21:53:49 +0000
Date: Wed, 15 Jan 2025 21:53:49 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [tip:irq/core 6/17] ERROR: modpost:
 "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko]
 undefined!
Message-ID: <Z4gubTOiYm-_H1uW@gallifrey>
References: <202501160501.6r9pNtBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <202501160501.6r9pNtBg-lkp@intel.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:53:31 up 252 days,  9:07,  1 user,  load average: 0.05, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* kernel test robot (lkp@intel.com) wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
> head:   12cbdcb9f05559ff72eb8a04df829852804c0276
> commit: dd1f17a9faf5359d76644236cde4cc1720f1184d [6/17] irqchip/irq-brcmstb-l2: Replace brcmstb_l2_mask_and_ack() by generic function
> config: arm64-randconfig-002-20250115 (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160501.6r9pNtBg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501160501.6r9pNtBg-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "irq_gc_mask_disable_and_ack_set" [drivers/irqchip/irq-brcmstb-l2.ko] undefined!

Hmm, that's not happy is it - I'll have a look.

Dave

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
