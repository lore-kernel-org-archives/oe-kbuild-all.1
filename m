Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FDC205E11
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742799218; cv=none; b=BqzhdrZwGKzUGJRjNDWr5Fa7dPgfs+49eeq5ARoYPjtD3k0H08ajMZEvoByUn0JJ+afK3fJyGBYniYzVKON14/XCakJJFd3pE7blTrjv5s4MVal8POiG2vzQbfjp33slE4rYuASBMeTh3ZgFGXyVSiG3FeslBjn1rMnOM0y4lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742799218; c=relaxed/simple;
	bh=pdCIEwKzCvz8Cx3HFhEz4UpCe7dOO9/t/xUC1YiMhhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLhE9HGyuzuMLitr+Qp0NMS9b7SdyRuhjKbT+f5dWdNcdiTRw86TMyM/RksaQ2vVUDIAkagvusvSxtcsreCRI+yuNEszP8HshHscUnpWUjujiDPZcKMhVSrIGkRI8jE5wnCGQCnTXWRRTzbpvZJ14zYAXy/Lk9BWOh0Uew1XwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqKFG7/R; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqKFG7/R"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so36978555e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799214; x=1743404014; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z51FtsQACYQGUb2PuJE7oGEJnLnqgT4gRrFnNuzwH8k=;
        b=IqKFG7/R75e1zz0G7v7JUf/hEyBn+Tz9TeczxUdkqVHlfeGiPPFezVIX8sWDFO91Yy
         TYPiu9mOCzoE2Z56oR25YWCT3HHpeX0nCNqIqJHvMHR0CCVqljAWZQf/Dlc++9KzcAd9
         NQnk/51itKk6sHHvao4kCrprforWpIjZbl1hgRzGdl/7MjWrq+qqqdNZc4SKOR7JjXcp
         zcQx/b0jQ92fy+ms0dcUil//gmVAFxcZc/eUM1Y5MO87MWYkIddCKGCjUIlfKezI2n7C
         MXtak3+arfhX3dNxYKouASCdAkSKc26BxlmzkdX3BfcLxzPJ9qwno4BghZdW16DN2Kf2
         eOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799214; x=1743404014;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z51FtsQACYQGUb2PuJE7oGEJnLnqgT4gRrFnNuzwH8k=;
        b=aHt18RNTasQ+rn2+P545J256Z3MHb8KHhAFyEate/ey9Tzy/Ic0hZxzltMdTsqAGRF
         0hPQxtY568einHXOvuz1slvxves3Wk/4E3FrbGk3aO+1ZIUiRomZYAB3PGgeKycNaJ+Q
         wmLvK1Ekb0HWMjdbyacj0ctgBLDPQxT0/FBHS89+fSRR5AcUOm+qxwFK6C5g6/qUmUlc
         yeehg1v3V9XH13AuULQzu4az/NMnANsgAWXmtHRXtmoX59daYHCZAxodhLatNXASaKJS
         Z1A/tS0yzfhBkUqEiT45DR5MkUBGQWupACP8eRXoKb6l7Fqs2aYx0BVAEVN60F0EZOA7
         GUZg==
X-Forwarded-Encrypted: i=1; AJvYcCXodSRfFILON9Zb585sIHfFfrQNDRHmoeqQ5VEmoo9BEy0W0abEiRsaM1NIBaWNx4hDyKRBuhNvuJW4n/B/@lists.linux.dev
X-Gm-Message-State: AOJu0YzhyCHlyk7MrmxonpAySLsrQrPQKqDxnjTdnJEK1xAGAliBSNqi
	ZH8rShvf0uJz0PeYVxH6TlZoow9fgeEcCoem3sRCjmuzg3pmHUsYyXRMGBfVAzc=
X-Gm-Gg: ASbGnctXikiu3Tuhw7G/pFe8ZeQiHqg8tNkiZMzCrJrSkzfmilHiKwFTrHdIfWIGe72
	NFEWK+N5fA5ubwzco9wpDbrYhoIAfUDODeit136fWxBikgQLfhh4gXtU9GvZdvrA2P+Xm+c08ZG
	Bc/t9/wK/WGBhPn0gHefC/erpA+fzCOfZt4XUXkBjoD8pBt2K1qt5Wi71rP8GZsqYiZZS6L8mYY
	7YAUdBR3wQTpI2DII8sgJOLiGIEo0He7AlCPOs84Rz04AmZPTu38dRGjtPEqvN5PalGPuaae0TM
	xVY8nZEWrW9Qlr6XkZ+DX+mYlz/oIMAdGrq18QtSjZFB9sZyDw==
X-Google-Smtp-Source: AGHT+IFNkHuVnxHGLYjWFkoxDb+tykP6apxEmadVwkU7XCeI/Stw2caONaEXz5WR4zzAARXEJMMoiQ==
X-Received: by 2002:a05:600c:154a:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43d50a37825mr107991545e9.20.1742799214106;
        Sun, 23 Mar 2025 23:53:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f995766sm9869400f8f.1.2025.03.23.23.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:53:33 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:53:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Corey Minyard <corey@minyard.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cminyard-ipmi:remove-srcu 8/15]
 drivers/char/ipmi/ipmi_msghandler.c:768 ipmi_smi_watcher_register() warn:
 iterator used outside loop: 'intf'
Message-ID: <bff880a9-6293-4753-b422-d1d76e097149@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cminyard/linux-ipmi remove-srcu
head:   952a7280d75bee86fb667526304477074b678a68
commit: ed7043aba7c5cb3017e4d2d7dd6e9c5f2dbb1df7 [8/15] ipmi:msghandler: Remove srcu for the ipmi_interfaces list
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250324/202503240244.LR7pOwyr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503240244.LR7pOwyr-lkp@intel.com/

smatch warnings:
drivers/char/ipmi/ipmi_msghandler.c:768 ipmi_smi_watcher_register() warn: iterator used outside loop: 'intf'

vim +/intf +768 drivers/char/ipmi/ipmi_msghandler.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  721  int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
^1da177e4c3f41 Linus Torvalds 2005-04-16  722  {
a567b6230066e3 Corey Minyard  2018-04-05  723  	struct ipmi_smi *intf;
ed7043aba7c5cb Corey Minyard  2025-03-18  724  	unsigned int count = 0, i;
ed7043aba7c5cb Corey Minyard  2025-03-18  725  	int *interfaces = NULL;
ed7043aba7c5cb Corey Minyard  2025-03-18  726  	int rv = 0;
913a89f009d98c Corey Minyard  2018-12-20  727  
913a89f009d98c Corey Minyard  2018-12-20  728  	/*
913a89f009d98c Corey Minyard  2018-12-20  729  	 * Make sure the driver is actually initialized, this handles
913a89f009d98c Corey Minyard  2018-12-20  730  	 * problems with initialization order.
913a89f009d98c Corey Minyard  2018-12-20  731  	 */
913a89f009d98c Corey Minyard  2018-12-20  732  	rv = ipmi_init_msghandler();
913a89f009d98c Corey Minyard  2018-12-20  733  	if (rv)
913a89f009d98c Corey Minyard  2018-12-20  734  		return rv;
bca0324d09e413 Corey Minyard  2006-12-06  735  
b2c03941b50944 Corey Minyard  2006-12-06  736  	mutex_lock(&smi_watchers_mutex);
b2c03941b50944 Corey Minyard  2006-12-06  737  
b2c03941b50944 Corey Minyard  2006-12-06  738  	list_add(&watcher->link, &smi_watchers);
bca0324d09e413 Corey Minyard  2006-12-06  739  
ed7043aba7c5cb Corey Minyard  2025-03-18  740  	/*
ed7043aba7c5cb Corey Minyard  2025-03-18  741  	 * Build an array of ipmi interfaces and fill it in.  We can't
ed7043aba7c5cb Corey Minyard  2025-03-18  742  	 * call the callback with ipmi_interfaces_mutex held.
ed7043aba7c5cb Corey Minyard  2025-03-18  743  	 * smi_watchers_mutex will keep things in order for the user.
ed7043aba7c5cb Corey Minyard  2025-03-18  744  	 */
ed7043aba7c5cb Corey Minyard  2025-03-18  745  	mutex_lock(&ipmi_interfaces_mutex);
ed7043aba7c5cb Corey Minyard  2025-03-18  746  	list_for_each_entry(intf, &ipmi_interfaces, link)
ed7043aba7c5cb Corey Minyard  2025-03-18  747  		count++;

intf comes from here

ed7043aba7c5cb Corey Minyard  2025-03-18  748  	if (count > 0) {
ed7043aba7c5cb Corey Minyard  2025-03-18  749  		interfaces = kmalloc_array(count, sizeof(*interfaces),
ed7043aba7c5cb Corey Minyard  2025-03-18  750  					   GFP_KERNEL);
ed7043aba7c5cb Corey Minyard  2025-03-18  751  		if (!interfaces)
ed7043aba7c5cb Corey Minyard  2025-03-18  752  			rv = -ENOMEM;
ed7043aba7c5cb Corey Minyard  2025-03-18  753  		count = 0;
ed7043aba7c5cb Corey Minyard  2025-03-18  754  	}
ed7043aba7c5cb Corey Minyard  2025-03-18  755  	if (interfaces) {
ed7043aba7c5cb Corey Minyard  2025-03-18  756  		list_for_each_entry(intf, &ipmi_interfaces, link) {
e86ee2d44b4405 Corey Minyard  2018-04-05  757  			int intf_num = READ_ONCE(intf->intf_num);
bca0324d09e413 Corey Minyard  2006-12-06  758  
e86ee2d44b4405 Corey Minyard  2018-04-05  759  			if (intf_num == -1)
e86ee2d44b4405 Corey Minyard  2018-04-05  760  				continue;
ed7043aba7c5cb Corey Minyard  2025-03-18  761  			interfaces[count++] = intf_num;
ed7043aba7c5cb Corey Minyard  2025-03-18  762  		}

or here.

ed7043aba7c5cb Corey Minyard  2025-03-18  763  	}
ed7043aba7c5cb Corey Minyard  2025-03-18  764  	mutex_unlock(&ipmi_interfaces_mutex);
ed7043aba7c5cb Corey Minyard  2025-03-18  765  
ed7043aba7c5cb Corey Minyard  2025-03-18  766  	if (interfaces) {
ed7043aba7c5cb Corey Minyard  2025-03-18  767  		for (i = 0; i < count; i++)
ed7043aba7c5cb Corey Minyard  2025-03-18 @768  			watcher->new_smi(interfaces[i], intf->si_dev);

It's an invalid pointer at this point.

ed7043aba7c5cb Corey Minyard  2025-03-18  769  		kfree(interfaces);
^1da177e4c3f41 Linus Torvalds 2005-04-16  770  	}
bca0324d09e413 Corey Minyard  2006-12-06  771  
b2c03941b50944 Corey Minyard  2006-12-06  772  	mutex_unlock(&smi_watchers_mutex);
bca0324d09e413 Corey Minyard  2006-12-06  773  
ed7043aba7c5cb Corey Minyard  2025-03-18  774  	return rv;
^1da177e4c3f41 Linus Torvalds 2005-04-16  775  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

