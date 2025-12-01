Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636C43002D0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 09:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764580240; cv=none; b=ALsHqBLCJgcyb2mFeMyWaPBIzpP9qqxmTClBs/gXkCsskScCyyRjR45bXm/7ZoYEJhz5Uji2kIkDiwIYawuI/YPardNoC+gEkURmpjhM0+eUGqWF3x7H/3bl127AUWkUjfBwPQRUVgascGFg67oTJtuZVPR8jwjIvkgMKrjWuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764580240; c=relaxed/simple;
	bh=vrkYxg4jrv0zJxao8OHdBZZZZF5agpkwIKLKOgwZfGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0wWnUGRBk9WD5YnDRvO0GjP4kxVMqG/y0VNmxQAPPNLV/kx16Bzx7PDh0+iJSgvpLtpxdZdOnQu3D7mK2rL6CU9rdto7CJav6r2jl4gF8zbqsPejsnoIfYzGUOs3DkKn6aF0eX1KgFRddSdWs46pudHfnordpH44j4B1sMXHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RPgII4+h; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RPgII4+h"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-299d40b0845so65602245ad.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Dec 2025 01:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764580238; x=1765185038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xH/xl4gTjMEdzE/YKcmGTPtK0Ad9BuJAHEgDFNDw3I=;
        b=RPgII4+h9b8aEYaoyowTDOdVxFNrSqrhqJln47luQfsSA1ZkmuDaaCyS7+e7bE61iE
         dA5NUZeDiYLeLyUIryoto+8K3JLGCSCK12f5fNG5jrBe/JNzMIfJRjX3xqNYMjnL7qDw
         GbLn25BnsAzHzS/8pNBQW9h2Q6z/K3O1MV00I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764580238; x=1765185038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xH/xl4gTjMEdzE/YKcmGTPtK0Ad9BuJAHEgDFNDw3I=;
        b=Z5Tc1zzxUNHuLFin5bzx3/OpuaOkobzjx5QFMSFKUPqDpqTMlAVDxaeBkb2JYOKp+6
         b4LwadfaE/4iRNQ3YFNTBvYUL9mrUsP/68HF2h+1iRq6jZhuFxcQqDhmmrYRH4Ky83IV
         jg6FlfBQPLqIJpXvmXJNvagtT5xX4XCEEFyJ3ZlEu+JjApn2WTkaXeWepcLPc4r3QVM/
         EmDCmq/clFY/uSn4vcOtfL+RkdbfSuttCbZED7Nde8Y0O0ckSyCAGfzItR+VzDFsmNqh
         ZGWUWqnCeY6e7XksOduWio29leUAlC/r+enOT14WbWKrbXxs7bshpZNItXR/duawnw8L
         dILA==
X-Forwarded-Encrypted: i=1; AJvYcCXvpdORAL/uYATks5mapvK97IFgnsDYAmT4AEn5K+gsOyjlFejE/I9IRU3dIo/5qLnRx0ccmGX9FI2fbi2m@lists.linux.dev
X-Gm-Message-State: AOJu0YycREX++MVHE6a8qArcF2nJhBOcQb1LYV+pUfQ5iyatTfyTbeoM
	Cg1X+XJDol6OrdL5v+ipTTedS9AWez7lcJzbgB9CRwmZAVVJjhiggwLvolyv7/z9tw==
X-Gm-Gg: ASbGnct2i9655vQRqlZLHk9Wb01hIjKPnkTMGqTX3Zv91GmDCDWSHwnQzwF6Fb+q/V1
	OZwLPD/LeCT42ssq6HufyZnfrL81ikRd5pqDGn7kUNowVZHjI/KwvpSwpco7xQ0WADQTUISTdlW
	y3ZoqX8+7bXTKfmqQM+nQmjEzxY8BqWoiS6lVBBWN7ZobeJ9PYcJTs20V1DGjP/SND86TnZAHx1
	a9zzss0J9tAGsu5pApgvew5gQY7HL6XHnZ055k+Et9TAHIyLm4XsVaHIlQgV/GMstI2S4lqOfYD
	KpjiFSsldUJFJYIyRdxwPvQQwxr5a/Bwo5qKdEoIXDwtr12btFjnZEM03ZuYrTpCALKu8TfCEou
	OyfVu/AvbYdxDQW7FDX42HmugOfHAeF2RMTT0jDW9wefhQghcqKBB4SG4d9P9l4naWPwJ9OTqHv
	HsivGAIciUR6KNAWvRBQrniwHV1BJtncn1znDH8i121Is37nsdITE=
X-Google-Smtp-Source: AGHT+IE0IPVwLtIcqmJPMQYCZMufINocvo6ueSZaKn00EQEiT6g2KuSYP5RewdIVgIypUPwe2Riu3w==
X-Received: by 2002:a17:903:1108:b0:295:8da5:c634 with SMTP id d9443c01a7336-29baae422b7mr220139295ad.9.1764580237703;
        Mon, 01 Dec 2025 01:10:37 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:943c:f651:f00f:2459])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce41afe1sm115517985ad.1.2025.12.01.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 01:10:37 -0800 (PST)
Date: Mon, 1 Dec 2025 18:10:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Richard Chang <richardycc@google.com>, 
	oe-kbuild-all@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org
Subject: Re: [PATCH 1/2] zram: introduce compressed data writeback
Message-ID: <tykowgjsd2gogsufmlz5vrh4eov4gnwsawrqx65ckf2s24cqwm@utqeq2m3cgw3>
References: <20251128170442.2988502-2-senozhatsky@chromium.org>
 <202511291628.NZif1jdx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511291628.NZif1jdx-lkp@intel.com>

On (25/11/29 17:07), kernel test robot wrote:
> Hi Sergey,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on next-20251128]
> [cannot apply to axboe/for-next linus/master v6.18-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sergey-Senozhatsky/zram-introduce-compressed-data-writeback/20251129-010716
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251128170442.2988502-2-senozhatsky%40chromium.org
> patch subject: [PATCH 1/2] zram: introduce compressed data writeback
> config: x86_64-randconfig-011-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291628.NZif1jdx-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291628.NZif1jdx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511291628.NZif1jdx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/block/zram/zram_drv.c:2099:12: warning: 'zram_read_from_zspool_raw' defined but not used [-Wunused-function]
>     2099 | static int zram_read_from_zspool_raw(struct zram *zram, struct page *page,
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~

Fixed in v2.  Thanks.
