Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B262A2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCU4nkkV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-408c6ec1fd1so11375e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 16:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700267286; x=1700872086; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73Tnq90BIIK+bWzVstEpI62VolU0zG+vjIVvtoSbajE=;
        b=BCU4nkkVLK3MisgW9qE7uGHL6SW7Qtfx1tXVbquSnkKF/K6AdanpaS+Mlpd3f6eVsO
         BmayvQsnnpAZtfJC+QiQXc222v1vsfJhTWX9BBfcaYkXDYvMF4hlBcEBZ7hA0VqxPkNF
         q5nKAx5UfkLLjmooJweYflx7bcDAmhc0JAGXs7Kug4emKN+17/LYTdnWKEr3nii9BnxO
         M8T6tCu97EscOlhY2SsEnyncw1+sgQYyY/Wrm4kDc3jptGGhNg2kZ7wCR278caYl0GH9
         VpT+Uf9x1oCnInBHB83mu2ItoqpVVPYd4xi5teKdHUJLKK28I39oxwulLmHT7wabyu/0
         obWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700267286; x=1700872086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73Tnq90BIIK+bWzVstEpI62VolU0zG+vjIVvtoSbajE=;
        b=Ms/2uV1mmYqbkQRLYaINQTvO22XqJ4DQ0yog8D4JxvAMzTWS+D702iDkVZCe6Vwn7r
         8HhAl1puzwQJR643WWcUmTjo9iJ62lxVsmYK9ibZPfFFCd8V1Dm/APUyUMJrchypTBie
         58Q+xeNwbdZGxi5q2ay5yGS8UGPnbKPG1lLNe/0d/XwXheDQClv7L2p2IUMhGtTY3/ZV
         V+RgXqXMC7LdttdSbHyUmIPHJfePhFzzt/kVZLwwernk7VbIMyVzl0m9zDiuZ4MC0lYV
         ZwbqkFMFrmwFXNrCQRLw6AKFja/nIb/nhSloPr/ApmnCMqgXaur/6VSSOa+J38P4pv1e
         6B8g==
X-Gm-Message-State: AOJu0YzLuIvy2l8IMHe9tUrYmD9VcQbXDxVjx3ED/pui177I0ZNh5FGp
	Zba5iTD9khTpil/U/YfHtJelXk+r1QYhkN2fqIWV
X-Google-Smtp-Source: AGHT+IHSq9c3SB879A4Y9X7B/NWEeDJZN+VTUL58zVS4FNEdH+w9beguhDsgVswh9vpjwc0wz4o1URoruZbhe/6DnnU=
X-Received: by 2002:a05:600c:3c8b:b0:3f7:3e85:36a with SMTP id
 bg11-20020a05600c3c8b00b003f73e85036amr201414wmb.7.1700267285667; Fri, 17 Nov
 2023 16:28:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231106193524.866104-16-jstultz@google.com> <202311081028.yDLmCWgr-lkp@intel.com>
In-Reply-To: <202311081028.yDLmCWgr-lkp@intel.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 17 Nov 2023 16:27:52 -0800
Message-ID: <CANDhNCrT-CRbSZhPtxQ+mD97x6+2C0uE4WsmS-ymPiYewrNviw@mail.gmail.com>
Subject: Re: [PATCH v6 15/20] sched: Add proxy deactivate helper
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Joel Fernandes <joelaf@google.com>, Qais Yousef <qyousef@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider <vschneid@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
	Zimuzo Ezeozue <zezeozue@google.com>, Youssef Esmat <youssefesmat@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 6:52=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> kernel test robot noticed the following build warnings:
>
...
> >> kernel/sched/core.c:6616:6: warning: no previous prototype for 'proxy_=
deactivate' [-Wmissing-prototypes]
>     6616 | bool proxy_deactivate(struct rq *rq, struct task_struct *next)
>          |      ^~~~~~~~~~~~~~~~


Thank you! I've fixed this up for v7

thanks again
-john
