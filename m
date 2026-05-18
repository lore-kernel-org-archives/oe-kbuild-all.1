Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EA23183C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 05:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080539; cv=none; b=umLECHAsdQspwRuTF2098Ou87U0dHNUhtrVGKbLbgKBP1RyPbqbMDz8mqu0K7/sUzXll9nQcL5M6mJmaUAoMzfwQaKtn2rnPsxdM/2mHOdr1ZFMBJhj/dhFB41IHKNSW8k2ow5kmnMDC1DPRa8YSzKEPy3QQSpCsvTmeeSid650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080539; c=relaxed/simple;
	bh=wJk729J9hFcJayciAmfuS6hEE3iMNdLSijZ70g86RZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apn3jwr0JQm2HORzGlN90FhByGZm4d84/3I/jJ5NkjTXvN0YosmU0+ccvqFzu/3LRtVOnEqYeFs0x2nsnVVbHN4mtei1a2BU/wLDakhU3PttMrodsHEs9gGfSzls2hpiyiSGXy/A1q73sRscFzyydICaJf3M6cJh6bvvfm6ayvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxSxKQwl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxSxKQwl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso7314595e9.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 22:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080536; x=1779685336; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4b3d+dkGn2jAB9QFWopKTNQvof7u0/leWFWS+6i69I=;
        b=lxSxKQwlr452C6wSqpUJOR+paoO3bK3g6dM/3jxb5xslrFydESg/G3HQCBf4Svm9Y3
         qKktA7VN+Jqsiu1ExarbERFMNy5Ji/FmmifmxZHeFDCYlsEnyOS399f0y/BrlxzXxFF/
         rlW5A698nGCbT3xF11uIj+XUEjJNaTjn9c6O0Tcgu5UYRBRCoiVCU76ffhz/ecoJj/gr
         Cvl+KAIF/Tpu8LsSPDI6aGj7rfK6waQUTF7raeB2iZfWbeDZaqLgjPqnVmUG63bIiRwO
         dAT5ZlCvTZC1emOjMEbhRWD+NDW00dDQ6ryspzQd4kIUEKVc+HDbyY437wjvAwxXAtQp
         AhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080536; x=1779685336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4b3d+dkGn2jAB9QFWopKTNQvof7u0/leWFWS+6i69I=;
        b=Az+aicVwpkLthBLp53IRYB8FBKak6SHCYnei0v8zwR/P5n3onWRHCEe9BR3g3xKfnp
         kEWuPnCSV8Re2l92DVceV6AzbVl1EJGkyjU5bZWFkBzFf8XC65aG9cfZelT9puaFvQG3
         3KUxprEAi+N9ONIyRStlAtK4D3YUQXFyBf3304zW5Le8KrMUTWD4dgivgvtCYixaKEGH
         qh83k0OLBUdx3l5iBAHJ9yt1vJSku0JIwTK5+FRn0RGlIunWaGQQiAOjs2rgPA8v5cE9
         dMFBLQmkIF3rNYLx1aCqWDlX1mjvJy4eONf//vJhtGLQXSevfnjVFxugfB1MQQEgtDMk
         YrZg==
X-Forwarded-Encrypted: i=1; AFNElJ8O48Zny+85L7oy+EbH60zLKMGEfzQYL3TPFHy2ut8ZgLhedRgq0iKXnGdwOWk9T7iIde2a184CkaRfhBab@lists.linux.dev
X-Gm-Message-State: AOJu0YwqbDFRxxDt1abG3GOEuBH+0Q8/EAhN8XyjPiEYl2qK/Pdgb9Rp
	fLWe9CVZRLh+O5JWorol2amDPToSx4qb8tVj5+kKOsH28Ak63Zb7OOr4
X-Gm-Gg: Acq92OETHJexqnCzCvsIHCV1VGPzO5oiaB0/o2e/NyJ6NOiVU9Y9ZQzSQnYfZxDdcRA
	tWFdI2GOBOg6rnBz6d41x1wGXPWlXO6dkrF3PzuV+dCzw0RDfpXkW7X3xuGRr8TJxxmtoz6M4t+
	2C5LYH36QvarMIgI/CNu9KfoGJFjC7tAKls2efeG0by/v+KeA8H/CStbc4q3FLHa1iwMnBZ4kAz
	klGTrOiv5uIu+TF5WFv3xO6TaeoicdgNV+AixO3bvMNa1U7gifdbMH5qvy+xHy7t/2bYSgy9KIY
	TzpFsdFofjvucsRyMirWoXG3F1WFk8qhuEV123JKyl3LNs2QfkAdFNuMHzrhio6dB1X+bzRb632
	Ckzm2d1EbUXRluQSI+fcSdPe708GgUTpbwv0AecVf7KbupIOCSsmRrAfoomPuMBcDq75UO9y78C
	DRT6ihfpY3SGsnv3JDAzc=
X-Received: by 2002:a05:600c:4e47:b0:488:a977:8de with SMTP id 5b1f17b1804b1-48fe61ed3b3mr218628225e9.16.1779080536331;
        Sun, 17 May 2026 22:02:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe6faeasm73287305e9.26.2026.05.17.22.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:02:15 -0700 (PDT)
Date: Mon, 18 May 2026 08:02:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:cgrp.struct_ops.v8 9/12]
 kernel/bpf/cgroup.c:513 prog_list_replace_item() error: we previously
 assumed 'pl->link' could be null (see line 510)
Message-ID: <agqdVTjHR3iC2CB1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git cgrp.struct_ops.v8
head:   1ae5eccb04d5d8c62c310b206b5e5dc4ff1d9c71
commit: 32e27daf9a1563276f88eb17d076f61f8cc8b502 [9/12] bpf: Add infrastructure to support attaching struct_ops to cgroups
config: nios2-randconfig-r073-20260517 (https://download.01.org/0day-ci/archive/20260517/202605170734.0Q0GXEJ9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605170734.0Q0GXEJ9-lkp@intel.com/

smatch warnings:
kernel/bpf/cgroup.c:513 prog_list_replace_item() error: we previously assumed 'pl->link' could be null (see line 510)

vim +513 kernel/bpf/cgroup.c

95b27b9bf36972 Martin KaFai Lau 2026-05-13  508  static void prog_list_replace_item(struct bpf_prog_list *pl, struct bpf_prog_array_item *item)
95b27b9bf36972 Martin KaFai Lau 2026-05-13  509  {
32e27daf9a1563 Martin KaFai Lau 2026-05-12 @510  	if (pl->link && pl->link->map)
                                                            ^^^^^^^^
If pl->link is NULL

32e27daf9a1563 Martin KaFai Lau 2026-05-12  511  		WRITE_ONCE(item->kdata, bpf_struct_ops_map_kdata(pl->link->map));
32e27daf9a1563 Martin KaFai Lau 2026-05-12  512  	else
95b27b9bf36972 Martin KaFai Lau 2026-05-13 @513  		WRITE_ONCE(item->prog, pl->link->link.prog);
                                                                                       ^^^^^^^^
it's going to crash here.

95b27b9bf36972 Martin KaFai Lau 2026-05-13  514  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

