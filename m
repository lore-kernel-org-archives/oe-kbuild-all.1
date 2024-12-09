Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206F214809
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733726220; cv=none; b=F6nSWCZNAZgf7CyhnCnbkc4Y44m7t8zNK3dMoJErnURGmiwSS63p5V5k8KFMCfSA7XGJP0t+EMP57l4eP9KvlpE9bUaAQnYRPAVSdj2dYlhuGSjIcPQSTSFcTQSrnn9iQEBs15/q37NuIYLoI2NVJHeCWwgoLj6V9g/j15gU9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733726220; c=relaxed/simple;
	bh=6eqqUNJJ3vPG7vTcA2wxcPmZxdDyXarNS81G6pfi81Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSY95lBhxH56SlSIRBrrpI6diaspfMshhLjFkUw/NJXb8n7p/q682CC8zg0Ktr4YqzbBbBYkGqPjY6uoRq+8i6jBiI3ra8Q8dNolKM89X2rdZwpZUYVV/Q8Ehh6Ck7Cc5TjvkKVHAIToJpnj9Lv1gAAneAP4k9P3OSxar41XOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P/A7pgPh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/A7pgPh"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso38840765e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 08 Dec 2024 22:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733726216; x=1734331016; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pYqNCYDwSFTStFCXhDRXkvYvPJ1uFwCy3cBb397Bbg=;
        b=P/A7pgPh317vYeERc5lY+iiXT0YcdLMxA3gcxDuOC0EI7ctqLAL9AHBFMRz/Ejs6IF
         7EBEw7wfCTLHJEvuin69NspK1vxRp1OerJK7L+g8dulHAzvv9H5cJ2YePxljmuFNDo+F
         jW4w81SC7QT/StuzWFJxqF0n8hiy6RhXUfhPBRdgQOdZbiAnKAXLz3B3ONMNDiE/vMfb
         4+4FopOCBfI7uAyjMBn5CSXFF+8ojxn1Lp4Mk1mSvtwdW6u5+2vQ89jNKOljksJoz0ri
         6ehdSg5P2gNw1TCiGRP73N89l0thzS/ERAcWUqNNRLjF5UFSkvSab3I79EgqHLqoFw64
         L/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733726216; x=1734331016;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pYqNCYDwSFTStFCXhDRXkvYvPJ1uFwCy3cBb397Bbg=;
        b=GX+I6jgMsr9SJmQGZ0JjiWIj43etE2HUFSGlBMYcvf47s9DiywCq0Fe4xIPxvwhyfh
         3IU7BxMEEoDrVix65bXm4k9D/HHx4hjIsg8fCteauh5lEy100kRSNr5hLal+OkXgD0Ov
         G1kXNSUXVVYXWpogeQUwhz3a5aboCVgDWXjhyJZDOFT/Pt7YNnAbJzXeCxItU6nTgnHW
         lRvVKFnvJ5m+r8moDgo1VRFAEo/T2yGbroIZiID7VReEbjEgHYa+qa5bOW3BT+94Sn0w
         cIOXuyYgVGnslNuIC19lFQp4M9uOtVUCavri5hhn8rGjG56j2zlxT0DM8EnUVfObByzd
         wc2w==
X-Forwarded-Encrypted: i=1; AJvYcCUksAyrsPYERW6g/z+yXHuhH8H4//zrQNaQ/gj5jYA0j6NNHkQdSKwDmuAHNFsQ4d7LHS28aqlvWPhX0KeC@lists.linux.dev
X-Gm-Message-State: AOJu0YxCXPICeaDWq01ERZfS9CGB3Kq1iMt5MDdHhBbxVE6vVXMp5OTu
	DUGmtDCrvcqtR7+3+dZ/xiMuh6XdT5GoqV2mWe0UEXsIB1EoPM4GSGrLCIohiXg=
X-Gm-Gg: ASbGncsiz/a69IL1oDIoOWra9XQCLJN/XJ1PMm+z1z3e7mx5f75lqNuYQpYTkB1CZwY
	0gBS8c19h70cgSuWIEaOWdH09Xfnss1gsWcNhujQlQRCpw86taBwm5tNtgDVrM9jW6Lbp2rC9h2
	0jQx1sjDlsNVjqvepAEzJi3VpAnN0jtcVF5IxdfHfrbYj9aOgdNZ3ehH6NVNf0a1G26jZ1c1tuF
	cNlH5ahxYQxF+JonukjvMRXyuDZPmr23usTudfNMwrYXnHleIHVi4o=
X-Google-Smtp-Source: AGHT+IES6dTJEaTnkmfHwTMG6jKosfbiP4CkXOOfgsEOmy/HB5R1ohvJm3vAtgSwl3yD4VVxuh+kKg==
X-Received: by 2002:a05:600c:19d3:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-434fa73ad6fmr9293965e9.13.1733726216159;
        Sun, 08 Dec 2024 22:36:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f39653c6sm48575895e9.7.2024.12.08.22.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:36:55 -0800 (PST)
Date: Mon, 9 Dec 2024 09:36:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/renesas/rcar/adg.c:416 rsnd_adg_create_null_clk() warn:
 passing zero to 'ERR_CAST'
Message-ID: <dd683985-6aac-43e0-8116-92f2c587874d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: c087a94bea49acf34d651f7308506fe462a937b3 ASoC: Rename "sh" to "renesas"
config: openrisc-randconfig-r071-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071740.OKhNHftG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412071740.OKhNHftG-lkp@intel.com/

smatch warnings:
sound/soc/renesas/rcar/adg.c:416 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'
sound/soc/renesas/rcar/dma.c:840 rsnd_dma_attach() error: we previously assumed '*dma_mod' could be null (see line 833)

vim +/ERR_CAST +416 sound/soc/renesas/rcar/adg.c

cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  406  static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  407  					    const char * const name,
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  408  					    const char *parent)
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  409  {
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  410  	struct device *dev = rsnd_priv_to_dev(priv);
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  411  	struct clk *clk;
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  412  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  413  	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
cc64c390b215b40 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-08-20  414  	if (IS_ERR_OR_NULL(clk)) {
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  415  		dev_err(dev, "create null clk error\n");
cc64c390b215b40 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-08-20 @416  		return ERR_CAST(clk);

This driver doesn't check for error pointers in the right way.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

If a function returns NULL and error pointers the NULL generally means
it's an optional feature.  For example, an ethernet card can transmit
packets just fine without blinking LEDs.  The driver has to be written
to handle the NULL pointer.

Here I guess clk_register_fixed_rate() is optional and has been
deliberately turned off but we're printing an error and then returning
NULL back to the caller.  The callers check for NULL and change it to
an -EIO.  It's shouldn't print an error if it's deliberate.  Or if the
driver can't operate without the feature then that dependency should be
enforced in the Kconfig.

cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  417  	}
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  418  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  419  	return clk;
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  420  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

