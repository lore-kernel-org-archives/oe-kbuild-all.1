Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AD92D7DF7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760692799; cv=none; b=AFzZHCspwMZRbgsLerKnYIvtvGL4u9M87o1ha1kX0qNe2e0IzXQh1iIxOuZzY2G7ew3LayLesPx+NGpITw+0kw587b5R8Wo1MYbaWPKLjrI8QAJwChHtSmRSSdyqUUiIcPPsaXd2bTvEyyV1p0a5GSfZ+vgNbKeSKt2hKrTjr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760692799; c=relaxed/simple;
	bh=FqcMRwFrInYrZOE7KriUyn4LQ40X/JXpvDnENpAmkUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDdDCia1NMYMV141hLJ8YPi453v+ZDrJ8a9qGxM+rS9wWwt0dagUHMQbyxR4bL1SaRWgen5camBJXjxvmjyd5kE4BAK4neTNnDkfI197EUCKZ5ggcEpt8XVcbysH/3SpcYw2T6FrIDysfl7fAdPhhA3FlMKC+BO9iQ+HEY3K8mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DFxhVDIU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DFxhVDIU"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-426f1574a14so953937f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760692795; x=1761297595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPMqXFh/dNNEvS2vqa7Ou7b74ZgoKM83pdwBrATLUys=;
        b=DFxhVDIUZQ10raKq7HkPwcwlnhT6LV1gF0JmLz3b1cNsQvLlQDxFLZjwCehl7uqbO8
         SL412tim1vcQuS1kmqU31dIgz9vEnWL8qsf2+/rgpM7+NwNxjXgTe4uZxMZzlaOEgrvT
         5wTnaS64PxagI1sAZ1TsWNXjt70gYehbRZ0kNT3mHj05krlVdPPq9fV37NoA+cxHguJy
         VPTqxLr9g6FkP2XaSNl2c/POvnm6gxFtTPmny3m6GkEXvUMeOwjW7AjoXd1B42pfjNpM
         9bBPk3frk/CiC2CgYBWx6rjVBvHciSQBf2bVRoaG9gtgmUZlAAqnfJ37ApiXLSGBTWAf
         WyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692795; x=1761297595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPMqXFh/dNNEvS2vqa7Ou7b74ZgoKM83pdwBrATLUys=;
        b=XJ5qDZKuZ+nGd0ku8c8mfxXkWrX2zVsb22t2yyuWcPNcdKoImqbXb2hrKFAg8FRjPV
         ZH+3z4omQ6t0kjDgaTZmNmG1ayAaza8pHN/wPe7TCZIDaWn8NK6sfWJiq8r9j+3u8vji
         dWtmaHZZZfCHpDtF56UPiSGgjOL1rGVnG+V5W0pHP+Gh14xHGkSxtULN5SdwymFYhDuc
         qgLeQ2zcAKSmRLXfzHToAe0szDVxiKzUZQ7RKiOD+PNBUQ5zYgTTMLGwLHGOHX4C3M0l
         l1diw7JhcB+JcHBlir/sfyekf0g0/+Gguhhq4dLk26n9jN2BQFscxskecLzGLFUy2OLt
         RvAw==
X-Forwarded-Encrypted: i=1; AJvYcCUO9fEktoKF6CPfe0HT2/3ZkpQLTOBOTW3HAegaE5ZI+mQGmHs7ihK2iY5N5ErFRrE1S/hKckrlzC3apQ6I@lists.linux.dev
X-Gm-Message-State: AOJu0YwaOKkhbFqTGogw4xZUn2UmmnOXQMLDl+YChJl9H+EW0rt/Qb/b
	yIwC0PmVp0Tk/Ec2lrkTtvcurvceETBH7NUbFq6vtSf2yLeKjMD/DECvOYNbp5dT+g4=
X-Gm-Gg: ASbGncsftbYzr3I48A0BIncoYo5ppna7lflmugTlERp6KJ5eAIQ98g1y2aVhRXrolmZ
	mrkl8MdFOqFz5y7r/6XWAYZwbcDSfjzZUmwiVpeVBbo2S1jdEDjybPoOTDimgqnrfjJM/J3Tl5Z
	rTuaX+Sf7a12e+qM+mVenRO2td5qnHa+MV0qAyba7m/SmxhYa/jTXWC8i0yJ/lHqtWllWboz83x
	tITme3WyffNcQQmYXgwvgithWyc7X8xDWVKQx5aY3kgLLvK8OQ45OxQ0a2Zs8/IbHUsgJl5w31d
	n0rvE7thVqIOFRkAGNp5f49/u/Q6HErn774tbia+ND/2QVNFlkYDjIftdx4X9ykvH5ymu3BrZM7
	HovSozuNRA7aGkmH2nHHD/7vjbkCtgWpiX9um09+RA+DsVqvp1DhyPerSJBu/B+uNvPo14+dr/l
	6/jwxwxkQpH8cdJg==
X-Google-Smtp-Source: AGHT+IHdkNU1vaYBqPsplsa4EJzoy/8Ut9krm5VAfFBmljD+VWsSOkiW4JEtZfw1U4XSgBeWnDsD2Q==
X-Received: by 2002:a05:6000:258a:b0:3e9:9f7f:6c36 with SMTP id ffacd0b85a97d-42704ddc6a4mr2107502f8f.54.1760692795387;
        Fri, 17 Oct 2025 02:19:55 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c29sm73120275e9.12.2025.10.17.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:19:54 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:19:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH v6 3/5] printk: nbcon: Allow KDB to acquire the NBCON
 context
Message-ID: <aPIKOOBfOH1cg01F@pathway.suse.cz>
References: <20251016-nbcon-kgdboc-v6-3-866aac60a80e@suse.com>
 <202510170949.NTx9lt0p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510170949.NTx9lt0p-lkp@intel.com>

On Fri 2025-10-17 09:25:53, kernel test robot wrote:
> Hi Marcos,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
> base:   3a8660878839faadb4f1a6dd72c3179c1df56787
> patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-3-866aac60a80e%40suse.com
> patch subject: [PATCH v6 3/5] printk: nbcon: Allow KDB to acquire the NBCON context
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170949.NTx9lt0p-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510170949.NTx9lt0p-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/kallsyms.c:19:
>    include/linux/kdb.h: In function 'kdb_printf_on_this_cpu':
> >> include/linux/kdb.h:229:63: error: expected ';' before '}' token
>      229 | static inline bool kdb_printf_on_this_cpu(void) { return false };

Great catch! This should be:

	static inline bool kdb_printf_on_this_cpu(void) { return false; }

No need for v7. I could fix it when commtting the change.

BTW: It is interesting that the robot was so quick this time but
     it did not catch it in the earlier versions of the patchset.
     Maybe the robot had a summer vacation as well ;-)

     I am just joking. I know that any resources are limited and
     could not test everything. It is great to have the robot around.

Best Regards,
Petr
