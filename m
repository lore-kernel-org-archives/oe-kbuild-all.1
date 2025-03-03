Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D41D6DDC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740985577; cv=none; b=GsgLLquosxeJ85F8mhaXDnj4d6rxNbNaGN++ifFADqGHl+YUwtohxwMqhxHkELU+H1V9EyzAAJjPaEUcRURBoJqGACF1JWdmrjcHZTNWEyaTgcBm9hURzLURxPZhzq9aDw9atagvuzIsefOJzm8UFCQuBg+3jjKF79Bji4cEh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740985577; c=relaxed/simple;
	bh=Rka7/Rx/UAJwBcyQ1ctL/DACSoeBVpoGCkrLxyEqkDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WQwhx4eJTDrAW6cWHVLXeNjzk8yQ9Jx73LzBYz4qzZzra7ddZ1yxh+gtm9w/+VMtA9vDwYEBB8bT8Fs1HSs0/Ns/ieveuQPC0UPH3QB1tIhxOIt3jmwytVHxIFNmFmQkukelEVMO6JQUdLL5erAK86w/A2NpY4O83sl+hgGNsEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kl5pV1lZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kl5pV1lZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaecf50578eso775759966b.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Mar 2025 23:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740985574; x=1741590374; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvEeRk3M8QKrsU6ZWqi+zoW7rNpMcZv1dlxRGclyC7A=;
        b=Kl5pV1lZqVgkMe+jGhvHbwVmdhvJ4/uSaHS2RE08X/aWL9zYaXBFhMEKM3DA+m1VVI
         2OBD+cElAKZnS4srt8pWsiYr7hfYboGY5Hhanltu5dSEMFWIePqZjrcq4o1s1LOYGDWb
         xd8QwVJ3/f2cxazJA8tWQZb2gLkbJ24uyZOB2+TkISzbrhwWK+kAj0qJQdYkPMptMRDe
         hDSmzbZDsFTkssiVqdI5Nyh4bdT5ZocZ0YLwFRqPgvLfAvoKXPORLMHz2t+//FzcdOwY
         l2DG0NIkyQk4XAlXnVGv+pY+pmKWJhAAxwH21PC8YFSOKm/j+1jOQN99N72pscV2s2Bb
         RaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740985574; x=1741590374;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvEeRk3M8QKrsU6ZWqi+zoW7rNpMcZv1dlxRGclyC7A=;
        b=Cp8z/DHFUI0YLrwixcDvkHsKfCSXVe+MTTw2n28JMAlFPXwoI0P2Qcx+2eQ7bkTpoD
         SsVO1I/KCVPu+Jx+f4mS39CGWgVdDgaNIaNU/s5N0gktabRTu4HI/q3dbQ3En6FmIemt
         qfKypVxpVdzvOegfVxEzzCIAdIKnu1l0w4J6nzG0jlOW4Yv52BSd+ACGrfO3CWd5SEIw
         1WL0jt1ECvZzTqcgOMhiNZ7X2Ym8txX3aHgZWz4sU5vOp5YK9+pCd50ZMaKgpXcrmWWX
         B3t55NR1yIRM0xXqP/PuGOeEEXMLEMsN2COTVOlO00V2P45PkVyPocpQVKIDajZghlVY
         3f2w==
X-Forwarded-Encrypted: i=1; AJvYcCW25m1PDnZONKexMx24R3mpbylsnNPyrWbC6jjDQKgDbL2e6daNzCbXGQTtSO74raEvzbi9oh4JQXmn6loZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/kKGnnLvRoierEgQu7hRnqXktzeGfC/pHgg0MroO8PTXBhp7Q
	iXXzZEMItsQfAx3PdzGoxja+JBypQIEWLS27CIMdsQDsF1tutIn8yzwE5TQtxu8=
X-Gm-Gg: ASbGncvedka7BZQDK9I5yxShD6Ys/q5m5ULlflt47WSkWLfntxV0pBi7eYfOY+YIF88
	KBivSHknqk61hEgdWo9nTL5T52AlXsLICZB5Vr6GawxsZCDUfwxp/7RonejcAJpDh3vi/KQLR0x
	ynDwpZN6JEY7MtRIBA3JS4rwroxO/UPcZ2X4Q1l8YR1dE2a2pmFu2JAJF5eBCzYMC2Rs96MJsC8
	XUQdRoITqGGwI3bCLx6P74GyfG2rgZwjF5skhjnXYHjRNo5ZSkGwzmc3YRp+x1gWWT/ZuTT5uWg
	9KbdwZsPR33my8PPhbIu/YcUw/XTllDOH9ttRkXadhOkZy27Xg==
X-Google-Smtp-Source: AGHT+IE9RaG3JnTWQBOFC+cG5oJLPzGegDPF8j6pgIAxLmaI3dzluH6lmpvCgAJRjLW14fgB2O0LwQ==
X-Received: by 2002:a17:907:9728:b0:abe:e814:ecb4 with SMTP id a640c23a62f3a-abf25f8dd35mr1474577666b.4.1740985572603;
        Sun, 02 Mar 2025 23:06:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0b9cbfsm769454866b.14.2025.03.02.23.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 23:06:12 -0800 (PST)
Date: Mon, 3 Mar 2025 10:06:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Saeed Mahameed <saeed@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Gal Pressman <gal@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next 12/14] devlink: Throw extack messages on param
 value validation error
Message-ID: <838b1bb7-776f-481a-bda0-015368012040@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228021227.871993-13-saeed@kernel.org>

Hi Saeed,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Saeed-Mahameed/devlink-define-enum-for-attr-types-of-dynamic-attributes/20250228-101818
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250228021227.871993-13-saeed%40kernel.org
patch subject: [PATCH net-next 12/14] devlink: Throw extack messages on param value validation error
config: sparc-randconfig-r071-20250302 (https://download.01.org/0day-ci/archive/20250302/202503022006.eOu80RMF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503022006.eOu80RMF-lkp@intel.com/

smatch warnings:
net/devlink/param.c:498 devlink_param_value_validate() error: we previously assumed 'param_data' could be null (see line 475)

vim +/param_data +498 net/devlink/param.c

ca557d9df319fed Saeed Mahameed 2025-02-27  461  static int
ca557d9df319fed Saeed Mahameed 2025-02-27  462  devlink_param_value_validate(struct genl_info *info,
ca557d9df319fed Saeed Mahameed 2025-02-27  463  			     enum devlink_param_type type)
ca557d9df319fed Saeed Mahameed 2025-02-27  464  {
ca557d9df319fed Saeed Mahameed 2025-02-27  465  	struct netlink_ext_ack *extack = info->extack;
ca557d9df319fed Saeed Mahameed 2025-02-27  466  	struct nlattr *param_data;
ca557d9df319fed Saeed Mahameed 2025-02-27  467  	int len = 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  468  
ca557d9df319fed Saeed Mahameed 2025-02-27  469  	if (type != DEVLINK_PARAM_TYPE_BOOL &&
ca557d9df319fed Saeed Mahameed 2025-02-27  470  	    GENL_REQ_ATTR_CHECK(info, DEVLINK_ATTR_PARAM_VALUE_DATA))
ca557d9df319fed Saeed Mahameed 2025-02-27  471  		return -EINVAL;
ca557d9df319fed Saeed Mahameed 2025-02-27  472  
ca557d9df319fed Saeed Mahameed 2025-02-27  473  	param_data = info->attrs[DEVLINK_ATTR_PARAM_VALUE_DATA];
ca557d9df319fed Saeed Mahameed 2025-02-27  474  
ca557d9df319fed Saeed Mahameed 2025-02-27 @475  	if (param_data)

This assumes param_data can be NULL

ca557d9df319fed Saeed Mahameed 2025-02-27  476  		len = nla_len(param_data);
ca557d9df319fed Saeed Mahameed 2025-02-27  477  
ca557d9df319fed Saeed Mahameed 2025-02-27  478  	switch (type) {
ca557d9df319fed Saeed Mahameed 2025-02-27  479  	case DEVLINK_PARAM_TYPE_U8:
ca557d9df319fed Saeed Mahameed 2025-02-27  480  		if (len == sizeof(u8))
ca557d9df319fed Saeed Mahameed 2025-02-27  481  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  482  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  483  				       "Expected uint8, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  484  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  485  	case DEVLINK_PARAM_TYPE_U16:
ca557d9df319fed Saeed Mahameed 2025-02-27  486  		if (len == sizeof(u16))
ca557d9df319fed Saeed Mahameed 2025-02-27  487  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  488  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  489  				       "Expected uint16, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  490  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  491  	case DEVLINK_PARAM_TYPE_U32:
ca557d9df319fed Saeed Mahameed 2025-02-27  492  		if (len == sizeof(u32))
ca557d9df319fed Saeed Mahameed 2025-02-27  493  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  494  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  495  				       "Expected uint32, got %d bytes", len);
ca557d9df319fed Saeed Mahameed 2025-02-27  496  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  497  	case DEVLINK_PARAM_TYPE_STRING:
ca557d9df319fed Saeed Mahameed 2025-02-27 @498  		len = strnlen(nla_data(param_data), nla_len(param_data));
                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereferences

ca557d9df319fed Saeed Mahameed 2025-02-27  499  
ca557d9df319fed Saeed Mahameed 2025-02-27  500  		if (len < nla_len(param_data) &&
ca557d9df319fed Saeed Mahameed 2025-02-27  501  		    len < __DEVLINK_PARAM_MAX_STRING_VALUE)
ca557d9df319fed Saeed Mahameed 2025-02-27  502  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  503  		NL_SET_ERR_MSG_MOD(extack, "String too long");
ca557d9df319fed Saeed Mahameed 2025-02-27  504  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  505  	case DEVLINK_PARAM_TYPE_BOOL:
ca557d9df319fed Saeed Mahameed 2025-02-27  506  		if (!len)
ca557d9df319fed Saeed Mahameed 2025-02-27  507  			return 0;
ca557d9df319fed Saeed Mahameed 2025-02-27  508  		NL_SET_ERR_MSG_MOD(extack, "Expected flag, got data");
ca557d9df319fed Saeed Mahameed 2025-02-27  509  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  510  	default:
ca557d9df319fed Saeed Mahameed 2025-02-27  511  		NL_SET_ERR_MSG_FMT_MOD(extack,
ca557d9df319fed Saeed Mahameed 2025-02-27  512  				       "Not supported value type %d", type);
ca557d9df319fed Saeed Mahameed 2025-02-27  513  		break;
ca557d9df319fed Saeed Mahameed 2025-02-27  514  	}
ca557d9df319fed Saeed Mahameed 2025-02-27  515  	return -EINVAL;
ca557d9df319fed Saeed Mahameed 2025-02-27  516  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

