Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5F18024
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759480572; cv=none; b=Nn7k5y5lvKCDFSaVUnrEbnhDG1EF4vgIbe7B8dsgiOmbSCpus7C2yA48ho0XZNMfl2XGDM1Tgoywizd2B+uUn+mbcJW/0It991qv7k73dDwnjJv8ZIycEuAl/lF908O2W9avNCRe5Z+vvP4OhkMj3VmBsFgr7FBcih6AJssfJzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759480572; c=relaxed/simple;
	bh=PKc37E4toOI+coMwxopVyqNk25skEmj4ksL4V0/afI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PcqE6Z1z5mA/0SHwB1yHJR8WWa+7ZRIKnDFYbAbO1hqFFjKjCbS617FoqMQZ463NyvfVMXUstQKkpisP/XyFa5GWEQ4GjHGTlAlcfnYvqX7dQG4MspwcnLpQT8ZL8dnKF9YYEj8EetpVxJ9cIeotAlQ3U4jID99k0OuAe9YyXQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3T/Oqip; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3T/Oqip"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e52279279so12840225e9.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Oct 2025 01:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759480568; x=1760085368; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=;
        b=L3T/OqipEgEr/kfjsqrAmXu+I0PhG01/8vBzrueLBSjXARxah74A75a2DjnkzD187E
         T7WxmV3rRCM+AYGfgTz3Sv8yJ+jPmqYezqWMq7A7rHQY7KJllKjBTWI7+vhmpL8gcXVg
         yxLtu9dbY3XQ4ubs7cPWeudftGMayl5XT0Zw1oS9RGJgH1H4hM6FcCRhLiL45VzAk1iH
         cq/+ANP/J/GNKLFxGU5IjTuudzt/2+yefretoPUYMAYNBAr+aGy0HeTVEDZL2iShhY6m
         QSL8PBhSkwXoHpWFc8hu+j4iFIv78tZGYweEyae4ZpNYvhDAJXl3FPlnw41cFnOOxZVj
         ZmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759480568; x=1760085368;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSviWDocZr7eRFQ1iMDzT5Qi5FWE3ORY1UYGHnObtBk=;
        b=pYOVzVLhFEtkgtIKjqnbTZQjSEl8n7jpjlYCaFytq04XRxk0W6WaqVzzke9CruNiEr
         Hzsj99hJUVaDPLrAAelCyHqU0mj1Sco0xHDpR9JONu1AgqDear0Wk5CZrj6uiD1Pzhbs
         tri5avQU5PqrNnoOLQcg232mYBnqLWLQlpU/KcttudclscAutkL5MNnCx6ZiZXSINSWr
         xNmhn7zc25L9U/O+qOqY/HDoKblojjUmBywSKhhrsTuuJC1AF9EYKCepGv6aKP/pMFKj
         rCccJsh1WSpaGIfYAj1PvH0G1QEOeNPSA0DtQdbGyTlxov8RNoHsNAXPDcpsf312AxBa
         Dblw==
X-Forwarded-Encrypted: i=1; AJvYcCVNo1crgC+OraNE5Kdqn5TpIsUugXW3UQcYYVd7vnywDt92TNjsnDMBhVMgkasR8Uzop/H5Wsez5Q6WDUlD@lists.linux.dev
X-Gm-Message-State: AOJu0YybzEVnSn+sye9ANj1Jutr6T/bMoCLhxdywWsQI/XKGVt5BR9lF
	CpqnGDuCGTXgMGmcCdkVrvId8dUNbOS9I1yG6RllYmOWshA7y+MIShiRUSA/TVZ1/l4=
X-Gm-Gg: ASbGncusmCEmzGAoTS6bth5+52g2Hl0Hb6cMxy9sDAmsTFEOl1PZ8MRXpWKPmUaG76d
	KWSICQV3JrY5YdJs5EgOVn2mP54kLpmedJCqSR/jmS+ZKESqpZ04x9OplFtY1HQwNtEvrKnh4FF
	Yc/5xU1t+5hNmrtKbbqJ0kn7j4ntU0pK+pd/OYYSHD3QvkBgIcGYpF5xSqMWw7a/pwtLmBWcKrw
	xYXngSlei3uNcwWzwYVJGY1hCq7hMBbaJh+Dj5nIqhZx4SPFIALYubJEyvRAjzZuUT51KOgjWuL
	muI80gHeTGoWr5HZSgzEEOhDWLXx33bJGBv/5+IwJmM4N8mhTHaO9If68RDityuuoo398a6oAip
	7bm46fG3LoKE0L69WoSVAAk/7d64c/gDk8mqBSsy3sFXXRyuXYSGPxS9e
X-Google-Smtp-Source: AGHT+IE76AssVOnYZ6flrpm/T7LxOGT/eMAoKYwNOlcK4L0ObcJKZqXObYnm2Ncd1mks7lx/eY9Deg==
X-Received: by 2002:a05:6000:2887:b0:3ee:126a:7aab with SMTP id ffacd0b85a97d-425671c3abemr1117681f8f.57.1759480567855;
        Fri, 03 Oct 2025 01:36:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8abf0bsm6826213f8f.17.2025.10.03.01.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 01:36:07 -0700 (PDT)
Date: Fri, 3 Oct 2025 11:36:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, lee@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI
 PMIC Regulators
Message-ID: <202510030902.aQS5rL8n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002090028.1796462-7-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251002-170532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251002090028.1796462-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v7 6/9] regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators
config: arm-randconfig-r071-20251003 (https://download.01.org/0day-ci/archive/20251003/202510030902.aQS5rL8n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510030902.aQS5rL8n-lkp@intel.com/

smatch warnings:
drivers/regulator/mt6373-regulator.c:664 mt6373_regulator_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +664 drivers/regulator/mt6373-regulator.c

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  645  static int mt6373_regulator_probe(struct platform_device *pdev)
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  646  {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  647  	struct irq_fwspec fwspec = {
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  648  		.param_count = 2,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  649  		.param = { 0, IRQ_TYPE_LEVEL_HIGH },
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  650  	};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  651  	struct device_node *interrupt_parent;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  652  	struct regulator_config config = {};
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  653  	struct mt6373_regulator_info *info;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  654  	struct device *dev = &pdev->dev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  655  	struct regulator_dev *rdev;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  656  	struct irq_domain *domain;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  657  	bool is_vbuck4_hw_ctrl;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  658  	bool is_cw_variant;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  659  	int i, ret;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  660  	u32 val;
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  661  
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  662  	config.regmap = mt6373_spmi_register_regmap(dev);
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  663  	if (!config.regmap)

This should be if (IS_ERR(config.regmap)) ...

910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02 @664  		return dev_err_probe(dev, PTR_ERR(config.regmap)i,
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  665  				     "Cannot get regmap\n");
910ce1c7c9122a AngeloGioacchino Del Regno 2025-10-02  666  	config.dev = dev;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

