Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E698F70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687785207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+SYQWOThvQIUC9h68Uc6FLsg5KsUusVMWbsT1caXNIo=;
	b=V/xRH3eN1ftHmsIVICD76aesrzvfs4nO/mhcdXlsRnwzlMptjzPX1nWyhhgHhd3hOxS0fr
	nRu3zsrrHRh8kBVVSzS6yja/7mrYCKnugwdn/7xblUEhk8UJ/7Q5WCx5skRFWvkBCpEuQC
	hAFIdIFts36dnZKWF6k9uRLJ45dSBm8=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-vCCYA8_kOiuLUkjgu7Hqng-1; Mon, 26 Jun 2023 09:13:26 -0400
X-MC-Unique: vCCYA8_kOiuLUkjgu7Hqng-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b754fb0220so278106a34.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 06:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687785204; x=1690377204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SYQWOThvQIUC9h68Uc6FLsg5KsUusVMWbsT1caXNIo=;
        b=b/XXxVzEsCjOLNp8sZqyiq22BYyyXAQjg/7XnN/i8N3KorT6fwE8Sivf0Y14Zlu0wn
         ApVoe4M9L2PSv8Zs7IzHYLPSEZFqE9F7pxB96BGTlHTbY58fc64bKXQz3XI8MzMdS8GL
         DJ+E9A1opeQ/4iL080ojPWT0IIlf8BiUCbInLTwizegFRkqAzruW4nRmQowIsrYT521z
         W7/grKtEqowsAdVD4lSGM/x7+hzcr2memN4Z3qooAJL4w0GPyIoy41Qa0fb/QLFC/nkh
         nyTd1s8WTj1deXxGDR7F/ATQZNB0EkcwMagvQ23Rlti/GRcVwbwkNi8BlEdeIJX7t/e1
         DY3w==
X-Gm-Message-State: AC+VfDwRLRA3TI6YwUXSdml3UJ+WMoh1GP4spQrIRVqrTN6dIii4WVLL
	7CbXzUhyBurny1QJBFzd4rG8tiDgx3Pg01eY3CCBDRsTgj6sryFo0QK1XOJgDszvw5JDbLcSb76
	uXDUC9iQRCZPctH0hN0AR4Nou7Q==
X-Received: by 2002:a05:6359:a1b:b0:133:b86:cbef with SMTP id el27-20020a0563590a1b00b001330b86cbefmr2394429rwb.5.1687785203994;
        Mon, 26 Jun 2023 06:13:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56qw0OaQXFwW3r4YZBQxeXiR8n5uj0/pqvtn78WvR91t7mWKo9FisdAs/CYAqDMQacAj+QDw==
X-Received: by 2002:a05:6359:a1b:b0:133:b86:cbef with SMTP id el27-20020a0563590a1b00b001330b86cbefmr2394419rwb.5.1687785203717;
        Mon, 26 Jun 2023 06:13:23 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::22])
        by smtp.gmail.com with ESMTPSA id i79-20020a0ddf52000000b0057320d10542sm1281063ywe.78.2023.06.26.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:13:23 -0700 (PDT)
Date: Mon, 26 Jun 2023 08:13:21 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [vireshk-pm:opp/linux-next 8/8] drivers/opp/of.c:516
 dev_pm_opp_of_find_icc_paths() warn: passing zero to 'dev_err_probe'
Message-ID: <20230626131321.dcaldxbz4wzkbyfp@halaney-x13s>
References: <de69e7e7-41bb-4abf-b8d5-dd31f2feec8d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <de69e7e7-41bb-4abf-b8d5-dd31f2feec8d@kadam.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 26, 2023 at 04:08:22PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
> head:   fa155f4f834882a79788218aea4914568b41dd0f
> commit: fa155f4f834882a79788218aea4914568b41dd0f [8/8] OPP: Use dev_err_probe() when failing to get icc_path
> config: openrisc-randconfig-m041-20230625 (https://download.01.org/0day-ci/archive/20230626/202306262008.guNLgjt6-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262008.guNLgjt6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202306262008.guNLgjt6-lkp@intel.com/
> 
> smatch warnings:
> drivers/opp/of.c:516 dev_pm_opp_of_find_icc_paths() warn: passing zero to 'dev_err_probe'

Will send a fix shortly, sorry.

Thanks,
Andrew

