Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2710E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 00:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759019818; cv=none; b=VyCg84DlxY4TpoSRK0WoL/b9x5GRHrfUEA5dvvKFq5W3yxILwxJBRnt9y6TsrhmhOkjKtUsxu19J99QxbIZgTFJ29FwhwIqt97UMZUh97yhh3lWydjVmTndtmNeOs/9IR8rWoHLUYi6UmYs9yg+c/DO33fQ0Dl/vAiXVMvz6dpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759019818; c=relaxed/simple;
	bh=Ec3kGgJVgDN67m3fNTnX3j9uPixMabkIMaDfK0v9Nc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YAbH28tFZj0PpbhLTMtRct2Z5i6Z98tj2NvtiPTgz1i3R/FuethV5a3GJ7WzZz2pUPQaf4tK7KzMTNueWfos8GN+EDHM23GWtHIpqr9gEepvSvGXfB5vGu3BmRDvntTvUNFFBVYg5eGWnQf6xyooltsZK/m/cf3S8Q6gs13p/KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PIE0nfb5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PIE0nfb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759019815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o9p0c5xcfOvo18Ej2qFhdgXJdkGOw9xcm/Iggm49n5M=;
	b=PIE0nfb5r7D1TXI+XOllF3OGrHMMgFofnSyVjXX38eNy9ctVLpfXRAEBffSiXhsTsev5SG
	b9AOQtjg/MKJKEAdHJ01WrKRoBCN8hrtEhy8q9iC8MaVVMjmZMpn3QzH3FKIoGlxR6xliJ
	GKe4hSk660eIvM3EYf0sc+1Z2Mj86Ic=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-OGG0STJ7PHK2GEj-gRc_fQ-1; Sat, 27 Sep 2025 20:36:54 -0400
X-MC-Unique: OGG0STJ7PHK2GEj-gRc_fQ-1
X-Mimecast-MFC-AGG-ID: OGG0STJ7PHK2GEj-gRc_fQ_1759019814
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df80d0d4aaso23145231cf.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 17:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759019814; x=1759624614;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9p0c5xcfOvo18Ej2qFhdgXJdkGOw9xcm/Iggm49n5M=;
        b=TQVMvVPLmZvjXrPUCWga73gs9u+KzBQYUUL/MH7N9x+iFmr7YCU1QdoQOVc7nNP1qL
         1QiO+iH2ixh+TdVHBm33yLmzzjZPpWxfa6gyOkXibXoI7V8Fn+EHuW2nCD7wMKFjMILu
         mvFsRwwriIrBEG2sfqO24IXZ4v3LeJWO2WhXZHhLp9t/IstusBZI5l51G/+CC9m5xjzZ
         SVeyzyuTRr6RQfqc81XI/Qcf3D2wMisvZlRgwPgKozM2c09KEDxEwrS/vX6tCbdwcQFg
         pHWvvnIdSGSDuAipTKe2Elns1f6dBZDu9ReqlG9ex5cBs2WC2iDhUyVSYgShDgsNSJ6e
         unow==
X-Gm-Message-State: AOJu0Yyu49uZtw7wu0+wuoTqzp0uehFPyT7YmctlNzbuJd5M/t8g782D
	LaWIIsZCz503A9zBv58Buj9In2VwYXK0nrMPOJMVq2xgr4q+nQEOztEYL+2YAoSg7evqhrhxw3e
	eBxXpCSX2DeM9vdWT6VC8TWfHW62/dGb0CzXZzSKtQvcgYRqnxWOAh/xkR7nSr390kHs=
X-Gm-Gg: ASbGnctPSpFLbAM+Aiq+UqWcuva1SB6ATh50nitm8HLkwf0wgZiaBZrX+TZXCb7d4Ua
	ub4hqx7FB7MohjLJjohma5s0lp5haO5k8FghspIHmDNwsjWIDA+FAwUZovhWDmUbHqhP/6YM4yh
	uDRQJnSkFKw/Y+ju4KvEuiojpZkvW2TpsFz6o2wuTEHgluyH1nstZqzr/AJjf+kQiS7WklhY/0b
	9zIsBPsQZZVlnBxksmL73PGCi1jBiuWpZSs4m2kT+34/CYyVJ8D2Q55qN8gl2vDfI0NNfFkgAPf
	0q5BPS17ZN+WcqrShpUgRIDisFYBwoH60pcnPpvmWQ/qR4ZdasX+hC1moCp6HswiaBUFEHalCgO
	Z6vfhZYKDzjjtKLL2JWE5LjeKhXG3iuE=
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr77691601cf.64.1759019813693;
        Sat, 27 Sep 2025 17:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6dBVU/UYTrTLhQQPy01sIboyLnnzG/mRBTs7ELQ0XPPLeHKR9n1q4ChDRNNNKAFi28WoAuA==
X-Received: by 2002:ac8:5716:0:b0:4b7:a62d:ef6f with SMTP id d75a77b69052e-4da4d314d23mr77691521cf.64.1759019813331;
        Sat, 27 Sep 2025 17:36:53 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0b9458e1sm47109601cf.15.2025.09.27.17.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 17:36:51 -0700 (PDT)
Date: Sat, 27 Sep 2025 20:36:49 -0400
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [linux-next:master 6189/12740]
 drivers/clk/microchip/clk-core.c:391:12: error: redefinition of
 'roclk_determine_rate'
Message-ID: <aNiDIa3o2QLuCHzD@redhat.com>
References: <202509280327.jsapR0Ww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202509280327.jsapR0Ww-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JpQJ9oV1ngsw0UG5CImx5S9HfHV-dSICjqN_IG89m9A_1759019814
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 28, 2025 at 03:48:14AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   262858079afde6d367ce3db183c74d8a43a0e83f
> commit: e9f039c08cdc9b38665aee9a88ae21f59c09ba8c [6189/12740] clk: microchip: core: convert from round_rate() to determine_rate()
> config: mips-randconfig-r131-20250927 (https://download.01.org/0day-ci/archive/20250928/202509280327.jsapR0Ww-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280327.jsapR0Ww-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509280327.jsapR0Ww-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/microchip/clk-core.c:391:12: error: redefinition of 'roclk_determine_rate'
>      391 | static int roclk_determine_rate(struct clk_hw *hw,
>          |            ^
>    drivers/clk/microchip/clk-core.c:377:12: note: previous definition is here
>      377 | static int roclk_determine_rate(struct clk_hw *hw,
>          |            ^
> >> drivers/clk/microchip/clk-core.c:411:18: error: call to undeclared function 'roclk_round_rate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      411 |                 nearest_rate = roclk_round_rate(hw, req->rate, &parent_rate);
>          |                                ^
>    drivers/clk/microchip/clk-core.c:926:20: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      926 |         .determine_rate = __clk_mux_determine_rate,
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/clk/microchip/clk-core.c:922:20: note: previous initialization is here
>      922 |         .determine_rate = sclk_determine_rate,
>          |                           ^~~~~~~~~~~~~~~~~~~
>    1 warning and 2 errors generated.

I fixed this with:

https://lore.kernel.org/linux-clk/20250927-clk-microchip-core-compile-error-v2-1-3473dbae3625@redhat.com/T/#u

Sorry I had to send out a v2 with the tags.

Stephen: Since the original change hasn't landed in Linus's tree yet,
it's up to you if you want to squash this fix with my original commit.

Brian

