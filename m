Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA71741C3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726655354; cv=none; b=GARPYLhH071inUsBCtRKHGDC56PpjtU3YDAlzhSyXhqLHFplMERdvvwgs10y5n2foEZE+rLVHwVJB2PfT/EHf8SPCjcd+b2EVz2JN92DkNdZa4Thc8Heo1UX3ar/4k6sZZdQ7Q4qP2tMP/CcpnwcS0xTQWriScF9G1A65MofkQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726655354; c=relaxed/simple;
	bh=a39yEU1qDSiQyVMeMKgLFZWZA/fQbvNEV7y3RlMGOEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=siBEJOner2dkbZ3ntuSGcS6b5WmlANc8R3ZvjRGfM9Y/oBIrHqC9BgkZ5JVLm2GeqMy4ItTGs+2/2aRux9JrXfgGu1dGRGWiekTRkSWAWuD604dBmfRz04fvbOBMKX4jrY2+7RNWrsyPtjPLd/v+1A452Igz21NgM8fPHfOsePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r84WSCO+; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r84WSCO+"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c1120a32so4499824f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 03:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726655350; x=1727260150; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8IGZ+UsOwDU5vfEwL536cwU6b6ARkEcblXO7Gz1AB8=;
        b=r84WSCO+mo+CTphDHvlLFLA2a3RhY6RzOwTfpJ9CDtA5LIxxL9OnK/WlJFbtIgrA+X
         VUoWjAuzYBEUe+Xtgol9FplsgpJN5UqRbPvCZHXIW3RxMpWt8QO7tJKSOOvR0OZoGI0z
         7BP3iStkDy39uRJ/JPnUuGTiEBjTVSzRxAdBi4HdtRUcu22zyWHed+wjIePUHuxk0e+i
         ckFHIDGdrTBFrHTXe3MpFJql9Tv4p5+Of0iBhiB+6CQ2aYGpy7qtrnAsUgg83sbRGj0c
         4KqJCQDC6/WBbQRcvPUTHy8foN6M1PsSrahFKwjWAqyXhNHa2jqS33DdfPFHuvj7GoPK
         ts0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726655350; x=1727260150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8IGZ+UsOwDU5vfEwL536cwU6b6ARkEcblXO7Gz1AB8=;
        b=NDFkXD2nnCF72BiA68akHOxO3yWHcJLeW0tFmObKzfRdapn4t6o7NvREsnjvgh/60v
         fML3quaWMg6NX+T+eRjPXzTvVuXylhViqzkMRFayFlru5hI9ad/bK1PJGkt5INmISNnf
         59NRrEYG/duc/b2vhomvrOa3v3KsZXQLXX4MVzPH+Hcc+qLpffbxxfo1WI93YVrPGUWz
         TvKdeJX4OxwKiTteLj9hKsh7CHNffJrki5jM8jc734/fOJ1Tax1wk9Ejt5epRB8F9OSW
         IYIPEJ3KpvvunC4/l+aZaO0s0GNeRQ9aRn3f4d2K+mw7t512w25AicF9jm7RLMEZpbNl
         O46A==
X-Forwarded-Encrypted: i=1; AJvYcCWwIm8ACx19PaGB5qHrW+bgoF9PKh4ApFLieStfKxCoNiljPczbgawHFjYIvE7VYhJDk3+YvL7JvZWYxRLo@lists.linux.dev
X-Gm-Message-State: AOJu0YwHzQfPZlY4B8jz3o5NtV9D2v1y6Wul0Qf3A/4GpXh6ZJ9DWJBx
	6RqNZSvTVKM3ZJ9Ldj+9jgYgkG8yGhZdDbAdK58nAkn16ZSIXOCseUrMTPFzwiA=
X-Google-Smtp-Source: AGHT+IGQN8g2sl5By/J4Z6wbJcgvZ3+TfEIn9bnlnNSVQu1J1Ze76BIcCUMXLkt5CXINpC2Ume6xYw==
X-Received: by 2002:a5d:65c9:0:b0:368:3731:1613 with SMTP id ffacd0b85a97d-378c2cf3f1emr12714688f8f.13.1726655350454;
        Wed, 18 Sep 2024 03:29:10 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7805179sm11876344f8f.100.2024.09.18.03.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 03:29:10 -0700 (PDT)
Date: Wed, 18 Sep 2024 13:29:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses()
 error: uninitialized symbol 'ret'.
Message-ID: <67cf80cf-d96d-4249-ac34-6085d4b32948@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   adfc3ded5c33d67e822525f95404ef0becb099b8
commit: 9799873717398e8fa1727482e578b9d777da645e spmi: pmic-arb: Add multi bus support
config: mips-randconfig-r072-20240916 (https://download.01.org/0day-ci/archive/20240916/202409162313.TnpH4qKB-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409162313.TnpH4qKB-lkp@intel.com/

smatch warnings:
drivers/spmi/spmi-pmic-arb.c:1782 spmi_pmic_arb_register_buses() error: uninitialized symbol 'ret'.

vim +/ret +1782 drivers/spmi/spmi-pmic-arb.c

9799873717398e8 Abel Vesa 2024-05-07  1762  static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
9799873717398e8 Abel Vesa 2024-05-07  1763  					struct platform_device *pdev)
9799873717398e8 Abel Vesa 2024-05-07  1764  {
9799873717398e8 Abel Vesa 2024-05-07  1765  	struct device *dev = &pdev->dev;
9799873717398e8 Abel Vesa 2024-05-07  1766  	struct device_node *node = dev->of_node;
9799873717398e8 Abel Vesa 2024-05-07  1767  	struct device_node *child;
9799873717398e8 Abel Vesa 2024-05-07  1768  	int ret;
9799873717398e8 Abel Vesa 2024-05-07  1769  
9799873717398e8 Abel Vesa 2024-05-07  1770  	/* legacy mode doesn't provide child node for the bus */
9799873717398e8 Abel Vesa 2024-05-07  1771  	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
9799873717398e8 Abel Vesa 2024-05-07  1772  		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
9799873717398e8 Abel Vesa 2024-05-07  1773  
9799873717398e8 Abel Vesa 2024-05-07  1774  	for_each_available_child_of_node(node, child) {
9799873717398e8 Abel Vesa 2024-05-07  1775  		if (of_node_name_eq(child, "spmi")) {
9799873717398e8 Abel Vesa 2024-05-07  1776  			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
9799873717398e8 Abel Vesa 2024-05-07  1777  			if (ret)
9799873717398e8 Abel Vesa 2024-05-07  1778  				return ret;
9799873717398e8 Abel Vesa 2024-05-07  1779  		}
9799873717398e8 Abel Vesa 2024-05-07  1780  	}
9799873717398e8 Abel Vesa 2024-05-07  1781  
9799873717398e8 Abel Vesa 2024-05-07 @1782  	return ret;

Is it possible to not have an spmi node?

9799873717398e8 Abel Vesa 2024-05-07  1783  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

