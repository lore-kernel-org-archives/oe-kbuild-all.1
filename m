Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4C7E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Oct 2022 02:11:24 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q1so9499716pgl.11
        for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Oct 2022 19:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mD54F0nwVnvCK8vmXVrPzoRuIPNIzaFzISbCkl/mHSQ=;
        b=LbTfaTXH/CjJ9V6kXD3yrq7QfNhiMOIV9zkLG2omDvLObKYSuL0sZauGMH3gfIoVsv
         iI/EvyWucpfm5m+ZpeL47wsAwXf4h1gBm9mWWpEpELOooHBcQrSFc/WQQJxzFtwtF9Dk
         uHkyTMyPgGVScv1KXZ51NkI1eH3Ivre08+FIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD54F0nwVnvCK8vmXVrPzoRuIPNIzaFzISbCkl/mHSQ=;
        b=zDcmESNtm1qSedRJtLRsXmKjGNK4ZzIj+QUDTJfUoLBkxhialGV5oJuIDrTCFOBe12
         IK+xUO7PpJNrBMmivaw6yfuH5oQOILEhGeNcGUUtpGdqK5WOgJJAFF2rLNZduX938U+M
         tvQh02V3b++hGfSkeigeYZ400MkwdrJ6CeAsOUqU1qxAXp9NDgEIBYqWZsfNBnYNrUW8
         jlnbb4wgINDMEtv7BPwVcezBuNdgDX3F4PsFtGFFMMtBXNcsZqK2G6YEZLe08Uhk/W2v
         lp4nASQBygMBHxFpOngQfc/WssWPa9LuOMJxbqKDYgIQ54MBmbrSGwHgg4QfI5A73t1j
         wkpg==
X-Gm-Message-State: ACrzQf0TAIEE4r3QqKAexGhKTHoAogjGjvd4tuotBn1nXZqZbjoFToRe
	z2m49sW4d+2Ch1SpCbxdCmT60w==
X-Google-Smtp-Source: AMsMyM5+Q1YaR4FNDT0EBNP5ogjwI7oj7RpLFj7mPPKa8pIgmsgBPlirEiVKDlwHDR0N7c1zpBTOcw==
X-Received: by 2002:aa7:81cc:0:b0:563:4e53:c08b with SMTP id c12-20020aa781cc000000b005634e53c08bmr11879285pfn.19.1667182283951;
        Sun, 30 Oct 2022 19:11:23 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:f624:9e85:ec7a:fa29])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090ab70100b00212e5fe09d7sm2996438pjr.10.2022.10.30.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 19:11:23 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:11:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 3853/4127] mm/zsmalloc.c:2220:69: warning:
 right shift count >= width of type
Message-ID: <Y18uxz6+U/Jqxfx1@google.com>
References: <202210291926.676Ue2l1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210291926.676Ue2l1-lkp@intel.com>

On (22/10/29 19:33), kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   fd8dab197cca2746e1fcd399a218eec5164726d4
> commit: 280bbecded35eea30bbb5537f4f0a8a7e0e1b784 [3853/4127] zsmalloc: turn zspage order into runtime variable
> config: parisc-randconfig-r023-20221029
> compiler: hppa64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=280bbecded35eea30bbb5537f4f0a8a7e0e1b784
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 280bbecded35eea30bbb5537f4f0a8a7e0e1b784
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/zsmalloc.c: In function 'zs_create_pool':
> >> mm/zsmalloc.c:2220:69: warning: right shift count >= width of type [-Wshift-count-overflow]
>     2220 |         pool->min_alloc_size = (max_pages_per_zspage << PAGE_SHIFT) >>
>          |                                                                     ^~

Haven't seen any warnings on my side. I guess the following should do
the trick:

---
 mm/zsmalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 0bc9ed1f1a5d..181bfc66249b 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -2211,6 +2211,7 @@ struct zs_pool *zs_create_pool(const char *name, u32 max_pages_per_zspage)
 	int i;
 	struct zs_pool *pool;
 	struct size_class *prev_class = NULL;
+	unsigned long num_pages = max_pages_per_zspage;
 
 	if (WARN_ON(max_pages_per_zspage < ZS_MIN_PAGES_PER_ZSPAGE ||
 		    max_pages_per_zspage > ZS_MAX_PAGES_PER_ZSPAGE))
@@ -2221,8 +2222,7 @@ struct zs_pool *zs_create_pool(const char *name, u32 max_pages_per_zspage)
 		return NULL;
 
 	/* min_alloc_size must be multiple of ZS_ALIGN */
-	pool->min_alloc_size = (max_pages_per_zspage << PAGE_SHIFT) >>
-		OBJ_INDEX_BITS;
+	pool->min_alloc_size = num_pages << PAGE_SHIFT >> OBJ_INDEX_BITS;
 	pool->min_alloc_size = max(pool->min_alloc_size, ZS_MIN_ALLOC_SIZE);
 
 	pool->num_size_classes =
-- 
2.38.1.273.g43a17bfeac-goog

