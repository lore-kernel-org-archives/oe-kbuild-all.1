Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0369079E1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749713382; cv=none; b=gosaXlWkerpNRkHRpW1XWDlnG9E5lupYbPRVr6q7/PYCqH6CV9oajcNUrJ//4lLF0F12WnWqrK3MEHrqFTQQgxJn+PLZJJcA2umsslz/3llFDiGZCvYSKJbSqxi4HJJVzl5jNRp2FTmsDEy4OFmOKUKarMhXFQkCgbmTvpzlzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749713382; c=relaxed/simple;
	bh=zSlIbjxaW75NdtQMB+5uCdNGmRLfncsyMDDu8q/6d+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SU5f6Sn4JATugI/ceRIBnzyV7B8/pYnI6kn51YCMCIPUwEBeZzBvkIjyPbjDw62Rv75VAx/1+cTb9ZHjc9xI1wSov9a3+ZpTpAM3yucAeWxsXdUaFIMI48p/9v2QDtpIst/Jseo8iA/wU+l3xEQPQ/nLModmtL7xcSmMhfwxAbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C8xpovNc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C8xpovNc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23508d30142so8079895ad.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Jun 2025 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749713380; x=1750318180; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OY0OK186Eiy+kb3OI3njLLfZm61nlKnH95xfL7qAiAQ=;
        b=C8xpovNcq2gkiebTkYUIvj46SLmk9RCLuJOBSwF20tRqZZg5OnLEW7sb5qHssLLTEj
         9kYtnVQqI4xuHYUm3Er5/YAnNhfm8CnjOv1mv4VffRczn1BzyOJq2J1JqN6MIutqi1Ee
         Mkn8WnXSHr2B0UGMH4xJsDJFyM964UZxaWgqFc9mjGxqoT2EPMQMQVHMouLOf1A76UQI
         LZ8tD+NyBZCsRhG1wshzhd1ZdEixBtFzf3N55kYXsj3AaK/KEAAt51YRoi1THtgSuTfm
         D6W/iNTLStg1WB0stF0vErZpbfEI33t456DBqJNguO5CEDQXU6Z9OM7mgBtMnQV7cUYw
         asPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749713380; x=1750318180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY0OK186Eiy+kb3OI3njLLfZm61nlKnH95xfL7qAiAQ=;
        b=MNrLgS0F5e80hQogCl5aUEqGlc6v1BiORkBGOmO8tHW9SWyCDHxgEXdQc079gxLtPS
         /ltC9kShjcYKl8fBzlauXYDii3fZYvMzdpaavpGoAw9BT4ANyOV+uHD93bZSeZ5OP3jl
         C/OCIJYXwZbneplmKVbYccnHxFHiCJKeTXADLiSM9D8dCOdnb471IAXJBfPhjL/3f+t5
         yMdNODCeCdsH560Gz6pPy8QwMJhxNu6Ww9Lz+qmKZiijqxpUEP3Cq3JN4WOA7M4cewsQ
         zYhxGxvjgYjo/8n7zWFVIcPBA/2JMeXn1kff/QmH7e2yz97o1aiGpyCer28MA6k4VdBf
         A+kw==
X-Gm-Message-State: AOJu0Yw1P/rEnMIQObU89Fj843JwdVScRfrVr3b1XvhBF79PRwV9+IR4
	N7RNLjY54szfP44tD6PT1V4fMX0G1nFHOn51ncLVYitvQQBxdnIcQInFOKSc2lHv1mY=
X-Gm-Gg: ASbGncuTRZN50E0Ko7fk6Gl4GK5gx8qbp/FZDr1iirYmUY8L7UD+iUaAOcs/YAhhJeu
	9GHumYM+t5RIgWzqEJoMOib/nroxuQC2X+UbyewaVpSxbx9o6kXDVz9NHTXYatgdRNn7XlAiXp4
	pODZLaOcmOGH7uwu6YOtGYgmRSJZPyU7jgXR4o96r62Opvwo2HBWvua5+tagYIdl31EJC2DhWaX
	8mjKzJRGbtZ7bsiuDFIbaJfBC11jd9Hn3rymdXR0D3ZxdXErdRruxhBkgRCAmE5VKSSaoNiar6U
	tq7syyfv2z/r5617Sxn2axuh1o4FHAyG+f0m8IRcWENmpBY7lcWP7WcNwjHvhfc=
X-Google-Smtp-Source: AGHT+IHSsq98Gwdk5JzoPA1cqT+FsUUn7tYinnnuONXeJ94UIXplKK2bd7jvRP2tu3UYegqm9ju+WQ==
X-Received: by 2002:a17:902:f943:b0:234:ef42:5d5b with SMTP id d9443c01a7336-2364c8d0c0bmr28410245ad.16.1749713380188;
        Thu, 12 Jun 2025 00:29:40 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e61b614sm7499335ad.13.2025.06.12.00.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:29:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:59:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/opp/of.o: warning: objtool:
 _opp_table_alloc_required_tables+0x3b0: stack state mismatch: reg1[22]=-1+0
 reg2[22]=-2-16
Message-ID: <20250612072937.gb3n2mh34aivabt4@vireshk-i7>
References: <202506110656.WF6sPKbe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506110656.WF6sPKbe-lkp@intel.com>

On 11-06-25, 06:19, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
> commit: ff9c512041f2b405536640374ae3a3fe10efaf8b OPP: Use mutex locking guards
> date:   6 weeks ago
> config: loongarch-randconfig-002-20250611
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build):
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506110656.WF6sPKbe-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/opp/of.o: warning: objtool: _opp_table_alloc_required_tables+0x3b0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-16

Hi,

I am not really sure what's really wrong with the change here:

@@ -201,9 +191,8 @@ static void _opp_table_alloc_required_tables(struct opp_table *opp_table,
                 * The OPP table is not held while allocating the table, take it
                 * now to avoid corruption to the lazy_opp_tables list.
                 */
-               mutex_lock(&opp_table_lock);
+               guard(mutex)(&opp_table_lock);
                list_add(&opp_table->lazy, &lazy_opp_tables);
-               mutex_unlock(&opp_table_lock);
        }
 }

Can someone help ?

-- 
viresh
