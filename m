Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A223714E2E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762751; cv=none; b=Wi4B/4gsVBcju31Qe479hjZcIloNTu2IazLvEAoq1kKu55GpVqAse8oQKjzrWGEdn6i4a64ge7E5uk4x/nwA0ojwwImKgCJiqy7YhJXQL6OoeeCsAS8Cuqb9rOMuy09WYdwR9gMc5ktk3ieHnOgbL1ulFiF52rD12/fancyHKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762751; c=relaxed/simple;
	bh=wEbP6qi+nZF7TDGpD2NX8D4wdG17ufmilIB2hmeWXis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJBl7hMj+2vO3Mg1O5l/nOmYQ4JdeZzmibRllzLLcon1abmMlsK/Wm7tuNVWCRQsCTxbkjrMnov61Zgh8vRCN3FnY18n2YDr4YgTmf2gKAHtDJo/zvkSn2xoqPrPZ5vFMPcwFPSwH209r+XRMt1OOEJAXjDsBDZRJfFN4QimexQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECohCPP7; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECohCPP7"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2ef493de975so693073fac.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762748; x=1753367548; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAGitSQnYjvE5arKuWyAVScrSmXNN9wG97tPTtqz150=;
        b=ECohCPP71Y4+cfaBRpjGXF4lZfJUVqkG1SQZbCds7WjAbPf6ParSjUY/ysH3fjf8Ur
         5YkFesLZVqZUfxaWfNMvQYAlwLr2fIpQiaDPnn1/ot/xZ1KmVAC6Xw+EUke5f4AyjFVM
         W9/CevoGtnBcCditMblYwv29e7FdrL47m9fGH0++HV8VLS8yarBigC4t5YxNg8OZHrOM
         /0nkT0fjWTlFpbi08Aa9KSb/j0c5DmbpT2a9Nd7bX/wDSk8V+8bY71oWdcRvNUSHvpyH
         MbdaWJKDmu/DzKHYFKAOmCc4cvlbprZdXUAnGSugfL6VcUSVLF8wIz2hs0i18AwASpfa
         2gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762748; x=1753367548;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAGitSQnYjvE5arKuWyAVScrSmXNN9wG97tPTtqz150=;
        b=ZYtw+6gsZpXi2dduig2GqEGeiu7jNFgW0F1Zu+XDYQbQWNUMTEinnKfZrnLPjz+s1b
         7VSkZtzIxoV//nCCVAidQkQlaD6thNL5TZj1/kXLnu92exakATy63R3CcNPGCBVKqbsf
         fm/X7LYaFLE0f53h0F/D59xDjj7NoBt5ql+IE9G6g0sZBKTEQcz2thafbh7jvhsptx0p
         o+Je4R6OaEBj+MeLMUp35CrGN4hkNC17UfJJ+eSazTsJMPfX1dErkVDD0WKV0eyUvmPO
         4nV9VtYZbUhEe00lBesdVpcdibHvPJ7vtsHJy69enlkBoHnuQ45SFXYM6pw8wkRiHIDM
         BKTw==
X-Forwarded-Encrypted: i=1; AJvYcCXXHC4InNDu581uPloB7Wjtc1iQ1MoyV5hEUcJmcXk6aWhg2IzsbGaCNnf0A24cn5sUfy01IcwaYzKGdX2P@lists.linux.dev
X-Gm-Message-State: AOJu0YzZNN1Ce7d+UQ2OJX9F6X2jjQT3uiOBjQulkrCbuvMrMf6/Hw3m
	X8YjbCFrQMlKlHBWqTGlBSNiQgRwNK4WvcurKNdCfE3aURHtlnexLR8l4Owl30+aVR4=
X-Gm-Gg: ASbGnctRsQ2cGT3JOFD4sMo0PjyiSAwu9m/jSQZO7eN2LUha3AX3M3DJ7P495jwUM4L
	C2yhdL72rI43XDXfwcw7xnx6Pt4zqMN2oB8lX2D8IsL7N+txbs+n1XOaHzweNmKbuV45CHqc+nW
	Ucoq9cpZllMZ1FKNOuEk6Mg/fW4lsbMjXZOdqBpZapQ4ND5gTrlkXlfmQAqSyGNKXXt5zD7rfP+
	ZJJBEWI6jPdrgbr3Z6V4D2Sl144oQ+RN+jTHx2jRTZe2BSnBB1M+ytkihkr5doi2/pR5lhIsl8s
	KOTcgEtTRgIffr3hxvAqHtXbUr2O3sXK495wHVkAXj7ExHAGpM/6C+RBQ6X+e4QkJwxXmQvlsDl
	mhP4vIsKjncRYtFvVOib+aEs4DteZ
X-Google-Smtp-Source: AGHT+IFi8qE3e3cHISEmGBhR/Op6SFiLyBeT3vOrIA/qwrfgnDtLiRdX2GVrb5LrLNQyWwd0Ggy3Zg==
X-Received: by 2002:a05:6870:b24f:b0:2bc:716c:4622 with SMTP id 586e51a60fabf-2ffb24e6b25mr5595540fac.38.1752762742352;
        Thu, 17 Jul 2025 07:32:22 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff111c35bfsm4432316fac.1.2025.07.17.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:32:21 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:32:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10097/10441] fs/bcachefs/journal_reclaim.c:877
 journal_flush_done() warn: missing error code? 'ret'
Message-ID: <3008994f-e84d-4763-a4db-9666555ce33f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8352908bdcd2d0bcf0aca8c69fae85fd5ea5edb
commit: 0e1d28c378988f28b773807c00e7f3be40f49bf3 [10097/10441] bcachefs: convert journal_reclaim.c to CLASS/guards
config: i386-randconfig-141-20250716 (https://download.01.org/0day-ci/archive/20250717/202507171850.10rxb3uq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507171850.10rxb3uq-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal_reclaim.c:877 journal_flush_done() warn: missing error code? 'ret'

vim +/ret +877 fs/bcachefs/journal_reclaim.c

039fc4c5221f74 Kent Overstreet 2020-05-28  861  static int journal_flush_done(struct journal *j, u64 seq_to_flush,
039fc4c5221f74 Kent Overstreet 2020-05-28  862  			      bool *did_work)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  863  {
35f5197009cae2 Kent Overstreet 2025-01-25  864  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  865  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  866  	ret = bch2_journal_error(j);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  867  	if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  868  		return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  869  
0e1d28c378988f Kent Overstreet 2025-07-14  870  	guard(mutex)(&j->reclaim_lock);
000de45996c4b0 Kent Overstreet 2019-01-14  871  
1e690efa72596a Kent Overstreet 2025-02-10  872  	for (int type = JOURNAL_PIN_TYPE_NR - 1;
1e690efa72596a Kent Overstreet 2025-02-10  873  	     type >= 0;
1e690efa72596a Kent Overstreet 2025-02-10  874  	     --type)
1e690efa72596a Kent Overstreet 2025-02-10  875  		if (journal_flush_pins_or_still_flushing(j, seq_to_flush, BIT(type))) {
35f5197009cae2 Kent Overstreet 2025-01-25  876  			*did_work = true;
0e1d28c378988f Kent Overstreet 2025-07-14 @877  			return ret;

I think ret was intended to be the return value from
journal_flush_pins_or_still_flushing()?

35f5197009cae2 Kent Overstreet 2025-01-25  878  		}
000de45996c4b0 Kent Overstreet 2019-01-14  879  
a66ff26b0f3118 Kent Overstreet 2023-12-10  880  	if (seq_to_flush > journal_cur_seq(j))
a66ff26b0f3118 Kent Overstreet 2023-12-10  881  		bch2_journal_entry_close(j);
a66ff26b0f3118 Kent Overstreet 2023-12-10  882  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  883  	/*
1c6fdbd8f2465d Kent Overstreet 2017-03-16  884  	 * If journal replay hasn't completed, the unreplayed journal entries
1c6fdbd8f2465d Kent Overstreet 2017-03-16  885  	 * hold refs on their corresponding sequence numbers
1c6fdbd8f2465d Kent Overstreet 2017-03-16  886  	 */
0e1d28c378988f Kent Overstreet 2025-07-14  887  	guard(spinlock)(&j->lock);
b895c70326aa43 Kent Overstreet 2024-04-30  888  	ret = !test_bit(JOURNAL_replay_done, &j->flags) ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16  889  		journal_last_seq(j) > seq_to_flush ||
f0a3a2ccabc5ae Kent Overstreet 2022-02-28  890  		!fifo_used(&j->pin);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  891  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  892  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

