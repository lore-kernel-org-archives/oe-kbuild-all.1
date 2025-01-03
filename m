Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F4411CA0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735926890; cv=none; b=K/CZ/LIUAz0ONInxcoElc5txjT7jw7nJO2LEA5gL2inhajeu2WWZuOJGs1k29z7NPbESegX31cIf4bsl582MSyplIq+KBUJ7jS5W+FcI6aN4M96HVAITlCTDU/Ujcx9B+hBtoD3KkzqH5qtax3hQ7qKXz2TEBbZX0VeC7XTSjnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735926890; c=relaxed/simple;
	bh=SZVdckYNTIpRWkjs8g8aeZDsa2OAdbUJYXdhZQCKv3Y=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iImEy/JKEfFY2tv95VOheKLl26wmm3V7ks589rg7TPS3jkveHeqU+1Gki6bTzqWePoEPFGZVpxQaatJFNz7L+S5n8Pss/bWCXMXUV+YlA6A6wSvhgKW7YZlOS62IY1YcgG2gSv8TVydKjxUojF0TRntDgmu6D/mNDB0mJh4NiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOsGaXBZ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOsGaXBZ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30167f4c1deso121761731fa.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Jan 2025 09:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735926886; x=1736531686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KEgvA8tB1Bo9zBkhjys01zsx3yfYxYnwQn1fQB1Miqg=;
        b=UOsGaXBZlW5D/kTm6HxrvpCeGXhl9xxv0p1nzzRh9V/zLUjT+ZdvZrHWSa2nVuSl6X
         2sBPfIDaS6gpmRuyjZaW1cw1n1/uy2gSdQ0GmCzvMFnUtpiyUZaBGNu6EOKjhjuriK+c
         YaexYKGNFV464na9ltc0gqSRqD8bEUsGC2cNwDxUC5a13f0bFfRfLwtKJEzvObUDAmsW
         8ptTL6oNbnJ2G82tx46Zp7v+oUCGn7z35D7hASPXdRQkKCWzYgbPkwlgUPsXVyFSL9Fd
         BI+SosG/AddAbslm8I35bGFeIh2V0keL4CrpZwWCj74lWzPfdXkEPyVg1owoiInlRqUL
         1O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735926886; x=1736531686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEgvA8tB1Bo9zBkhjys01zsx3yfYxYnwQn1fQB1Miqg=;
        b=RVVreRu2tBfu6ZDsItZTyAjADj3Yo5Vpg3XLrqsWabRmbAPSkkfuQR1ULijrPNIwKY
         Fy4/MqKFb4TYpa4afP/MVdZQiueLb00U19a8mxTKmLvDyBj0jX3taVmZ4JHButYbd4Cc
         MiEQ9epVqvWG6wZrLSxoY4nalkr1azF61ZPRY5whGPvD3XA274FJHMvV3j21mlOo7m4J
         LUaQo9RQpFQQq9VrM5L5VIJmt6WlmUeZRdDejGbGCZr0nflU0HeoPE/f51Z94u86y0CT
         oV9vkfVGUcrDusxKkAPGY69r4QgnOwYa8uFMbHAYihrZTpzznQbsrCzryJ+ciI42se6x
         w8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVruySyXYVXBzHIHKbNT7q/Rr7o83wpr6v14IhcW9J7TtC2vaqOI2iBFdKCXi3kK+d1l6aFaDK+F1tA/jYa@lists.linux.dev
X-Gm-Message-State: AOJu0Yyll1k5Uje/X8lt4Z9TlO4isuAk9hQqLn7+TsrnngFhOR70F6k3
	I7etHDPl8WaCnUDJmETeAjZh+myObcLqtsmdUcRYiexdI+usOrpP
X-Gm-Gg: ASbGncuuThOPKuM1y6R1eOwZsyJU6U8RdAK++sBmkOkajNFf0/ZgdcYp1TJdfhFxjpJ
	nIkgXnF9va2CwbQkywWGmr4S8QtgF7K0Ci+MUWWhJZje86YArXNxC6Orn801WYY/Xo97JubF5ct
	9vNyZrZCOHY+1jvV6GDv0xpECqJdUIL4qczjvlSJqzXy+WPYwbvF/jpJ8VLEgtS79Z8J3FCf+Pw
	ZlrctZX5dgiYYefyzdaumTfCQRnnFBKuyWshNqpTuUbTJAISkwtQDgxiN7nQH8JxapDhIq+wwxD
	IXI1dT/w
X-Google-Smtp-Source: AGHT+IEo6wPn0qCWzKY0C+BpJJ2FrhB6wFI0VSgUrgzC/cUGQjd2a/ft8sIEclBBf3mnwJNyqVPpIQ==
X-Received: by 2002:a05:651c:2127:b0:2ff:d5c3:61b3 with SMTP id 38308e7fff4ca-30468552129mr164783271fa.6.1735926886094;
        Fri, 03 Jan 2025 09:54:46 -0800 (PST)
Received: from pc636 (host-90-233-198-81.mobileonline.telia.com. [90.233.198.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045acd7b0asm47498281fa.0.2025.01.03.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 09:54:45 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 3 Jan 2025 18:54:43 +0100
To: Todd Kjos <tkjos@android.com>
Cc: Uladzislau Rezki <uladzislau.rezki@sony.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: Re: drivers/android/binder.c:1819: warning: Function parameter or
 struct member 'file' not described in 'binder_task_work_cb'
Message-ID: <Z3gkY2vbLSgrbWaj@pc636>
References: <202501031535.erbln3A2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501031535.erbln3A2-lkp@intel.com>

On Fri, Jan 03, 2025 at 03:39:37PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> commit: 28b3ae426598e722cf5d5ab9cc7038791b955a56 rcu: Introduce CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
> date:   2 years, 8 months ago
> config: csky-randconfig-r022-20230522 (https://download.01.org/0day-ci/archive/20250103/202501031535.erbln3A2-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031535.erbln3A2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501031535.erbln3A2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/android/binder.c:233: warning: Function parameter or struct member '_proc' not described in 'binder_proc_unlock'
>    drivers/android/binder.c:233: warning: Excess function parameter 'proc' description in 'binder_proc_unlock'
>    drivers/android/binder.c:335: warning: expecting prototype for binder_node_unlock(). Prototype was for binder_node_inner_unlock() instead
>    drivers/android/binder.c:1155: warning: expecting prototype for binder_dec_ref(). Prototype was for binder_dec_ref_olocked() instead
> >> drivers/android/binder.c:1819: warning: Function parameter or struct member 'file' not described in 'binder_task_work_cb'
> >> drivers/android/binder.c:1819: warning: Excess struct member 'fd' description in 'binder_task_work_cb'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'offset' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'skip_size' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'fixup_data' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'node' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'offset' not described in 'binder_sg_copy'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'sender_uaddr' not described in 'binder_sg_copy'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'length' not described in 'binder_sg_copy'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'node' not described in 'binder_sg_copy'
>    drivers/android/binder.c:2683: warning: Function parameter or struct member 'procp' not described in 'binder_get_node_refs_for_txn'
>    drivers/android/binder.c:2683: warning: Excess function parameter 'proc' description in 'binder_get_node_refs_for_txn'
> >> drivers/android/binder.c:3510: warning: Function parameter or struct member 'thread' not described in 'binder_free_buf'
> 
> 
> vim +1819 drivers/android/binder.c
> 
> 7980240b6d63e0 Martijn Coenen 2017-02-03  1806  
> 80cd795630d652 Todd Kjos      2018-12-14  1807  /**
> 80cd795630d652 Todd Kjos      2018-12-14  1808   * struct binder_task_work_cb - for deferred close
> 80cd795630d652 Todd Kjos      2018-12-14  1809   *
> 80cd795630d652 Todd Kjos      2018-12-14  1810   * @twork:                callback_head for task work
> 80cd795630d652 Todd Kjos      2018-12-14  1811   * @fd:                   fd to close
> 80cd795630d652 Todd Kjos      2018-12-14  1812   *
> 80cd795630d652 Todd Kjos      2018-12-14  1813   * Structure to pass task work to be handled after
> 80cd795630d652 Todd Kjos      2018-12-14  1814   * returning from binder_ioctl() via task_work_add().
> 80cd795630d652 Todd Kjos      2018-12-14  1815   */
> 80cd795630d652 Todd Kjos      2018-12-14  1816  struct binder_task_work_cb {
> 80cd795630d652 Todd Kjos      2018-12-14  1817  	struct callback_head twork;
> 80cd795630d652 Todd Kjos      2018-12-14  1818  	struct file *file;
> 80cd795630d652 Todd Kjos      2018-12-14 @1819  };
> 80cd795630d652 Todd Kjos      2018-12-14  1820  
> 
> :::::: The code at line 1819 was first introduced by commit
> :::::: 80cd795630d6526ba729a089a435bf74a57af927 binder: fix use-after-free due to ksys_close() during fdget()
> 
Above warnings have nothing to do with the:

    commit: 28b3ae426598e722cf5d5ab9cc7038791b955a56 rcu: Introduce CONFIG_RCU_EXP_CPU_STALL_TIMEOUT

Add "Todd Kjos <tkjos@android.com>", owner of the patch, to sort those warnings out. 

--
Uladzislau Rezki
