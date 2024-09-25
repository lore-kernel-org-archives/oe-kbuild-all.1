Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427F7E574
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727253410; cv=none; b=RSCOXZth21InTFNb1xXsVUhe8h5E4wGRIZTtYcTPR81v7ZG9U38Yt4H54c7nhD4BRzmPC30YlBCPE9mzdEGf7MRZe/WukaFWly0WO8Egn6Lo15/QqEuXkuB0Wlf1s9mG4gajDYimZmoy74xoL2kKVYtCj0KCh3bkdudqCy/15yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727253410; c=relaxed/simple;
	bh=hFX5MsOVvjcdZd2f+saKTifXHbdQI2NeLDIcbXQLoh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=N+NyrV8zXhfFFPwLc4Ssb/nbBD3Z37z2yQQVsejzcGUWN62DQqSlKmUCo4NfJ8FcWWkKxjpbpwfN9T36QLJv0o28lLe350rH8o4YWNfCyt5kgoJUTf2GfuwoJdH4n2M3HyQZXOL+aRL83saxHUnX+QqXhiPrHrQIWLZmqqnFsmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWBLsas9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWBLsas9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37cc9aeb01dso132485f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727253407; x=1727858207; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=24TAtbArscHpN8Q5Ya3k/SGwY5zHz1+8qMhqhIxqNPQ=;
        b=uWBLsas9XL5m93IttCJselAIvsjr7k2lMvsRC1h4AwEDzjmPp8e17UplokEZV3ezgQ
         4mT7AehIAqjWxHFcd1zJTv/ve2aaxhRWPEjy3/fqC56Mi092yxjrY/fQfYPqJfw/FRgw
         /cPxJe/Em2iu2P2FWU47/cQ59h+0pRnvg112oUI2htVlJTWH/BMbcBnAdp0InX9+5Y0X
         P+LJr9CoOT+6CA784PikqOhM0Q0AL9SCv94QC7BLHpG91NcfuCyGnyBrT5If1yHW6pFq
         3s+Opi32uXM4hKOchZrBwI7Cqna1HCYJ9CKFpShWzBbysPtZ46tNkjAUnVcVQHTYlruk
         ZJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727253407; x=1727858207;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24TAtbArscHpN8Q5Ya3k/SGwY5zHz1+8qMhqhIxqNPQ=;
        b=JGnd85BNh2iL21P+mMEuD/bPJvvt5GuTcqJzX6i1T6KiAVG3m2dju5JoPs3qEuLfWA
         Pu8tJUuXoAyFyuqPleEofGPEz8FooO6HxDE5E7LbskrzAyGecNQwvvVeCZF1VLfQp4it
         GqszWORoX6fk3Wdn1vjprJ82mGeZ/X+quzEkqUvWZee5gtUEu6SxhzIhsf9posjlXB+w
         TfSJmJZqQwPWayGW/ZMJLeFwEFLU33khQW0DhzYBCfC8tWxUxwLb+w5RfHppiX0l+b3n
         9axtdatohooeKZ4qY97sC98M2X3JlfyhEFjbrEsb28IdNQYOI6e0L42dpL8WixopWi5W
         VHLw==
X-Forwarded-Encrypted: i=1; AJvYcCUYhXWyG63x8vH/lJ0rO4P0z5Y5Txc9qseGsut+R4q/8VsAQcQcTLztwYzX8TLo2fnjDwoEhSXphvvYa4lY@lists.linux.dev
X-Gm-Message-State: AOJu0YxjVOF4xEdFNg0SmHUC+sTCZ4md7Ug6h0IKPu8G25AO3yRTOcWI
	+DKztbFrdyYZYE6bSOfHuAM+Fj8lq5QRzcqrXYPLETes/fssajAE6TyunasMNXXkoIPBA9EYUK3
	L
X-Google-Smtp-Source: AGHT+IGxLktfoNE2e2EE4CrdWmjS2fFk7LgFAgB99YMRslWo9edoYR8GVryJlZM+pVzqAnkQDLGUXA==
X-Received: by 2002:a5d:4946:0:b0:374:c1a9:b989 with SMTP id ffacd0b85a97d-37cc2464e4fmr1398488f8f.1.1727253407268;
        Wed, 25 Sep 2024 01:36:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f33bsm3383526f8f.97.2024.09.25.01.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:36:46 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:36:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Fangzhi Zuo <Jerry.Zuo@amd.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, lyude@redhat.com,
	jani.nikula@intel.com, imre.deak@intel.com, simona@ffwll.ch,
	wayne.lin@amd.com, Harry.Wentland@amd.com, rodrigo.siqueira@amd.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: Re: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
Message-ID: <e817b705-2147-4c69-a43c-704eaf07eeee@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919173944.256887-1-Jerry.Zuo@amd.com>

Hi Fangzhi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fangzhi-Zuo/drm-display-dsc-Refactor-MST-DSC-Determination-Policy/20240920-014114
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240919173944.256887-1-Jerry.Zuo%40amd.com
patch subject: [PATCH] drm/display/dsc: Refactor MST DSC Determination Policy
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409231002.bMP89Ipm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409231002.bMP89Ipm-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/display/drm_dp_mst_topology.c:6046 drm_dp_mst_dsc_aux_for_port() warn: variable dereferenced before check 'port' (see line 6035)

vim +/port +6046 drivers/gpu/drm/display/drm_dp_mst_topology.c

cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6033  void drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6034  {
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19 @6035  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
                                                                                                                                              ^^^^^^^^^
The patch adds an unchecked dereference

cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6036  	struct drm_dp_mst_port *immediate_upstream_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6037  	struct drm_dp_mst_port *fec_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6038  	struct drm_dp_mst_port *dsc_port = NULL;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6039  	struct drm_dp_aux *upstream_aux;
53965dbe5396d2 drivers/gpu/drm/drm_dp_mst_topology.c         Paul E. McKenney 2020-02-19  6040  	struct drm_dp_desc desc = {};
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6041  	bool end_has_dpcd = (port->dpcd_rev > 0);
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6042  	u8 endpoint_dsc = 0;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6043  	u8 upstream_dsc;
cc707186414576 drivers/gpu/drm/display/drm_dp_mst_topology.c Fangzhi Zuo      2024-09-19  6044  	u8 fec_cap;
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26  6045  
c2bc1b6eabe65d drivers/gpu/drm/drm_dp_mst_topology.c         David Francis    2019-08-26 @6046  	if (!port)
                                                                                                            ^^^^^
But the old code assumed port could be NULL.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

