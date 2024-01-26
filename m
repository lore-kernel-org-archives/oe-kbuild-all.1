Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDB1D526
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706284041; cv=none; b=VwHk2y8vWGof6x2IHdiEsKos7rOG0jE6lk3ie7nIN28jCFp4bWkDYhodnC1SllZg44w2+oJ4CcjXUuNXD4LfKSdURRJnNjnm6+gZgrwkfkJxb4mHgLPQlxX0n87Xhlsf7UBNH/7Jj0MYUoYNl6vxi/Qn+fid7LHab25LN3DBAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706284041; c=relaxed/simple;
	bh=DAs3V7HyP/XpBmzo6+7opXgyjmtVQeAlOfAKpgpolnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9SzqDBgMqDnGBAxU4ixhsjuDoOcH8fNEaf+ZuDmMWm9tn/wy2K+qPj0+A/fipIoCSr9QATyOcfxDG29neBwQ44+wHcsSmjBGq86A0E4a/khpThVmHZePkj8z/ijqle97uj8zvTy1HUN+pI0+T4VKVsBX925/QNu5KM3UeGyhFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lRPeu6UA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lRPeu6UA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6dc6f47302bso620986b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706284039; x=1706888839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qc1S48vRk0PGvch6nvXwWAPqcctjRQ+0B+3F6wtfmnc=;
        b=lRPeu6UAU2ZqyofvivXxir+W/lPkhePzvS5kT96oWB8hDXlZS/QRRWesJP2xaOBGyx
         KkBeKzGdck9ICl2rD3/Hj+fvQ6WvbddtjFUD2sg3wx8uugwMGrhIBwm9rPww8mwcvPA0
         cKvJbq6PKc4G/Vz4V89/oFLbKm5d/pMHeRPE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706284039; x=1706888839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qc1S48vRk0PGvch6nvXwWAPqcctjRQ+0B+3F6wtfmnc=;
        b=WqWjXVxzvuI/2J13P9hofWOJdjH69rbyXzYoV75R9R7BrRUbtyRSgMlXGurG4l4mmA
         kpg9OMRjbUTRrAzPm8AbRdcp1qYJ4MldaI9s+GQN7bbAnnq5xYAZMfLf+UPWTxVaCKp4
         rj/G1nHUgllZkRWoM5XPPgMerrd1kB8vOe36d1nyUk/rgqcXPDFPHMr4P9OEZiv/6HSj
         ws8PV0b+lZ00nxlSnNKbBuerUcPuu2HsdQQuDvQKC5EthhGTW+MOu0yaOnMSNoeItbXr
         IWsznXVwcItO+oaWG0y0zPMqRjRyZuc3589NPdzVHOSmxcH74rq+9DMSZEIJ+pFueKCp
         rITg==
X-Gm-Message-State: AOJu0YxhRY5b9MAa0ewoY8Qfgb/vYsxHwUHaziyYpoCMMDnfNsecCpf5
	/n1M9JvUw05opH3FemN7WBLh6dY066wOqS/zefJRP5WaCutQX1cMTpD+nByEiAM/WLF9ARIkQLM
	=
X-Google-Smtp-Source: AGHT+IHzsnw5TGHNhM9GaI5lNXsmzH1jBjkNdTyXdBCPgQ7tx5bVGYxMba+mPuyXqYN+9sJJoRpaoA==
X-Received: by 2002:aa7:9ec8:0:b0:6de:a18:70b with SMTP id r8-20020aa79ec8000000b006de0a18070bmr355100pfq.45.1706284039622;
        Fri, 26 Jan 2024 07:47:19 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id j8-20020a056a00234800b006d6b91c6eb6sm1271255pfj.13.2024.01.26.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:47:19 -0800 (PST)
Date: Sat, 27 Jan 2024 00:47:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [sailus-media-tree:master 18/18]
 drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift'
 in 'struct ov08x40_mode'
Message-ID: <20240126154714.GB194356@google.com>
References: <202401261628.dWEtdXLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401261628.dWEtdXLE-lkp@intel.com>

On (24/01/26 16:47), kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   f76be7216c3df5f563353bd7a6aaf5076b118943
> commit: f76be7216c3df5f563353bd7a6aaf5076b118943 [18/18] media: ov08x40: Reduce start streaming time
> config: i386-randconfig-003-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261628.dWEtdXLE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401261628.dWEtdXLE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/media/i2c/ov08x40.c:1783:23: error: no member named 'exposure_shift' in 'struct ov08x40_mode'
>     1783 |         if (ov08x->cur_mode->exposure_shift == 1) {
>          |             ~~~~~~~~~~~~~~~  ^
>    1 error generated.

This CL depends on https://patchwork.kernel.org/patch/13426393
