Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B823523371E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582823; cv=none; b=CAbaMW+jv+fIv1Qzk0B1GIEcSR4obwITbF6nofDj+dtBfENnOKrhKRQVjW3TnOgbbVD4jFkmroLfLKGtjfHFJ8vRwBsd5LjPjJgIt8r9M3q5RZymWfSLuRLCn8QUViZ3M+C9+QXNy2qQ5Ct37xFitXZ62KKWjJe/ZL5tWa/uS2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582823; c=relaxed/simple;
	bh=9I9XHZRgnlgkSyK6bk18GShdXhlb3cRo4eQ4FSWfEgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T1ae0vXyhkZxwJmFGvY8+8b4q1DFoH721scxZNLgcI+8RDCDSBj9J5VBpPftbv5K/9Jk+75lWWGEAOwQPewMtKXIlWdWIbLSek53IcQQBndG+Rao291wuPaSgaw9qjztN9qeCk6DVtbngkZ6nQUOj/ViGWqi/VQ3hsLf5XNyzR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQFYUGOf; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQFYUGOf"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4922504f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Apr 2025 01:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743582819; x=1744187619; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RflM3eIUeAykRn7gfmZiAZuq4DaaLmevr7UucAIeFSc=;
        b=OQFYUGOfAO2+iAxmTbQVQUWxx6DTR0a24TADCiv/mKcnSfV7SKu7jvI4Y2h34Gu+RC
         iEWYiLR/OWxJYcgcvIHIexinxDyDUA7R6vSK/G0yjl9PEV37zNNvT51Fu42gX3P1qDiM
         HMKlXBO8zliRuKof4PE+QL3IwTHYII6tjL6O2xYhaGg6QC+NTI3JPCNHraIy6R/RgN+i
         w6ZvM77QZOV+pOefRd6vkeRRjZ2jPCA/Q29D92BiJH8kDjyzHgeW2K/5UVzek3fCqK7r
         sVy4Vkb6YLXiGBwKI1CMNCAC+l929tVp+CuexPVJKWFKBVP4mMH5mzuDO4J8NhMDBL0M
         YYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582819; x=1744187619;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RflM3eIUeAykRn7gfmZiAZuq4DaaLmevr7UucAIeFSc=;
        b=DFS2ldnidgF92B4S8IJvS8e48yRCf7QShKis82UmD9BckFEG6ZCVoY1RVb2LF4zvGQ
         U7/xSNM2PosagHntjFEt31e1UiA/Hb376bpYbOjkpItDR4bIpyl3fq9hdHYsQOW87qCz
         lgpHjiPuM8G69RxqN0mrnNtlrMHJcGQkiyQZ8odAN8gb/gOzTEIIRdwGvcQaDtgXmen4
         7MW0AmURMb9bBDDCs+ltU6LCs7lcUfRHwBLYX0bgrGMIAdUEio8Bq4EWolwS1ZmHN96Z
         xVotb22mgu0OfsXtQRTPH7FHnpVdwnV+lTOWIbove7WrqNZhQSXW9nW7Io9bjzWRut2z
         6M5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK7wNWE9wNck1yVMdDi9JfnUONtu+TdZ3S/V18nJYGR8k453XZbaC55/G2aZFJ+chGozy13oZCj5t3yqct@lists.linux.dev
X-Gm-Message-State: AOJu0YyBm2LpOLF16aI+cAA5rvhMFBUuLw4So7Seca9He6iu+yZGsURV
	voF1w3MkDjvIGQrq+rG9iZDs54L+t1ZBLpk+3UU1M4mmlPBm4o9mQnpetpLlxvY=
X-Gm-Gg: ASbGncsVGe/xN0xPhMkhNTzNOqchS5P5gzlwv9ggEzgk5dlf13BsnX7wZ6AowXuU110
	YxkLCTZMBBCcYdedQuWm0t9CAfirjE00PzWtp7JsMr7uikEOM72RKNps1QX8sTom/nefzvxABKD
	XHJJ1Sd0Jjmi1lCdovek/eaUF9lZQTsdv/JDdq7i8trYhDfKRLS15EB3BTeI9o+7r6dDAwt8pMp
	Inz2kV1shME91H22OJ3K+93mCgfBSZuRTZNIFbJRrYqr1mh1DqXA6mjKzxy7ICoQLpNewd9lTjj
	+6fs35cHFfdjC2J9ZfyNoJxNo7WxKrDJ7eErrDcoSkylsTSplA==
X-Google-Smtp-Source: AGHT+IF60L370xApA1IohVIjYQPwT3lpHbrDLuhxkwVDRvR1TS0O+uW7nY7HDfqyeIQWm5MDbCeb7Q==
X-Received: by 2002:a5d:64c9:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-39c29769561mr1219466f8f.35.1743582818911;
        Wed, 02 Apr 2025 01:33:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb613aabesm13363625e9.39.2025.04.02.01.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:33:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:33:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Paul E. McKenney" <paulmck@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.03.25a 45/45] lib/ratelimit.c:45 ___ratelimit()
 warn: 'burst' unsigned <= 0
Message-ID: <922c17a3-d075-47f8-9af1-f14e0bbf6da2@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.03.25a
head:   cedfad9ced72fc8c873e11a4c6a089a415489166
commit: cedfad9ced72fc8c873e11a4c6a089a415489166 [45/45] ratelimit: Reduce ratelimit's false-positive misses
config: x86_64-randconfig-161-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020656.TgN4JCta-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504020656.TgN4JCta-lkp@intel.com/

New smatch warnings:
lib/ratelimit.c:45 ___ratelimit() warn: 'burst' unsigned <= 0
lib/ratelimit.c:45 ___ratelimit() warn: 'interval' unsigned <= 0

vim +/burst +45 lib/ratelimit.c

5c828713358cb9 Christian Borntraeger 2009-10-23  27  int ___ratelimit(struct ratelimit_state *rs, const char *func)
5f97a5a8799b8d Dave Young            2008-04-29  28  {
cedfad9ced72fc Paul E. McKenney      2025-03-31  29  	unsigned long begin;
cedfad9ced72fc Paul E. McKenney      2025-03-31  30  	unsigned long burst = READ_ONCE(rs->burst);
                                                        ^^^^^^^^^^^^^^^^^^^

cedfad9ced72fc Paul E. McKenney      2025-03-31  31  	int delta = 0;
4d9c377c81d377 Alexey Dobriyan       2008-07-28  32  	unsigned long flags;
cedfad9ced72fc Paul E. McKenney      2025-03-31  33  	bool gotlock = false;
cedfad9ced72fc Paul E. McKenney      2025-03-31  34  	bool initialized;
cedfad9ced72fc Paul E. McKenney      2025-03-31  35  	unsigned long interval = READ_ONCE(rs->interval);
cedfad9ced72fc Paul E. McKenney      2025-03-31  36  	unsigned long j;
cedfad9ced72fc Paul E. McKenney      2025-03-31  37  	int n_left;
5f97a5a8799b8d Dave Young            2008-04-29  38  
edaac8e3167501 Ingo Molnar           2009-09-22  39  	/*
cedfad9ced72fc Paul E. McKenney      2025-03-31  40  	 * If the burst or interval settings mark this ratelimit_state
cedfad9ced72fc Paul E. McKenney      2025-03-31  41  	 * structure as disabled, then clear the RATELIMIT_INITIALIZED bit
cedfad9ced72fc Paul E. McKenney      2025-03-31  42  	 * in ->flags to force resetting of the ratelimiting interval when
cedfad9ced72fc Paul E. McKenney      2025-03-31  43  	 * this ratelimit_state structure is next re-enabled.
edaac8e3167501 Ingo Molnar           2009-09-22  44  	 */
cedfad9ced72fc Paul E. McKenney      2025-03-31 @45  	if (burst <= 0 || interval <= 0) {
                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
unsigned can't be less than zero.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

