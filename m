Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03291FC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 04:13:29 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id 63so9802885iov.8
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 20:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kzsiWXbAaTfTSEeYq53aj5QUY471/DVxdjgiIyCZYk=;
        b=cdoc8efmjn+jQ7ARHCXdMytFUSRSDGQ6gBhyVlI3Vj5OgCMM8Knd+8Xn/JsMwmZGsg
         MtSZ/VA9uWhni0/MWcmGUu1ybkmv2qD59X0WNnJUJtviXQHsYeR73RSAMnCw6nVvlsY6
         miEq/hvhaQf9zeyEyTaPCZv/+ve0DWMbzoTG0dPdGUYsv0y/eO9pR9ZB2csIWe2Ab5uL
         Rsia8hXBtnQzgAS64xquBZ69FOtq1cIdrd7mIHCkow7WFz7g6eTrnCaUN6e0dx5jTPAA
         9ixQXXpBAMHwmVJOfBwDR/0Dhz5uv3haPn3qLxrFdqzVU1kNYmTHhBKPTHV+NSFITzeb
         Akzw==
X-Gm-Message-State: ANoB5pkWIsTTr4ynzIupEOvXG2vD2eGYnb2tAIe1DdKTHF4hXnYzgjVz
	g2UC7TU4RsoztO3ciq9IFG4=
X-Google-Smtp-Source: AA0mqf6GLmY2F1XnOyE6lkOe8a+C8EF+DY0gL6NgwHrGxPhgOeBj39sinxwn94OMrnYYlkxLpI3u2w==
X-Received: by 2002:a02:ccf5:0:b0:363:7181:954e with SMTP id l21-20020a02ccf5000000b003637181954emr7170298jaq.40.1668485608767;
        Mon, 14 Nov 2022 20:13:28 -0800 (PST)
Received: from fedora ([2607:f598:b99a:be1:dfa7:eed0:45ca:de3c])
        by smtp.gmail.com with ESMTPSA id f14-20020a02a10e000000b003760a908bfasm2481380jag.169.2022.11.14.20.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 20:13:28 -0800 (PST)
Date: Mon, 14 Nov 2022 20:13:25 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	42.hyeyoo@gmail.com
Subject: Re: [linux-next:master 5002/7443]
 include/linux/compiler_types.h:357:45: error: call to
 '__compiletime_assert_474' declared with attribute error: BUILD_BUG_ON
 failed: PERCPU_DYNAMIC_EARLY_SIZE < NR_KMALLOC_TYPES * KMALLOC_SHIFT_HIGH *
 sizeof(struct kmem_cache_cpu)
Message-ID: <Y3MR5ZA6DClG/2rC@fedora>
References: <202211120436.HzD1i2yQ-lkp@intel.com>
 <Y3Hx8SYyD9y1Q8o/@MiWiFi-R3L-srv>
 <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dda9e5fc-258b-bf67-c90a-f7fb23ab68e3@suse.cz>

Hi Vlastimil & Baoquan,

On Mon, Nov 14, 2022 at 06:58:13PM +0100, Vlastimil Babka wrote:
> On 11/14/22 08:44, Baoquan He wrote:
> > Hi,
> > 
> > I reproduced the build failure according to lkp report and made a patch
> > as below to fix it.
> > 
> > From dae7dd9705015ce36db757e88c78802584f949b1 Mon Sep 17 00:00:00 2001
> > From: Baoquan He <bhe@redhat.com>
> > Date: Sun, 13 Nov 2022 18:08:27 +0800
> > Subject: [PATCH] percpu: adjust the value of PERCPU_DYNAMIC_EARLY_SIZE
> > Content-type: text/plain
> > 
> > LKP reported a build failure as below on the patch "mm/slub, percpu:
> > correct the calculation of early percpu allocation size"
> 
> Since I have that patch in slab.git exposed to -next, should I take this fix
> too, to make things simpler? Dennis?
> 

I don't have any problems with you running a fix, but I'm not quite sure
this is the right fix. Though this might cause a trivial merge conflict
with: d667c94962c1 ("mm/percpu: remove unused PERCPU_DYNAMIC_EARLY_SLOTS")
in my percpu#for-6.2 branch.

If I'm understanding this correctly, slub requires additional percpu
memory due to the use of 64k pages. By increasing
PERCPU_DYNAMIC_EARLY_SIZE, we solve the problem for 64k page users, but
require a few unnecessary pages that can bloat the size of subsequent
percpu chunks. Though, I'm not sure if that's an issue today for
embedded devices.

I think adding parity to PERCPU_DYNAMIC_EARLY_SIZE with
PERCPU_DYNAMIC_RESERVE is defined by BITS_PER_LONG is a safer option
here. A small TODO item would be to make PERCPU_DYNAMIC_RESERVE be a +
value instead of a max() with PERCPU_DYNAMIC_EARLY_SIZE.

Thanks,
Dennis

---
diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index f1ec5ad1351c..22ce3271eed2 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -42,7 +42,11 @@
  * larger than PERCPU_DYNAMIC_EARLY_SIZE.
  */
 #define PERCPU_DYNAMIC_EARLY_SLOTS	128
+#if BITS_PER_LONG > 32
+#define PERCPU_DYNAMIC_EARLY_SIZE	(20 << 10)
+#else
 #define PERCPU_DYNAMIC_EARLY_SIZE	(12 << 10)
+#endif
 
 /*
  * PERCPU_DYNAMIC_RESERVE indicates the amount of free area to piggy
