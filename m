Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D72801
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 06:45:08 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a37909a64eso1111214b6e.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 23:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689921907; x=1690526707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b/LfJYkEQO7iFSjVsuA5HWx8BcMwmvWUSIH/VsiaNhY=;
        b=Ez9E70yO8yp2Nrol+NXT0Mke3M5rvBP+YO/KnKswLCoXkF216zQoIInLe4Ep+5zWy1
         hTAyPRvbqr/hOGVr0MylrLpX1xTr7HUJq6orU6S4DqpzWgtBU+D7NzXQ40ZIAGu3We8t
         g8eDmWFe9+nrdpFap5YazQIkzjm6G31CJQ3mKOJ2/tGQtVNjz34FnU/RzUZxzxQUWZMi
         E5YagrIKHSO8KwecSbHD4Y7sCbG1Vlfn4F57koeq4UHgukO4zhpyK/OJKB8piKjxCUov
         PShptiK5DNxGbdzO28QNbYRhYrqq7bjVvsqRDEOAX1x4pexnLn/Q6LptkyAeGT7c57J1
         NQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689921907; x=1690526707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/LfJYkEQO7iFSjVsuA5HWx8BcMwmvWUSIH/VsiaNhY=;
        b=I363z/2TLv3YwzfYLUntoFh8qoZXJ9ZEMdxe7l51tNbmwiTscQea1PVyI0uiO98yRi
         Um+5dj2b0blo+sWDCsHG5FgnRqMf/vH/WRw30HZ8s0XEKn3A/W/X+T7oBVePVVaqipFH
         cVYNf6hvBzcyHx+1eQh4UsfD2oMIl0ZRxuEKAe0KvSAImbjDwYWZLceN54c1yGrsM/Yt
         dG2WBz8jQwviWR2klo61ofZ3noO7zanMVsHaK5kG+M9d3A11rO3MFISjggXSYOViEa3S
         HKyyZ8sZ9JFrJ8YDCTVqs0Sg+tsG3WSWb1tsFq7YsmjTvaEk1d6LzVNeSdWe79NaHNaV
         PnMA==
X-Gm-Message-State: ABy/qLaaEL/vWMlmNwLtc+q0DuSVsSInsxDDQlmN/qQ1JkDu1LbcddTS
	+9aaNc81hXewZ+uzqPzL7LNtNg==
X-Google-Smtp-Source: APBJJlFhbxVYQ6v5xUEbXBSZ6k1l/lqhkXK9MEJothL00DZqxDDlrRD312jIeqJx3AoL9I0Fasmuqg==
X-Received: by 2002:a05:6808:bc4:b0:3a1:c108:41b1 with SMTP id o4-20020a0568080bc400b003a1c10841b1mr1596997oik.25.1689921907139;
        Thu, 20 Jul 2023 23:45:07 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id 5-20020a17090a190500b0025bfda134ccsm2045164pjg.16.2023.07.20.23.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 23:45:06 -0700 (PDT)
Date: Fri, 21 Jul 2023 12:15:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] xen: privcmd: Add support for irqfd
Message-ID: <20230721064504.llvur2gdgy7eka2j@vireshk-i7>
References: <a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar@linaro.org>
 <202307210852.ukq5f98v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307210852.ukq5f98v-lkp@intel.com>

On 21-07-23, 08:38, kernel test robot wrote:
> Hi Viresh,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on xen-tip/linux-next]
> [also build test ERROR on linus/master v6.5-rc2 next-20230720]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Viresh-Kumar/xen-privcmd-Add-support-for-irqfd/20230720-173905
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
> patch link:    https://lore.kernel.org/r/a25d5f01fe9b4624aa12cab77abd001044ea02d5.1689845210.git.viresh.kumar%40linaro.org
> patch subject: [PATCH V2 2/2] xen: privcmd: Add support for irqfd
> config: arm64-randconfig-r026-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210852.ukq5f98v-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210852.ukq5f98v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307210852.ukq5f98v-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/xen/privcmd.c:961:12: error: call to undeclared function 'eventfd_ctx_fileget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      961 |         eventfd = eventfd_ctx_fileget(f.file);

Fixed by selecting EVENTFD. Thanks.

-- 
viresh
