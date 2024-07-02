Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4066F12E1FE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 06:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903071; cv=none; b=NZhlsY6CkFJrj/QDpZ1rLFVhKpUbW7Q2D45ifLJOUtI+YPg/+0tfPJEVBHQUvCvFjL3bQHRDqwcojFEcP+zCLUJV82kN5Bh2giY9qGFJfySIlnQmq+24mUNGdrVGMuH8Wg00hVL1Tq0dgigtEl73DuTggXgvO0e03qKaofiaR7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903071; c=relaxed/simple;
	bh=71IAUX22JOL+OvZy19VmEh4pp1XLyi2CC0Wm0cxOSqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOj2g2T5JkM+KpaD2171cb3ubXAAjLzrmLKo6TF1vqng8D92jI2FFudtp0uvDDunF8WLrcTJTMfSl6z8E2Ex2ahlkmg7TGtDBw47p7nQE2zimukMTz4KVRxSFvEzDDDgnUhp+yadfwwOvv1NgA7o1E13gkG1D3KjvQsErwq2L18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UlY/sTpi; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UlY/sTpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oGVcmNnPax/juI0kncFWafmx1hWLkvBT9x+Nd2AN52s=;
	b=UlY/sTpiFS2jbLHKap2vVUBnRJkBazHDGYhbbXl9UpkHBEhvJMu8PKUPO1wKF6
	w3XEDg9Y+mPAex+d6FC0lZ5bDessfWvvWATLALg+X8GfUsIsDOSkIVJuLzyBJ8hW
	9b0oNhsFVWz8/2DjxDEwCiKpACxM7KUCmxxaXXHaV4Lqo=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHbyc+o4NmIeQ9AA--.8463S3;
	Tue, 02 Jul 2024 14:50:40 +0800 (CST)
Date: Tue, 2 Jul 2024 14:50:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [shawnguo:imx/dt64 53/91]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to match any
 schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
Message-ID: <ZoOjPtWSTTn8QryI@dragon>
References: <202407021405.ahrmTsPb-lkp@intel.com>
 <AM6PR04MB5941F075BB66E5D866A8F54988DC2@AM6PR04MB5941.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB5941F075BB66E5D866A8F54988DC2@AM6PR04MB5941.eurprd04.prod.outlook.com>
X-CM-TRANSID:Mc8vCgBHbyc+o4NmIeQ9AA--.8463S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryUWw15Cw18uF4fJFWrKrg_yoWDWwcE9w
	4qyw17Wrs5ArW7AF95ArsrJF9xWFy0q3s5JryYq3WkZ3WavFZ8G34DZrZ3tw4fGr4rKF98
	AwnrXw1fXF1DKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8oGQDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgAQZWZv-d5VQgAAsK

On Tue, Jul 02, 2024 at 06:22:26AM +0000, Peng Fan wrote:
> > dtcheck warnings: (new ones prefixed by >>)
> > >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> > match
> > >> any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
> > >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> > match
> > >> any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
> >    arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: scmi:
> > protocol@19: Unevaluated properties are not allowed
> > ('regusdhc2vmmcgrp', 'uart1grp', 'usdhc1-100mhzgrp', 'usdhc1-
> > 200mhzgrp', 'usdhc1grp', 'usdhc2-100mhzgrp', 'usdhc2-200mhzgrp',
> > 'usdhc2gpiogrp', 'usdhc2grp' were unexpected)
> 
> The binding is in Linus' pinctrl tree.

Hi lkp forks,

Thanks for all those reports!  But could you stop such "make W=1 dtbs"
testing against my imx/dt64 (and imx/dt) branch but testing linux-next
instead?  Binding changes may go via different trees.

Shawn

