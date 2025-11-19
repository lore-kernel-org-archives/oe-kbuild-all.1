Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61B2D8372
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552533; cv=none; b=kpae2MZl2CGc+owQK8z5SKpydaOtT0Aj2HtDu42q6rd0ezAhRMZY+KLwp+jkuxi8ZvnHRdm4WKCaO7eE/4jLogyrxaQec1dJ5eb4pTZSi3fqAW07o3UtIu24SM989/ffYDTaVEJJN5uGE6kJgZlQmf9xPZyJj+TsuYSIOGzauSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552533; c=relaxed/simple;
	bh=YXVZjEaAOYhdLALkG6iQfHDi4t1TMB3ZmQQl/3koAtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uzn9o88gitk67yNum6WrISdpLEwdvBCd6TuNMD1Ohtf8POiVR5UeolIe+aiTZlnJJZ1B0GCDGldvC6JJNN0uJHUKVK3bU6aYSXzWJ7VPxeQ9l4HdzQrAYi93Fsl+CLve8dTq3dkH8FljpO+Jop19j4IIzRiv7sno1tTMB4quAcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zndQ3uuV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zndQ3uuV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755a7652eso44721795e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763552530; x=1764157330; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKNQEgtNgQPS9Mtp6l7lpMTlYq37qRn7txqE2SJWZsU=;
        b=zndQ3uuVcsFmtp6wMhbRHJv88PsaTsgQxiTU5Yr9ElCQ09Gd9aav8cpQazCA6jGYo7
         3wlg9W1OOkGBqhE+BUeUWi8crOlpdtLVjVMAZ4EZGjt0fdU6D2hXXz4py1NJ/B0K1H2Q
         WomBKmDAelYFL3vd0li3RNh7aAbzA0vx+0TsXf9Tjr5B9gvKfkUbEYmV60mTSvgvMgwL
         P0eplzTbEy/WUQMfTM8y4Kjl2mpJ4As3DzqEYL8jrvCb6OYGkYJzJHw1kk4RE+ayQ6ZY
         wGDPVEnMXVvqQTU0QwR1jfUXOHPQj/z1M8KKCJoYG7y7uTGmLdlAhvO3CMqdZx/ocSPM
         ENCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552530; x=1764157330;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKNQEgtNgQPS9Mtp6l7lpMTlYq37qRn7txqE2SJWZsU=;
        b=oJkRrSjtPyqmyyB6qkq8z4lUlEFonxVfhXbgxJCdhCcZR/UpthmvufSZTXkTuNLIJJ
         vUwAJUaD4G7vA3V+OHmHqQXYzWQ0ehGpFTE18Oe/W92quCLpR5jKZ+4mKT216oscxMCk
         xIn/nwetpKUbXouAwvK1RQrYN+jtfjhZk4Ao/Lsoj/xr0DinO8XSvkFrsLS+NNMvEDIN
         p10oiHjj4Nwwi71+DMqirbiiLrOMMDa1aKgXoQAJmKInOe3FI8fkqbRy4Nx1XSkb0lQz
         odN1CLRCiAxIuqJ23nryvdPu4ZLjSlczkIkXT6MvbhG6gDUQMnQFK+vEIHxPUHFevosE
         8MnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUorY/btvPaIDMeDsIy92ZG4gYPJeEmE2+Pe+wiW2dnEjXF0TJYK+Tg0qf+R+RLF1wsXr2DhNSLcZAIeaV1@lists.linux.dev
X-Gm-Message-State: AOJu0YyqRBwrnX6ZTSFWJZFOFQL/RCA6CWRqyxUAQ+tXWHQvBjpt+X3f
	fOCF+XE5IPgmDoITW8nS250NynCUtXjBpmkAv90E8XxlWgI0tJKm0qVapDtkzV3JzwM=
X-Gm-Gg: ASbGncsgY5FVJxIYYkOUyuqenPENgWN6pNH7hqhKKNEXdyX50J7xBs+qJmHrF9VVN2b
	9TUc7SEGBjXzNSiV0FCrTnGkfUm/z576olgU+KoXxgdCsFVzPxFhPlmuslB7fPY5q6tzZPDKj4q
	e0kH7+mtw1UqTzTXfACaAGRfPk5sc2h4EUm2f81A97ZTtBUneujVCJRX8c9+iurR9/yKK2XNXqL
	E7TN2HLQlLrJVRgYi4Xn3HysnkrsAI7/g+J1xRX5e7tY0EELG59uZiPFvvHFHIv4nQ5sfXxt0tO
	FpD7J6+/2KyThmb/mKQZyk6PT+SLFLjyDvvI0Fw74bnicv079/5LPs3b7kNdLIOnYoEsviuPMHQ
	jTOk2/hRYervRE6l4zwNKRA9ySVKt5YfKlS5Uji8eHl1Gw9jMxUNvNQEgyPjb3handbOcl1b1bM
	3EI6X3ttvzFz96D4r/
X-Google-Smtp-Source: AGHT+IHsZMSMa866adrXMNEwnjC95hxQhlprmTn4XLH+22Ej4LyoTqH4tdcZp9JazbS9ZFd92Rsu2g==
X-Received: by 2002:a05:600c:1c20:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4778fe4f635mr196492035e9.5.1763552530111;
        Wed, 19 Nov 2025 03:42:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42b53f17291sm37588199f8f.32.2025.11.19.03.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:42:09 -0800 (PST)
Date: Wed, 19 Nov 2025 14:42:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 464/903] fs/bcachefs/journal/sb.c:213
 bch2_journal_buckets_to_sb() error: we previously assumed 'c' could be null
 (see line 197)
Message-ID: <202511171844.Cww9WIp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   ca748d1945bfa1208b1d32e5a246a352b09ad271
commit: 3d1f4469e2743eb10d5450c26d37cac439a002f1 [464/903] bcachefs: move journal code to subdir
config: x86_64-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171844.Cww9WIp3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511171844.Cww9WIp3-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal/sb.c:213 bch2_journal_buckets_to_sb() error: we previously assumed 'c' could be null (see line 197)

vim +/c +213 fs/bcachefs/journal/sb.c

2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  191  int bch2_journal_buckets_to_sb(struct bch_fs *c, struct bch_dev *ca,
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  192  			       u64 *buckets, unsigned nr)
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  193  {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  194  	struct bch_sb_field_journal_v2 *j;
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  195  	unsigned i, dst = 0, nr_compacted = 1;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  196  
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10 @197  	if (c)

This assumes c can be NULL.

25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  198  		lockdep_assert_held(&c->sb_lock);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  199  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  200  	if (!nr) {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  201  		bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  202  		bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal_v2);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  203  		return 0;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  204  	}
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  205  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  206  	for (i = 0; i + 1 < nr; i++)
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  207  		if (buckets[i] + 1 != buckets[i + 1])
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  208  			nr_compacted++;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  209  
4637429e3946d0 fs/bcachefs/journal_sb.c Kent Overstreet 2023-09-26  210  	j = bch2_sb_field_resize(&ca->disk_sb, journal_v2,
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  211  			 (sizeof(*j) + sizeof(j->d[0]) * nr_compacted) / sizeof(u64));
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  212  	if (!j)
09b9c72bd4b77a fs/bcachefs/journal_sb.c Kent Overstreet 2025-05-28 @213  		return bch_err_throw(c, ENOSPC_sb_journal);
                                                                                                             ^
Unchecked dereference.

25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  214  
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  215  	bch2_sb_field_delete(&ca->disk_sb, BCH_SB_FIELD_journal);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  216  
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  217  	j->d[dst].start = cpu_to_le64(buckets[0]);
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  218  	j->d[dst].nr	= cpu_to_le64(1);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  219  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  220  	for (i = 1; i < nr; i++) {
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  221  		if (buckets[i] == buckets[i - 1] + 1) {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  222  			le64_add_cpu(&j->d[dst].nr, 1);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  223  		} else {
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  224  			dst++;
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  225  			j->d[dst].start = cpu_to_le64(buckets[i]);
73bd774d28d2b2 fs/bcachefs/journal_sb.c Kent Overstreet 2023-07-06  226  			j->d[dst].nr	= cpu_to_le64(1);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  227  		}
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  228  	}
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  229  
2640faeb1741db fs/bcachefs/journal_sb.c Kent Overstreet 2023-03-06  230  	BUG_ON(dst + 1 != nr_compacted);
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  231  	return 0;
25be2e5d4a051f fs/bcachefs/journal_sb.c Kent Overstreet 2022-03-10  232  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

