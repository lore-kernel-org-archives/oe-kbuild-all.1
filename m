Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096747F3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 07:21:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-309382efe13so1837433f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 00:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684480903; x=1687072903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aNZ3qyN6oyXbeQpxb9jE35xavW40i2UfsZY947zNi6A=;
        b=nFBcGtR+q6RWN4wIRGCpaNcck/OXxyOWNm+gj3QIv3XT87Go5ZbPZIZPg5Tn9mLkD+
         e7ARQa2Nl2KAJluKz35RBPSYkc3c7Ur1zRZoo99U52fVnf0i8tHwBYBtEu2apK8aklYv
         TA4/dHiDokjBMqyxwZI8t5HMZt1EAvMfS6aZcvxfe4FB9dTVe2fJoCMT5gGYTj9IJYTR
         5wyaMqOouDY9++Zoc+dHU4N/TJnmFjtlUs2TGLjvNpRWiNEiabUFnaE9wOBf0YwNhR4y
         yREwTQyMuDRCt4cpuDYBMHfEJ1G+vIEqnnH6SHxsn21k0czziOvRKAxxqahJ9sQxqRUW
         7+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684480903; x=1687072903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNZ3qyN6oyXbeQpxb9jE35xavW40i2UfsZY947zNi6A=;
        b=gjIBEUBGZJ25sm5x8h6c3mw/Yvpt947P9eujDh3Tw2/M5wyI0ENdFbXTP50Q6lqWo5
         vB2/CKeTkSGXeN8fvNL6tWseUjxaY7aR+rxXGiQ0VlTOBj5E34yxfaJ52pQAji9dJrpc
         PRBfYMQzDdmVQNl7lOvmoYTR1qIHSvIN88KX86Hqj3dN1vBkSOyAO8Z9TxOghyFJZPFL
         NYBY76thmL/HUiSB4mIu1fPkQonecjexP0/elWT9mhVYFZonH4qk4kGxNVB46AIrXXoY
         OipS8ZRApDehswWZXFn7efFCXr3hso+ySNmP9WYEU2n9bekI+7p9UpqBthWLYYkVQwL9
         rvYg==
X-Gm-Message-State: AC+VfDztHNw1+2Q5AnX+37KNUuA72UUBK5vcZr2yVrUQk1oaDBI/R+Qt
	aoXgUGZi/d+cOK38aBAJ6ztwUg==
X-Google-Smtp-Source: ACHHUZ6Ezp1L9iAjUVbIXAmlKN/iS9Pt494Dm+7ljsI25DttxqjuqCPZ36RewBvHRz+DFiNOy83/Yg==
X-Received: by 2002:adf:f74a:0:b0:306:342a:6a01 with SMTP id z10-20020adff74a000000b00306342a6a01mr853884wrp.47.1684480903233;
        Fri, 19 May 2023 00:21:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d5251000000b003079693eff2sm4331182wrc.41.2023.05.19.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 00:21:41 -0700 (PDT)
Date: Fri, 19 May 2023 10:21:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Oscar Salvador <osalvador@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 2908/3314] lib/stackdepot.c:544 stack_print()
 warn: unsigned 'stack->size' is never less than zero.
Message-ID: <110d728f-b125-4358-9839-13e094597ef9@kili.mountain>
References: <202305182345.LTMlWG84-lkp@intel.com>
 <20230518133247.a0ece8de7c3fc5dca9e1b67d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518133247.a0ece8de7c3fc5dca9e1b67d@linux-foundation.org>

On Thu, May 18, 2023 at 01:32:47PM -0700, Andrew Morton wrote:
> On Thu, 18 May 2023 23:44:10 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   798d276b39e984345d52b933a900a71fa0815928
> > commit: e435b85a4aea7a82259105d5d8025655460052e1 [2908/3314] mm, page_owner: add page_owner_stacks file to print out only stacks and their counte
> > config: x86_64-randconfig-m001
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202305182345.LTMlWG84-lkp@intel.com/
> > 
> > smatch warnings:
> > lib/stackdepot.c:544 stack_print() warn: unsigned 'stack->size' is never less than zero.
> > 
> 
> Linus would complain about that warning.
> 

Yeah.  I hadn't intended that warning to be printed.  It's supposed
to check for if the check for negatives is paired with an upper bound
check.  That Smatch check is original vintage from 2009 so it's due for
a re-write.

> > 
> >    537	
> >    538	int stack_print(struct seq_file *m, void *v)
> >    539	{
> >    540		char *buf;
> >    541		int ret = 0;
> >    542		struct stack_record *stack = v;
> >    543	
> >  > 544		if (!stack->size || stack->size < 0 ||
> >    545		    stack->size > PAGE_SIZE || stack->handle.valid != 1 ||
> >    546		    refcount_read(&stack->count) < 1)
> 
> How about <=?

It doesn't really solve the problem.  Smatch complains about that too.
I'll fix the Smatch check.

regards,
dan carpenter

