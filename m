Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DCF156DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 19:29:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1befe39630bso10437575ad.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694460598; x=1695065398; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGQStCvoWj3/Xp0jbKniFWE15sG3u2sI0fTxWSIsDmg=;
        b=ERjUrmNr6gyfCkQB6rXZYNnscXpnXsAWylQOq9eCx47Nt9/eQGywCN8WCq5TyvlAeF
         2eJGiQyy9xtywhiETg4nhLU2BnmHE9z7gyvXt7xGqVHj1bfdeGvnr78kculnKPQD+XjQ
         kv7jOO+WcI9W2y6GmEt1h8r368jXHru3M7lb2SinNwgLFyTwe4WpYEqxPQFM/w/CcxBv
         BhnqQevnwmYn6HKvRYNP2/gmL6JR/Eowu0n145rKtHEFj+s6gWlwJW0n9XVgUog2TMdJ
         iA66Ps0D/HHCXrUchqfAe+0TXeNqQy6F8s7emw6ghBZugDuUG6tuJUFC2fDwyx3akIKX
         1+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694460598; x=1695065398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGQStCvoWj3/Xp0jbKniFWE15sG3u2sI0fTxWSIsDmg=;
        b=QWUydpF6loYUgX98OEYta8g5R4tqAEYPMMoUutIDI0ZQJX17xlHBOAragJlZ51xKLA
         sRKhgkjEMVOZv0IgzjM24IjWuORL35SiA7AHKBvAQh8BH86xBB25MZSJsw9XiVeW8v96
         qFuPo5APxpS650/9mEz4hXMSyx94xq3rQxMOka3y25Ehv48TZXaj3GbdjUnab9qK2408
         7jEv6kAzZ2QGeuhBf7sZiFlkDsccKKjhIKRX3oqW5uNl4fHlhtlVdPrRDFAXwZhNSI6h
         uyW/cHA5YAkZSO8DUj58D2inoI34mTyw0u33L3A6pngCJtG5SwKltC9W1weskRmGxfK5
         9+gg==
X-Gm-Message-State: AOJu0Yx3+1dgJlIY2zZYtKsnbyOa9SdIEA6Z6m1zDZIcthgVqLhd2cBg
	+h8AtQXPXyyMc9UarZk2hf0QNw==
X-Google-Smtp-Source: AGHT+IEaqmgNPlrgJsJYHYB0ZENpQMy8GU6BQOpJO6AC4O+btal68J7EbL9UcfulTF4O8CmZsO2gQg==
X-Received: by 2002:a17:902:e546:b0:1bb:9e6e:a9f3 with SMTP id n6-20020a170902e54600b001bb9e6ea9f3mr12355983plf.4.1694460598344;
        Mon, 11 Sep 2023 12:29:58 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001bdc66478c1sm6809944plg.309.2023.09.11.12.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 12:29:57 -0700 (PDT)
Message-ID: <bf5831cf-74b8-438f-8892-8b41cc222c2b@kernel.dk>
Date: Mon, 11 Sep 2023 13:29:56 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel/task_work.c:73: warning: Function parameter or member
 'data' not described in 'task_work_cancel_match'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>
References: <202309120307.zis3yQGe-lkp@intel.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202309120307.zis3yQGe-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/23 1:12 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> commit: c7aab1a7c52b82d9afd7e03c398eb03dc2aa0507 task_work: add helper for more targeted task_work canceling
> date:   2 years, 5 months ago
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230912/202309120307.zis3yQGe-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120307.zis3yQGe-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309120307.zis3yQGe-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> kernel/task_work.c:73: warning: Function parameter or member 'data' not described in 'task_work_cancel_match'

Wow, that got introduced with:

commit c7aab1a7c52b82d9afd7e03c398eb03dc2aa0507
Author: Jens Axboe <axboe@kernel.dk>
Date:   Thu Apr 1 19:53:29 2021 -0600

    task_work: add helper for more targeted task_work canceling

which is a while ago. In any case, this should fix it. I'll send out a
proper patch.


diff --git a/kernel/task_work.c b/kernel/task_work.c
index 065e1ef8fc8d..2a628b4a6124 100644
--- a/kernel/task_work.c
+++ b/kernel/task_work.c
@@ -78,6 +78,7 @@ int task_work_add(struct task_struct *task, struct callback_head *work,
  * task_work_cancel_match - cancel a pending work added by task_work_add()
  * @task: the task which should execute the work
  * @match: match function to call
+ * @data: data to pass into match function
  *
  * RETURNS:
  * The found work or NULL if not found.

-- 
Jens Axboe

