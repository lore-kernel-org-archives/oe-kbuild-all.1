Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672568;
	b=CJbFqFS7jkXGM+ldiGnURSdxPHLh3WbSaO8o/NQo/fqHLatn/r0y34m9tXlFuOpThitw
	 o5Qdqm54JjAM87e1a+WZxbCu7XGL+LxpPpa/igaHSE4nXLqJWohfFxp8eJmAXvJaMKLZ8
	 Pm8s6srsN8MS7uodmOrKSBzqRw5rniRkZBDp0ipkKG8ndZdsooHegvootaaCwcMTPWubq
	 J6zqi0P0DPFokktDANKmvlnQAQ6/5X0PPzTe6mrLp8+y0DNAJBeHDi2LcGftchonQHbha
	 iTuggDAOPSjB9MFy0VYU23AIut3gvooIe7kKJvhWD5O95N4FHgutD4fug+21hYRxZ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=U2gCIt6Zdi/HC7EkK4V9lC6vrubY+ioEkE70QG4s7EI=;
	b=JD8GvSxwbCDbaN2yiflfFihfxPSkd9PdUuUM95FX5X9AZDcXa1abls35/drgUc8sUumH
	 xt///+Zki4ggLQAJNPJC2bRUH6JoYn/BMRBZ5Ti8088YFEaFbvJzFtkVRxZEBjZ23IjkU
	 oSGWVZPP8H2KzDFO7XrLchyMExC7Gp2554uqeGsQPbOua7rIUT390+L8Yt3mJkGTRV623
	 P9rGyn/WtO5Dx5VMzuEfhedup6IYELXF5rL+nmYtDXezrkaZdM2qmu/DH/ShYrN6awEmi
	 Qwl0Gf1LQWv2FUYsNnQY7FrqTUqN7g411kkKzfqHC3FxS0V5FBy8msyCNrt6uuGDWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqPUITBa;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EA1606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 05:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59EA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqPUITBa
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so65932585e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 21:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672567; x=1796277367; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2gCIt6Zdi/HC7EkK4V9lC6vrubY+ioEkE70QG4s7EI=;
        b=JqPUITBaTGTp/E7COOQW96h5pOg7P+BuDpWMLkrLO5Wr+s8s5NBs6nZhSi1vIP9lvk
         Z28tYxEjgePYbJvWaWTfef+WdO+8RETkAcZtLQLrlO7a1DnFAiBWOyPDEEIh1VSxByhp
         kjEeB2Za85jdPejdNiHQh1qJ/JzLmEQxzcAwvgxgwT6CfVRPdPmuUjfoC0ErLAy1ckeK
         4LLIb0p2mWCttKQUKwArgaMmuXtvYo36yuNUmt5R/LfzNukQzYzl17+MUdIEQCPLv14X
         SFUr/1WF7soKYbJ40ZLIphZ1G6DBHzgi0A4n7R9eYj9+nve4mrlcultOndU9n7LV+Yz+
         axFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672567; x=1796277367;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2gCIt6Zdi/HC7EkK4V9lC6vrubY+ioEkE70QG4s7EI=;
        b=P6Q5zwh9tldlvr+lT0yBRdevJM7lV7zgymILWn3zlh9MzwadqaGuXjH1ujC+9yCol6
         c5uKQCj7z3b4DHjXvgbXvEGfaYxHEv/BCHK487KYUYKaNyH+rUti7Jr+VBy9p/st+Jcg
         /5UakciVJgk9GddHom6dS/urgZ3h0CRFdfZoE4lnsra/p4IDWoDUR69SEsd7H14t5xEu
         pyWKCSlR6F3EIvsMv/Ap5bxfja368OnuWH67nI7H5nHO8SrhhxOLiE9mlyQ0slnq1oo4
         Bw/DqSa7BzqJF3UghTe6ZYrx3x+DgaOOBbvFHtunDTCvyqm9rIfsJMF5ECdC/9BdDNur
         OnZg==
X-Forwarded-Encrypted: i=1; AL+hErHysSfN9PIlnKcAx34Pls+JX/o8NPgjNj8n8EJ9bsdUZKyminwW/nbKvN0Ps8bGKOIoWvjWircxGVSpMhr0@lists.linux.dev
X-Gm-Message-State: APuU4Z+h0DlaMIo1kNR5n/n48e5lFL7ZKNnPVgq1dE5f8Gc7UMyzXmb2
	H/BXUcqobyC0lSKKmBsz6WsK7N9pNSeA5AO8eGvAtcm/hl5xhETM+v2P
X-Gm-Gg: AZFdTZcTfDh6yr09BVLfw9QoMSTOGUa/vvTLgyfd2DE42zopsNOL+E/9bPcZ8nm7i2R
	RanjYXV2NtkP3bqgQ9ATXMkfh7hZnsPmcKpKDfGHZe86Zl9t3YcQnV7NahgG0diVKTA5NfKDQ+V
	dqkqDzLyx6bgckaI+24jdfwsuRUIstGsSvl3kbi5OSNyJO+nFxuBqTXO5WGQppEbV11XF8bvQYX
	xpz1dMKAtn6Vrg72z9QtjVCvduk7SFxSUUeoObIt2ve+6T37Z5zGiiX4OdL92Ui+tXWCx+dSMku
	e8DFtxY6IMDD99a+IGEuPUiVf0fYigqSxVY5bfoHGYkQnuJD2E2CvBgLCDqxlXmKynFW57pnArX
	YN+gqT73DLvhEyHGFAMMNYUUFK4npz3kv884WUYutj+WiEbI1B08o6Q/UUcyWNET4l/8XYZ3Xeu
	7nA0LnpijutsiGimh92DsKM6R/c+pqxIG15mwx1yWmKSN/OppVKKPltx4wRFJxpqolEfRr7+Gyz
	9jFh7id4kUIXoSgMxaia+JDhkwL0bdUqlMgbBB7HoQdLi0friamwzyovI9755NsozORVYlGaM0U
	X2C2e/r4HsJ5/VoJIBXUTVDcoswYuKjvjlK4wXQKaebDaEPLP3vlz+k762JLlZVvx1C75+SzaxD
	aCHuhqEpJdvCiDqSEVLe9B16t3DO55gxznr02y3jLxrmVLhcIrWd3sY0auFt63JJapMI=
X-Received: by 2002:a05:600c:8906:b0:4bb:a60e:a316 with SMTP id 5b1f17b1804b1-4bba60ea355mr62162175e9.12.1795672566416;
        Wed, 25 Nov 2026 21:56:06 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm565134715e9.5.2026.11.25.21.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:56:05 -0800 (PST)
Date: Thu, 26 Nov 2026 08:56:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yaohan Li <shunsheng1218@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines:
 444.
Message-ID: <20261125184601.R647t8Sj-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5
head:   d23ba232a8fefe909aeb9366e3905a95a429ebfc
commit: d23ba232a8fefe909aeb9366e3905a95a429ebfc [6/6] regulator: qcom-labibb: stop the recovery workers on teardown
config: openrisc-randconfig-2200-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125184601.R647t8Sj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261125184601.R647t8Sj-lkp@intel.com/

smatch warnings:
drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq() warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.

vim +444 drivers/regulator/qcom-labibb-regulator.c

d23ba232a8fefe9 Yaohan Li 2026-11-18  393  static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
d23ba232a8fefe9 Yaohan Li 2026-11-18  394  {
d23ba232a8fefe9 Yaohan Li 2026-11-18  395  	u32 irq_flags = IRQF_ONESHOT;
d23ba232a8fefe9 Yaohan Li 2026-11-18  396  	int ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  397  
d23ba232a8fefe9 Yaohan Li 2026-11-18  398  	lockdep_assert_held(&vreg->ocp_lock);
d23ba232a8fefe9 Yaohan Li 2026-11-18  399  
d23ba232a8fefe9 Yaohan Li 2026-11-18  400  	if (vreg->shutting_down)
d23ba232a8fefe9 Yaohan Li 2026-11-18  401  		return -ESHUTDOWN;
d23ba232a8fefe9 Yaohan Li 2026-11-18  402  
d23ba232a8fefe9 Yaohan Li 2026-11-18  403  	if (!vreg->ocp_requested)
d23ba232a8fefe9 Yaohan Li 2026-11-18  404  		return 0;
d23ba232a8fefe9 Yaohan Li 2026-11-18  405  
d23ba232a8fefe9 Yaohan Li 2026-11-18  406  	if (!vreg->ocp_irq_done) {
d23ba232a8fefe9 Yaohan Li 2026-11-18  407  		/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
d23ba232a8fefe9 Yaohan Li 2026-11-18  408  		switch (vreg->type) {
d23ba232a8fefe9 Yaohan Li 2026-11-18  409  		case QCOM_LAB_TYPE:
d23ba232a8fefe9 Yaohan Li 2026-11-18  410  			irq_flags |= IRQF_TRIGGER_LOW;
d23ba232a8fefe9 Yaohan Li 2026-11-18  411  			break;
d23ba232a8fefe9 Yaohan Li 2026-11-18  412  		case QCOM_IBB_TYPE:
d23ba232a8fefe9 Yaohan Li 2026-11-18  413  			irq_flags |= IRQF_TRIGGER_HIGH;
d23ba232a8fefe9 Yaohan Li 2026-11-18  414  			break;
d23ba232a8fefe9 Yaohan Li 2026-11-18  415  		default:
d23ba232a8fefe9 Yaohan Li 2026-11-18  416  			return -EINVAL;
d23ba232a8fefe9 Yaohan Li 2026-11-18  417  		}
d23ba232a8fefe9 Yaohan Li 2026-11-18  418  
d23ba232a8fefe9 Yaohan Li 2026-11-18  419  		/*
d23ba232a8fefe9 Yaohan Li 2026-11-18  420  		 * The interrupt is owned and released by the cleanup
d23ba232a8fefe9 Yaohan Li 2026-11-18  421  		 * action, so its name has to outlive the interrupt:
d23ba232a8fefe9 Yaohan Li 2026-11-18  422  		 * devres would release a name allocated here before the
d23ba232a8fefe9 Yaohan Li 2026-11-18  423  		 * action runs, while vreg->desc.name is owned by the
d23ba232a8fefe9 Yaohan Li 2026-11-18  424  		 * driver data.
d23ba232a8fefe9 Yaohan Li 2026-11-18  425  		 */
d23ba232a8fefe9 Yaohan Li 2026-11-18  426  		ret = request_threaded_irq(vreg->ocp_irq, NULL,
d23ba232a8fefe9 Yaohan Li 2026-11-18  427  					   qcom_labibb_ocp_isr, irq_flags,
d23ba232a8fefe9 Yaohan Li 2026-11-18  428  					   vreg->desc.name, vreg);
d23ba232a8fefe9 Yaohan Li 2026-11-18  429  		if (ret)
d23ba232a8fefe9 Yaohan Li 2026-11-18  430  			return ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  431  
d23ba232a8fefe9 Yaohan Li 2026-11-18  432  		vreg->ocp_irq_done = true;
d23ba232a8fefe9 Yaohan Li 2026-11-18  433  	}
d23ba232a8fefe9 Yaohan Li 2026-11-18  434  
d23ba232a8fefe9 Yaohan Li 2026-11-18  435  	/*
d23ba232a8fefe9 Yaohan Li 2026-11-18  436  	 * Enable the hardware source only once a handler exists, and turn
d23ba232a8fefe9 Yaohan Li 2026-11-18  437  	 * it back off if that failed, so that a later attempt can retry
d23ba232a8fefe9 Yaohan Li 2026-11-18  438  	 * without leaving the source enabled on its own.
d23ba232a8fefe9 Yaohan Li 2026-11-18  439  	 */
d23ba232a8fefe9 Yaohan Li 2026-11-18  440  	ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
d23ba232a8fefe9 Yaohan Li 2026-11-18  441  	if (ret)
d23ba232a8fefe9 Yaohan Li 2026-11-18  442  		qcom_labibb_ocp_hw_disable(vreg->rdev);

Ideally qcom_labibb_ocp_hw_enable() would clean up after its ownself on
failure...

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

Also request_threaded_irq() needs cleanup.

d23ba232a8fefe9 Yaohan Li 2026-11-18  443  
d23ba232a8fefe9 Yaohan Li 2026-11-18 @444  	return ret;
d23ba232a8fefe9 Yaohan Li 2026-11-18  445  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

