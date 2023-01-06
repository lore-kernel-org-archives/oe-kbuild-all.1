Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79E7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jan 2023 02:40:48 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id 17so372093pll.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 05 Jan 2023 18:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMReju9ZGtQuchPf6WD9hD7WrRjOmXzq8UOpnjdwzRA=;
        b=EAUzZPDeXGC0d+iZL/kZVthTK5VgGLJSKoIT/mnIxBnVdm5R1Jgr3sps1GVnLSdW6j
         kaglzdd+f63S78qhVEaQWY4kKG3BOcMw8WT+odspW9V1T/J1iROYz4l7IVgMO+K7NMgx
         ViiaVjIM7/j06EpS/snN775i+n+s0VUmaNUd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMReju9ZGtQuchPf6WD9hD7WrRjOmXzq8UOpnjdwzRA=;
        b=Ysuq+/MBR2cNYnzxYQCb1qIY/GkltM8A2MMaEduiZawX1Fmvfu9QOgOUJvxJbxc1Uw
         Itq4AIua1aa1dlbJzJ729RqHOuLbMNUKJwIpT42N/rtD+spkmu2E6apnwUoJGrn3bbBn
         KtQky+B11QCKgdus8Zpzq6K+q2HH/QJ3yokMvvjrw6ey4TZzja7+rZFFTlFeGDg9ikDk
         wcJo6/t8rYxM9w2+P/LwPPD/FGSI2vAht4X8nCQbs80RFOVqAT5oJV9IKLc9uJ86KXfs
         EskG0re9A45YdzkEQztR2jM5VlMfsbLJkPScPnUaqqDqx3XJ8/Og604CPT0TmI9jDmmB
         4h1Q==
X-Gm-Message-State: AFqh2ko5g5bQidU/NNh84pghPKp+TJZKQIcr8STdmnR1f7ISIrCqgnCQ
	ZNaUxUjHRvUZ5i/8gexAP69nzw==
X-Google-Smtp-Source: AMrXdXuKsPfttknL+8ufrCvWlfSCXDdcoVO19lKPgv8O+wkjGLNunqK2GGJzXu9n5PG/R4zX/Bdc8A==
X-Received: by 2002:a17:902:bcc5:b0:192:b2d3:4fc8 with SMTP id o5-20020a170902bcc500b00192b2d34fc8mr25830361pls.1.1672972848043;
        Thu, 05 Jan 2023 18:40:48 -0800 (PST)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id n20-20020a170902d0d400b00192fc9e8552sm2117899pln.0.2023.01.05.18.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 18:40:47 -0800 (PST)
Date: Fri, 6 Jan 2023 11:40:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Minchan Kim <minchan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] zsmalloc: make zspage chain size configurable
Message-ID: <Y7eKK7wKfv6E4NMn@google.com>
References: <20230105053510.1819862-4-senozhatsky@chromium.org>
 <202301060349.wchW6HX9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301060349.wchW6HX9-lkp@intel.com>

On (23/01/06 03:49), kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
> >> Documentation/admin-guide/blockdev/zsmalloc.rst:19: WARNING: Literal block expected; none found.
> >> Documentation/admin-guide/blockdev/zsmalloc.rst:21: WARNING: Unexpected indentation.
> >> Documentation/admin-guide/blockdev/zsmalloc.rst:22: WARNING: Block quote ends without a blank line; unexpected unindent.
> >> Documentation/admin-guide/blockdev/zsmalloc.rst: WARNING: document isn't included in any toctree
> 
> vim +19 Documentation/admin-guide/blockdev/zsmalloc.rst
> 
>     18	
>   > 19	class  size almost_full almost_empty obj_allocated   obj_used pages_used pages_per_zspage freeable
>     20	..
>   > 21	   94  1536           0            0             0          0          0                3        0
>   > 22	  100  1632           0            0             0          0          0                2        0
>     23	..
>     24	

Thanks.

OK, added `make htmldocs` to my build scripts, time to get used to
the fact that we now make docs. I fixed all the warnings and moved
the contents to Documentation/mm/zsmalloc.rst file of which I was
not aware before.

Will include all the improvements into v2.
