Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29FC15C133
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 04:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722919917; cv=none; b=AOuvCrQyVFA/T6DU27U5BFdRPTMGuxIkaODa2duAHfSpnrn85moeHzQiDM9YSlnCcUszUYijjJ//O2XmTbb5A7bpmhk5fuEe/cbIX5xVaEQokVw4yeM3vfe0iTPeZDqVtiKHdcDDxDP4rHv5QVGLletHSY1qcIzfW6gmKsk1H2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722919917; c=relaxed/simple;
	bh=OiMv1fqLHwMe/meg9xscd4zfQKOekgsO4UZ5+YCHlIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcFjQr32FQk7LnT8qTJBOiozMK0tJGIpoLUNsUG3ln13brALrCdcwOVRhLQ4Gfs/W04tz7u5fL+oiDGe1VBQpicCqGAKoaHly4TNiLQiGKhIwuPacg045pUhAljjwsGlTR6gLE+LNLqLNoKHAIY00TjB2VqhUjrLGfC01BSvWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rte6IwKv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rte6IwKv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70f5ef740b7so159039b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Aug 2024 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722919915; x=1723524715; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t9lT0XdB5mcDq9zC4EQAHNJ7RkoUaPk1qdyqjjuk+Mc=;
        b=rte6IwKvyqP316VqOaDYwm5H7PwFE3skRFILm8bGjc4eWFCGdIcrMaK/Hv6M3CFD/a
         BEXdqwNrd7Ddfy2DKvVwojqfg2eHT1HfDj1C59rzQTYmgsDW9uFJDoIID9aBovwAjA3i
         erxd3nIxbuHvigjnNyxpKTVX0TWbBmUfRi5+XLwMQnNMOiEq/V1vn2zefO7S2Sc5ST/K
         MlhJfr9nFo8scBhRiLtJVakoc4kQkMEIyYwyj1999ssR0JkZd7OV5X8YjP2xcleP+6yl
         c8Ysw8FmWgytLGgfzsfmjBJH6AjL884OBXJcwkpgAPSNoUka++p2ZwIrHKXxHTt8OH90
         NUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722919915; x=1723524715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9lT0XdB5mcDq9zC4EQAHNJ7RkoUaPk1qdyqjjuk+Mc=;
        b=F0JOlWhbusXOHpvTw5ehHP55toc1c03LuJzw5Jvetv9ZO/w+KBQJYe6D5kuu5olpV4
         Z7uf8sQwO3v7hsLXwZL7E5Uhi/Aw5uKmDt8pVi4BM7a2hs52KeugCppPvVUcd6rCOftl
         rBifQIq6YZBAQnKxkU7Gibe3JANof+L/J3AVBlwWcNMmNeAWCR9WH3ElYmrQ+IZ5RnII
         PB7EItAwssiExmzdziY8swRReFB7K7Lfw0Po0EiPh6ZXLNbZXy8lheCmC93X9XbxxFaX
         igrfCc+jqA4sjk6XrRXBGQ6CGAoo8Wxe6gXUI2JZbyMv/jxijQmGZhx72pTmuJ7VJQc3
         vykA==
X-Forwarded-Encrypted: i=1; AJvYcCWv+pP9KnUrffT/8NxAQVqu3j+BWwbRe0NbOcQPySnwY+E4ACGVG/4ICeBAh28/HCvKkWyW70am+EHq7MsRUfJZKGw5ABLRpVSchklNvg==
X-Gm-Message-State: AOJu0YzImHCXsRQoz/cZxAn90eYJnPZqRIfXLvnfU4vERXe4rsO5xoHu
	1fL9uOZvme6nwX/U4a/kHUj/PnIU07XmK+MDDXZMjguQHT2iODExeqV44h5LuHQ=
X-Google-Smtp-Source: AGHT+IGMW9pFn8MBD0M6wG6DiJhwIDtq1qEITbJ7PtGwS4U+HOetoCD2Lm6eaLPi3qLOwjgegXo48w==
X-Received: by 2002:a05:6a20:1588:b0:1c4:986a:ddb8 with SMTP id adf61e73a8af0-1c69966b784mr21687022637.43.1722919915127;
        Mon, 05 Aug 2024 21:51:55 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec40f5asm6241853b3a.51.2024.08.05.21.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 21:51:54 -0700 (PDT)
Date: Tue, 6 Aug 2024 10:21:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 2/2]
 drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is
 uninitialized when used here
Message-ID: <20240806045152.g5xker6gy2ad6jxt@vireshk-i7>
References: <202408030418.gnJDcCpm-lkp@intel.com>
 <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
 <CAL_Jsq+evBH2+XVeMAGXy9Ucof=G574+sFKcG94MqSUdgzFSgw@mail.gmail.com>
 <CAL_JsqK6rY7S3X9sNSZFqhKPqz1wYz3QdgaQu42pnaKVA0HrwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK6rY7S3X9sNSZFqhKPqz1wYz3QdgaQu42pnaKVA0HrwA@mail.gmail.com>

On 05-08-24, 17:02, Rob Herring wrote:
> On Mon, Aug 5, 2024 at 8:00 AM Rob Herring <robh@kernel.org> wrote:
> > Is there some reason COMPILE_TEST is not enabled for almost everything
> > in cpufreq/?

Not sure why.

> Pushed this out for builders to test:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=cpufreq-compile-test

Thanks. Would be good to get these merged.

-- 
viresh
