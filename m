Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0062A1B0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717350226; cv=none; b=IzU1iKvA5Tnd+pJVNf7Jlg3FXGwtmU8nL3xhsMra5QE9+86kRFHzyFTwBU8FphENdwG62mvPet0AbviRzyB0ThAfy1uFlk3PrO9u4l6qQ7R9WyGfwDaJXpmcHbB5npFR39yI1sUfGWp9K35Oc8zcXLcVCHVPVUuxIIBXhNj9uIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717350226; c=relaxed/simple;
	bh=Af/kEOqNbwUOa3kAk/ZbOge45GldzWBilvQi/CceEqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqytfQfKBXqHOtL3PtrQgFZIVbygUUhtA1G3MAYBzar6qG2OWyjaVavrRSzFb79HXRBB9Xc1ncs7cvu53isN7ApcVJTxEJsDHIekX9OxcQNQnWUmsfqKI4TkJNO+qy2QIZ5PcvBk71Z/88cdMbDannxUgSHXQB7Je2k4PNkQWiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUo/+kTK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUo/+kTK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6538a8e5eso274865ad.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Jun 2024 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717350224; x=1717955024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QVYvn45xuKCqAmfsQN9o8nWTGJ8RKVT6+1YtcfyGBkw=;
        b=gUo/+kTKhuwYaT5EJWv/j27YR8U3g3wExGslnplEtz3qBE85vk9zftTTERuiaqgCUX
         Mc0dw/W4rXocpMUaR5f0s4n0SOU3Lf+SVmLFBD7lN+x5qsg695meUmmx0MxZ4EY6Bbsy
         gmxY645MrxZgCDlJTu2WhFaRlylLy3f04BYB5IPXgNfUW4X9lLWz/Qrz3d9TayuYG/Rx
         y0Wd1LaVZQF9xTcBcAtiG5F3tB0bL5FTUZzimum+ofXjDscqol6GfEJNWX1SYdYmjHWz
         dK5/psE0VvHinNgvntJpXr32EQGqcOZ3GSHEvSPl/TNSoni5cOs3LF821KaKHS1iqXhf
         Cpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717350224; x=1717955024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVYvn45xuKCqAmfsQN9o8nWTGJ8RKVT6+1YtcfyGBkw=;
        b=NVmvthC494N9ZBgared06MaGz4PaSSoJM0lhNBFz/nSUKqGA32B8wLhW8ns+TaVGOd
         HDPk5MLseEgCtSmh6cELhfWJQJqhcMzt2HwztOLEMMGmh5cfoimpgD4gBpVn8JQ7kth1
         9rKEgHc7IMVLPQXUEH13DsB1CXB82MzW2EHawHCLM+hNmHmnNsrE/1uPb6PLNw2cmAeT
         zKdnjZju5RrA1pNfm7929jdaOuw8stc7PUNquapjVKY9EwJitdzabVNruMHqnPVF6P4Q
         5gOzNAT4/OWqmlwGmnR2koo6HaVQ/vqzYBsetFFfMPTSLdNLAUvtUf/OWlwjqQOURzZR
         A4Dg==
X-Gm-Message-State: AOJu0Yxh5BdPziqdqM9+iDqdxa6okq03CC08MAalVdy4CEzYScPxmd+P
	ZRzVaG3YqZGeE23RmettpeGlfzwPfpHz8D5OwM297oCTwyilFMEI
X-Google-Smtp-Source: AGHT+IEA/orTGFjeW7gsNTSl5epQsQ3MkyyvV4S9DpL38mexliTyPs4rfRg2cLoDMIIuPJjEfC3bwQ==
X-Received: by 2002:a17:903:22c3:b0:1eb:50eb:c07d with SMTP id d9443c01a7336-1f6370c34c3mr80842555ad.4.1717350224447;
        Sun, 02 Jun 2024 10:43:44 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632355498sm50159925ad.66.2024.06.02.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 10:43:43 -0700 (PDT)
Date: Mon, 3 Jun 2024 01:43:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ian Rogers <irogers@google.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 38/65] fs/bcachefs/clock.c:150:18-21:
 Unneeded variable: "ret". Return "NULL" on line 164
Message-ID: <ZlyvTI8Lf50Q634D@visitorckw-System-Product-Name>
References: <202406030001.jwsq6DZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406030001.jwsq6DZp-lkp@intel.com>

On Mon, Jun 03, 2024 at 12:46:08AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   54524b845fbe070c5401141bc4ff2ec3f01f1e72
> commit: cf66e6c3b24c5aaf365c54bb7dc8b9cb01f47f4d [38/65] bcachefs: remove heap-related macros and switch to generic min_heap
> config: x86_64-randconfig-102-20240602 (https://download.01.org/0day-ci/archive/20240603/202406030001.jwsq6DZp-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406030001.jwsq6DZp-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> fs/bcachefs/clock.c:150:18-21: Unneeded variable: "ret". Return "NULL" on line 164
>
Hi Andrew,

This error occurred because I forgot to store the minimum value into
'ret' before calling min_heap_pop(). Should I submit a new version of
the patch series or send a separate patch to fix this error?

Regards,
Kuan-Wei

> vim +150 fs/bcachefs/clock.c
> 
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  146  
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  147  static struct io_timer *get_expired_timer(struct io_clock *clock,
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  148  					  unsigned long now)
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  149  {
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16 @150  	struct io_timer *ret = NULL;
> cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  151  	const struct min_heap_callbacks callbacks = {
> cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  152  		.less = io_timer_cmp,
> cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  153  		.swp = io_timer_swp,
> cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  154  	};
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  155  
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  156  	spin_lock(&clock->timer_lock);
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  157  
> cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  158  	if (clock->timers.nr &&
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  159  	    time_after_eq(now, clock->timers.data[0]->expire))
> cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  160  		min_heap_pop(&clock->timers, &callbacks, NULL);
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  161  
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  162  	spin_unlock(&clock->timer_lock);
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  163  
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16 @164  	return ret;
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  165  }
> 1c6fdbd8f2465dd Kent Overstreet 2017-03-16  166  
> 
> :::::: The code at line 150 was first introduced by commit
> :::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
> 
> :::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
> :::::: CC: Kent Overstreet <kent.overstreet@linux.dev>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
