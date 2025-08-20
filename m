Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978BF2C11DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755672031; cv=none; b=L9Ielf0V/PpymUCaqcCCorOG6Vhmt5PjcY0jS4I31MDIg3jLCU2C8Sd66+/AKWSEgPNlRjGfqN+MI3NUiVMcf3rJcPvQpISPID/Tn9fCSNA5arccncNp66RAc8s6nKPLHlgO4DO/yjV6GZug5AKMVQ2Myg9oVbmXPRMaz/HqX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755672031; c=relaxed/simple;
	bh=GbYe/xr2KnaQN5qvGP3TKUQEzBohUBz2Hp6+TW9NVTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EPg9GOgTipMWcBDPUtzMbV4cDpMr6G1ETq7vPpanOeyv+dB0wfaTZiF78UbDoQzpASyEW0hXt7WWlfX8Lze73nqaAJ1rQIdssJbHdOBTnACVDZpy/TJgdd6CaPjoADNkKA4z9iO4igNOn+oyn4ApFGKSSYYlnZKnYDZVykzN/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SvUk5y8+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SvUk5y8+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3bb30c72433so2066899f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 23:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755672028; x=1756276828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr7gbAs7NoWP6YIoHdlAkJ/lGPbRe6fvpSA2+GwU+Bk=;
        b=SvUk5y8+iQS1dqiJ2zNLxGMj1JnUESJrTDip0008kBqzGXKZ6yXdHMPV5h4CmMJFVC
         PC3XWUzk34sbe5jWK2NjQ8Jz8LJ8xXElEHbCCZ/NqO1rGDwo5fk9CIl5rtOTfZf/ufQ1
         Hm2Gs7jBt6omMJgokxhJcayecAoL+3dltvegGwy8t955jl4j9kOGozhB2kJRbYR7uu18
         rQNh+Uf6442vjmDwn4cJBpRmdOd1IZsW+jNwZIk8F4AL59ZmH+3PcfzqNBfbcgjV5ct8
         BVWR7iy96ka6hYe9wzc71wNt2l0N1FrWNNYdSPsXLkPVSgJ/UdGvkq/H2oDPUHto/BNe
         Xu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755672028; x=1756276828;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xr7gbAs7NoWP6YIoHdlAkJ/lGPbRe6fvpSA2+GwU+Bk=;
        b=mQ9bSGwZ7cbo7GZfePSzwW18obpodbv/KA0/g1mB6UzacTbvE4NoY6Gt3dd8STIUVS
         RbgJ03GUOsX17f55BtOq55psRRYAPfE7atLGml1eqMXB2GCqOB693zBKIVSAp1uFV/88
         +LAOoAKT5oJr6yf9W9tj6hQi4gk9eqHLnctF7t1RFS/ly0t1X2aM2EbgO8lwS5OmqfyK
         AXoQwSfzcQXicdPg5nNrspNicTvCHgLu3/XRn9agl4LvAnQ7E325aIMF/6BFwd/3ouC/
         7I0bBx8mDukwNQAdc4Sbn5hUkrn6ku/HVbXUDkcjnYAVVAc3CZMABHcIHdLJC6jCaU5D
         lUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl5RC1eYISwktpq6wOpQZKDUp8lz2nyuZLVL3z7lpgLCJSlwt8QSDW/kUBoLJxzQCSNRx0N5EPonq4NqlE@lists.linux.dev
X-Gm-Message-State: AOJu0YwIIL874OspM3NqtJ2agA06Pb5Vgbwc7TOclgbLX9lK2zzjgcsS
	oTKaHclnfMkkHbY8HqhTIzzLDpzi5hKLzHHVYh7Jj2yXXXOA6iMhMvtuWtqI0YWnfWc=
X-Gm-Gg: ASbGnctAdZKWNpLYfot3Jl5WstBM356FICow/raH5+b9qvcvgiAMZlovJ3S9KFkBOfS
	iucEJKBJm+RjX0tFPDhK9XWIPPTC67EjfkQBVEUpzxGxCHFcNsi8Tlz+cMRM8ebZjd49MvoWKrv
	VeLTJS7DrAlYjZOIK5sy5xmm1Df576jWF6j9mAFJo7Q+KQPP7L53GxG0/8R9SMoOpos2R5WXC9S
	AWWo3rTNsvYqMHPdcVyTNIf2sN9IjwyARnpTW7XM4UgEeSqNJoRajbWtNPpm5a7/I9VBsC/j2QS
	rnukbKppztiIHZf2qeJCIOlgvLa4ifrUoPgnAvSfZ9oCgI98tKIDY5RwREl/6nJJjBzWrnTEq8s
	KuGPL476X9hFo70WwTfxIYP0Scmw=
X-Google-Smtp-Source: AGHT+IGAZ6McYMCx54eY6pWpoKew3ITg2+wTSl/nURpfg3Nb30p1pBzhgzsuHH+BOzekuGd6+2v13A==
X-Received: by 2002:a05:6000:188f:b0:3b8:f358:e80d with SMTP id ffacd0b85a97d-3c32c4345d2mr1070252f8f.5.1755672027829;
        Tue, 19 Aug 2025 23:40:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b47c2865dsm17711515e9.2.2025.08.19.23.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:40:27 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:40:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ivan Vecera <ivecera@redhat.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: Re: [PATCH net-next v3 3/5] dpll: zl3073x: Add firmware loading
 functionality
Message-ID: <202508200929.zEY4ejFt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174408.1146717-4-ivecera@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dpll-zl3073x-Add-functions-to-access-hardware-registers/20250814-014831
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250813174408.1146717-4-ivecera%40redhat.com
patch subject: [PATCH net-next v3 3/5] dpll: zl3073x: Add firmware loading functionality
config: xtensa-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250820/202508200929.zEY4ejFt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508200929.zEY4ejFt-lkp@intel.com/

smatch warnings:
drivers/dpll/zl3073x/fw.c:239 zl3073x_fw_component_load() warn: potential user controlled sizeof overflow 'count * 4' '0-u32max * 4'

vim +239 drivers/dpll/zl3073x/fw.c

cd5cfd9ddd76800 Ivan Vecera 2025-08-13  202  static ssize_t
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  203  zl3073x_fw_component_load(struct zl3073x_dev *zldev,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  204  			  struct zl3073x_fw_component **pcomp,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  205  			  const char **psrc, size_t *psize,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  206  			  struct netlink_ext_ack *extack)
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  207  {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  208  	const struct zl3073x_fw_component_info *info;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  209  	struct zl3073x_fw_component *comp = NULL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  210  	struct device *dev = zldev->dev;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  211  	enum zl3073x_fw_component_id id;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  212  	char buf[32], name[16];
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  213  	u32 count, size, *dest;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  214  	int pos, rc;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  215  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  216  	/* Fetch image name and size from input */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  217  	strscpy(buf, *psrc, min(sizeof(buf), *psize));
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  218  	rc = sscanf(buf, "%15s %u %n", name, &count, &pos);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  219  	if (!rc) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  220  		/* No more data */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  221  		return 0;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  222  	} else if (rc == 1) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  223  		ZL3073X_FW_ERR_MSG(zldev, extack, "invalid component size");
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  224  		return -EINVAL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  225  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  226  	*psrc += pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  227  	*psize -= pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  228  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  229  	dev_dbg(dev, "Firmware component '%s' found\n", name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  230  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  231  	id = zl3073x_fw_component_id_get(name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  232  	if (id == ZL_FW_COMPONENT_INVALID) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  233  		ZL3073X_FW_ERR_MSG(zldev, extack, "unknown component type '%s'",
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  234  				   name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  235  		return -EINVAL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  236  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  237  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  238  	info = &component_info[id];
cd5cfd9ddd76800 Ivan Vecera 2025-08-13 @239  	size = count * sizeof(u32); /* get size in bytes */

This is an integer overflow.  Imagine count is 0x80000001.  That means
size is 4.

cd5cfd9ddd76800 Ivan Vecera 2025-08-13  240  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  241  	/* Check image size validity */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  242  	if (size > component_info[id].max_size) {

size is valid.

cd5cfd9ddd76800 Ivan Vecera 2025-08-13  243  		ZL3073X_FW_ERR_MSG(zldev, extack,
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  244  				   "[%s] component is too big (%u bytes)\n",
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  245  				   info->name, size);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  246  		return -EINVAL;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  247  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  248  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  249  	dev_dbg(dev, "Indicated component image size: %u bytes\n", size);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  250  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  251  	/* Alloc component */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  252  	comp = zl3073x_fw_component_alloc(size);

The allocation succeeds.

cd5cfd9ddd76800 Ivan Vecera 2025-08-13  253  	if (!comp) {
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  254  		ZL3073X_FW_ERR_MSG(zldev, extack, "failed to alloc memory");
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  255  		return -ENOMEM;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  256  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  257  	comp->id = id;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  258  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  259  	/* Load component data from firmware source */
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  260  	for (dest = comp->data; count; count--, dest++) {

But count is invalid so so we will loop 134 million times.

cd5cfd9ddd76800 Ivan Vecera 2025-08-13  261  		strscpy(buf, *psrc, min(sizeof(buf), *psize));
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  262  		rc = sscanf(buf, "%x %n", dest, &pos);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  263  		if (!rc)
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  264  			goto err_data;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  265  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  266  		*psrc += pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  267  		*psize -= pos;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  268  	}
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  269  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  270  	*pcomp = comp;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  271  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  272  	return 1;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  273  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  274  err_data:
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  275  	ZL3073X_FW_ERR_MSG(zldev, extack, "[%s] invalid or missing data",
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  276  			   info->name);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  277  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  278  	zl3073x_fw_component_free(comp);
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  279  
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  280  	return -ENODATA;
cd5cfd9ddd76800 Ivan Vecera 2025-08-13  281  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

