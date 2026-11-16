Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808922;
	b=ReA6rGD2tYbt3pzu6qoYx3mi0XHKrAi6NPX9/wrUOkymtTdxgvh6vQGqKXfUVXXmI6hZ
	 +i+lMNCCKCOc1xZvy3vErl5iCsCKiroecca6mEaYlZhsd6krd35EZleIADe263MYvulvd
	 sG3NMwCCqFn0EuVioKMisHrfMBVwV2FOdwrLqRQjkVH8OhDfnh6IwhEejZYl3OsWq5XnM
	 p8wsSjHFhkoiTVsNtz5jskymCyzaXijbk8009c7Kur/YeF1s6JmBP77nzfWG8sJWxGEyy
	 YujcIaRCqq2NjS5BN9AeM4gjoPTy/ZScnI3/SebRUJ/cdXiYeGGKKKvt9+SUAKrdFtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6FNxbnnu/0yNQoPXbolulSs+Roxu0nUNixTH/GF4RF8=;
	b=Pb+apcez/TrecEXDBs6jdwjz0UHUt/LShdtX+oxOo+8MGn8rSCVLSptGok+Fq2PV6i+m
	 EPqI2iYKTdHVkvnayQbcwPQb8saaJ/n3UkSqdMSuxuvmqmgiZe6tw2H35kworkCa6LL1R
	 pn7w5URVy0tE5/cRX/E1V+o26qM5B8E/W1urxOpjKkWs3IGIFUwkIk63I1rUB3H1n0kFI
	 tWM3Q5fDZEaxrNP7oVn82V4Mx4FP2Y4dPcCEKu/sSM5ngjCF1iCqMHB/RGmNfN8fyodm1
	 +Yqq/G/JXs/ciWEkO7yR81AvPbz140y6caPR+c4jZUuqaCwYnHse1Os8hZ1SZ4CW6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPRzpq2n;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BEA606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 06:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPRzpq2n
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso22433225e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 22:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808921; x=1795413721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FNxbnnu/0yNQoPXbolulSs+Roxu0nUNixTH/GF4RF8=;
        b=aPRzpq2nOU0mR52VyHYPPsi5MpEmN0Ywe8sEbxphCZIQvce3qUER2/AVG+RCncLjcW
         H8bvDYjiFg8jKW/nLMIe8k7IZE36lJXJfXzJxW9uSI3xY8gr6Q7Xkxtw7rmlFtox/D4R
         hPsRfQ7yAP8rz6a2t8ZcTf5cdt9MMgD3Y6kZ/PUGfoxwsioNDUoOkPbu7Dg2J4ge2dkK
         /wxDmXE8AUTk92zF4aUluq7mOD+u3xCmWkqN/zvPcTnM4WRiIYGRJBH3YWLlyQEcCK1N
         1E9bu1kWVPkCmVJaVzV4N5mf+o605SxHIBtaK0x2CMrxzew8ai5/RTEdkntHssrmnU0U
         GOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808921; x=1795413721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FNxbnnu/0yNQoPXbolulSs+Roxu0nUNixTH/GF4RF8=;
        b=Q3b4+5a3vVp7sgtXqV2qITW5JQj7bUuMCC/ZulPvvtTA8746kdIxQCAQ4ByVp02uRr
         xh0py5bix5PIgNc0NnhCYvJtn/X4zojIDxfI83j57UieMJbW8eY0Rh6vbIGIWrtCywyd
         QYk9lzU5PH/3ubnHYh8eUVmUwtUmkDm7KJx4zQzciaylbAx+czU6Ezvzq47tZfknwN1F
         SDZLgy1kZYgQNf4hqJ8bEBeoTUNVu1ZM9faKRCzTyHz359sFM/Er1lgVAEzvhOanGfbZ
         o+WA+VouI9S4TpskDCJhOmviTtkhGzd6sTmpb5SDKnOA6VLJ5ZHDBC1NQhzoFCqElk5H
         1U+Q==
X-Forwarded-Encrypted: i=1; AL+hErEhtrNfZOw9P891ZlAy/xyX0+2U5v7JP7gxqwc09GQpTptkNyqzCm7J6mea1Hr7JHBrmV7+xP4+z9Whnvhd@lists.linux.dev
X-Gm-Message-State: APuU4Z/Io0QXQuyNsx4V4/gX+8/nR2q6FxS9w0T6CCuuoou3VnsAPhgR
	aLYdrUxDT8eqZoQINfm49phDV+H9PbQou4xM5Q/vCDH+CJthoF0tksYt
X-Gm-Gg: AYBFou13gtZys/FCnFQu0AaYMULQGshUnZn29sChpn6Hth8MjeQc9AyhrCgzfnCvVwT
	LrzwPfu+nMzcW/r8ItC0IO01F9mrsnncrDTKepW++72luKQ6CwkdsCcxW4tpzTZYzvO7p5zYCxU
	BY+Wfi2WIYJ9HHBW1PtXJVx8dU3f6bYV9+5QQ2MhHV/lACR2D47t6kz0EYPzNk2KeBYkFezneH7
	LaUsOz4hMtQW33JNhLBd0evHD8nRcLBn6R/t8zGwhnUfMYyqDLNM9GN04bhSUTbJcAYHLYu/w56
	Bcmf9nWAkicKnQqu3zsuO/0E/fS0g+CVH72UWBZx9R6c3I7dTlQPHKavEpi2CW+fYK0GCh76wgC
	1DaZaoA1I6SAQbCVBFRuROkx8VCXN10mmOuKBuDV2G0cZNY3zAaX33J6b4i9ZBlDqLeP/XjKEEI
	CsDJzi4JNcp6ovUU83NdQpEyGgwDMal/gGT2AUR98Rn3SNEeCA12qtkCPFUeTAGzLr7sri4r0Jf
	OYzu1MVDbLAqorCtucRajBmUUBQMZdxOr2nd/03KYraTHBe8r+Q1+bnGHOG0owOjstZBexlg71A
	+nnUvg7/pDjUBihkjxQtX3TU9dYmvSo0KvsCSeDGnO4Jo8+ronwx99r46dD778v8n993pf18pg0
	sBINvyM+6BY+X4OeoZekBAJBDQFPXNOk3nP9fhseNyjUmZEKjB68CV8E4Bqtn/96DNi8=
X-Received: by 2002:a05:600c:c165:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb685ecce6mr91958735e9.18.1794808920781;
        Sun, 15 Nov 2026 22:02:00 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm372885465e9.12.2026.11.15.22.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:00 -0800 (PST)
Date: Mon, 16 Nov 2026 09:01:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Phillip Lougher <phillip@squashfs.org.uk>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	mm-commits@vger.kernel.org
Subject: Re: [akpm-mm:mm-nonmm-unstable 139/151] fs/squashfs/namei.c:283
 squashfs_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <avqcVK8VjSl6RqJ_@stanley.mountain>
References: <202611131955.0Gd7ipSP-lkp@intel.com>
 <20261115215756.839150412f8e2ce4bab5105c@linux-foundation.org>
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
In-Reply-To: <20261115215756.839150412f8e2ce4bab5105c@linux-foundation.org>

On Sun, Nov 15, 2026 at 09:57:56PM -0800, Andrew Morton wrote:
> On Mon, 16 Nov 2026 08:26:18 +0300 Dan Carpenter <error27@gmail.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > head:   152f0559e66c079f717de375f133ff127afb1f58
> > commit: 5213b0a08263b2191b86b046c3a63f11e8abc399 [139/151] Squashfs: fix variables in directory code and add more sanity checks
> > config: um-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131955.0Gd7ipSP-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
> > smatch: v0.5.0-9187-g5189e3fb
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202611131955.0Gd7ipSP-lkp@intel.com/
> > 
> > New smatch warnings:
> > fs/squashfs/namei.c:283 squashfs_lookup() warn: passing zero to 'ERR_PTR'
> 
> OK.
> 
> > 5213b0a08263b21 Phillip Lougher 2026-11-11  224  			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
> > 5213b0a08263b21 Phillip Lougher 2026-11-11  225  				goto read_failure;
> > 
> > We need an error code on this path.
> > 
> 
> How's this?
> 

There were two paths which need an error code.

regards,
dan carpenter

