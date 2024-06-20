Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315BA1803A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718870174; cv=none; b=CupCqAzI4Uw7ZAcaC8JLcD87aBjN2pg/VeKifc2yfhk1+HROd87q949fo/GaTNHioutJQ41NhRW3pIXM6TIo9iks7LS1ZOWx+DnbTnh/HW/rvlolDpRIqmk8Oc2aA8Fbs3nz5Q0Vb8y+1d8mEklMk3c9b17kPj9YQVb/hd3R3mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718870174; c=relaxed/simple;
	bh=BQV8PljRL1R2MKlHV+buP+xt+n5b0gL6wvE3+HAxHaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQyu1L3TiYw11VTQ19DaGAl36Dbyh9t3E/Ps4wNM8fF3VQkqE46D82oT720sY+tajZmZyFzSab+SmEjCQmaRoh7WKLGB/Z5K13w3pgTexUM9OxX7T/AUSPW/Klrfb68KIAGP/7uLYSbV0VhoSACJLFVXrnkpAUy/oAsSQ/XmyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHEoUX3z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHEoUX3z"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c84a21c62so644831e87.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 00:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718870170; x=1719474970; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Sp9Tow40j8vVkNe7lusJ7wIu9MnedHyl3fGXRjd8Mw=;
        b=CHEoUX3zCspHWDouwcm+ZR1OkicQwoRrzISM0oGk+EYREeXDwyiT08rBoj/YjdyT8H
         5NTr2qnw9MKa33sXCaeW1vl56krJcEPZu95byss6MAqxbPNVt64F9z3K+A7t7EghK7dy
         sqq9MI4Hk3bsuRTHbiRV2jn+6UJEihkMYEIZzHyiQsyamVE3S3zOc6yqF1cMsxGnwjgX
         vYcbLIFm505pQJ1LWFP/nvzowZZlOqPPapw+z9WvqmxxgjP3p7J1/zOe6OlAXl8H70+g
         AOyEBu/EE0dBUCBLdkaM8p9F41P0T6V3+YH/bOcYxo2atN1ZHTZ+GBpfFdhPab2nJvEM
         8g9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718870170; x=1719474970;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sp9Tow40j8vVkNe7lusJ7wIu9MnedHyl3fGXRjd8Mw=;
        b=nhQBp6q+S2P/ix2OVu6BdJwzXDAuP0Bc1w+ww9//wDHcJCI113Sljk6bhCe3rcrvKI
         yR/bPN7Fme9b+/NkxoYRyQdN8AQagnCi15oDtqLam/4RAgr41304ZPWkWcgAor9KA7pB
         Ml+HoHjhJSY81MreoE3vAIt1cC/425/jLdY93VNdYfxDlEPInlqORb8mR/EWZPsomWi2
         Fm84HvqzX2bw81sY2aJ+b3paGR0LcjQvtwp0Pop8Rr5clR3tPqCMJRC39iWrBzIhGgRM
         lxveQpzTuJNb9tSQEdzfMPCaqJLw21Lkqi5CClC/EHNDLoMNDu7Ic+KkC5XqwM7Vk+ee
         1CnA==
X-Forwarded-Encrypted: i=1; AJvYcCX9+aGERkvDwJ9Ut830mPjQIo1EH410sYk5s4ZRbOPfrI0dYeKkjiBkv0JGHKdUWP5AQxGZHkasFPfe8L6harNzda9NWS9j1Rwn+m6oKA==
X-Gm-Message-State: AOJu0Yw30P+tfZmhDWHhzELqIvYgbO/A/2XvVuZtMVQpDkg+y6YP7Y38
	+FBxOnvt/U4F46za3xe3eAaGlJMe8vdqRcdYRlP9Uihe26z6Rc3R58nvg//Tn3k=
X-Google-Smtp-Source: AGHT+IGjj7vcLD/gPmDU8Z8Dk0gb7Bf2ldfr07Rldt7HZnfccaNm8jU+fhYzVzwYch0L6rUvuYHepg==
X-Received: by 2002:a19:4347:0:b0:52c:8318:dc14 with SMTP id 2adb3069b0e04-52ccaa5dc33mr2566883e87.25.1718870170078;
        Thu, 20 Jun 2024 00:56:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f88522f42sm340129766b.110.2024.06.20.00.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 00:56:09 -0700 (PDT)
Date: Thu, 20 Jun 2024 10:56:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Danielle Ratson <danieller@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 30/41] net/ethtool/module.c:186
 ethnl_module_fw_flash_ntf_put_err() warn: passing zero to 'PTR_ERR'
Message-ID: <a92ab294-e61e-464f-bd2c-9e96991903c8@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   ded71079fd9b5d39c76a01fdfa82eb29e047b512
commit: c270a7d3889b3655d39165331365c2c65d41185f [30/41] ethtool: Add flashing transceiver modules' firmware notifications ability
config: i386-randconfig-141-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201539.b3yhaypM-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406201539.b3yhaypM-lkp@intel.com/

smatch warnings:
net/ethtool/module.c:186 ethnl_module_fw_flash_ntf_put_err() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +186 net/ethtool/module.c

c270a7d3889b36 Danielle Ratson 2024-06-17  165  static int
c270a7d3889b36 Danielle Ratson 2024-06-17  166  ethnl_module_fw_flash_ntf_put_err(struct sk_buff *skb, char *err_msg,
c270a7d3889b36 Danielle Ratson 2024-06-17  167  				  char *sub_err_msg)
c270a7d3889b36 Danielle Ratson 2024-06-17  168  {
c270a7d3889b36 Danielle Ratson 2024-06-17  169  	int err_msg_len, sub_err_msg_len, total_len;
c270a7d3889b36 Danielle Ratson 2024-06-17  170  	struct nlattr *attr;
c270a7d3889b36 Danielle Ratson 2024-06-17  171  
c270a7d3889b36 Danielle Ratson 2024-06-17  172  	if (!err_msg)
c270a7d3889b36 Danielle Ratson 2024-06-17  173  		return 0;
c270a7d3889b36 Danielle Ratson 2024-06-17  174  
c270a7d3889b36 Danielle Ratson 2024-06-17  175  	err_msg_len = strlen(err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  176  	total_len = err_msg_len + 2; /* For period and NUL. */
c270a7d3889b36 Danielle Ratson 2024-06-17  177  
c270a7d3889b36 Danielle Ratson 2024-06-17  178  	if (sub_err_msg) {
c270a7d3889b36 Danielle Ratson 2024-06-17  179  		sub_err_msg_len = strlen(sub_err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  180  		total_len += sub_err_msg_len + 2; /* For ", ". */
c270a7d3889b36 Danielle Ratson 2024-06-17  181  	}
c270a7d3889b36 Danielle Ratson 2024-06-17  182  
c270a7d3889b36 Danielle Ratson 2024-06-17  183  	attr = nla_reserve(skb, ETHTOOL_A_MODULE_FW_FLASH_STATUS_MSG,
c270a7d3889b36 Danielle Ratson 2024-06-17  184  			   total_len);
c270a7d3889b36 Danielle Ratson 2024-06-17  185  	if (!attr)
c270a7d3889b36 Danielle Ratson 2024-06-17 @186  		return PTR_ERR(attr);

This returns success.  It should be return -ENOMEM;

c270a7d3889b36 Danielle Ratson 2024-06-17  187  
c270a7d3889b36 Danielle Ratson 2024-06-17  188  	if (sub_err_msg)
c270a7d3889b36 Danielle Ratson 2024-06-17  189  		sprintf(nla_data(attr), "%s, %s.", err_msg, sub_err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  190  	else
c270a7d3889b36 Danielle Ratson 2024-06-17  191  		sprintf(nla_data(attr), "%s.", err_msg);
c270a7d3889b36 Danielle Ratson 2024-06-17  192  
c270a7d3889b36 Danielle Ratson 2024-06-17  193  	return 0;
c270a7d3889b36 Danielle Ratson 2024-06-17  194  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

