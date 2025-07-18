Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBDF18035
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 01:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752803788; cv=none; b=E16yhAfKJQg3tUZ9Op9+FVA/0xETqxyLyHDJJszOzpJthjBoldN78qT8iiaZcemaAjVxv7V7DPi2srOdPyAQcViqKqTsIOAR//ODn/JJItHdbZAEmEcPa5MEAJ5cInpcyRKnzmb6QPdBaPEyjIXp4uqzlUv2ycqE8y9IiayHvCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752803788; c=relaxed/simple;
	bh=quAYO0IslRfjqgKElHOFH14nBNPcPgnK44K4dVwjZOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXBB6Pw6+zOhT5G2kvIML2QQejMra/S3Z7vFLVuvr+hCVbLC+n1LY9dtkID8lg9pJiQiXhO94Hl1SkNzaM1hx0MS4db0hgqmr76HSbBcK+IwjqIveRSoybpewBxB38sG/fkOe5vk/6U0hbS773CoxdCQAnoGI7SkzL3ywWk7dq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=az+ZUDVb; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="az+ZUDVb"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-615913ff67fso1046457eaf.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 18:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752803785; x=1753408585; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fO3BAJqBnEaDNYRieqyNWfhvX+qq7zVCYvlmIioIH+0=;
        b=az+ZUDVbiraTPL8qQ8JfLPSbQ3yWkt3uHa4pIqd16uNrR+mx0dvzWSIbpx5+9RyKzW
         CWboAWBi9B3q2VK7WiNdPef8XAJLfe5SyuAvLUQBrunjaDBFZR6bK+ix9GQU4auoFb19
         SUtB6x+NT4asJudlirSFfga9fCUbdEAOw34OXmBYpKN4z0wf1cUdokp1pm+W032iPGxX
         kT6WT/t/JQLv+v5mMcvGbazDLgIFA/7QaBYmMTvmn0P+4/3YvrriDDonaAUvpJsM1r36
         ZU1znEiFMuo1vmuwdDVtoA/y82JUlLB8EYqyoQ819QIF3NH8/W9aH+s/G/1JZ6Pt+K2T
         SHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752803785; x=1753408585;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fO3BAJqBnEaDNYRieqyNWfhvX+qq7zVCYvlmIioIH+0=;
        b=xVmoeXyNlQILDhZ47aYA5+c4x2Pj8FprTd+EazphpgigeTwQJIGg0AHOwAA5Fk/WTP
         xR+W+HpDVv0b2i89Zwy5iCeoHgkoLajTp0ZCJfoKntS9yK8EMqQiz+2ug0TmJBm5lkvp
         ShxDQOfly72f71ZotCveawEIB5EMbPgSyQQPFcsC4XLY1DOJizA+1Q5mQogUemBqUNpc
         8bZevJ/rJiC35NYGjoyKjMZQuocZxDgXp+lOLEZoFLp/ZkqkZyZ17K9jgMAt1LDQJQ2v
         JZDsBAtlF5Ac3z802GvRFexja0XEZ6H+3iPQSp6HI88ikLPJqHNYxj7ZlxyBxF9kFTMm
         Lahw==
X-Forwarded-Encrypted: i=1; AJvYcCXqKG1G1O2MPONcw7rS6kl48ThbAusg0ApEuT3pN7NJJ3sIMeeOR62K5FasEQM71AWLg8zU9odwLSCPAvf3@lists.linux.dev
X-Gm-Message-State: AOJu0YxehUww4/cm8g6VhjY6Qchfj2AisXpJdE4dTTSXR/e3L8TVRXJn
	ichJLQ9KbrnyioQLWP66Q9L5hcIp1hl/SmO1T0ZKXNFXwXGs6rj3/e10xO+CAi1cc/8=
X-Gm-Gg: ASbGncvAPNOrfSmQKt3gu5Es1bn4b1PB6YvB5aqHH0iwlbv6VdvT5r16OowS0OGcO44
	Q2ynfmY51dz4zVgEpUEN58BgocKeugmpy69Y+tUbQlldR5T/oKEEVFW0sMyhMYwqM1JU32Nqxqx
	Bs/zAyB3BIU+XqVp+9nGX0HThFjgCr+atOQbxtIdzEtRgAGf8jFoBjSeBZZ/zY9GHWeXLn0QctV
	qBOVc0yjZ4AfiDMcDfJTj1/AqrvfWkugeRb0qqCGsR8NZQ2tG6GEsH+P4TCAkR/qV1stKfK3Ydh
	xVzwa4qi0fkWD2GEdApaLZk2Duo+O0bTyEcbWnVu7SMuB5uMbqfZqg9wYssURamDl8yTUKDN5HR
	C6fjTuR/8+VCZNC5nYyNKI+KmDXq9
X-Google-Smtp-Source: AGHT+IHdvePjkbGrc4fHsRSW0DkuBczzR5AniNwIbs7HoS/t+xfZWroitDzOx/kPfUw49uOhvzQOOg==
X-Received: by 2002:a05:6820:2702:b0:611:3e54:8d0a with SMTP id 006d021491bc7-615acc319a6mr3839050eaf.1.1752803784936;
        Thu, 17 Jul 2025 18:56:24 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-615bcc8c21fsm88647eaf.18.2025.07.17.18.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 18:56:24 -0700 (PDT)
Date: Fri, 18 Jul 2025 04:56:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 10555/10823] io_uring/zcrx.c:385
 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null
 (see line 380)
Message-ID: <f07001e5-021c-4695-8116-07b1a71665fb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 262ab205180d2ba3ab6110899a4dbe439c51dfaa [10555/10823] io_uring/zcrx: account area memory
config: x86_64-randconfig-161-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180628.gBxrOgqr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507180628.gBxrOgqr-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:385 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null (see line 380)

vim +385 io_uring/zcrx.c

cf96310c5f9a0d David Wei      2025-02-14  378  static void io_zcrx_free_area(struct io_zcrx_area *area)
cf96310c5f9a0d David Wei      2025-02-14  379  {
0ec33c81d9c734 Pavel Begunkov 2025-05-27 @380  	if (area->ifq)
                                                    ^^^^^^^^^
This line assumes that area->ifq can be NULL

db070446f5af8c Pavel Begunkov 2025-02-14  381  		io_zcrx_unmap_area(area->ifq, area);
782dfa329ac9d1 Pavel Begunkov 2025-05-01  382  	io_release_area_mem(&area->mem);
db070446f5af8c Pavel Begunkov 2025-02-14  383  
262ab205180d2b Pavel Begunkov 2025-07-16  384  	if (area->mem.account_pages)
262ab205180d2b Pavel Begunkov 2025-07-16 @385  		io_unaccount_mem(area->ifq->ctx, area->mem.account_pages);
                                                                         ^^^^^^^^^^^
But here it's dereferenced without checking

262ab205180d2b Pavel Begunkov 2025-07-16  386  
cf96310c5f9a0d David Wei      2025-02-14  387  	kvfree(area->freelist);
cf96310c5f9a0d David Wei      2025-02-14  388  	kvfree(area->nia.niovs);
34a3e60821ab9f Pavel Begunkov 2025-02-14  389  	kvfree(area->user_refs);
cf96310c5f9a0d David Wei      2025-02-14  390  	kfree(area);
cf96310c5f9a0d David Wei      2025-02-14  391  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

