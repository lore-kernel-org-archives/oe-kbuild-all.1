Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8F8803
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 23:41:08 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r18so8828178pgr.12
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 15:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eFw+vUyxAlXvyIKzXin+BYmD1wliXJ2GCQPgnmMqPE=;
        b=Snt/OPG2tgQ8VVC0fHoRXK5F8u+MEs8vNfrE7F5EYVieTVuQnSTLLkj7I7UadmSNzB
         qBfPd7mdvtAie6eUa/SAWtMFRatf/cRsILFZLpc4PC/0CFsSZJiZbvwnvti2VzLA4zt6
         J/KbXXBo2XLxqQIk8ANh7C54MqVwqTJejwJ6j/FDOzvt6pS9ni09j3sAy7d8mF0mRsJn
         4L2M2mN8koQOmg7J+xMHItxyOj9Y4tGSYjU5bETIjJkCMGqsWC7Ezp5aAEdcpASIseRL
         qAjNqBa3ClOQ49VUuRaqZpezHZzhUwz1/toBEfoVqt6TtHqNWI+UC2cQObppQ2TifQMl
         Tx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eFw+vUyxAlXvyIKzXin+BYmD1wliXJ2GCQPgnmMqPE=;
        b=5HcYqzYSeco9btKduh3QW9RluhgZSrdysCFi0Lr4uWKmZgRDPRx7n+ZMHNjREjS72o
         TsmM+MYaMly7SPnDM7fkeMHrph6RBPwik/0Bho2ytnApQrJXs7+x7/t+e+eh5wAsfNe8
         odMVFmUZdhU60gefal2bJXV96JDo000stImS+9qB/WlqbMzFtysvoPBWXL1+1QhgmXuE
         c3V2GJCK296r66d4GKUN7OBzBIKH/e/2Z/3zHVp50X2ESYDM22vc/hUIh47Iw3D62q5j
         4SKejrWlormky8OjDsLM8EjHvc5aahHob2gwSU2jnkQCizJfQnSpUcFZrXZnK6DQCvSn
         JEjw==
X-Gm-Message-State: AO0yUKVtZzwl7fFT8XAzyw6DVKgLFCKtbi8jkjnGrsaLu9sqqCmt5H29
	edj0KtoNIOqmfu+LTHJU43Q=
X-Google-Smtp-Source: AK7set91W+OMws+4fUqP4r4tKzPFUXR3RfGq0xeU4+1VuTm6Jw8XNrpgKH4YxYrPfmJMkJejYoWgSg==
X-Received: by 2002:a05:6a00:2123:b0:592:3e51:d881 with SMTP id n3-20020a056a00212300b005923e51d881mr17105931pfj.14.1675122068136;
        Mon, 30 Jan 2023 15:41:08 -0800 (PST)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id e190-20020a621ec7000000b005809d382016sm7952191pfe.74.2023.01.30.15.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 15:41:07 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 30 Jan 2023 13:41:06 -1000
From: Tejun Heo <tj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: torvalds@linux-foundation.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@kernel.org, joshdon@google.com, brho@google.com,
	pjt@google.com, derkling@google.com, haoluo@google.com,
	dvernet@meta.com, dschatzberg@meta.com, dskarlat@cs.cmu.edu,
	riel@surriel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 23/30] sched_ext: Add cgroup support
Message-ID: <Y9hVkifLuMTYIW97@slm.duckdns.org>
References: <20230128001639.3510083-24-tj@kernel.org>
 <202301290107.J4Eavi26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301290107.J4Eavi26-lkp@intel.com>

On Sun, Jan 29, 2023 at 02:05:35AM +0800, kernel test robot wrote:
> Hi Tejun,
> 
> I love your patch! Perhaps something to improve:

Fixed the build bugs from the two lkp reports. Will include the right base
tag from the next posting.

Thanks.

-- 
tejun
