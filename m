Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69657882
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l9xFMjgz"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5596E240006;
	Tue,  5 Dec 2023 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701777051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cah3j2juioi6RSxftEHdB0arRwFIS4jHm/Lr5W6KbZo=;
	b=l9xFMjgzXQ9m3krWfcIirDdTAADkMa7a8uqjEI07OkV+UhPjJYX5fIIK84oJUGWDl/K7H+
	W2jA8JTnkt0lquOmDRfaeBQd0fjP7qE/eHf4NQRJ1awyRzafJSccnrBGwtgrBlcMpcOA3X
	/elx1tmTrCWsOyiOPqoAjmIdjiD5X6PRSy8cXczfguWhXmHgIP0XK4+7s4ucnG/EvkiW3y
	cHkwar/k85zpI3RaBSpKO8XbCF1E7JTXZE9fQocL9aeG+YxIXBII40wgo8EVDdIvFV9suc
	DnV3xU4Dqknua5ps45EUJQifuhl+138z/7FsyfFhf6v1yd1jfp3LBKcAqRQW6Q==
Date: Tue, 5 Dec 2023 12:50:48 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: drivers/soc/fsl/qe/tsa.c:145:23: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <20231205125048.766fc560@bootlin.com>
In-Reply-To: <202312051959.9YdRIYbg-lkp@intel.com>
References: <202312051959.9YdRIYbg-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi all,

On Tue, 5 Dec 2023 19:36:05 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
> commit: 1d4ba0b81c1cf2bfc0c55658f53809846ae9de52 soc: fsl: cpm1: Add support for TSA
> date:   9 months ago
> config: powerpc-randconfig-r131-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051959.9YdRIYbg-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051959.9YdRIYbg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312051959.9YdRIYbg-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: dereference of noderef expression
[...]
>    drivers/soc/fsl/qe/tsa.c:145:23: sparse: sparse: dereference of noderef expression
> 
> vim +145 drivers/soc/fsl/qe/tsa.c
> 
>    142	
>    143	static inline void tsa_write8(void *__iomem addr, u32 val)
>    144	{
>  > 145		iowrite8(val, addr);  
>    146	}
>    147	
> 

This will be fixed when the following patch is merged
  https://lore.kernel.org/linux-kernel/20231128140818.261541-2-herve.codina@bootlin.com/

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
